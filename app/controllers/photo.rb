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
	@user = User.find(params[:id])
	@albums = @user.albums
	erb :album
end

get '/album/:id' do
	@album = Album.find(params[:id])
	erb :photo
end

get 'album/:id/:photo_id' do
end
