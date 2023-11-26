module CommandLineArguments
  def first_arg
    @first_arg ||= ARGV.first
  end 

  def need_help?
    if help_args_passed? 
      return true if help_is_not_directory_or_existing_file?
    end 
    
    return false
  end

  def help_args_passed?
    first_arg&.to_sym == :help || first_arg&.to_sym == :usage__
  end 

  def help_is_not_directory_or_existing_file?
    return special_node_detection_message if special_nodes_exist?
    
    true
  end 

  def special_nodes_exist?
    help_node_exist? || usage_node_exist?
  end

  def help_node_exist?
    Dir.exist? 'help'
  end 

  def usage_node_exist?
    Dir.exist? 'usage__'
  end

  def hint
    help_node_exist? ? 'usage__' : 'help'
  end

  def special_node_detection_message
    puts "\n#{first_arg} filenode detected. Reference can be requested in this way:\n #{$0} #{hint}\n\n".colorize(:light_blue)
    puts "But here is the reference anyway....\n".colorize(:light_blue)

    ::CollageProccessor.usage
    
    false
  end
end