class League < ActiveRecord::Base
  # Associations
  belongs_to :sport
  has_many :tournaments, dependent: :destroy
  
  # Validations
  validates_presence_of :name, :logo, :sport_id
  validates :active, inclusion: [true, false]
  validate :end_after_start

  # Callbacks
  # check if should be active according to start_date and end_date
  before_create :set_active

  # Methods
  # Sets active to opposite of current value
  # returns nothing
  def toggle_active!
  	self.toggle!(:active)
  end

  private
  	# Validates end_date is after start_date
  	# returns nothing
	def end_after_start
		return if start_date.blank? || end_date.blank?

		if end_date < start_date 
			errors.add(:end_date, "must be before start_date")
		end
	end

	# Sets active to true if current_date is between league start_date and end_date
	# returns nothing
	def set_active
		return if start_date.blank? || end_date.blank?

		if Date.today.between?(start_date, end_date)
			self.active = true
		else
			self.active = false
		end

    return nil
	end
end
