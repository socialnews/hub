class User < ActiveRecord::Base

	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		create(
			provider: auth['provider'],
			uid: auth['uid'],
			name: auth['info']['name']
		)
	end
end

# User Model explained

# call a self method on the User object that 
# finds a user from the response given from the provider (the auth paramter passed in)
# OR call create_user_from_omniauth if they do not exist

# create_user_from_omniauth takes the response from
# the provider and uses the necessary info to create a new record
