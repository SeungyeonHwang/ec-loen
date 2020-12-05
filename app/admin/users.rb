ActiveAdmin.register User do
  index do
    selectable_column

    id_column

    column :email
    column :"カート" do |user|
      user.carts.present?
    end

    actions do |user|
      a "カートを確認", href: "/admin/users/#{user.id}/carts"
    end
  end
end
