require 'faker'

MULTIPLIER = 1

# suppliers
suppliers = []
(1..10*MULTIPLIER).each do
  suppliers << Supplier.create(
    name: Faker::Name.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    job_title: Faker::Company.profession,
    business_phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip,
    country: Faker::Address.country_code,
    webpage: Faker::Internet.url,
    notes: Faker::Hipster.sentence
  )
end

# shipper
shippers = []
(1..10*MULTIPLIER).each do
  suppliers << Shipper.create(
    name: Faker::Name.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    job_title: Faker::Company.profession,
    business_phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip,
    country: Faker::Address.country_code,
    webpage: Faker::Internet.url,
    notes: Faker::Hipster.sentence
  )
end

# customers
customers = []
(1..30*MULTIPLIER).each do
  customers << Customer.create(
    name: Faker::Name.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    job_title: Faker::Company.profession,
    business_phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip,
    country: Faker::Address.country_code,
    webpage: Faker::Internet.url,
    notes: Faker::Hipster.sentence
  )
end

# employees
employees = []
(1..30*MULTIPLIER).each do
  employees << Employee.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    job_title: Faker::Company.profession,
    business_phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip,
    country: Faker::Address.country_code,
    webpage: Faker::Internet.url,
    notes: Faker::Hipster.sentence
  )
end

# products
products = []
(1..300*MULTIPLIER).each do
  cost = Faker::Commerce.price
  products << Product.create(
    supplier_id: suppliers.sample.id,
    product_code: Faker::Number.number(10),
    product_name: Faker::Commerce.product_name,
    standard_cost: cost,
    list_price: (cost * (1 + (Faker::Number.decimal(2).to_f/100))).round(2),
    reorder_level: Faker::Number.between(10,100),
    target_level:  Faker::Number.between(10,100),
    discontinued: Faker::Boolean.boolean(0.2),
    minimum_reorder_quantity:  Faker::Number.between(10,100),
    category: Faker::Commerce.department(1)
  )
end

# order_status
order_statuses = []
['NEW','PENDING','PAID','SHIPPED','VOID'].each do |s|
  order_statuses << OrderStatus.create(
    code: s
  )
end

# orders
(1..100*MULTIPLIER).each do
  order_date = Faker::Date.between(1.years.ago, Date.today)
  paid_date = nil
  shipped_date = nil
  if Faker::Boolean.boolean # paid
    paid_date = Faker::Date.between(order_date, Date.today)
    if Faker::Boolean.boolean # shipped
      shipped_date = Faker::Date.between(paid_date, Date.today)
    end
  end
  order = Order.create(
    employee: employees.sample,
    customer: customers.sample,
    order_date: order_date,
    paid_date: paid_date,
    shipped_date: shipped_date,
    shipper: shippers.sample,
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip,
    country: Faker::Address.country_code,
    shipping_fee: Faker::Number.between(10,50),
    taxes: Faker::Number.between(10,15),
    payment_type: ['CASH','VISA','MASTERCARD','PAYPAL'].sample,
    notes: '',
    tax_rate: Faker::Number.decimal(1),
    order_status: order_statuses.sample
  )
  products.sample(Faker::Number.between(1,10)).each do |p|
    OrderDetail.create(
      order: order,
      product: p,
      quantity: Faker::Number.between(1,5),
      unit_price: p.list_price,
      discount: 0
    )
  end

end
