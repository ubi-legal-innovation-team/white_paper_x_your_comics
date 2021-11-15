class Version < ApplicationRecord
	strip_attributes

	validates :stakes, :media, :countries, :questions, :answers, :imagery, :short_description, :description, presence:true
	validates :language, :inclusion => { :in => %(EN FR) }
	
	belongs_to :project, inverse_of: :versions
end
