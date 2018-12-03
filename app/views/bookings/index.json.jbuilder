json.array! @bookings do |booking|
  json.id booking.id
  json.title booking.title
  json.start booking.start
  json.end booking.end
  json.color booking.color
  json.editable booking.editable(current_user.role)
  json.role current_user.role
end
