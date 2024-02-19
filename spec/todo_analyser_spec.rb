# frozen_string_literal: true

require 'todo_analyser/console_output'
require 'todo_analyser/todo_reader_json'
require 'todo_analyser/todo_consumer'

RSpec.describe TodoAnalyser do
  it 'has a version number' do
    expect(TodoAnalyser::VERSION).not_to be nil
  end

  it 'analyse test' do
    expect do
      TodoAnalyser.analyse('https://jsonplaceholder.typicode.com/todos',
                           5)
    end.to output(include('[✓] et porro tempora')).to_stdout
  end

  it 'full run test' do
    reader = TodoReaderJSON.new('https://jsonplaceholder.typicode.com/todos')

    expect do
      TodoConsumer.new(reader, 5, ConsoleOutput.new).consume
    end.to output(include('[✓] et porro tempora')).to_stdout
  end
end
