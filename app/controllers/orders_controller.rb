class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy, :show]
  before_action :set_user, only: [:index, :create, :new, :create]
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:my_orders, :new, :create, :delivery_price]

  # GET /orders
  # GET /orders.json
  def my_orders
    @orders = current_user.orders.all
  end

  def index
    @orders = @user.orders.all
    authorize Order
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    authorize @order
  end

  # GET /orders/new
  def new
    @user == current_user
    @order = Order.new
  end

  def delivery_price
    url = "http://api.edostavka.ru/calculator/calculate_price_by_json.php"
    puts params
    @response = HTTParty.post(url.to_s,
                              body: {
                                version: '1.0',
                                dateExecute: Date.tomorrow,
                                senderCityId: 259,
                                receiverCityId:  params[:city_id],
                                tariffId: 1,
                                goods: [
                                  {
                                      weight:0.1,
                                      length:5,
                                      width:5,
                                      height:1
                                  },
                                  {
                                      weight: 0.1,
                                      volume: 0.1
                                  }
                                ]
                              }.to_json,
                              :headers => { 'Content-Type' => 'application/json' })
  end

  # GET /orders/1/edit
  def edit
    authorize @order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @user = current_user
    @user.orders << @order
    @order.add_item_from_cart(@cart)

    respond_to do |format|
      if @order.save
        format.html { redirect_to private_office_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    authorize @order
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    authorize @order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:city_id, :line_item, :pay_type, :address, :phone, :delivery_type, :user_id)
    end
end
