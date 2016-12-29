class SportsController < ApplicationController
	before_action :set_sport, only: [:show, :edit, :update, :destroy]

	def index
		@sports = Sport.all
	end

	def show
	end 

	def new
		@sport = Sport.new
	end

	def create
		@sport = Sport.new(sport_params)
		if @sport.save
			redirect_to sports_path
		else
			respond_to do |format|
				format.html { render action: 'new' }
				format.json { render json: @sport.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @sport.update(sport_params)
			redirect_to sports_path
		else
			respond_to do |format|
				format.html { render action: 'edit' }
				format.json { render json: @sport.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@sport.destroy
		redirect_to sports_path
	end

	private
		def set_sport
			@sport = Sport.find(params[:id])
		end

		def sport_params
			params.require(:sport).permit(:name, :image)
		end
end
