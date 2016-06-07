FactoryGirl.define do
  factory :address, class: Address do
    street 'Rua'
    district 'Bairro'
    city 'Cidade'
    zipcode 'CEP'
  end

  factory :customer, class: Customer do
    cpf '12345'
    phone '1234578'
    association(:address, factory: :address)
    association(:user, factory: :customer_user)
  end

  factory :user, class: User do
    name 'User'
    email 'test@test.com'
    role 'user'
    password 'test123'

    factory :admin_user do
      role 'admin'
      email 'admin@test.com'
    end

    factory :customer_user do
      role 'customer'
      email 'customer@test.com'
    end
  end

  factory :line_item, class: LineItem do
    total 100
    order
    association(:product, factory: :product_category)
  end

  factory :product, class: Product do
    name 'Test'
    description 'description'
    minimum_price 100
    association(:product_category, factory: :product_category)
  end

  factory :product_category, class: ProductCategory do
    name 'Category Test'
  end

end