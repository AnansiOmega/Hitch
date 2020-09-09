puts "destroy"

Delivery.destroy_all
Receiver.destroy_all
Supplier.destroy_all
Driver.destroy_all
Broker.destroy_all

puts "Seeding..."

20.times do
    Broker.create(name: Faker::FunnyName.name, email: Faker::Internet.email, password_digest: Faker::Internet.password)   
end

20.times do
    Driver.create(name: Faker::FunnyName.two_word_name, email: Faker::Internet.email, password_digest: Faker::Internet.password)
end

20.times do
    Supplier.create(company: Faker::Company.name, location: Faker::Address.city)
end

20.times do
    Receiver.create(company: Faker::Company.name, location: Faker::Address.city)
end

x = ["8'6", "9'6"]
y = ["Awaiting Pickup", "In Transit", "Delivery Completed"]


200.times do
    Delivery.create(
    broker_id: Broker.all.sample.id, 
    driver_id: Driver.all.sample.id, 
    supplier_id: Supplier.all.sample.id, 
    receiver_id: Receiver.all.sample.id, 
    hazardous: Faker::Boolean.boolean,
    scheduled_pickup: DateTime.now - (rand * 21),
    height: x.sample, weight: "#{rand(6..40)} tons",
    status: y.sample, 
    description: "#{rand(50..5000)} pallets of #{Faker::Construction.material}"
    )
end

puts "donezo"
