require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

#  head 1 2 3 tail
  def remove
    # debugger
    @prev.next = @next
    @next.prev = @prev

  end
end

    # optional but useful, connects previous link to next link
    # and removes self from list.
    
class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
  end

  def include?(key)
    self.each do |node|
      if node.key == key
        return true
      end
    end
    false
  end

#   head 5 7 tail
#   head is head
#   tail is tail
#   tail.prev # 7
#   7.next # 2

#   nil 5 7 4 tail

#  5 7 4
#  5 7 4 120
  # 1 2 3
  # 2.next points to new_node
  # tail.prev points to new_node
  # 1 2 new_node 3

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    @tail.prev = new_node
    # new_node.next = @tail
    # new_node.prev = @tail.prev.prev
  end
  #Append a new node to the end of the list

  def update(key, val)
    self.each do |node|
      if node.key == key 
        node.val = val
      end
    end
  end

  def each(&block)  #{|x| print x }
    cur_node = self.first
    until cur_node == nil
      block.call(cur_node)
      cur_node = cur_node.next
    end

  end

  def remove(key)
    # debugger
    self.each do |node|
      # debugger
      if node.key == key
        node.remove
      end
    end
  end

#   cur_node.prev is 7,  7.next = 3
#   cur_node.next is 3,  3.prev = 7
  

#  head 4 7 2 3 tail
#  remove 2 
#  make it so 7 points to 3
#  make it so 3 points to 7

# reassign the previous node (node.prev) to point to the next node (node.next)
# reassign the next node (node.prev) to point to the previous node (node.next)

  # The block passed to #each will yield to a node.


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
