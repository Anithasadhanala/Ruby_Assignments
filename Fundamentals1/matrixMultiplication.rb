print("----------------space: O(1) except returning matrix, time : O(max(row)*max(col))--------------------------------\n")


=begin

Write a Program to perform a Matrix Multiplication. You should 
take two matrices as input and display the product as an output.
If multiplication is not possible, an error should be thrown

=end




#finds the multiplied matrix
#returns the matrix
def getMultipliedMatrix(r1,c1,mat1,r2,c2,mat2)
    print(mat1,mat2)
    multipledMat =[]
    for i in (0...r1).to_a
        currRow=[]
        for j in (0...c2).to_a
            sum=0
            for k in (0...c1).to_a
                print(mat1[i][k], " ",mat2[j][k])
                sum+= mat1[i][k]*mat2[k][j]
            end
            currRow.push(sum)
        end
        multipledMat.push(currRow)
    end
    return multipledMat
end



#main function
def main()
    r1,c1 = gets().chomp().split().map(&:to_i)
    mat1 = []
    for i in (0...r1).to_a
        fullRow = gets().chomp().split().map(&:to_i)
        mat1.push(fullRow)
    end

    r2,c2 = gets().chomp().split().map(&:to_i)
    mat2 = []
    for i in (0...r2).to_a
        fullRow = gets().chomp().split().map(&:to_i)
        mat2.push(fullRow)
    end

    if(c1!=r2)
        raise "This matrix shape is not compatible for the multiplication"
    else
        multipledMatrix = getMultipliedMatrix(r1,c1,mat1,r2,c2,mat2)
        print(multipledMatrix,"\n")
    end
end
    
    


#explicitly calling the main
main()