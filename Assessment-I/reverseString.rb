print("-------------space:O(1) returned str is not counted, time: O(n) ------------------------\n")



=begin

Write a Program to reverse a string via Recursion and via Loop (there should be two separate functions):
Input: “ABCD”
Output:
Reverse via Recursion: “DCBA”
Reverse via Loops: “DCBA”
Please do not use any inbuilt functions provided by Ruby here

=end




#reversed by recursion
#returns the reversed string
def reversedByRecursion(str,ind,newStr)
    if(ind<0) 
        return newStr
    end
    newStr+=str[ind]
    return reversedByRecursion(str,ind-1,newStr)
end




#reverse by for loop
#returns reversed string
def reversedByLoop(str)
    newStr = ""
    for i in (0...str.size).to_a.reverse
        newStr += str[i]
    end
    return newStr
end



#main function
def main()
    str = gets().chomp()
    loopReversed = reversedByLoop(str)
    recursionReversed = reversedByRecursion(str,str.size-1,"")
    puts recursionReversed
end


#explictly called main 
main()