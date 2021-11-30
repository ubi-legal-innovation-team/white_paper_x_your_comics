class UserAgent < ApplicationRecord
	strip_attributes

	validates :host_name, :operating_system, presence:true, uniqueness:true
end
