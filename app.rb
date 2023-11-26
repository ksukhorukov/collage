#!/usr/bin/env ruby 

require_relative './collage_proccessor.rb'

def app_args
  ARGV.first || '.'
end

def usage
  if app_args.size != 1
    ::CollageProccessor.usage 
    exit
  end
end

usage

CollageProccessor.new(app_args)
