ActiveAdmin.register Cosmetic do

  scope :all
  scope -> {"公開"}, :Opend, default: true
  scope -> {"非公開"}, :Closed

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
    column :price do |cosmetic|
        number_to_currency(cosmetic.price)
    end
    column :Open do |ids|
      ids.is_open
    end
    actions
  end

  # コスメをOpenする
  batch_action :open do |ids|
    @cosmetics = Cosmetic.where(id: ids)

    @cosmetics.each do |cosmetic| 
      cosmetic.update(is_open: true)
    end
    flash[:notice] = "コスメが公開されました。"
    redirect_back(fallback_location: root_path)
  end

  # コスメをCloseする
  batch_action :close do |ids|
    @cosmetics = Cosmetic.where(id: ids)

    @cosmetics.each do |cosmetic| 
      cosmetic.update(is_open: false)
    end
    flash[:notice] = "コスメが非公開されました。"
    redirect_back(fallback_location: root_path)
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :product_name
      f.input :company_name
      f.input :desc
      f.input :price, hint: "販売価格を入力してください"
      f.input :is_open
    end
    f.actions
  end
  # showをカスタムする所
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