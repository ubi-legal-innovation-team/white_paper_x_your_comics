class Project < ApplicationRecord
	strip_attributes except: [ :imagery ]

	validates :title, :actor, :company, :contact, :stakes, :media, :countries, presence:true
	
	has_many :bodies, inverse_of: :project, dependent: :destroy

	accepts_nested_attributes_for :bodies

	has_one_attached :imagery
end
