class Admin < ActiveRecord::Base

	def self.authenticate(username)
		admin = find_by_username(username)
		if admin
			admin.dorm_id
		else
			nil
		end
	end

end
