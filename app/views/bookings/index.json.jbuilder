json.array! @bookings do |booking|
  json.id booking.id
  json.title booking.title
  json.comment booking.comment
  json.start booking.start
  json.end booking.end
  json.color booking.color
  json.user_id booking.user_id
  json.customer_id booking.customer_id
end
