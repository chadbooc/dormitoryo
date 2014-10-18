class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
	protect_from_forgery
	helper_method :current_user

	def current_user
    	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  	end

  	def deny_access
 		redirect_to :root
 	end

 	def dormer?
		Resident.where(student_number:current_user.student_number).first != nil
	end

	def renewable?
		if !dormer?
			return false
		end

		s = Record.generate_tag(current_user)
		dorm = Resident.where(student_number:current_user.student_number).first.dorm_id
		d = DormAllotment.select('dorm_id').where(s + ' AND dorm_id = ' + dorm.to_s)

		if d.first == nil
			return false
		else
			return true
		end  
	end

 	def admin?
 		Admin.authenticate(current_user.username) != nil
 	end

 	def logged_in?
 		if current_user == nil
 			deny_access
 		end
 	end
end