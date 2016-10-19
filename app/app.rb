require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
ENV['RACK_ENV'] ||= 'development'

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
    Link.create(url: url, title: title)
    redirect to '/links'
  end

  run! if app_file == $0
end

DataMapper.setup(:default,"postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
