print("-----------------space: O(n), time: O(n)----------------------\n")


=begin

Write a Program to find the length of the longest sub-array in an array with a sum equal to 0. Error should be thrown if the same is not possible. Please take Max Array Length to be 25
Input: 15, -2, 2, -8, 1, 7, 10, 23
Output: 5
Explanation: The longest sub-array with elements summing up-to 0 is [-2, 2, -8, 1, 7]

=end




#finds the longestsubArrayLength
#returns the length
def getLongestSubArrayOfSumZero(size,arr)
    hash={}
    sum=0
    maxi =0 
    for i in (0...size).to_a
        sum+=arr[i]
        strSum = sum.to_s
        if(sum==0)
            maxi = i+1
        end
        if(hash.has_key?(strSum))
            maxi = [i-hash[strSum],maxi].max
        end
        if not (hash.has_key?(strSum))
            hash[strSum] = i
        end
    end
    return maxi
end
        




#main funtion
def main()
    size = gets().chomp().to_i
    arr = gets().chomp().split().map(&:to_i)

    sum = getLongestSubArrayOfSumZero(size,arr)
    if(sum==0)
        raise "No summation subset with sum zero"
    else
        puts sum
    end
end



#explicitly calling the main 
main()


