ActiveAdmin.register Page do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :title, :body, :order , :is_published ,:section_id, :menu_display, :featured

index do
	column :id
	column :title, :sorteable => :title
	column :section, :sorteable => :section
	column :created_at , :sorteable => :created_at
	column :order 
	actions
end

form do |f| 
	f.inputs "Details" do
		f.input :title, :label => "Title"
		f.input :section , :label => "Section"
		f.input :body, as: :html_editor, :tabel  => "Body"
		f.input :order , :label => "Order"
		f.input :is_published , :label => "Published"
		f.input :featured , :label => "Featured"
		f.input :menu_display, :label => "Display in Menu"
		f.actions
	end
end


end
