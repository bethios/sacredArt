require 'rails_helper'

RSpec.describe FaqsController, type: :controller do
  let(:my_faq) { Faq.create!( question: "What is the answer to life the universe and everything?", answer: "The answer is 42") }
  let(:admin) { User.create!(name: 'admin user', email: 'admin@admin.com', password: "helloworld", role: :admin) }

  context "guest" do
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Faqs.all to faq" do
        get :index
        expect(assigns(:faqs)).to eq([my_faq])
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "FAQS create" do
      it "returns http redirect" do
        post :create, faq: { question: "What is the answer to life the universe and everything?", answer: "The answer is 42" }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, id: my_faq.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_question = "What is the question?"
        new_answer = "I'll need some time to think about that"

        put :update, id: my_faq.id, faq: {question: new_question, answer: new_answer}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, id: my_faq.id
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

      it "assigns Faqs.all to faq" do
        get :index
        expect(assigns(:faqs)).to eq([my_faq])
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, id: my_faq.id
        expect(response).to render_template :new
      end

      it "instantiates @faq" do
        get :new
        expect(assigns(:faq)).not_to be_nil
      end
    end

    describe "FAQ create" do
      it "returns http success" do
        expect { post :create, faq: { question: "What is the answer to life the universe and everything?", answer: "The answer is 42" }}.to change(Faq,:count).by(1)
      end

      it "assigns the new faq to @faq" do
        post :create, faq: { question: "What is the answer to life the universe and everything?", answer: "The answer is 42" }
        expect(assigns(:faq)).to eq Faq.last
      end

      it "redirects to the faq path" do
        post :create, faq: { question: "What is the answer to life the universe and everything?", answer: "The answer is 42"}
        expect(response).to redirect_to faqs_path
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, id: my_faq.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, id: my_faq.id
        expect(response).to render_template :edit
      end

      it "assigns faq to be updated to @faq" do
        get :edit, id: my_faq.id
        faq_instance = assigns(:faq)

        expect(faq_instance.id).to eq my_faq.id
        expect(faq_instance.question).to eq my_faq.question
        expect(faq_instance.answer).to eq my_faq.answer
      end
    end

    describe "PUT update" do
      it "updates faq with expected attributes" do
        new_question = "What is the question?"
        new_answer = "I'll need some time to think about that"

        put :update, id: my_faq.id, faq: {question: new_question, answer: new_answer}

        updated_faq = assigns(:faq)
        expect(updated_faq.id).to eq my_faq.id
        expect(updated_faq.question).to eq new_question
        expect(updated_faq.answer).to eq new_answer
      end

      it "redirects to the faq index" do
        new_question = "What is the question?"
        new_answer = "I'll need some time to think about that"

        put :update, id: my_faq.id, faq: {question: new_question, answer: new_answer}
        expect(response).to redirect_to faqs_path
      end
    end

    describe "DELETE destroy" do
      it "deletes the faq" do
        delete :destroy, id: my_faq.id
        count = Faq.where({id: my_faq.id}).size
        expect(count).to eq 0
      end

      it "redirects to faq index" do
        delete :destroy,  id: my_faq.id
        expect(response).to redirect_to faqs_path
      end
    end
  end

end
