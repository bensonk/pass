#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'erb'
require 'less'

helpers do 
  def easy
    "password"
  end

  def medium
    "drowssap"
  end

  def hard
    "p4s5w0rd!"
  end
end

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  less :screen
end

get '/easy' do
  easy
end

get '/medium' do
  medium
end

get '/hard' do
  hard
end

get '/' do
  erb :index
end
