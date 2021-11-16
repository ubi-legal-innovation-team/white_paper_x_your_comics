class Body < ApplicationRecord
	strip_attributes
	
	belongs_to :project, inverse_of: :bodies

	has_rich_text :content
end
