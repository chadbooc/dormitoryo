class CreateDorms < ActiveRecord::Migration
  	def change
    	create_table :dorms do |t|
    		t.string :dorm_name
    		t.integer :occupied_slots, default:0
    		t.integer :total_slots, default:0
    	end
  	end
end
