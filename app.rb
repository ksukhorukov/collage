#!/usr/bin/env ruby 

require_relative './collage_proccessor.rb'

def app_args
  [ARGV.first || '.']
end

::CollageProccessor.usage if app_args.size != 1

CollageProccessor.new(app_args.first)
