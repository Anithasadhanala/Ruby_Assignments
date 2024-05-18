print("-----------------space:O(1) , time:O(n*minLengthWord)--------------------\n")


=begin

Write a Program to find the longest common prefix in a given set of strings (Take a maximum of 5 strings as Input)
Input:
“apple”, “ape”, “april”
Output: 
“ap”

=end 


#finds the commonSubsetSize
#returns the common string
def findingCommonSubset(s1,s2)
   
    min_si = [s1.size,s2.size].min
    i=0
    common=""
    while(i<min_si)
        if(s1[i]!=s2[i])
            return common
        else
            common += s1[i]
        end
        i+=1
    end
    return common
end


#main function
def main()

    size = gets().chomp().to_i
    arr = gets().chomp().split()

    s=arr[0]
    for i in (1...size).to_a
        s  = findingCommonSubset(s,arr[i])
    end
    puts(s)
end


#calling main explicitly
main()


