ActiveAdmin.register Blog do
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title 
      f.input :image, as: :file, input_html: { multiple: true }
      f.input :content
      f.input :tag
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :title
      row :image do
        div do
          blog.image.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
          end
        end
      end
      row :content
      row :tag
    end
  end
end

