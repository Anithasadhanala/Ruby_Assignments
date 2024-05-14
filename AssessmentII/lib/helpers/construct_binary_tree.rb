

#creates a treeNode
class TreeNode
    attr_accessor :val, :left, :right
  
    def initialize(value)
      @val = value
      @left = nil
      @right = nil
    end
end  


#constructs a binary tree, by providing an array
class BinaryTree


    #method that constructs the binary tree
    def construct_binary_tree(arr)
    
        root = TreeNode.new(arr.shift)
        queue =[root]

        #iterates till the queue is empty()
        until(queue.empty?)
            node = queue.shift
            left_val = arr.shift
            right_val = arr.shift

            if(left_val)
                node.left = TreeNode.new(left_val)
                queue << (node.left)
            end
            if(right_val)
                node.right = TreeNode.new(right_val)
                queue << (node.right)
            end
        end 
        
        return root
    end


    #method that prints the arr
    def print_arr(arr)
        arr.each do |element|
            print(element," ")
        end
        puts()
    end 


    #method that returns inorder of a BST
    def inorder_traversal(root,result)
        return if root.nil?

        inorder_traversal(root.left, result)
        result.push(root.val)
        inorder_traversal(root.right, result)

        return result
    end


    #method that returns preorder of a BST
    def preorder_traversal(root, result)
        return if root.nil?
    
        result.push(root.val)
        preorder_traversal(root.left, result)
        preorder_traversal(root.right, result)

        return result
    end


    #method that returns postorder of a BST
    def postorder_traversal(root, result)
        return if root.nil?
    
        postorder_traversal(root.left, result)
        postorder_traversal(root.right, result)
        result.push(root.val)

        return result

    end

end   
  
 