# 決済用のテストアカウント(PayPal)
# ID : sb-pvigb3874582@personal.example.com
# Password : PvGa82-x
# Credit Card Number : 4525916807516153(VISA)
# Expiration Date : 01/2026
# Credit Card CSV : 111

# ユーザーと管理者IDセット
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
User.create(email: 'test@sample.co.jp', password: 'password', password_confirmation: 'password')
User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# # ダミーデータ作成
Cosmetic.set_dummy_data
