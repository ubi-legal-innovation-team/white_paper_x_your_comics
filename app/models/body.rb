class Body < ApplicationRecord
	strip_attributes
	
	belongs_to :project, inverse_of: :bodies

	validates  :long_description,
			   :short_description, 
			   :question_one, 
			   :question_two, 
			   :question_three, 
			   :question_four, 
			   :question_five, 
			   :question_six, 
			   :question_seven, presence: true

	has_rich_text :long_description
	has_rich_text :question_one
	has_rich_text :question_two
	has_rich_text :question_three
	has_rich_text :question_four
	has_rich_text :question_five
	has_rich_text :question_six
	has_rich_text :question_seven
end
