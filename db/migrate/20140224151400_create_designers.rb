class CreateDesigners < ActiveRecord::Migration
	def change
		create_table :designers do |t|
			t.string :name
			t.string :brand
			t.string :city
			t.string :country
			t.text :brand_style

			t.timestamps
		end
	end		
end