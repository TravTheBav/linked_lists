require_relative 'linked_list'

ll = LinkedList.new
ll.append(1)
ll.append(2)
ll.append(3)
ll.prepend(0)
ll.append(100)
puts ll.to_s
