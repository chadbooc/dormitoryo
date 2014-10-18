class Applicant < ActiveRecord::Base

	def self.demand(id)
		demands = Applicant.select("dorm_id, count(*) as demand").group("dorm_id").having('dorm_id = ' + id.to_s)
		
		if demands.first
			demands.first.demand
		else
			0
		end
	end

	def self.applied(student_number, dorm_id)
		app = Applicant.where(student_number: student_number, dorm_id: dorm_id)
		app.first
	end


end
