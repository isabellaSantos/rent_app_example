class ManageProductsController < BaseController
  before_action :set_manage_product, only: [:show, :edit, :update, :destroy, :to_state]

  def index
    @manage_products = ManageProduct.all
  end

  def show
  end

  def new
    if Product.all.empty?
      flash[:error] = 'nao existe produto'
      redirect_to new_product_path and return
    end
    @manage_product = ManageProduct.new
  end

  def edit
  end

  def create
    quantity = params[:quantity].to_i
    quantity.times do
      manage_product = ManageProduct.new(manage_product_params)
      unless manage_product.save
        flash[:error] = ''
        redirect_to manage_products_path and return
      end
    end

    redirect_to manage_products_path
  end

  def update
    if @manage_product.update(manage_product_params)
      redirect_to @manage_product, notice: 'Manage product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @manage_product.destroy
    redirect_to manage_products_url, notice: 'Manage product was successfully destroyed.'
  end

  def to_state
    if @manage_product.send(params[:state])
      flash[:success] = ''
    else
      flash[:error] = ''
    end
    redirect_to edit_manage_product_path @manage_product
  end

  private

    def set_manage_product
      @manage_product = ManageProduct.find(params[:id] || params[:manage_product_id])
    end

    def manage_product_params
      params.require(:manage_product).permit(:number, :manufacture_date, :product_id)
    end

    def model_class
      ManageProduct
    end
end
