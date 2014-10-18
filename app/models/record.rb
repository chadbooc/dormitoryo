class Record < ActiveRecord::Base
	has_one :user

	def self.generate_tag(user)
		r = Record.where(student_number: user.student_number).first
		s = ""

		if(r.student_tag == 'freshman')
			s = "freshie_"
		elsif(r.student_tag == 'upperclass')
			s = "upperclass_"
		elsif(r.student_tag == 'graduate')
			s = "graduate_"
		end

		if(r.sex == 'male')
			s = s + "m > 0"
		else
			s = s + "f > 0"
		end

		return s
	end

	def self.full_name(record)
		return record.last_name + ", " + record.first_name
	end
end
