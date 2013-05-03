get '/' do
  @photos = Photo.all
  erb :index
end

get '/upload' do
  erb :upload
end

post "/upload" do
  photo = Photo.new
  photo.filename.store!(params[:filename])
  photo.save
  redirect to('/')
end

get '/user/:id/albums' do
end

get 'album/:albumid' do
end

get 'album/:albumid/:photoid' do
end
