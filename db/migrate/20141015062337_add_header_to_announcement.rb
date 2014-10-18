class AddHeaderToAnnouncement < ActiveRecord::Migration
	def change
		add_column :announcements, :header, :string
	end
end
