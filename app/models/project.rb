class Project < ApplicationRecord
	strip_attributes except: [ :imagery ]

	validates :title, :actor, :company, :contact, :stakes, :media, :countries, presence:true
	
	has_many :bodies, inverse_of: :project, dependent: :destroy
	has_one_attached :imagery

	accepts_nested_attributes_for :bodies

	before_update :set_multiple_fields

	private

	def set_multiple_fields
	  self.countries.delete("")
	  self.stakes.delete("")
	  self.countries.compact!
	  self.stakes.compact!
  end
end
