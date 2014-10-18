class Dorm < ActiveRecord::Base

	validates_presence_of :total_slots

	def self.available(id)
		dorm = Dorm.find(id)
		
		if (dorm.total_slots - dorm.occupied_slots) >= 0
                  return dorm.total_slots - dorm.occupied_slots
   		else
      		return 0
        end
	
		#dorm = DormAllotment.where(dorm_id:id).first
		#total = dorm.freshie_m + dorm.freshie_f + dorm.upperclass_m +
		#		dorm.upperclass_f + dorm.graduate_m + dorm.graduate_f
	
		#return total
	end

end
