print("-------------------space: O(n), time: O(n) -------------------------\n")





=begin

Write a Program to check and return if an expression is valid or not. We should check for the following:
The expression should not contain anything other than numbers and mathematical symbols (No alphabets)
Allowed Operations: + (Add), - (Subtract), * (Multiply), / (Divide), % (Mod), ^ (Exponent)
Check if all brackets have been closed
Case #1: Valid Expression
Input: (5+4)*[(4/5)-{9-6+(10^2)}]
Output: Valid
Case #2: Invalid Expression
Input: (5+4*[(4/5)-{9-6+(10^2}
Output: Invalid
Explanation: Brackets have not been closed properly

=end





#finds if the string contains any alphabets
#returns boolean
def contains_alphabets?(str)
    /[a-zA-Z]/.match?(str)
  end



#returns the string contains alphabets or not
def getIsValidWithNoAlphabets(str)
    return contains_alphabets?(str)
end


#validating the expression, mathematically
#returns boolean value
def getIsValidExpression(str)
    stack=[]
    str.chars.each do |char|
        if(char=='(' || char=='[' || char=='{')
            stack.push(char)
        elsif (char==')')
            if(stack.empty? || stack.pop!='(') 
                return false
            end
        elsif (char==']')
            if(stack.empty? || stack.pop!='[') 
                return false
            end
        elsif (char=='}')
            if(stack.empty? || stack.pop!='[') 
                return false
            end
        end
        
    end
    stack.empty?
end



#main function
def main()
    str = gets().chomp()

    isValidNoAlphabets = getIsValidWithNoAlphabets(str)
    if (isValidNoAlphabets)
        raise "pls give the expression without alphabets"
    else
        isValidExpresssion = getIsValidExpression(str)
        if not (isValidExpresssion)
            raise "This is not a valid expression"
        else
            puts("this is a valid expression")
        end
    end
end



#calling main function explicitly
main()