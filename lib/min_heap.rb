class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    node = HeapNode.new(key, value)

    if @store.empty?
      @store.push(node)
    else
      @store.push(node)
      heap_up(@store.length - 1)
    end
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
    removed = @store.pop
    heap_down(0)
    return removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    return if @store[index].nil? || index == 0

    parent_index = (index - 1) / 2

    if @store[parent_index].key > @store[index].key
     swap(index, parent_index)
     heap_up(parent_index)
   end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = (index * 2) + 1
    right = (index * 2) + 2

    if !@store[left] && !@store[right]
      return 
    elsif !@store[right]
      min = left
    else
      min = @store[left].key <= @store[right].key ? left : right
    end

    swap(index, min)
    heap_down(min)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end