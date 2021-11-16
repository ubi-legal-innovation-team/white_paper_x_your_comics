class Project < ApplicationRecord
	strip_attributes except: [ :imagery ]

	validates :title, :actor, :company, :contact, :stakes, :media, :countries, presence:true
	
	has_many :bodies, inverse_of: :project, dependent: :destroy

	has_one_attached :imagery
end
