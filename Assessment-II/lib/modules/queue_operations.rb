


# acts as an interface for Queue class
module QueueOperations
    def enqueue(element)
        raise NotImplementedError, "Method not implemented"
    end

    def display()
        raise NotImplementedError, "Method not implemented"
    end

    def dequeue()
        raise NotImplementedError, "Method not implemented"
    end

    def get_size()
        raise NotImplementedError, "Method not implemented"
    end
end