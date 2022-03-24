require_relative 'linked_list'

ll = LinkedList.new
ll.remove_at(0)
ll.append(0)
puts ll.to_s
ll.remove_at(0)
puts ll.to_s

3.times { |i| ll.append(i) }
puts ll.to_s
ll.remove_at(1)
puts ll.to_s

ll.remove_at(1)
puts ll.to_s

ll.remove_at(-1)
ll.remove_at(9000)