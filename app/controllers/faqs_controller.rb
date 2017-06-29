class FaqsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index
  before_action :find_faq, only: [:update, :edit, :destroy]

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new

    if @faq.update_attributes(faq_params)
      redirect_to faqs_path
    else
      flash[:alert] = 'Error saving FAQ'
    end
  end

  def update
    if @faq.update_attributes(faq_params)
      redirect_to faqs_path
    else
      flash[:alert] = 'Error saving FAQ'
    end
  end

  def edit
  end

  def destroy
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

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end

  def find_faq
    @faq = Faq.find(params[:id].to_i)
  end
end
