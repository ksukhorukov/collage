#!/usr/bin/env ruby 

require_relative './collage_proccessor.rb'
require_relative './command_line_arguments.rb'

include CommandLineArguments

::CollageProccessor.usage(exit_flow: true) if need_help?

CollageProccessor.new(first_arg)
