print("---------------space: O(1), time: O(m*n)--------------------------\n")




=begin

Write a Program to take two arrays as input and check if one is a subset of the other
Case #1: Positive Scenario
Input:
Array #1: 1, 2, 3, 4
Array #2: 1, 2
Output: Array #2 is a subset of Array #1
Case #2: Negative Scenario
Input:
Array #1: 1, 2, 3, 4
Array #2: 8, 6, 6
Output: Array #2 is not subset of Array #1

=end




#finds the arr1 is subset of arr2 or not
#returns boolean values
def isReallyASubset(s1,arr1,s2,arr2)
    min_size = [s1,s2].min

    if(min_size!=s1)
        temp = arr1
        arr1 = arr2
        arr2 = temp
        s2 = s1
        s1 = min_size
    end
    return arr1.all? { |element| arr2.include?(element) }
end




#main function
def main()
    size1 = gets().chomp().to_i
    arr1 = gets().chomp().split().map(&:to_i)
    size2 = gets().chomp().to_i
    arr2 = gets().chomp().split().map(&:to_i)

    is_subset = isReallyASubset(size1,arr1,size2,arr2)
    puts(is_subset)
end


#explicitly calling the main
main()



