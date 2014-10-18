class UserController < ApplicationController
	
	before_filter :logged_in?, :except => [:home, :sign_in]
	
	#uses:
	#user/login.html.erb
	#user/home.html.erb, if logged in
	def home
		if current_user == nil
			@user = User.new
			@announcement = Announcement.all.reverse
			render :login
		end
	end

	#===============Authentication==================
	#ST-1: As a user, I can login
	#ST-2: As a user, I can logout

  	def sign_in
	    username = params[:user][:username]
	    password = params[:user][:password]

	    user = User.authenticate(username, password)

	    if user
	    	session[:user_id] = user.id
		else
			flash[:error] = 'username and password does not match'
		end

		redirect_to :root
  	end

  	def logout
	    if current_user
	      session[:user_id] = nil
	      flash[:notice] = "You have been signed out."
	    end

	    redirect_to :root
  	end	

  	#==================View Dorms====================
  	#ST-4: As a user, I can view the number of slots a dorm can accomodate
  	#ST-5: As a user, I can view the number of slots available in a dorm
  	
  	def view_dorms
		@dorms = Dorm.all
	end

	#====================Apply=======================
	#ST-6: As a user, I can view of demands in a certain dorm
	#ST-7: As a dorm applicant, I want to choose the dorms I want to apply to
	#ST-8: As a dorm applicant (current dormer), I can renew my slot in the dormitory

	before_filter :apply, :unless => :admin?, :only => [:new_application, :sort]
	before_filter :deny_access, :unless => :renewable?, :only => :renew

	def apply
		app_status = Record.where(student_number:current_user.student_number).first.app_status

		unless app_status == 2 || !renewable?
			redirect_to :renew
		end
	end

	def new_application
		@dormer = renewable?
		@admin = admin?

		if @admin
			@dorms = Dorm.all
		else
			s = Record.generate_tag(current_user)
			d = DormAllotment.select('dorm_id').where(s)
			@dorms = Dorm.where(id: d)
		end
	end

	def renew
		s = Record.where(student_number:current_user.student_number)
		@app_status = s.first.app_status
	end

	def save
		user = Record.where(student_number:current_user.student_number).first
		user.app_status = params[:status]
		user.save

		if(user.app_status == 1)

			a = Applicant.where(student_number:current_user.student_number)
			a.each do |x|
				x.destroy
			end

			dorm = Resident.where(student_number:current_user.student_number).first
			#kailangan bang idagdag yung renewal sa demand?		
			Applicant.create student_number:user.student_number, dorm_id:dorm.dorm_id, is_renewing:true


			redirect_to :back
		else
			redirect_to :new_application
		end
	end

	def select
		@dorm = Dorm.find(params[:id])
		apply = Applicant.create(dorm_id:params[:id], student_number:current_user.student_number, is_renewing:false)
		redirect_to :sort
	end

	def remove
		to_remove = Applicant.where(student_number:current_user.student_number, dorm_id:params[:id]).first
		#dapat may lalabas na are you sure?
		to_remove.destroy
		redirect_to :back
	end

	def sort
		if admin?
			redirect_to :root
		end
		
		a = Applicant.where(student_number:current_user.student_number)
		dorms = Applicant.select('dorm_id').where(student_number:current_user.student_number)
		@dorm = Dorm.where(id:dorms)
	end

	
end
