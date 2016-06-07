class ProductCategoriesController < BaseController

  before_action :set_product_category, only: [:edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def edit
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    if @product_category.save
      redirect_to product_categories_path, notice: 'Product category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product_category.update(product_category_params)
      redirect_to @product_category, notice: 'Product category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product_category.destroy
    redirect_to product_categories_url, notice: 'Product category was successfully destroyed.'
  end

  private

    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def product_category_params
      params.require(:product_category).permit(:name)
    end

    def model_class
      ProductCategory
    end
end
