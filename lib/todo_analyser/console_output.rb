# frozen_string_literal: true

##
# Print to console
##
class ConsoleOutput
  def call(todo)
    # Classify TODOs [ ]: Pending, [✓]: Completed
    puts "[#{todo.completed ? '✓' : ' '}] #{todo.title}  (#{todo.completed ? 'Completed' : 'Pending'})"
    # Alternately can display the status in the end
    # (#{todo.completed ? "Completed" : "Pending"})
  end
end
