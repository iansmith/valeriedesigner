# require the gemfile active record
require 'active_record'
# require yaml (markup language for structuring data in a file). if this is a gemwhy isn't specified in the gemfile.
require 'yaml'

# not sure ????  $ means global variable???  related to the app directory.
$: << "app"
# require the file designer.rb, which contains the class information
require 'designer'

#read database config, depends on you being in the parent of this dir
# sets variable config. value of config is an instantion of YAML, with the method load_file called on it.  Where is this method defined?
config = YAML.load_file('config/databases.yml')['development']
# hook up database to active record
# calls establish_connecton method on this class?  Where is it instantiated????
ActiveRecord::Base.establish_connection config

# variable d is an instance of the class designer, and method find_by_name.  IS find_by_name part of ActiveRecord class?  looks for
# a designer's name
d = Designer.find_by_name("Isaac Mizrahi")
# if there is no value
if d.nil?
	#we don't have him in DB right now, so add him
	# create a hash table
	Designer.create({ 
		:name => "Isaac Mizrahi",
		:brand => "isaac",
		:city => "New York, NY",
		:country => "USA",
		:brand_style => "Youthful yet traditional outerwear"
	})
	d = Designer.find_by_name("Isaac Mizrahi")
end

puts "isaac's id is #{d.id} and location is #{d.city}, #{d.country}"