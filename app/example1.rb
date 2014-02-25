require 'active_record'
require 'yaml'

$: << "app"
require 'designer'

#read database config, depends on you being in the parent of this dir
config = YAML.load_file('config/databases.yml')['development']
# hook up database to active record
ActiveRecord::Base.establish_connection config


d = Designer.find_by_name("Isaak Mizrahi")
if d.nil?
	#we don't have him in DB right now, so add him
	Designer.create({ 
		:name => "Isaak Mizrahi",
		:brand => "isaak",
		:city => "New York, NY",
		:country => "USA",
		:brand_style => "Youthful yet traditional outerwear"
	})
	d = Designer.find_by_name("Isaak Mizrahi")
end

puts "isaak's id is #{d.id} and location is #{d.city}, #{d.country}"