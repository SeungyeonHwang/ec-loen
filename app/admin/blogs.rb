ActiveAdmin.register Blog do
  
  index do
    selectable_column

    id_column

    column :title
    column :image do |blog|
      if blog.image.attached?
        image_tag url_for(blog.image), class: "small_img"
      else
        "イメージなし"
      end
    end
    column :content do |blog|
      truncate(blog.content, omision: "...", length: 600)
    end
    column :created_at
    column :updated_at
    column :tag
  end

  form do |f|
    f.inputs do
      f.input :title 
      f.input :image, as: :file
      f.input :content, :as => :ckeditor
      f.input :tag
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :title
      row :image do |blog|
        if blog.image.attached?
          image_tag url_for(blog.image), class: "small_img"
        else
          "イメージなし"
        end
      end
      row :content do |blog|
      truncate(blog.content, omision: "...", length: 600)
    end
      row :tag
    end
  end
end

