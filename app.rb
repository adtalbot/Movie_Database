require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/movie")
require("./lib/actor")
require("pg")

get('/') do
  @movies = Movie.all()
  @actors = Actor.all()
  erb(:index)
end

get('/movies') do
  @movies = Movie.all()
  erb(:movies)
end

post('/movies') do
  name = params.fetch('name')
  movie = Movie.create({:name => name})
  @movies = Movie.all()
  erb(:movies)
end

get('/actors') do
  @actors = Actor.all()
  erb(:actors)
end

post('/actors') do
  name = params.fetch('name')
  actor = Actor.create({:name => name})
  @actors = Actor.all()
  erb(:actors)
end

get('/movies/:id') do
  @movie = Movie.find(params.fetch("id").to_i)
  @actors = Actor.all()
  erb(:movie)
end

get('/actors/:id') do
  @actor = Actor.find(params.fetch("id").to_i)
  @movies = Movie.all()
  erb(:actor)
end






