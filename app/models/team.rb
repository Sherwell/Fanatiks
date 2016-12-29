class Team < ActiveRecord::Base
	# Associations
	has_many :group_teams, dependent: :destroy 

	# Validations
	validates_presence_of :name, :logo
end
