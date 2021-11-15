class Project < ApplicationRecord
	strip_attributes

	validates :title, :actor, :company, presence:true
	
	has_many :versions, inverse_of: :project, dependent: :destroy
end
