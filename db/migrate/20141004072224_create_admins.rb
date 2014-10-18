class CreateAdmins < ActiveRecord::Migration
	def change
    	create_table :admins do |t|
    		t.string :username
    		t.integer :dorm_id
    	end
  	end
end
