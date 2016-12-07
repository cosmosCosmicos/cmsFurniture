class Page < ActiveRecord::Base
	belongs_to :section
	scope :display_by_section , -> id {where(section_id: id, menu_display: true) if id.present?}
end
