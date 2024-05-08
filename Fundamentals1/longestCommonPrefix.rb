print("-----------------space:O(1) , time:O(n*minLengthWord)--------------------\n")


#finds the minimum size of two strings
#returns only size
def min_size(s1,s2)
    size1 = s1.size
    size2 = s2.size

    if(size1>size2)
        return size2
    end
    return size1
end



#finds the commonSubsetSize
#returns the common string
def findingCommonSubset(s1,s2)
   
    min_si = min_size(s1,s2)
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


