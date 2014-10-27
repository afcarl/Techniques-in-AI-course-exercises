classdef Tree 
    properties
        root;
    end
    
    methods
        function obj = Tree(root_data)
            
            % Root element doesn't have a parent. Assigning it to 0.
            obj.root = Tree_node(root_data, 0);
        end
    end
    
end

