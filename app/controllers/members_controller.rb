class MembersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_subscription_status
	
	def dashboard
		return unless current_user
	  return if current_user.payment_processor.nil?
		
		@portal_session = current_user.payment_processor.billing_portal
  end
  
  private

  def check_subscription_status
    unless current_user.active_subscription
      redirect_to checkout_path(
        line_items: ['price_1LmczHHpP6oUFeBfgvbtPxpk'],
        payment_mode: 'subscription'
      ), alert: 'You must have an active subscription to access this page.'
    end
  end
end
