class Version < ApplicationRecord
	strip_attributes

	validates :stakes, :media, :country, :questions, :answers, :imagery, :short_description, presence:true
	validates :language, :inclusion => { :in => %(EN FR) }
	
	belongs_to :project, inverse_of: :versions
end
