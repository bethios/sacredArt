class FaqsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new
    @faq.question = params[:faq][:question]
    @faq.answer = params[:faq][:answer]

    if @faq.save
      redirect_to faqs_path
    else
      flash[:alert] = 'error saving faq'
    end
  end

  def update
    @faq = Faq.find(params[:id])
    @faq.question = params[:faq][:question]
    @faq.answer = params[:faq][:answer]

    if @faq.save
      redirect_to faqs_path
    else
      flash[:alert] = 'error saving faq'
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def destroy
    @faq = Faq.find(params[:id])

    if @faq.destroy
      flash[:notice] = "\"#{@faq.question}\" was deleted successfully."
      redirect_to faqs_path
    else
      flash.now[:alert] = "There was an error deleting the faq."
      render faqs_path
    end
  end

  def index
    @faqs = Faq.all
  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end
end
