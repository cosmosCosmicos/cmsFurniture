

ActiveAdmin.register Image do

  permit_params :name, :page_id , :description, :display ,:show_name , :is_published , :order, :file_name

  controller do
    def create
      attrs = permitted_params[:image]
      filename = attrs[:file_name].original_filename
      image = Image.new
      image.name = attrs[:name]
      image.page_id = attrs[:page_id]
      image.description = attrs[:description]
      image.order = attrs[:order]
      image.file_name = filename
      image.display = attrs[:display]
      image.show_name = attrs[:show_name]
      image.is_published = attrs[:is_published]

      if image.save
        save_image(image)
        flash[:notice] = 'File uploaded'
        redirect_to '/admin/images'
      else
        flash[:notice] = 'cant upload file, please try again'
        redirect_to '/admin/images/new'
      end
    end
  end

  def save_image(image)
    page = Page.find(image.page_id)
    section = Section.find(page.section)
    directory = 'public/images/' + section.name + '/' + page.title
    path = File.join(directory, image.file_name)
    FileUtils.mkdir_p(path) unless File.exist?(path)
  end

  index do
    column :id
    column :name
    column :description
    column :file_name
    column :order
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name, :label => "Name"
      f.input :page , :label => "Page"
      f.input :description, as: :html_editor, :label  => "Desciption"
      f.input :order , :label => "Order"
      f.input :file_name, as: :file , :label => "File"
      f.input :display, :label => "Display in Page"
      f.input :show_name, :label => "Show Name"
      f.input :is_published , :label => "Published"
      f.actions
    end
  end

end
