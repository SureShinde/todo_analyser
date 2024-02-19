# frozen_string_literal: true

##
# Consume and output TODOs
##
class TodoConsumer
  def initialize(reader, number, output_method)
    @reader = reader
    @number = number
    @output_method = output_method
  end

  def consume
    @reader.read_todos do |todo|
      @output_method.call(todo)
      break if @number <= 1

      @number -= 1
    end
  end
end
