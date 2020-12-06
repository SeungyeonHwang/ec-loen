ActiveAdmin.register Blog do
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
      row :content
      row :tag
    end
  end
end

