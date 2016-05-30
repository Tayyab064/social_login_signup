class User < ActiveRecord::Base
	has_many :identities , dependent: :destroy
	enum gender: [:male , :female]	
	accepts_nested_attributes_for :identities


	def generate_email_token
	    begin
	      self.email_token = SecureRandom.hex.to_s
	    end while self.class.exists?(email_token: email_token)
	end
end
