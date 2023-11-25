#!/usr/bin/env ruby 

require_relative './collage_proccessor.rb'

def app_args
  ARGV.first
end

CollageProccessor.new(app_args)
