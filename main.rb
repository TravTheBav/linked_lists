require_relative 'linked_list.rb'

ll = LinkedList.new
ll.append(1)
ll.append(2)
ll.append(3)
ll.pop
ll.prepend(4)
ll.prepend(5)
p ll.size
ll.size.times { ll.pop }
p ll.size