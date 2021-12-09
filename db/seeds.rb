require 'csv'

puts '*** BOOTING ***'

[User,Project,Country,Stake,Media,UserAgent,PrintablePdf,Requester].each do |model_name|
	model_name.destroy_all
end

puts '=== all models destroyed ==='

puts '*** START SEED ***'

countries_csv_options = { col_sep: ';', quote_char: nil, headers: :first_row }
countries_filepath    = 'countries.csv'

CSV.foreach(countries_filepath, countries_csv_options) do |row|
  Country.create(name:row[0], region:row[1].split(',').map(&:to_i), position:row[2])
end

puts '=== Countries created ==='

Stake.create(name:"Informational design")
Stake.create(name:"Access to justice")
Stake.create(name:"Innovate sustainably")
Stake.create(name:"Implement legal design")
Stake.create(name:"Perception of law professionals")
Stake.create(name:"Deal with multiplicity of outcomes")

puts '=== Stakes created ==='

Media.create(name:"Document")
Media.create(name:"Toolbox")
Media.create(name:"Website")
Media.create(name:"Comics")
Media.create(name:"Lab")
Media.create(name:"Application")
Media.create(name:"Infographic")
Media.create(name:"Training")

puts '=== Medias created ==='

project1 = Project.create(
	title:"Airbus NDA",
	company:"Imagine Legal Design",
	actor:"Astrid Kohlmeier",
	contact:"https://astridkohlmeier.de/contact/",
	stakes:["Informational design"],
	media:"Document",
	countries:["Germany"])

project1.imagery.attach(
	io:File.open('app/assets/images/imageries/Airbus.jpg'), 
	filename: 'Airbus.jpg', 
	content_type: 'image/jpg')

project1.save

puts '=== p1 saved ==='

project2 = Project.create(
	title:"Toolbox CNIL",
	company:"Amurabi",
	actor:"Marie Potel",
	contact:"Hello@amurabi.eu",
	stakes:["Access to justice","Innovate sustainably"],
	media:"Toolbox",
	countries:["France"])

project2.imagery.attach(
	io:File.open('app/assets/images/imageries/Amurabi.png'), 
	filename: 'Amurabi.png', 
	content_type: 'image/png')

project2.save

puts '=== p2 saved ==='

project3 = Project.create(
	title:"Andie assists",
	company:"Inkling",
	actor:"Sara Rayment",
	contact:"HELLO@INKLINGDESIGN.COM.AU",
	stakes:["Access to justice"],
	media:"Website",
	countries:["Australia"])

project3.imagery.attach(
	io:File.open('app/assets/images/imageries/Andie.png'), 
	filename: 'Andie.png', 
	content_type: 'image/png')

project3.save

puts '=== p3 saved ==='

project4 = Project.create(
	title:"Novation service agreement",
	company:"Hey Plain Jane",
	actor:"Liezl Van Zyl & Elizabeth de Stadler",
	contact:"liezl@heyplainjane.com",
	stakes:["Informational design"],
	media:"Document",
	countries:["South Africa"])

project4.imagery.attach(
	io:File.open('app/assets/images/imageries/Help_plain_jane.png'), 
	filename: 'Help_plain_jane.png', 
	content_type: 'image/png')

project4.save

puts '=== p4 saved ==='

project5 = Project.create(
	title:"Lawtoons ",
	company:"Hiil",
	actor:"Kanan Dhru",
	contact:"kanan.dhru@gmail.com",
	stakes:["Access to justice","Informational design"],
	media:"Comics",
	countries:["India"])

project5.imagery.attach(
	io:File.open('app/assets/images/imageries/Lawtoons.png'), 
	filename: 'Lawtoons.png', 
	content_type: 'image/png')

project5.save

puts '=== p5 saved ==='

project6 = Project.create(
	title:"Les surligneurs",
	company:"Où sont les dragons",
	actor:"Joachim Savin",
	contact:"contact@lessurligneurs.eu",
	stakes:["Perception of law professionals"],
	media:"Website",
	countries:["France"])

project6.imagery.attach(
	io:File.open('app/assets/images/imageries/surligneurs.png'), 
	filename: 'surligneurs.png', 
	content_type: 'image/png')

project6.save

puts '=== p6 saved ==='

project7 = Project.create(
	title:"The judiciary design lab one with the Dominican Republic",
	company:"Lexia Abogados",
	actor:"Jose Torres et Daniela Medina",
	contact:"Info@lexia.co",
	stakes:["Innovate sustainably","Implement legal design"],
	media:"Lab",
	countries:["Brazil"])

project7.imagery.attach(
	io:File.open('app/assets/images/imageries/Lexia.png'), 
	filename: 'Lexia.png', 
	content_type: 'image/png')

project7.save

puts '=== p7 saved ==='

project9 = Project.create(
	title:"Refugeye",
	company:"Design & Human",
	actor:"Geoffrey Dorne",
	contact:"GeoffreyDorne@Protonmail.com",
	stakes:["Access to justice","Informational design"],
	media:"Application",
	countries:["France"])

project9.imagery.attach(
	io:File.open('app/assets/images/imageries/Refugeye.png'), 
	filename: 'Refugeye.png', 
	content_type: 'image/png')

project9.save

puts '=== p9 saved ==='

project10 = Project.create(
	title:"Eco Vadis",
	company:"Passera Design",
	actor:"Stefania Passera",
	contact:"PASSERA.STEFANIA@GMAIL.COM",
	stakes:["Informational design"],
	media:"Document",
	countries:["Finland"])

project10.imagery.attach(
	io:File.open('app/assets/images/imageries/Ecovadis.jpg'), 
	filename: 'Ecovadis.jpg', 
	content_type: 'image/jpg')

project10.save

puts '=== p10 saved ==='

project11 = Project.create(
	title:"Agile Legal Quest",
	company:"Ubisoft & Taylor Wessing",
	actor:"Marie-Lorraine Chiriacopol, Jean-Philippe Doho, Martijn Loth & Otto Sleeking",
	contact:"Legal-Innovation@ubisoft.com",
	stakes:["Informational design","Perception of law professionals"],
	media:"Infographic",
	countries:["France"])

project11.imagery.attach(
	io:File.open('app/assets/images/imageries/TW.png'), 
	filename: 'TW.png', 
	content_type: 'image/png')

project11.save

puts '=== p11 saved ==='

project12 = Project.create(
	title:"Tool SNCF",
	company:"Your Comics",
	actor:"Shayan Remtoulah",
	contact:"Info@your-comics.com",
	stakes:["Deal with multiplicity of outcomes","Informational design"],
	media:"Toolbox",
	countries:["France"])

project12.imagery.attach(
	io:File.open('app/assets/images/imageries/SNCF.png'), 
	filename: 'SNCF.png', 
	content_type: 'image/png')

project12.save

puts '=== p12 saved ==='

project13 = Project.create(
	title:"DU Legal à Montpellier",
	company:"DU Montpellier",
	actor:"Laura Fauqueur",
	contact:"https://www.globalinstitute.legal/",
	stakes:["Implement legal design"],
	media:"Training",
	countries:["France","Spain"])

project13.imagery.attach(
	io:File.open('app/assets/images/imageries/DU.png'), 
	filename: 'DU.png', 
	content_type: 'image/png')

project13.save

puts '=== p13 saved ==='

puts '=== all projects created ==='

puts '*** OVER ***'