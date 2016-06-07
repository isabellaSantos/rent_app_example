class OrdersController < BaseController
  before_action :set_order, only: [:edit, :edit_state, :update, :destroy]

  def index
    if current_user.customer?
      @orders = Order.by_customer current_user.customer
    else
      @orders = Order.all
    end
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @order.delivery
      render :new
    else
      render :new
    end
  end

  def edit_state
    render :new
  end

  def update
    if @order.update(order_params)
      @order.months_quantity = params[:months_quantity].to_i if @order.delivery?

      if @order.send(params[:state])
        render :new and return
      end
    end
    render :edit
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

    def set_order
      @order = Order.find_by!(number: params[:id] || params[:order_id])
    end

    def order_params
      params.require(:order).permit(:initial_date, :customer_id,
                                    line_items_attributes: [:product_id, :total],
                                    address_attributes: [:street, :district, :city, :zipcode])
    end

    def model_class
      Order
    end
end
