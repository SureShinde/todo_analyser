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

  def self.configure
    # Command-line argument parsing
    options = {}
    OptionParser.new do |opts|
      opts.banner = 'Usage: todo_analyser.rb URL [OPTIONS]'

      opts.on('-n', '--number N', 'Number of TODOs to consume (default: 20)') do |n|
        options[:number] = n.to_i
      end
    end.parse!

    [ARGV[0], options[:number] || 20]
  end

  def self.analyse(todos_path, number)
    # Calls
    reader = TodoReaderJSON.new(todos_path)
    consumer = TodoConsumer.new(reader, number, ConsoleOutput.new)
    consumer.consume
  end

  def self.run
    todos_path, number = configure

    raise 'Please specify a file to consume TODOs from.' unless todos_path

    analyse(todos_path, number)
  end
end
