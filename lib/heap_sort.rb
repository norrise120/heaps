# This method uses a heap to sort an array.
# Time Complexity:  O(n log n) where n is the number of items in the list
# Space Complexity: O(n) where n is the number of items in the list
def heapsort(list)
  return list if list.length < 2
	
  heap = MinHeap.new

  until list.empty?
    heap.add(list.pop)
  end

  until heap.empty?
    list.push(heap.remove)
  end

  return list
end