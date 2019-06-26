require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #create
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  #read
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #read: index action/ show action
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show 
  end

  #update:
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #update"
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    # @article.save    
    redirect "articles/#{@article.id}"

  end

  #delete
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end

end
