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
    @size += 1
    if head.nil?
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = new_node
    end    
  end

  # adds a new node containing 'value' to the beginning of the list
  def prepend(value)
    new_node = Node.new(value)
    @size += 1
    if head.nil?
      @head = new_node
      @tail = @head
    else
      new_node.next_node = @head
      @head = new_node
    end    
  end

  # returns the node at the given index; does not work with negative indexes
  def at(index)
    return nil if index < 0 || index > @size - 1

    i = 0
    node = @head
    while i < index
      node = node.next_node
      i += 1
    end
    node
  end

  # removes the last element from the list
  def pop
    return nil if @size.zero?

    if @size == 1
      popped_node = @head
      @head = nil
      @tail = nil
    else
      popped_node = @tail
      new_tail = self.at(@size - 2)
      new_tail.next_node = nil
      @tail = new_tail
    end
    @size -= 1
    popped_node
  end

end