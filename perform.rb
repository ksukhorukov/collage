#!/usr/bin/env ruby 


require 'colorize'
require 'pry'

def print_info(str)
  raise 'empty info' if str == nil

  puts str.colorize(color: :green, mode: :bold)
end

def perform
  counter = 0

  all_images.each_with_index { 
    |file_name, idx|  
      remove_metadata(file_name);
      rename(file_name, idx + 1); 
      counter += 1 
  }

  counter
end 

def rename(file_name, n)
 File.rename(file_name, n.to_s + File.extname(file_name))
end

def remove_metadata(file_name)
  system "exiftool -all= -overwrite_original_in_place #{file_name} > /dev/null"
end 

def all_images
  Dir.glob('*.{jpeg,jpg,png}')
end 

def usage
  print_info "\nUsage: #{$0}\n\nResult:\n[+] renamed 5 pictures\n\n" 
  exit
end 

usage unless ARGV.size != 1

  counter = perform

  print_info("\n[+] processed #{counter} pictures\n")

