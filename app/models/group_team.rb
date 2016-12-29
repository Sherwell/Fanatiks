class GroupTeam < ActiveRecord::Base
  BASE_ATTRIBUTES = %i(group_id team_id pj pg pp pe gf gc dif pts)

  # Associations
  belongs_to :group
  belongs_to :team

  # Validations
  validate :all_base_attributes_present?

  # Callbacks
  before_validation :calculate_pj
  before_validation :calculate_dif
  before_validation :calculate_pts

  # Methods
  private
    # Calculates played games from won games, lost games, and tied games
    # Returns nothing
  	def calculate_pj
  		if self.pg? && self.pp? && self.pe?
  			self.pj = self.pg + self.pp + self.pe 
  		end
  	end

  	# Calculates difference in goals from favor goals - against goals
  	# Returns nothing
  	def calculate_dif
  		if self.gf? && self.gc?
  			self.dif = self.gf - self.gc
  		end
  	end

  	# Calculates group team points
  	# Returns nothing
  	def calculate_pts
  		if self.pg? && self.pe?
  			self.pts = self.pg * 3 + self.pe
  		end
  	end

  	# Tests for all base attributes to be present
  	# Returns true if all present, false if not
  	def all_base_attributes_present?
      if BASE_ATTRIBUTES.all? { |attribute| self.send("#{attribute}?") }
  		  return true
      else
        errors.add(:base, "All attributes are needed")
        return false
      end
  	end
end
