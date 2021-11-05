class Requester < ApplicationRecord
	strip_attributes
	validates :first_name, :last_name, :email, :reason, :message, presence:true
end
