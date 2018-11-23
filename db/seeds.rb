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
  name: "Emilio",
  lastname: "Navarro",
  status: 1,
  role: 1
)

@professional = User.create(
  email: "professional@mta.cl",
  password: "prueba",
  name: "Emilio",
  lastname: "Navarro",
  status: 1,
  role: 0
)

10.times do |x|
  @customer = Customer.create(
    name: "Cliente#{x + 1}",
    email: "cliente#{x + 1}@gmail.com",
    phone: "2339434#{x + 1}",
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
    start_at = Random.rand(15).days.ago + 5.days
    time = rand(12) + 6
    @booking = Booking.create(
      title: Faker::Overwatch.hero,
      comment: Faker::Overwatch.quote,
      date: start_at.change({ hour: 0, min: 0, sec: 0 }),
      start: start_at.change({ hour: time, min: 30, sec: 0 }),
      end: start_at.change({ hour: time + 2, min: 30, sec: 0 }),
      status: rand(3),
      user: @professional,
      author: @admin,
      customer: @customer
    )
    @billing = Billing.create(
      code: "111111",
      payment_method: "Efectivo",
      amount: 20000,
      currency: "CLP",
      user: @assistant
    )
    BookingService.create(
      service: @service,
      booking: @booking,
      billing: @billing
    )
  end
end
