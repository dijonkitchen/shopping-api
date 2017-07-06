# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p = Product.create(name: "Product x")

(0..20).each do |num|
  c = Customer.create(first_name: "Customer #{num}", last_name: 'Last name')
  o = c.orders.create(created_at: Time.at((1.year.to_f)*rand + (Time.now-1.year).to_f))
  o.products << Product.last
end
