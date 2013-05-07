get '/' do
  @photos = Photo.order("created_at DESC")
  erb :index
end

post '/' do 
  @user = User.authenticate(params[:login][:email], params[:login][:password])
  if @user
    session[:id] = @user.id
  else
    "User does not exist"
  end
  redirect to('/')
end

get '/logout' do
  session.clear
  redirect to ('/')
end
