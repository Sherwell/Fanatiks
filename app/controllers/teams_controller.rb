class TeamsController < ApplicationController
	before_action :set_team, only: [:show, :edit, :update, :destroy]

	def index
		@teams = Team.all 
	end

	def show 
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save
			redirect_to teams_path
		else
			respond_to do |format|
				format.html { render action: "new" }
				format.json { render json: @team.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @team.update(team_params)
			redirect_to teams_path
		else
			respond_to do |format|
				format.html { render action: "edit" }
				format.json { render json: @team.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@team.destroy
		redirect_to teams_path
	end

	private
		def set_team
			@team = Team.find(params[:id])
		end

		def team_params
			params.require(:team).permit(:name, :logo)
		end
end
