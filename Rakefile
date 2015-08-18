require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require 'rubygems'
    require 'bundler'
    Bundler.require
    Dir[File.expand_path("./app/*.rb")].each {|file| require file }
  end
end
