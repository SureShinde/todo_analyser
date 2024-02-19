# frozen_string_literal: true

require 'optparse'

require_relative 'todo_analyser/version'
require_relative 'todo_analyser/console_output'
require_relative 'todo_analyser/todo_reader_json'
require_relative 'todo_analyser/todo_consumer'

##
# Module to Run the Parser & Analyser
##
module TodoAnalyser
  class Error < StandardError; end

  # Command-line argument parsing
  options = {}
  OptionParser.new do |opts|
    opts.banner = 'Usage: todo_analyser.rb URL [OPTIONS]'

    opts.on('-n', '--number N', 'Number of TODOs to consume (default: 20)') do |n|
      options[:number] = n.to_i
    end
  end.parse!

  todos_path = ARGV[0]
  raise 'Please specify a file to consume TODOs from.' unless todos_path

  # Default Values
  number = options[:number] || 20

  # Calls
  reader = TodoReaderJSON.new(todos_path)
  consumer = TodoConsumer.new(reader, number, ConsoleOutput.new)
  consumer.consume
end
