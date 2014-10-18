class CreateDormAllotments < ActiveRecord::Migration
	def change
    	create_table :dorm_allotments do |t|
    		t.integer :dorm_id
      		t.integer :freshie_m, default:0
      		t.integer :freshie_f, default:0
      		t.integer :upperclass_m, default:0
      		t.integer :upperclass_f, default:0
      		t.integer :graduate_m, default:0
      		t.integer :graduate_f, default:0
		end
	end
end
