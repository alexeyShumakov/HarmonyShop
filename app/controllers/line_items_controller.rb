class LineItemsController < ApplicationController
  include CurrentCart

  before_filter :authenticate_user!, only: [:index, :show, :new, :edit]
  after_action :verify_authorized, only: [:index, :show, :new, :edit]
  before_action :set_cart, only:  [:create, :update]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
    authorize LineItem
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    authorize @line_item
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
    authorize @line_item
  end

  # GET /line_items/1/edit
  def edit
    authorize @line_item
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id, params[:size], params[:color])
    respond_to do |format|
      if @line_item.save
        format.js
        format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.js { render partial: 'bad_params' }
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.js
        format.html { redirect_to cart_custom_show_path, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.js {render nothing: true}
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    unless @line_item.order_id
      @line_item.destroy
    end
    respond_to do |format|
      format.js
      format.html { redirect_to cart_custom_show_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :size, :color, :quantity)
    end
end
