require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
	let(:team) { create :team }

	describe "actions" do 
		describe "GET #index" do 
			before(:each) do 
				get :index 
			end

			it "assigns @teams" do 
				teams = create_list(:team, 10)
				expect(assigns(:teams)).to eq(teams)
				expect(assigns(:teams).count).to eq(10)
			end

			it "renders template :index" do
				expect(response).to render_template(:index)
			end	

			it "responds with status-code 200" do 
				expect(response.status).to eq(200)
			end 
		end

		describe "GET #show" do 
			before(:each) do 
				get :show, id: team
			end

			it "assigns @team" do 
				expect(assigns(:team)).to eq(team)
			end

			it "renders template show" do 
				expect(response).to render_template(:show)
			end

			it "responds with status-code 200" do 
				expect(response.status).to eq(200)
			end
		end

		describe "GET #new" do 
			before(:each) do 
				get :new 
			end

			it "assigns @team with new team" do 
				expect(assigns(:team)).to be_a_new(Team)
			end

			it "renders template new" do 
				expect(response).to render_template(:new)
			end	

			it "responds with status-code 200" do 
				expect(response.status).to eq(200)
			end
		end

		describe "POST #create" do
			describe "with valid attributes" do
				it "creates a new team" do
					expect {
						post :create, team: attributes_for(:team)
					}.to change(Team, :count).by(1)
				end

				it "redirects to index" do 
					post :create, team: attributes_for(:team)

					expect(response).to redirect_to("/teams")
				end

				it "responds with status-code 302" do 
					post :create, team: attributes_for(:team)

					expect(response.status).to eq(302)
				end
			end

			describe "with invalid attributes" do 
				it "doesn't create a new team" do 
					expect { 
						post :create, team: { name: nil }
					}.to_not change(Team, :count)
				end

				it "renders template new" do 
					post :create, team: { name: nil }

					expect(response).to render_template(:new) 
				end

				it "responds with status-code 200" do 
					post :create, team: { name: nil }

					expect(response.status).to eq(200)
				end

				it "renders json with errors" do 
					post :create, team: { name: nil }, format: :json

					json = JSON.parse(response.body)
					expect(json["name"]).to include("can't be blank")
				end
			end 
		end

		describe "GET #edit" do 
			it "assigns @team" do 
				get :edit, id: team 

				expect(assigns(:team)).to eq(team)
			end

			it "renders template edit" do 
				get :edit, id: team 

				expect(response).to render_template(:edit)
			end

			it "responds with status-code 200" do 
				get :edit, id: team 

				expect(response.status).to eq(200)
			end
		end

		describe "PUT #update" do
			describe "with valid attributes" do 
				it "updates team specified by id" do 
					put :update, id: team, team: { name: "New Team" }
					team.reload

					expect(team.name).to eq("New Team")
				end

				it "redirects to index" do 
					put :update, id: team, team: { name: "New Team" }

					expect(response).to redirect_to("/teams")
				end

				it "responds with status-code 302" do 
					put :update, id: team, team: { name: "New Team" }

					expect(response.status).to eq(302)
				end
			end

			describe "with invalid attributes" do 
				it "doesn't update team" do 
					put :update, id: team, team: { name: "New Team", logo: nil }
					team.reload

					expect(team.name).not_to eq("New Team")
				end

				it "renders template edit" do 
					put :update, id: team, team: { name: "New Team", logo: nil }

					expect(response).to render_template(:edit)
				end

				it "responds with status-code 200" do 
					put :update, id: team, team: { name: "New Team", logo: nil }
					expect(response.status).to eq(200)
				end

				it "renders json error" do 
					put :update, id: team, team: { name: "New Team", logo: nil }, format: :json 

					json = JSON.parse(response.body)

					expect(json["logo"]).to include("can't be blank")
				end
			end
		end

		describe "DELETE #destroy" do 
			it "deletes the object specified by id" do 
				# expect change by 0 because it creates then deletes it
				expect {
					delete :destroy, id: team 
				}.to change(Team, :count).by(0)

				# confirm that team was removed
				expect(Team.find_by_id(team.id)).to eq(nil)
			end

			it "redirects to index" do 
				delete :destroy, id: team 

				expect(response).to redirect_to("/teams")
			end

			it "responds with status-code 302" do 
				delete :destroy, id: team 

				expect(response.status).to eq(302)
			end
		end
	end
end
