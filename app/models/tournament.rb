class Tournament < ActiveRecord::Base
  # Associations
  belongs_to :league

  # Validations
  validates_presence_of :name, :year, :league_id
end
