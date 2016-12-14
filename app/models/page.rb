class Page < ActiveRecord::Base
	belongs_to :section
	has_many :image
	scope :display_by_section , -> id {where(section_id: id, menu_display: true) if id.present?}
end
