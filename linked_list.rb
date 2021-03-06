# a class representing the full linked list

require_relative 'node'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
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
  end

  # returns the size of the list
  def size
    return 0 if @head.nil?

    total_nodes = 1
    current_node = @head

    until current_node.next_node.nil?
      total_nodes += 1
      current_node = current_node.next_node
    end

    total_nodes
  end

  # returns the node at the given index; does not work with negative indexes
  def at(index)
    return nil if index.negative? || index > size - 1

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
    return nil if size.zero?

    if size == 1
      popped_node = @head
      @head = nil
      @tail = nil
    else
      popped_node = @tail
      new_tail = at(size - 2)
      new_tail.next_node = nil
      @tail = new_tail
    end
    popped_node
  end

  def contains?(value)
    idx = 0
    while idx < size
      return true if value == at(idx).value

      idx += 1
    end
    false
  end

  def find(value)
    idx = 0
    while idx < size
      return idx if value == at(idx).value

      idx += 1
    end
    nil
  end

  def to_s
    idx = 0
    str = ""
    while idx < size
      value = at(idx).value

      str += "( #{value} ) -> "
      idx += 1
    end
    str + "nil"
  end

  # will append a node with given value if index is greater than the last available index
  def insert_at(value, idx)
    begin
      if size.zero? || idx > size - 1
        append(value)
      else
        tmp = at(idx)
        new_node = Node.new(value)
        at(idx - 1).next_node = new_node
        new_node.next_node = tmp
      end
    rescue
      puts 'does not take negative indexes'
    end
  end

  def remove_at(index)
    return if head.nil?

    begin
      if index.zero?
        @head = at(index).next_node
      elsif index == size - 1
        pop
      else
        new_next_node = at(index).next_node
        at(index - 1).next_node = new_next_node
      end
    rescue
      puts 'given index out of range'
    end
  end
end
