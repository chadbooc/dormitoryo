class DormAllotment < ActiveRecord::Base

	validates_presence_of :freshie_m
	validates_presence_of :freshie_f
	validates_presence_of :upperclass_m
	validates_presence_of :upperclass_f
	validates_presence_of :graduate_m
	validates_presence_of :graduate_f

	validates_numericality_of :freshie_m, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "male freshmen must be greater than or equal to 0"

    validates_numericality_of :freshie_f, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "female freshmen must be greater than or equal to 0"

    validates_numericality_of :upperclass_m, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "male upperclass must be greater than or equal to 0"

   	validates_numericality_of :upperclass_f, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "female upperclass must be greater than or equal to 0"

    validates_numericality_of :graduate_m, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "male graduate students must be greater than or equal to 0"

    validates_numericality_of :graduate_f, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "female graduate students must be greater than or equal to 0"
end
