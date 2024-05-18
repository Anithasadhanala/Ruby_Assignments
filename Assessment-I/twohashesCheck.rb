print("---------------------------------------\n")


=begin

Write a Program to take two hashses as input and check for the following:
Keys in Hash #1 is a subset of Keys in Hash #2
Values in Hash #1 is a subset of Values in Hash #2
Case #1: Positive Scenario
Input:
Hash #1: { a: 1, b: 2, c: 3 }
Hash #2: { a: 1 }
Output:
Keys of Hash #2 are a subset of Keys of Hash #1
Values of Hash #2 are a subset of Values of Hash #1
Case #2: Negative Scenario
Input:
Hash #1: { a: 1, b: 2, c: 3 }
Hash #2: { d: 1 }
Output:
Keys of Hash #2 are NOT a subset of Keys of Hash #1
Values of Hash #2 are NOT a subset of Values of Hash #1
Case #3: Negative Scenario
Input:
Hash #1: { a: 1, b: 2, c: 3 }
Hash #2: { a: 5, b: 6 }
Output:
Keys of Hash #2 are a subset of Keys of Hash #1
Values of Hash #2 are NOT a subset of Values of Hash #1

=end




#finds if two hashes keys are equal or not
#returns booolean
def getAllKeysEqualOrNot(hash1,hash2)
    return hash2.keys.all? { |key| hash1.keys.include?(key) }
end 




#finds if hash1 values are subset of hash2 values with respect to the keys
def getAllValuesEqualOrNot(hash1,hash2)
    return = hash1.all? { |key, value| hash2[key] == value }
end




#main function
def main()
    hash1 = {a:1,b:2}
    hash2 = {a:1,"b"=>2}


    allKeysEqual = getAllKeysEqualOrNot(hash1,hash2)
    allValuesEqual = getAllValuesEqualOrNot(hash1,hash2)
    puts("hash1 keys are all subset of hash2 keys :",allKeysEqual)
    puts("hash1 values are all subset of hash2 keys : ",allValuesEqual)

end




#expliciltly calling main
main()