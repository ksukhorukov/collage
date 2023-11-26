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

  def both_nodes_exist?
    help_node_exist? && usage_node_exist?
  end

  def hint
    help_node_exist? ? 'usage__' : 'help'
  end

  def existing_special_node_name
    return "Both 'help' and 'usage__'" if help_node_exist? && usage_node_exist?
    return 'help' if help_node_exist?
    return 'usage__' if usage_node_exist?
  end

  def special_node_detection_message
    puts "\nYou have 'help' or 'usage__' directories in local directory or even both.\nMaybe you wanted to get some help? Here it is...".colorize(:light_blue)

    ::CollageProccessor.usage(_exit: false)
    
    false
  end
end