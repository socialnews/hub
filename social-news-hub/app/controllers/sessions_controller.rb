class SessionsController < ApplicationController

	def create
		auth = request.env["omniauth.auth"] 
		session[:omniauth] = auth.except('extra')
		user = User.sign_in_from_omniauth(auth)
		session[:user_id] = user.id
		redirect_to root_url, notice: "Signed In"
	end

	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "Signed Out"
	end
end

# Sessions Controller Explained

# create

# auth is assigned the response stored in the enviroment
# variable you get when you do the callback

# session variable is assigned the response except extra data
# (twitter hand back alot of unneeded data)

# assign user variable a User object calling
# the sign_in_from_omniauth method (in models)
# passing it the response given back from the provider

# destroy

# setting both the user_id and omniauth response
# to nil - therefore you are signed out