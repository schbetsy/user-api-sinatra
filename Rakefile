require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require 'rubygems'
    require 'bundler'
    Bundler.require
    require "./user_api"
  end
end
