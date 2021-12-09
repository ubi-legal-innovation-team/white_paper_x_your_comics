class Project < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged

	strip_attributes except: [ :imagery ]

	validates :title, :actor, :company, :contact, :stakes, :media, :countries, presence:true
	
	has_many :bodies, inverse_of: :project, dependent: :destroy
	has_one_attached :imagery

	accepts_nested_attributes_for :bodies

	before_update  :set_multiple_fields
	before_create  :set_multiple_fields
	before_destroy :destroy_printable

	private

	def set_multiple_fields
	  self.countries.delete("")
	  self.stakes.delete("")
	  self.countries.compact!
	  self.stakes.compact!
  end

  def destroy_printable
  	id = self.id

  	printable = PrintablePdf.find_by(project_id:id)
  	printable.destroy
  end
end
