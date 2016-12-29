class Group < ActiveRecord::Base
  # Associations
  belongs_to :tournament
  has_many :group_teams, dependent: :destroy

  # Validations
  validates_presence_of :name, :position, :tournament_id
end
