classdef Tree_node < handle
   properties
      data;
      children = {};
      parent;
   end
   methods
      function obj = Tree_node(data, parent)
          
         obj.data = data;
         obj.parent = parent;
      end
      
      function add_children(obj, children)
          
          size_of_array_to_add = length(children);
          extension = cell(1, size_of_array_to_add);
          
          for i = 1:size_of_array_to_add
              extension{i} = Tree_node(children{i}, obj);
          end
          
          obj.children = [obj.children, extension];
      end
      
      function path_to_root = get_path_to_root(obj, current_path)
          
          current_path{end+1} = obj;
          if obj.parent == 0
              path_to_root = current_path;
          else
              path_to_root = obj.parent.get_path_to_root(current_path);
          end
      end
   end
end

