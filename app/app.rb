ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    "<h1>Welcome to Bookmark Manager</h1>"
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    title = params[:title]
    url = params[:url]
    tag_name = params[:tag_name]
    link = Link.create(url: url, title: title)
    tag = Tag.create(name: tag_name)
    LinkTag.create(:link => link, :tag => tag)
    redirect to '/links'
  end

  run! if app_file == $0
end
