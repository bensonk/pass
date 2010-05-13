#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'erb'
require 'less'

set :wordlist, File.new("wordlist.txt").readlines
set :punctuation, [ "!", ".", ",", ";", ":", "/", "@", "\#", "$", "%", "^", "&", "*" ]
set :leet_mapping, { "A" => "4",
                     "E" => "3",
                     "I" => "1",
                     "O" => "0",
                     "B" => "6" }

helpers do 
  def random_punctuation
    settings.punctuation[(rand() * settings.punctuation.length).to_i - 1]
  end

  def random_word
    return settings.wordlist[(rand * settings.wordlist.length).to_i - 1]
  end

  def easy
    random_word
  end

  def medium
    p = ""
    random_word.each_char do |c|
      if settings.leet_mapping.key?(c.upcase) and 0.7 < rand
        p += settings.leet_mapping[c.upcase]
      else
        p += c
      end
    end
    p.strip
  end

  def hard
    word = "#{medium} #{medium} #{medium}#{random_punctuation}"
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
