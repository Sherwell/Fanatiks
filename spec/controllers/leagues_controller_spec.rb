require 'rails_helper'

RSpec.describe LeaguesController, type: :controller do
	let(:league) { create :league }

	describe "actions" do 
		describe "GET #index" do 
			it "assigns @leagues" do 
				leagues = create_list(:league, 10)
				get :index

				expect(assigns(:leagues)).to eq(leagues)
			end

			it "renders template :index" do 
				get :index

				expect(response).to render_template(:index)
			end

			it "returns status-code 200" do 
				get :index

				expect(response.status).to eq(200) 
			end
		end

		describe "GET #show" do 
		end

		describe "GET #new" do 
		end

		describe "POST #create" do 
		end

		describe "GET #edit" do 
		end

		describe "PUT #update" do 
		end

		describe "DELETE #destroy" do 
		end
	end
end
