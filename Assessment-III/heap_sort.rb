
=begin
Write a Program to take an array as input 
and sort it in ascending order using Heap Sort
=end



# class that implements heap sort
class HeapSort

    # method that swaps the elements
    def swap(arr, i, j)
      arr[i], arr[j] = arr[j], arr[i]
    end
  

    # method that heapifies the arr
    def heapify(arr, n, i)
      big = i
      l = 2 * i + 1
      r = 2 * i + 2
  
      if l < n && arr[l] > arr[big]
        big = l
      end
  
      if r < n && arr[r] > arr[big]
        big = r
      end
  
      if big != i
        swap(arr, i, big)
        heapify(arr, n, big)
      end
    end
  

    # arr last index is swapped for min element finding
    def heap_sort(arr, size)
      start = size / 2 - 1
      while start >= 0
        heapify(arr, size, start)
        start -= 1
      end
  
      (size - 1).downto(0) do |i|
        swap(arr, 0, i)
        heapify(arr, i, 0)
      end
    end
end
  



# method that acts as starting point
def entry_point
    puts "---------------------------------- Heap Sort --------------------------------------"
    puts "Enter the array: "
    arr = gets.chomp.split.map(&:to_i)
    size = arr.length

    heap = HeapSort.new
    heap.heap_sort(arr, size)

    puts "Array after Heap Sort: "
    print(arr, "\n")
    puts "-------------------------------- program ended --------------------------------------"
end



# explicitly calling start method
entry_point
  