class ProjectPdf
	def initialize(pdf,project,version,params)

		image_one   = []
		image_two   = []
		image_three = []
		image_four  = []
		image_five  = []
		image_six   = []
		image_seven = []

		params[:sources].split(',').zip(params[:questions].split(',')).each do |array|

			if array.last == "question_one"
				image_one.push(array.first)
    	elsif array.last == "question_two"
 				image_two.push(array.first)
    	elsif array.last == "question_three"
 				image_three.push(array.first)
    	elsif array.last == "question_four"
 				image_four.push(array.first)
    	elsif array.last == "question_five"
				image_five.push(array.first)
    	elsif array.last == "question_six"
				image_six.push(array.first)
    	elsif array.last == "question_seven"
				image_seven.push(array.first)
			end

    end

		# title
		pdf.text project.title, align: :center, style: :bold, size: 20
		pdf.text project.actor, align: :center
		pdf.move_down(20)

		# long description
		pdf.text version.long_description.to_plain_text if version
		pdf.move_down(20)

		# imagery
		pdf.image open("http://res.cloudinary.com/led8/image/upload/#{project.imagery.key}"), fit: [350, 350], position: :center
		pdf.move_down(20)

		if version && version.version == "fr"

			# first question
			pdf.text "_1. À quelle problématique a répondu votre projet et quelle en était la cible ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_one.to_plain_text if version
			pdf.move_down(20)

			if !image_one.empty?

				image_one.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# second question
			pdf.text "_2. Quelles ont été les solutions mises en place ? (Descriptif du projet + visuels) ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_two.to_plain_text if version
			pdf.move_down(20)

			if !image_two.empty?

				image_two.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# third question
			pdf.text "_3. Quelle a été la méthodologie pour mettre cela en place ? Et quelles ont été les parties prenantes ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_three.to_plain_text if version
			pdf.move_down(20)

			if !image_three.empty?

				image_three.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# fourth question
			pdf.text "_4. Quel a été l’impact, les résultats du projet ? Un verbatim utilisateur ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_four.to_plain_text if version
			pdf.move_down(20)

			if !image_four.empty?

				image_four.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# fifth question
			pdf.text "_5. Quels ont été les principaux challenges ? Et comment les avez-vous surmontés ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_five.to_plain_text if version
			pdf.move_down(20)

			if !image_five.empty?

				image_five.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# sixth question
			pdf.text "_6. Quel est votre retour d’expérience, les conseils que vous donneriez pour des projets similaires ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_six.to_plain_text if version
			pdf.move_down(20)

			if !image_six.empty?

				image_six.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# seventh question
			pdf.text "_7. Comment ce projet a changé votre approche sur le droit ? sur le Legal design ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_seven.to_plain_text if version
			pdf.move_down(20)

			if !image_seven.empty?

				image_seven.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

		else

			# first question
			pdf.text "_1. What problem did your project address and who was the target ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_one.to_plain_text if version
			pdf.move_down(20)

			if !image_one.empty?

				image_one.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# second question
			pdf.text "_2. What solutions have been put in place? (Project description + visuals) ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_two.to_plain_text if version
			pdf.move_down(20)

			if !image_two.empty?

				image_two.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# third question
			pdf.text "_3. What was the methodology to put this in place? And who were the stakeholders ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_three.to_plain_text if version
			pdf.move_down(20)

			if !image_three.empty?

				image_three.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# fourth question
			pdf.text "_4. What was the impact, the results of the project? Can you share a user verbatim ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_four.to_plain_text if version
			pdf.move_down(20)

			if !image_four.empty?

				image_four.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# fifth question
			pdf.text "_5. What were the main challenges? And how did you overcome them ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_five.to_plain_text if version
			pdf.move_down(20)

			if !image_five.empty?

				image_five.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# sixth question
			pdf.text "_6. What is your feedback on the project, what advice would you give for similar projects ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_six.to_plain_text if version
			pdf.move_down(20)

			if !image_six.empty?

				image_six.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

			# seventh question
			pdf.text "_7. How has this project changed your approach to law ? to Legal design ?", style: :bold
			pdf.move_down(10)
			pdf.text version.question_seven.to_plain_text if version
			pdf.move_down(20)

			if !image_seven.empty?

				image_seven.each do |url|
					pdf.image open(url.gsub('admin.','')), fit: [350, 350], position: :center
	    		pdf.move_down(20)
				end

			end

		end
	end
end