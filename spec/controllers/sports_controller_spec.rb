require 'rails_helper'

RSpec.describe SportsController, type: :controller do
	let(:sport) { create :sport }

	describe "actions" do
		describe "GET #index" do 
			it "assigns @sports" do 
				sports = create_list(:sport, 10)
				get :index

				expect(assigns(:sports)).to eq(sports)

				expect(assigns(:sports).count).to eq(10)
			end

			it "renders the index template" do
				get :index
				expect(response).to render_template(:index)
			end

			it "responds with status-code 200" do 
				get :index
				# expect status-code 200 
				expect(response.status).to eq(200)
			end
		end

		describe "GET #show" do 
			it "assigns the sport specified by id" do 
				get :show, id: sport

				expect(assigns(:sport)).to eq(sport)
			end

			it "renders the show template" do 
				get :show, id: sport

				expect(response).to render_template(:show)
			end

			it "responds with status-code 200" do
				get :show, id: sport
				# expect status-code 200
				expect(response.status).to eq(200)
			end
		end

		describe "GET #new" do 
			it "assigns @sport to a new sport" do 
				get :new

				expect(assigns(:sport)).to be_a_new(Sport)
			end

			it "renders template new" do 
				get :new

				expect(response).to render_template(:new)
			end

			it "responds with status-code 200" do 
				get :new

				expect(response.status).to eq(200)
			end
		end

		describe "POST #create" do 
			context "with valid attributes" do
				it "creates a new sport" do
					expect {
						post :create, sport: attributes_for(:sport)
					}.to change(Sport, :count).by(1)
				end

				it "redirect to :index" do 
					post :create, sport: attributes_for(:sport)

					expect(response).to redirect_to("/sports")
				end

				it "responds with status-code 302" do
					post :create, sport: attributes_for(:sport)

					expect(response.status).to eq(302)
				end	
			end

			context "with invalid attributes" do 
				it "doesn't create a new sport" do 
					expect {
						post :create, sport: { pg: nil }
					}.to_not change(Sport, :count)
				end

				it "responds with status-code 200" do 
					post :create, sport: { name: nil }

					expect(response.status).to eq(200)
				end

				it "renders new template" do
					post :create, sport: { name: nil }

					expect(response).to render_template(:new)
				end

				it "renders json with errors" do
					post :create, sport: { name: nil }, format: :json 

					json = JSON.parse(response.body)
					expect(json["name"]).to include("can't be blank")
				end
			end
		end

		describe "GET #edit" do 
			it "assigns the sport specified by id" do 
				get :edit, id: sport 

				expect(assigns(:sport)).to eq(sport)
			end

			it "loads the edit template" do
				get :edit, id: sport

				expect(response).to render_template(:edit)
			end

			it "responds with status-code 200" do 
				get :edit, id: sport

				expect(response.status).to eq(200)
			end
		end

		describe "PUT #update" do 
			context "with valid attributes" do 
				it "updates the specified sport" do
					put :update, id: sport, sport: { name: "New Sport" }
					sport.reload

					expect(sport.name).to eq("New Sport")
				end

				it "redirects to sports path" do
					put :update, id: sport, sport: { name: "New Sport" }
					sport.reload

					expect(response).to redirect_to "/sports"
				end

				it "responds with status-code 302" do 
					put :update, id: sport, sport: { name: "New Sport" }

					expect(response.status).to eq(302)
				end
			end

			context "with invalid attributes" do 
				it "doesn't update the specified sport" do 
					put :update, id: sport, sport: { name: "Not Changed", image: nil }
					sport.reload

					expect(sport.name).to_not eq("Not Changed")
				end

				it "renders edit template" do 
					put :update, id: sport, sport: { name: "Not Changed", image: nil }

					expect(response).to render_template(:edit)
				end

				it "responds with status-code 200" do
					put :update, id: sport, sport: { name: "Not Changed", image: nil }

					expect(response.status).to eq(200)
				end

				it "renders json with errors" do
					put :update, id: sport, sport: { name: "Not Changed", image: nil }, format: :json

					json = JSON.parse(response.body)
					expect(json["image"]).to include("can't be blank")
				end
			end
		end

		describe "DELETE #destroy" do 
			it "deletes the sport specified by id" do 
				# expect change of count by 0 because it first creates, then deletes it
				expect {
					delete :destroy, id: sport
				}.to change(Sport, :count).by(0) 

				# confirm that sport was removed
				expect(Sport.find_by_id(sport.id)).to eq(nil)
			end

			it "responds with status-code 302" do 
				delete :destroy, id: sport

				# test for status-code 302
				expect(response.status).to eq(302)
			end
		end
	end
end
