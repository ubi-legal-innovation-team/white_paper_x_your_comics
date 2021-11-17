class Country < ApplicationRecord
	strip_attributes

	validates :name, presence:true, uniqueness:true
end
