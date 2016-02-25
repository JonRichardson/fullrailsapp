class WelcomeController < ApplicationController
  def register
    if params.has_key?(:user_name) && !params[:user_name].strip.empty?
      user_name = params[:user_name].strip
      #save a new user to our database
      user = User.new
      #the name column of our table will contain our user name parameter from the input box
      user.name = user_name
      #save the user name into the table/database
      user.save
      #store the user ID into a session(which is the primary key of our table)
      session[:user_id] = user.id.to_s
      #once user has entered user name, the browser will redirect to game page
      redirect_to '/game/play'
    else
      render 'register'
    end
  end
end
