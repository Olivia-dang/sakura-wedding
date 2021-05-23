class Conversation < ApplicationRecord
    #validation to ensure that there cannot be two conversations between the same two users
    validates :sender, uniqueness: {scope: :receiver}

    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'

    #relationship with messages, default sorting rule is 'the oldest one comes first'
    has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
    
    #create 'participating' to use in conversations_controller, so current_user can see conversations if they are either a sender or a receiver
    scope :participating, -> (user) do
        where("(conversations.sender_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
    end
    #a scope that returns a conversation for two users
    scope :between, -> (sender_id, receiver_id) do
        where(sender_id: sender_id, receiver_id: receiver_id).or(where(sender_id: receiver_id, receiver_id: sender_id)).limit(1)
    end

    def with(current_user)
        sender == current_user ? receiver : sender
    end
    def participates?(user)
        sender == user || receiver == user
    end
end