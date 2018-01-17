class SampleMailer < ApplicationMailer

	def sample_mail(user)
		@user = user
		mail(to: @user.email, subject: 'mail using SMTP rails')	
	end
end
