=begin

Write a Program that creates a file and folder structure for a given user
Input:
Enter Folder Name: “Folder”
Enter File Name: “File 1.txt”
What do you want to write in the file? - “Lorem ipsum dolor sit amet, consectetur adipiscing elit”
Do you want to continue (Y/N)? Y
Do you want to create/update/delete a given file? - create
Enter File Name: “File 2.txt”
What do you want to write in the file? - “Lorem ipsum dolor sit amet,  ut eu sem integer.”
Do you want to continue (Y/N)? Y
Do you want to create/update/delete a given file? - update
Enter File Name: “File 2.txt”
What do you want to write in the file? - “Lorem ipsum dolor sit amet, consectetur"
Do you want to create/update/delete a given file? - delete
Enter File Name: “File 2.txt”
Do you want to continue (Y/N)? N
This should run in a continuous loop until the user decides to exit the program

=end




# class that handles file operations
class FileOperations


    # method that creates a file
    def create_file_operation(folder_name, file_name, file_content)

        # create a folder if not exists
        Dir.mkdir(folder_name) unless File.exists?(folder_name)

        #create a file and writing user given content
            File.open("#{folder_name}/#{file_name}", 'w') do |file|
            file.write(file_content)
        end
    end



    # method that updates the file 
    def update_file_operation(folder_name, file_name, file_content)
        File.open("#{folder_name}/#{file_name}", 'w') do |file|
            file.write(file_content)
        end
    end


    # method that deletes the file
    def delete_file_operation(folderName, file_name)
        File.delete("#{folderName}/#{file_name}")
    end
end





# main function
def main()

    
    files = FileOperations.new

    # input from the user
    puts "Enter Folder Name : "
    folder_name = gets.chomp
    puts "Enter File Name : "
    file_name = gets.chomp
    puts "Enter content in the file :"
    file_data = gets.chomp


    # file instance
    files = FileOperations.new
    files.create_file_operation(folder_name, file_name, file_data)



    #infinite loop until N, n entered by the user
    while(true)

        puts "Do you want to continue (Y/N)?"
        input_status = gets.chomp


        # break condition from the infinite while loop
        if(input_status=='N' || input_status=='n')
            break
        end


        # if not loop is breaken, these operations continues
        puts "Do you want to create/update/delete a given file ?"
        operation = gets.chomp.downcase

        case operation
        when 'create'
            puts "Enter Name of the File: "
            file_name = gets.chomp
            puts "content in your File : "
            file_data = gets.chomp
            files.create_file_operation(folder_name, file_name, file_data)
        when 'update'
            puts "Enter Name of the File: "
            file_name = gets.chomp
            puts "content in your File : "
            file_data = gets.chomp
            files.update_file_operation(folder_name, file_name, file_data)
        when 'delete'
            puts "Enter Name of the File "
            file_name = gets.chomp
            files.delete_file_operation(folder_name, file_name)
        else
            puts "Invalid operation input"
        end
    end
end


#explicitly calling the main
main()