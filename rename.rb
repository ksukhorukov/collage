#!/usr/bin/env ruby 

def rename(file_name, n)
 File.rename(file_name, n.to_s + File.extname(file_name))
end

counter = 0;

Dir.glob('*.{jpeg,jpg,png}').each_with_index { |file_name, idx|  rename(file_name, idx + 1); counter += 1 }

puts "\n[+] renamed #{counter} pictures\n"

