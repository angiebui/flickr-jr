get '/' do
  @photos = Photo.all
  erb :index
end

post '/' do #login 
  @user = User.authenticate(params[:login][:email], params[:login][:password])
  if @user
    session[:id] = @user.id
    p @current_user
    p "i'm logged in"
  else
    "User does not exist"
  end
  redirect to('/')
end

get '/upload' do
  erb :upload
end

post "/upload" do
  if current_user 
    photo = Photo.new
    photo.filename.store!(params[:filename])
    photo.save
    redirect to('/') # redirect to that album?
  else
    @errors = "Please login to upload"
  end
end

get '/user/:id/albums' do
end

get 'album/:albumid' do
end

get 'album/:albumid/:photoid' do
end
