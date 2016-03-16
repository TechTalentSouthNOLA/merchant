FactoryGirl.define do

  factory :brand do
    name "Foo"
  end

  factory :category do
    name "Foo"
  end

  factory :product do
    name "Foo"
    current_price 8.99
    quantity 10
    description "Lorem ipsum"
    brand
    category
  end

end