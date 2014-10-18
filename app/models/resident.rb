class Resident < ActiveRecord::Base

	before_save :update_slots

	def update_slots
		dorm = Dorm.find(dorm_id)
		dorm.occupied_slots += 1
		dorm.save
	end
end
