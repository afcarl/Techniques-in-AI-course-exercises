classdef Queue < handle
    % Simple queue implementation. Popped values aren't deleted due to the
    % fact that it's time-consuming operation for matlab's arrays.
    
    properties
        head = 1;
        queue_end = 0;
        container = {};
    end
    
    methods
        function obj = Queue()
        end
        
        function add(obj, element)
            
            obj.container{end+1} = element;
            obj.queue_end = obj.queue_end + 1;
        end
        
        function extracted_element = pop(obj)
            
            if obj.empty()
                msgID = 'MYFUN:BadIndex';
                msg = 'Empty queue pop attempt';
                baseException = MException(msgID,msg);
                throw(baseException);
            end
            
            extracted_element = obj.container{obj.head};
            obj.head = obj.head + 1;
        end
        
        function result = empty(obj)
            
            result = obj.queue_end < obj.head;
        end
        
        function elements = get_all_elements(obj)
            
            elements = {obj.container{obj.head:obj.queue_end}};
        end
    end
    
end

