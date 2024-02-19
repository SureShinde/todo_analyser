#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'json'
require 'net/http'

##
# Module to Run the Parser & Analyser
##
module TodoAnalyser
  # Interface for reading the response
  module TodoReaderInterface
    def read
      raise NotImplementedError, 'read_todos not implemented'
    end
  end

  # Concrete implementation for JSON TODOs
  class TodoReaderJSON
    include TodoReaderInterface
    def initialize(todo_path)
      @todo_path = todo_path
    end

    def read
      uri = URI(@todo_path)
      todos_string = Net::HTTP.get(uri)
      todos = JSON.parse todos_string

      todos.each_with_index do |todo, i|
        next unless i.odd? # Check for even lines

        title = todo['title']
        completed = todo['completed']

        yield Todo.new(title.strip, completed.to_s.strip.downcase == 'true')
      end
    end
  end

  # Bin
  class Todo
    attr_reader :title, :completed

    def initialize(title, completed)
      @title = title
      @completed = completed
    end
  end

  # Consume and output TODOs
  class TodoConsumer
    def initialize(reader, number, output_method)
      @reader = reader
      @number = number
      @output_method = output_method
    end

    def consume
      @reader.read do |todo|
        @output_method.call(todo)
        break if @number <= 1

        @number -= 1
      end
    end
  end

  # Print to console
  class ConsoleOutput
    def call(todo)
      # Classify TODOs [ ]: Pending, [✓]: Completed
      puts "[#{todo.completed ? '✓' : ' '}] #{todo.title}"
      # Alternately can display the status in the end
      # (#{todo.completed ? "Completed" : "Pending"})
    end
  end

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
