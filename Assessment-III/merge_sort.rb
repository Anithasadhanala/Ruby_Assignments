
=begin
Write a Program to take an array as input and sort it in ascending order using Merge Sort
=end



# class that implements merge sort algo
class MergeSort


    # methos that merges the sub arr
    def merging(low,mid,high,arr)
        i=low
        j=mid+1
        temp_arr=[]
        while(i<=mid && j<=high)
            if(arr[i] < arr[j])
                temp_arr << arr[i]
                i+=1
            else 
                temp_arr << arr[j]
                j+=1
            end
        end
        while(i<=mid)
            temp_arr << arr[i]
            i+=1
        end
        while(j<=high)
            temp_arr << arr[j]
            j+=1
        end

        for i in (low..high)
            arr[i] = temp_arr[i-low]
        end
    end


    # method that divides the arr into two sub arrays
    def sort_with_mergeAlgo(low, high,arr)
        if(low < high)
            mid = low + (high - low) / 2
            sort_with_mergeAlgo(low,mid,arr)
            sort_with_mergeAlgo(mid+1,high,arr)
            merging(low,mid,high,arr)
        end
    end
end



# entry point function
def entry_point

    puts("Enter arr elements : ")
    arr = gets().chomp().split().map(&:to_i)
    size = arr.length

    #instance
    merge_sort = MergeSort.new
    merge_sort.sort_with_mergeAlgo(0,size-1,arr)

    
    puts("Arr after Merge Sort : ")
    print(arr,"\n")
    puts("------------------------ program ended -------------------------")

end


#explicitly calling start function
entry_point