# frozen_string_literal: true

require 'json'
require 'net/http'

require_relative 'todo_reader_interface'
require_relative 'todo'

# Concrete implementation for JSON TODOs
class TodoReaderJSON
  include TodoReaderInterface

  def initialize(todo_path)
    @todo_path = todo_path
  end

  def read_todos
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
