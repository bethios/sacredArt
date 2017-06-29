require 'rails_helper'

RSpec.describe HoursController, type: :controller do
  let(:my_hour) { Hour.create!( title: "Spring Hours", body: "Tuesday - Friday: noon - 7pm Saturday - Sunday: 11am - 6pm") }
  let(:admin) { User.create!(name: 'admin user', email: 'admin@admin.com', password: "helloworld", role: :admin) }

  context "guest" do
    describe "GET index" do
      it "returns http redirect" do
        get :index
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "Hours create" do
      it "returns http redirect" do
        post :create, hour: { title: "Spring Hours", body: "Tuesday - Friday: noon - 7pm Saturday - Sunday: 11am - 6pm" }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, id: my_hour.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_title = "Winter hours"
        new_body = "9am -5pm"

        put :update, id: my_hour.id, hour: {title: new_title, body: new_body}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "admin" do
    before do
      create_session(admin)
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Hours.all to hour" do
        get :index
        expect(assigns(:hours)).to eq([my_hour])
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, id: my_hour.id
        expect(response).to render_template :new
      end

      it "instantiates @hour" do
        get :new
        expect(assigns(:hour)).not_to be_nil
      end
    end

    describe "HOUR create" do
      it "returns http success" do
        expect { post :create, hour: { title: "Spring Hours", body: "Tuesday - Friday: noon - 7pm Saturday - Sunday: 11am - 6pm" }}.to change(Hour,:count).by(1)
      end

      it "assigns the new hour to @hour" do
        post :create, hour: { title: "Spring Hours", body: "Tuesday - Friday: noon - 7pm Saturday - Sunday: 11am - 6pm"  }
        expect(assigns(:hour)).to eq Hour.last
      end

      it "redirects to the admin path" do
        post :create, hour: { title: "Spring Hours", body: "Tuesday - Friday: noon - 7pm Saturday - Sunday: 11am - 6pm" }
        expect(response).to redirect_to admin_path
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, id: my_hour.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, id: my_hour.id
        expect(response).to render_template :edit
      end

      it "assigns hour to be updated to @hour" do
        get :edit, id: my_hour.id
        hour_instance = assigns(:hour)

        expect(hour_instance.id).to eq my_hour.id
        expect(hour_instance.title).to eq my_hour.title
        expect(hour_instance.body).to eq my_hour.body
      end
    end

    describe "PUT update" do
      it "updates hour with expected attributes" do
        new_title = "Winter hours"
        new_body = "9am -5pm"

        put :update, id: my_hour.id, hour: {title: new_title, body: new_body}

        updated_hour = assigns(:hour)
        expect(updated_hour.id).to eq my_hour.id
        expect(updated_hour.title).to eq new_title
        expect(updated_hour.body).to eq new_body
      end

      it "redirects to the admin path" do
        new_title = "Winter hours"
        new_body = "9am -5pm"

        put :update, id: my_hour.id, hour: {title: new_title, body: new_body}
        expect(response).to redirect_to admin_path
      end
    end
  end

end
