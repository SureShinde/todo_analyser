# frozen_string_literal: true

##
# TODOs Model
##
class Todo
  attr_reader :title, :completed

  def initialize(title, completed)
    @title = title
    @completed = completed
  end
end
