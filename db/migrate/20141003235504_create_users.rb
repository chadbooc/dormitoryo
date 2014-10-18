class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.column :student_number, :integer, unique: true
			t.column :username, :string, unique: true
    		t.column :password_hash, :string
    		t.column :password_salt, :string
		end
	end
end
