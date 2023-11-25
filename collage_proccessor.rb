require 'colorize'
require 'pry'

class  CollageProccessor
  attr_accessor :counter
  attr_reader :dir_path

  def initialize(dir_path = '.')
    @dir_path = dir_path || '.'

    no_pictures_found?
    non_empty_counter?

    @counter  = perform

    print_info("\n[+] processed #{counter} pictures\n")
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

  private 

  def print_info(str = '', color = :green)
    raise 'empty info' if str == nil

    puts str.colorize(color: color.to_sym, mode: :bold)
  end

  def rename(file_name, n)
   File.rename(file_name, n.to_s + File.extname(file_name))
  end

  def remove_metadata(file_name)
    system "exiftool -all= -overwrite_original_in_place #{file_name} > /dev/null"
  end 

  def absolute_dir_path 
    @absolute_dir_path ||= File.expand_path(dir_path) + '/'
  end 

  def mask
    .*{jpeg,jpg,png}
  end 

  def all_images
    Dir.glob(mask, base: absolute_dir_path)
  end 

  def usage
    print_info "\nUsage: #{$0}\n\nResult:\n\n[+] processed 5 pictures\n\n" 
    exit
  end 

  def non_empty_counter?
    exit unless @counter.nil?
  end 

  def no_pictures_found?
    all_images.count.zero?
    no_pictures_found_message
    exit
  end

  def no_pictures_found_message
    print_info("[-] No pictures found at #{absolute_dir_path}", :red)
  end 
end 