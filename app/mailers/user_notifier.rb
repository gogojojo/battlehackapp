class UserNotifier < ApplicationMailer
	default :from => 'admin@trippin.com'

	def send_signup_email(user)
		@user = user
		mail( :to => @user.email,
			:subject => 'Thanks for signing up! You may now start Trippin!' )
	end
end
