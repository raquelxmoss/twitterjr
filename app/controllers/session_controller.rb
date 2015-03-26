enable :sessions

get '/feed' do
  unless session[:user].nil?
    id = session[:user].id
    user = User.find(id)
    @followers = user.followers.includes(:tweets)
    session[:error] = nil
    erb :'session_pages/my_feed'
  else
    session[:error] = "You are not logged in!"
    redirect '/'
  end
end

get '/followers' do
  unless session[:user].nil?
    @followers = User.find(session[:user].id).followers
    session[:error] = nil
    erb :'session_pages/followers'
  else
    session[:error] = "You are not logged in!"
    redirect '/'
  end
end

get '/update_profile' do
  unless session[:user].nil?
    @user = session[:user]
    session[:error] = nil
    erb :'session_pages/update_profile'
  else
    session[:error] = "You are not logged in!"
    redirect '/'
  end
end

#Need to implement post unpdate with the redirection
# post '/update_profile' do

#     @user = session[:user]
#     session[:error] = nil
#     redirect "/profile/#{session[:user].id}"

# end
