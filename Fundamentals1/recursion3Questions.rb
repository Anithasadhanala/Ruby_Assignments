print("-------------all programs space: O(1), time: O(n) --------------------------\n")


#finds the factorial by recursion
#returns factorial
def getFactorialByrecursion(num)
    if(num==1)
        return 1
    end
    return num * getFactorialByrecursion(num-1)
end




#finds nth fibonacci by recursion (need dp for larger inputs)
#returns nth fibonacci
def getNthFibonacci(n)
    if(n==0) 
        return 0
    elsif(n==1 || n==2) 
        return 1;
    end
    return getNthFibonacci(n-1)+getNthFibonacci(n-2)
end




#finds the mean of a num
#returns mean only
def getMeanValueByRecursion(arr,ind,size,sum)
    if(ind<0)
        return sum/((size))
    end
    return getMeanValueByRecursion(arr,ind-1,size,sum+arr[ind])
end




#main function
def main()
    size = gets().chomp().to_i
    arr = gets().chomp().split().map(&:to_i)


    mean= getMeanValueByRecursion(arr,size-1,size,0)
    nthFibonacci = getNthFibonacci(size)
    factorial = getFactorialByrecursion(size)

    print("mean : ",mean,"\n")
    print("nthFibonacci : ",nthFibonacci,"\n")
    print("factorial : ",factorial,"\n")
end


#calling main explicitly
main()




    


