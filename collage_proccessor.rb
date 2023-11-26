require 'colorize'
require 'pry'

class  CollageProccessor
  attr_accessor :counter
  attr_reader :dir_path

  def initialize(dir_path = '.')
    @dir_path = dir_path || '.'

    check_dir_path_existance!

    no_pictures_found?
    non_empty_counter?

    @counter  = perform

    print_info("\n[+] Processed #{counter} pictures\n")
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

  def self.usage(_exit: true)
    puts "\nExecute programm without any params to proccess local folder:".colorize(color: :green)
    puts "\nExample: #{$0}\n\n".colorize(color: :green)
    puts "Pass absolute or relative path of a directory with images:".colorize(color: :green)
    puts "\nExample: #{$0} /var/www/щерево/fotki\n".colorize(color: :green)
    puts "\nHELP command alternative: #{$0} usage__\n".colorize(color: :green)

    exit if _exit
  end 

  private 

  def print_info(str = '', color = :green)
    raise 'empty info' if str == nil

    puts str.colorize(color: color&.to_sym)
  end

  def rename(file_name, n)
    Dir.chdir(absolute_dir_path) do 
      File.rename(file_name, n.to_s + File.extname(file_name))
    end
  end

  def remove_metadata(file_name)
    Dir.chdir(absolute_dir_path) do 
      system "exiftool -all= -overwrite_original_in_place #{file_name} > /dev/null"
    end
  end 

  def absolute_dir_path 
    File.expand_path(dir_path) + '/'
  end 

  def check_dir_path_existance!
    dir_path_does_not_exist_error && exit unless Dir.exist?(absolute_dir_path)
  end

  def dir_path_does_not_exist_error
    puts "\nError: #{absolute_dir_path} does not exist\n".colorize(color: :red)
    exit
  end

  def mask
    "*.{jpeg,jpg,png}"
  end 

  def all_images
    Dir.chdir(absolute_dir_path) do 
      return Dir.glob(mask)
    end
  end 

  def usage
    print_info "\nUsage: #{$0}\n\nResult:\n\n[+] Processed 5 pictures\n\n" 
    exit
  end 

  def non_empty_counter?
    exit unless @counter.nil?
  end 

  def images_found? 
    all_images.size.positive?
  end 

  def no_pictures_found?
    return false if images_found?

    no_pictures_found_message

    exit
  end

  def no_pictures_found_message
    print_info("[-] Error: No pictures found at #{absolute_dir_path}\n", :red)
  end 
end 