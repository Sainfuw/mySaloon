# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Service.destroy_all
Customer.destroy_all
User.destroy_all

@admin = User.create(
  email: "devel@mta.cl",
  password: "prueba",
  name: "Emilio",
  lastname: "Navarro",
  status: 1,
  role: 2
)

@assistant = User.create(
  email: "assistant@mta.cl",
  password: "prueba",
  name: "Hernan",
  lastname: "Mira",
  status: 1,
  role: 1
)

5.times do 
  @name = Faker::Name.first_name
  @professional = User.create(
    email: "#{@name}@mta.cl",
    password: "prueba",
    name: @name,
    lastname: Faker::Name.last_name,
    status: 1,
    role: 0
  )
end

10.times do |x|
  @name = Faker::Name.name
  Faker::Config.locale = 'en-US'
  @customer = Customer.create(
    name: @name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    status: 1,
    author: @admin
  )
  @service = Service.create(
    name: "Servicio #{x + 1}",
    price: 10000 * (x + 1),
    status: 1,
    author: @admin
  )
  2.times do |x|
    start_at = Random.rand(8).days.ago
    time = rand(12) + 6
    @booking = Booking.create(
      title: Faker::Lorem.word,
      comment: Faker::Lorem.paragraph,
      date: start_at.change({ hour: 0, min: 0, sec: 0 }),
      start: start_at.change({ hour: time, min: 30, sec: 0 }),
      end: start_at.change({ hour: time + 2, min: 30, sec: 0 }),
      status: 2,
      user: User.where(role: 0)[rand(5)],
      author: @admin,
      customer: @customer
    )
    @billing = Billing.create(
      code: "111111",
      payment_method: "Efectivo",
      amount: 20000,
      currency: "CLP",
      customer: @customer
    )
    BookingService.create(
      service: @service,
      booking: @booking,
      billing: @billing
    )
    @billing.update_attribute :created_at, start_at.change({ hour: time, min: 30, sec: 0 })
  end
  2.times do |x|
    start_at = Random.rand(8).days.ago + 7.days
    time = rand(12) + 6
    @booking = Booking.create(
      title: Faker::Lorem.word,
      comment: Faker::Lorem.paragraph,
      date: start_at.change({ hour: 0, min: 0, sec: 0 }),
      start: start_at.change({ hour: time, min: 30, sec: 0 }),
      end: start_at.change({ hour: time + 2, min: 30, sec: 0 }),
      status: 1,
      user: User.where(role: 0)[rand(5)],
      author: @admin,
      customer: @customer
    )
    BookingService.create(
      service: @service,
      booking: @booking
    )
  end
end



