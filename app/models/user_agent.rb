class UserAgent < ApplicationRecord
	strip_attributes

	validates :operating_system, presence: true
	validates :host_name, :publics_ip, uniqueness: true
	
	private

	def self.remove_duplicates
		grouped = UserAgent.all.group_by{ |user_agent| [user_agent.host_name, user_agent.publics_ip] }
		p grouped
		grouped.values.each do |duplicates|
			first_one = duplicates.shift

			duplicates.each{|double| double.destroy}
		end
	end
end
