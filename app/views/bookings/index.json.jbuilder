if current_user.admin? || current_user.assistant?
  json.array! @bookings, partial: 'bookings/booking', as: :booking
else
  json.array! @bookings.where(user: current_user), partial: 'bookings/booking', as: :booking
end