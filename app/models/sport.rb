class Sport < ActiveRecord::Base
	# Associations
	has_many :leagues, dependent: :destroy

	# Validations
	validates_presence_of :name, :image
end
