#!/usr/bin/env ruby 

require_relative './collage_proccessor.rb'

def first_arg
  @first_arg ||= ARGV.first
end 

def need_help?
  if help_is_not_directory_or_existing_file?
    return true if help_args_passed?
  end 
  
  return false
end

def help_args_passed?
  first_arg == 'help' || first_arg == 'usage__'
end 

def help_is_not_directory_or_existing_file?
  return help_folder_detected_message if help_node_exist?
  true
end 

def help_node_exist?
  Dir['help'].size.positive? 
end 

def help_folder_detected_message 
  puts "\n\n'help' filenode detected. Reference can be requested in this way:\n #{$0} usage__\n\n".colorize(:light_blue)
  false
end

::CollageProccessor.usage && exit if need_help?

CollageProccessor.new(first_arg)
