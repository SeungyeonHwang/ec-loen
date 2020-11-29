# TEST ACCOUNT (PAYPAL)

# sb-pvigb3874582@personal.example.com
# PvGa82-x

# Credit Card Number:
# 4525916807516153

# Credit Card Type:
# VISA

# Expiration Date:
# 01/2026

# Credit Card Type:
# VISA

# Expiration Date:
# 01/2026

# Credit Card CSV
# 111

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
User.create(email: 'test@sample.co.jp', password: '12341234', password_confirmation: '12341234')
Cosmetic.set_dummy_data
