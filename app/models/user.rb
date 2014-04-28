class User < ActiveRecord::Base

	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :full_name, :location, :password
	
	validates_confirmation_of :password

	validates_length_of :bio, minimun: 20, allow_blank: false

	validates_uniqueness_of :email

	validate do
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end	

end
