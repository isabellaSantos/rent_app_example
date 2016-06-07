class CustomersController < BaseController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    @user = User.new
    @address = Address.new
  end

  def edit
    @user = @customer.user
    @address = @customer.address
  end

  def create
    params = customer_params
    params[:user_attributes][:password] = params[:cpf]
    @customer = Customer.new(customer_params)
    @customer.user.password = params[:cpf]
    @customer.user.role = 'customer'

    if @customer.save
      redirect_to customers_path, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:cpf, :phone, user_attributes: [:name, :email],
                                       address_attributes: [:street, :district, :city, :zipcode])
    end

    def model_class
      Customer
    end
end
