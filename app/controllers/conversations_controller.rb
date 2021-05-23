class ConversationsController < ApplicationController
  before_action :authenticate_user!
  #make sure that the user is actually authorized to view the requested conversation
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  before_action :set_users, only: [:index, :show]

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end
  
  def show
    @conversation = Conversation.find_by(id: params[:id])
    @message = Message.new
  end
  
  private
  
  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end
  
  def check_participating!
    redirect_to conversations_path unless @conversation && @conversation.participates?(current_user)
  end
  def set_users
    @users = User.all
  end
end
