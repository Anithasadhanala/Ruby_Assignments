
=begin
Write a Program to take an array as input and sort it in 
ascending order using Quick Sort (Divide and Conquer)
=end



puts("----------------------------------- Quick sort ----------------------------------------")
puts("-----------------------Time: O(nlogn), Space: O(1), Inplace algo-----------------------")




# Quick sort class
class QuickSort


    # methos that swaps the elements in arr
    def swap(pos1,pos2,arr)
        arr[pos1],arr[pos2]  = arr[pos2],arr[pos1]
    end


    # method that positions the pivot at correct place
    def partition(low,high,arr)
        pivot = arr[high]
        i = low
      
        while(low < high)
            if (arr[low] < pivot) 
                swap(i,low,arr)
                i+=1   
            end
            low+=1
        end
        swap(i,high,arr)
        i
    end




    # method that performs Quick sort in ASC
    def sort_with_QuickAlgo(low,high,arr)
        if(low < high)
            pivot = partition(low,high,arr)
            sort_with_QuickAlgo(low,pivot-1,arr)
            sort_with_QuickAlgo(pivot+1,high,arr)
        end
    end
end



# entry point function
def entry_point

 
    puts("Enter arr elements : ")
    arr = gets().chomp().split().map(&:to_i)
    size = arr.length

    #instance
    quick_sort = QuickSort.new
    quick_sort.sort_with_QuickAlgo(0,size-1,arr)

    
    puts("Arr after Quick Sort : ")
    print(arr,"\n")
    puts("------------------------ program ended -------------------------")

end


#explicitly calling start function
entry_point



