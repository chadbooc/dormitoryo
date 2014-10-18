 class AdminController < ApplicationController
 	before_filter :logged_in?
 	before_filter :deny_access, :unless => :admin?

 	#================Dorm Slots=================
 	#ST-3: As an OSHAdmin, I can modify the slots in the dorms
 	
	def modify_slots
		@dorm = Dorm.find(params[:id])
		@dorm_allotment = DormAllotment.find(params[:id])
	end

	def save

		@dorm = Dorm.find(params[:id])
		@dorm.total_slots = params[:dorm][:total_slots]
		

		@dorm_allotment = DormAllotment.find(params[:id])
		@dorm_allotment.freshie_m = params[:dorm_allotment][:freshie_m]
		@dorm_allotment.freshie_f = params[:dorm_allotment][:freshie_f]
		@dorm_allotment.upperclass_m = params[:dorm_allotment][:upperclass_m]
		@dorm_allotment.upperclass_f = params[:dorm_allotment][:upperclass_f]
		@dorm_allotment.graduate_m = params[:dorm_allotment][:graduate_m]
		@dorm_allotment.graduate_f = params[:dorm_allotment][:graduate_f]
				

		if @dorm_allotment.valid? && @dorm.valid? && @dorm.total_slots >= @dorm.occupied_slots
 
            total = @dorm_allotment.freshie_m + @dorm_allotment.freshie_f + @dorm_allotment.upperclass_m +
                    @dorm_allotment.upperclass_f + @dorm_allotment.graduate_m + @dorm_allotment.graduate_f

            if total <= @dorm.total_slots
                    @dorm_allotment.save
                    @dorm.save
                    redirect_to :view_dorms
            else
                    flash[:notice] = "*The total of the allocated slots must be less than or equal to the total slots"
                    render 'admin/modify_slots'
            end

		elsif @dorm.total_slots < @dorm.occupied_slots
		    flash[:notice] = "*Total Slot should be at least equal to the number of current residents. Current number of residents is " + @dorm.occupied_slots.to_s + "."
		    render 'admin/modify_slots'
       
       	else
            render 'admin/modify_slots'
		end	
	end

	#===========================================
	def post
	end

	def post_it
		Announcement.create header:params[:post][:header], content:params[:post][:content]
		redirect_to :root
	end

	def waitlist
		@record = Record.new
		w = Waitlist.select('student_number').all
		@waitlist = Record.select('student_number, first_name, last_name').where(student_number:w)
	end

	def search_by_snum
		@student_number = params[:record][:student_number]
		@waitlisted = Waitlist.where(student_number:@student_number).first
		record = Record.where(student_number:@student_number).first

		if Resident.where(student_number:@student_number).first
			@dormer = true
		end

		if record
			@student = Record.full_name(record)
		end
		
		@record = Record.new


		w = Waitlist.select('student_number').all
		@waitlist = Record.select('student_number, first_name, last_name').where(student_number:w)

		render :waitlist
	end

	def add_to_waitlist


		w = Waitlist.create student_number:params[:student_number]
		@name = params[:name]
		#redirect_to :root
	end

	def grant_dorm
		snum = params[:student_number]
		@dorms = Dorm.all
		@resident = Resident.new
	end

end
