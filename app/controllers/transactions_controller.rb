class TransactionsController < ApplicationController
    # Skip CSRF verification for stripe chechout form
    skip_before_action :verify_authenticity_token, only: [:create]
    before_action :set_dress, only: [:create]

    #enforcing users to authenticate
    before_action :authenticate_user!

    def create      
        #Create new transaction before redirecting to Stripe
        @transaction = current_user.purchases.create(seller_id: @dress.user_id, dress_id: @dress.id, amount: @dress.price_in_cents)
        
        #Redirect to Stripe payment page
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [
               {
                price_data: {
                    unit_amount: (@dress.price_in_cents),
                    currency: 'aud',
                    product_data: {
                        name: @dress.name
                    },
                },
                quantity: 1,
            }],
            mode: 'payment',
            success_url: checkout_successful_url,
            cancel_url: checkout_canceled_url,
        })

        render json: { id: session.id }
    end

    def purchases
        @purchases = current_user.purchases
    end
    
    def sales
        @sales = current_user.sales
    end

    def show        
    end

    def success
    end

    def cancel
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_dress
      @dress = Dress.find(params[:id])
    end
end
