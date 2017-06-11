require 'rails_helper'
include SessionsHelper

RSpec.describe ArtistsController, type: :controller do
  let(:my_category) { Category.create!( name: "Original Art", image: "original.jpg") }
  let(:my_artist) { my_category.artists.create!(name: 'test artist', body: 'test artist body', category_id: my_category.id) }
  let(:admin) { User.create!(name: 'admin user', email: 'admin@admin.com', password: "helloworld", role: :admin) }

  context "guest" do
    describe "GET show" do
      it "returns http redirect" do
        get :show, category_id: my_category.id, id: my_artist.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new, category_id: my_category.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "ARTIST create" do
      it "returns http redirect" do
        post :create, category_id: my_category.id, artist: { name: 'test artist', body: 'test artist body', category_id: my_category.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, category_id: my_category.id, id: my_artist.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_name = "test2"
        new_body = "test update 2"

        put :update, category_id: my_category.id, id: my_artist.id, artist: {name: new_name, body: new_body, category_id: my_category.id}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, category_id: my_category.id, id: my_artist.id
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "admin" do
    before do
      create_session(admin)
    end

    describe "GET new" do
      it "returns http success" do
        get :new, category_id: my_category.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, category_id: my_category.id, id: my_artist.id
        expect(response).to render_template :new
      end

      it "instantiates @artist" do
        get :new, category_id: my_category.id
        expect(assigns(:artist)).not_to be_nil
      end
    end

    describe "ARTIST create" do
      it "returns http success" do
        expect { post :create, category_id: my_category.id, artist: { name: 'test artist', body: 'test artist body', category_id: my_category.id }}.to change(Artist,:count).by(1)
      end

      it "assigns the new artist to @artist" do
        post :create, category_id: my_category.id, artist: { name: 'test artist', body: 'test artist body', category_id: my_category.id }
        expect(assigns(:artist)).to eq Artist.last
      end

      it "redirects to the category" do
        post :create, category_id: my_category.id, artist: { name: 'test artist', body: 'test artist body', category_id: my_category.id }
        expect(response).to redirect_to my_category
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, category_id: my_category.id, id: my_artist.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, category_id: my_category.id, id: my_artist.id
        expect(response).to render_template :edit
      end

      it "assigns artist to be updated to @artist" do
        get :edit, category_id: my_category.id, id: my_artist.id
        artist_instance = assigns(:artist)

        expect(artist_instance.id).to eq my_artist.id
        expect(artist_instance.name).to eq my_artist.name
        expect(artist_instance.body).to eq my_artist.body
        expect(artist_instance.category_id).to eq my_artist.category_id
      end
    end

    describe "PUT update" do
      it "updates artist with expected attributes" do
        new_name = "test2"
        new_body = "test update 2"

        put :update, category_id: my_category.id, id: my_artist.id, artist: {name: new_name, body: new_body, category_id: my_category.id}
        updated_artist = assigns(:artist)
        expect(updated_artist.id).to eq my_artist.id
        expect(updated_artist.name).to eq new_name
        expect(updated_artist.body).to eq new_body
        expect(updated_artist.category_id).to eq my_artist.category_id
      end

      it "redirects to the category" do
        new_name = "test2"
        new_body = "test update 2"
        put :update, category_id: my_category.id, id: my_artist.id, artist: {name: new_name, body: new_body, category_id: my_category.id}
        expect(response).to redirect_to my_category
      end
    end

    describe "DELETE destroy" do
      it "deletes the artist" do
        delete :destroy, category_id: my_category.id, id: my_artist.id
        count = Artist.where({id: my_artist.id}).size
        expect(count).to eq 0
      end

      it "redirects to artist index" do
        delete :destroy, category_id: my_category.id, id: my_artist.id
        expect(response).to redirect_to my_category
      end
    end
  end

end
