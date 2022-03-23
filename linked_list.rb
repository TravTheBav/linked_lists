# a class representing the full linked list

require_relative 'node'

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # adds a new node containing 'value' to the end of the list
  def append(value)
    new_node = Node.new(value)
    if head.nil?
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  # adds a new node containing 'value' to the beginning of the list
  def prepend(value)
    new_node = Node.new(value)
    if head.nil?
      @head = new_node
      @tail = @head
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

end