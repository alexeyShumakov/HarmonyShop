class OrdersController < ApplicationController

  include DeliveryInfo

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
    @order = Order.new
    if @cart.total_quantity == 0
      redirect_to root_path
    else
      @user == current_user
    end
  end

  def delivery_price
    # see DeliveryInfo
    @response = delivery_info
    set_delivery_session
    @delivery_and_products_price = session[:delivery_price] + @cart.total_price
  end
  # GET /orders/1/edit
  def edit
    authorize @order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    # delivery_price get from session, not from hidden input
    @order.delivery_price = session[:delivery_price]
    @order.total_price = @cart.total_price
    @order.status = 0
    @user = current_user

    respond_to do |format|
      if @order.save
        # delete session data
        clear_delivery_session
        @user.orders << @order
        @order.add_item_from_cart(@cart)
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
      params.require(:order).permit(:city, :city_id, :line_item, :pay_type, :address, :phone, :user_id, :status)
    end
end
