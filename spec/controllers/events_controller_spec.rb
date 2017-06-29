require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:my_event) { Event.create!( title: "New Awesome Event!", date: "11/11/2017", body: "new awesome things, oh look, they're great!") }
  let(:admin) { User.create!(name: 'admin user', email: 'admin@admin.com', password: "helloworld", role: :admin) }

  context "guest" do
    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "EVENT create" do
      it "returns http redirect" do
        post :create, event: {  title: "New Awesome Event!", date: "11/11/2017", body: "new awesome things, oh look, they're great!" }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, id: my_event.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_title = "updated event!"
        new_body = "look at the new stuff!"
        new_date = "10/10/2017"

        put :update, id: my_event.id, event: {title: new_title, body: new_body, date: new_date }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, id: my_event.id
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
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, id: my_event.id
        expect(response).to render_template :new
      end

      it "instantiates @event" do
        get :new
        expect(assigns(:event)).not_to be_nil
      end
    end

    describe "EVENT create" do
      it "returns http success" do
        expect { post :create, event: { title: "New Awesome Event!", date: "11/11/2017", body: "new awesome things, oh look, they're great!" }}.to change(Event,:count).by(1)
      end

      it "assigns the new event to @event" do
        post :create, event: { title: "New Awesome Event!", date: "11/11/2017", body: "new awesome things, oh look, they're great!"}
        expect(assigns(:event)).to eq Event.last
      end

      it "redirects to the events index" do
        post :create, event: { title: "New Awesome Event!", date: "11/11/2017", body: "new awesome things, oh look, they're great!" }
        expect(response).to redirect_to events_path
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, id: my_event.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, id: my_event.id
        expect(response).to render_template :edit
      end

      it "assigns event to be updated to @event" do
        get :edit, id: my_event.id
        event_instance = assigns(:event)

        expect(event_instance.id).to eq my_event.id
        expect(event_instance.title).to eq my_event.title
        expect(event_instance.body).to eq my_event.body
        expect(event_instance.date).to eq my_event.date
      end
    end

    describe "PUT update" do
      it "updates artist with expected attributes" do
        new_title = "updated event!"
        new_body = "look at the new stuff!"
        new_date = "10/10/2017"

        put :update, id: my_event.id, event: {title: new_title, body: new_body, date: new_date }

        updated_event = assigns(:event)
        expect(updated_event.id).to eq my_event.id
        expect(updated_event.title).to eq new_title
        expect(updated_event.body).to eq new_body
      end

      it "redirects to the event index" do
        new_title = "updated event!"
        new_body = "look at the new stuff!"
        new_date = "10/10/2017"

        put :update, id: my_event.id, event: {title: new_title, body: new_body, date: new_date }
        expect(response).to redirect_to events_path
      end
    end

    describe "DELETE destroy" do
      it "deletes the event" do
        delete :destroy, id: my_event.id
        count = Event.where({id: my_event.id}).size
        expect(count).to eq 0
      end

      it "redirects to artist index" do
        delete :destroy, id: my_event.id
        expect(response).to redirect_to events_path
      end
    end
  end


end
