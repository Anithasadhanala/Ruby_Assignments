
=begin
Write a Program to take an array as input and sort 
it in ascending order using Bubble Sort
=end



puts("------------------------- Bubble sort -----------------------------")
puts("------------Time: O(n^2), Space: O(1), Inplace algo----------------")




# Bubble sort class
class BubbleSort

    # method that performs Bubble sort in ASC
    def sort_with_bubbleAlgo(size,arr)
        for i in (0..size-2).to_a
            swaps=0
            for j in (1..size-1).to_a
                if(arr[j]<arr[j-1])
                    swaps+=1
                    temp = arr[j]
                    arr[j] = arr[j-1]
                    arr[j-1] = temp
                end
            end

            # loop break, states that elements are ASC
            if(swaps==0)
                break
            end
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
    bubble_sort = BubbleSort.new
    sorted_arr = bubble_sort.sort_with_bubbleAlgo(size,arr)

    
    puts("Arr after Bubble Sort : ")
    print(sorted_arr,"\n")
    puts("------------------------ program ended -------------------------")

end


#explicitly calling start function
entry_point



