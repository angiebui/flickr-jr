get '/upload' do
	unless current_user
	@errors = "Please login or signup to load"
  end

 erb :upload
end

post "/upload" do
  if current_user 
  	album = current_user.albums.find_or_create_by_title(params[:title])
    photo = album.photos.new
    photo.filename.store!(params[:filename])
    photo.save
    redirect to("/album/#{album.id}")
  else
    @errors = "You must login or signup to upload"
    erb :upload
  end
end

get '/user/:id/albums' do
	@user = User.find(params[:id])
	@albums = @user.albums
	erb :album
end

get '/album/:id' do
	@album = Album.find(params[:id])
	@photos = @album.photos.order("created_at DESC")
	erb :photo
end

get 'album/:id/:photo_id' do

end

post '/album/:id' do
	photo = Album.find(params[:id]).photos.new
	photo.filename.store!(params[:filename])
	photo.save
	
	redirect to("/album/#{params[:id]}") #optimize so that it lands in that image specifically in album?
end

