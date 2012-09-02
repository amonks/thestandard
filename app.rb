###############################################################################################
# CONFIGURATION ###############################################################################
###############################################################################################


###################################
# REQUIRES ########################
###################################

require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'


###################################
# DB ##############################
###################################

#locally use this
#DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mahdata.db")

#for heroku use this
# DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://mahdata.db')
# 
# 
# 
# class Issue
#   include DataMapper::Resource
#   property  :issue_title, Text
#   property  :pub_date, Text
#   property  :issue_number, Integer, :key => true
# end
# 
# 
# DataMapper.auto_upgrade!

###################################
# NETWORK #########################
###################################

set :haml, {:format => :html5 } # default Haml format is :xhtml

###################################
# BLOCK IE ########################
###################################
get '/', :agent => /MSIE [^8]/ do
  "THIS WEBSITE IS DESIGNED FOR MODERN BROWSERS.  PLEASE USE ONE."
end

###############################################################################################
# OUTPUT ######################################################################################
###############################################################################################


###################################
# STYLE ###########################
###################################

get '/stylesheets/style.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :style
end

###################################
# Index ###########################
###################################

get '/' do
  haml :index
end

###################################
# Issues ##########################
###################################

get '/one' do
  haml :one
end

get '/two' do
  haml :two
end

get '/three' do
  haml :three
end
