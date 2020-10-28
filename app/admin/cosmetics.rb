ActiveAdmin.register Cosmetic do
  index do 
    selectable_column

    id_column

    column :image do |cosmetic|
      if cosmetic.image.attached?
        image_tag url_for(cosmetic.image), class: "small_img"
      else
        "イメージなし"
      end
    end
    column :product_name
    column :company_name
    column :desc

    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :image, :product_name, :company_name, :desc
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :product_name, :company_name, :desc]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # new, edit カスタムする所
  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :product_name
      f.input :company_name
      f.input :desc
    end
    f.actions
  end
  # show　カスタムする所
  show do
    attributes_table do
      row :id 
      row :image do |cosmetic|
        if cosmetic.image.attached?
          image_tag url_for(cosmetic.image), class: "small_img"
        else
          "イメージなし"
        end
      end
      row :product_name
      row :company_name
      row :desc
    end
  end
end
