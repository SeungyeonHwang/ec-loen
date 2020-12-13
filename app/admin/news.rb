ActiveAdmin.register News do

  index do
    selectable_column

    id_column

    column :title
    column :content do |news|
      truncate(news.content, omision: "...", length: 600)
    end
    column :created_at
    column :updated_at
  end

  form do |f|
    f.inputs do
      f.input :title 
      f.input :content, :as => :ckeditor
    end
    f.actions
  end
  
end
