#!/usr/bin/env ruby 

def perform
  counter = 0
  all_images.each_with_index { |file_name, idx|  rename(file_name, idx + 1); counter += 1 }
  counter
end 

def rename(file_name, n)
 File.rename(file_name, n.to_s + File.extname(file_name))
end

def. remove_metadata
  system exiftool -all= -overwrite_original_in_place "${FILENAME}"
end 

def all_images
  Dir.glob('*.{jpeg,jpg,png}')
end 



puts "\n[+] renamed #{perform} pictures\n"

