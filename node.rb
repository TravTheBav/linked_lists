# a class representing a node in a linked list

class Node
  attr_accessor :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def value
    @value
  end
end
