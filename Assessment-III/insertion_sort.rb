
=begin
Write a Program to take an array as input and sort 
it in ascending order using Insertion Sort
=end



puts("------------------------- Insertion sort -----------------------------")
puts("-------------Time: O(n^2), Space: O(1), Inplace algo------------------")






# Insertion sort class
class InsertionSort

    # method that performs insertsion sort in ASC
    def sort_with_insertionAlgo(size,arr)
        for i in (1..size-1).to_a
            j = i-1
            val = arr[i]
            while(j > -1 && arr[j]>val)
                arr[j+1] = arr[j]
                j-=1
            end
        arr[j+1] = val
        end
        arr
    end
end



# entry point function
def entry_point

   
    puts("Enter arr elements : ")
    arr = gets().chomp().split().map(&:to_i)
    size = arr.length

    #instance
    insertion_sort = InsertionSort.new
    sorted_arr = insertion_sort.sort_with_insertionAlgo(size,arr)

    
    puts("Arr after Insertion Sort : ")
    print(sorted_arr,"\n")
    puts("------------------------ program ended -------------------------")

end


#explicitly calling start function
entry_point



