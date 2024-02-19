# frozen_string_literal: true

##
# Interface for reading the response
##
module TodoReaderInterface
  def read_todos
    raise NotImplementedError, 'read_todos not implemented'
  end
end
