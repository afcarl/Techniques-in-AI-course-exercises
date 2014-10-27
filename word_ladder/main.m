clc; clear; close all;

load fourLetterWords.mat

% Cast every string to lowercase
dictionary = cellfun(@lower, fourLetterWords, 'UniformOutput', false);


initial_state = 'kalt';
goal_state = 'warm';



frontier_queue = Queue();
explored_set = {};
solution = 0;

tree = Tree(initial_state);
current_node = tree.root;
frontier_queue.add(current_node);

% Implementation of breadth-first algorithm

while(1)
    
    if frontier_queue.empty()
        'failure'
        break;
    end
    
    % Explore new nodes
    current_node = frontier_queue.pop();
    current_node_word = current_node.data;
    explored_set{end+1} = current_node_word;
    possible_next_step_words = word_ladder_possible_next_steps(dictionary, current_node_word);
    
    % Add all possible next step words as children
    current_node.add_children(possible_next_step_words);
    frontier_nodes = frontier_queue.get_all_elements();
    
    for i = 1:length(possible_next_step_words)
        
        % Before adding new node into frontier, we need to check
        % whether it is already in frontier or explored set.
        current_word = possible_next_step_words{i};
        result = cellfun(@(node) strcmp(node.data, current_word), frontier_nodes);
        is_word_in_frontier = any(result);
        is_word_in_explored_set = cell_of_strings_contain_string(explored_set, current_word);

        if and(~is_word_in_explored_set, ~is_word_in_frontier)
            if strcmp(current_word, goal_state)
                'success'
                solution = current_node.children{i};
                break;
            end
            
            frontier_queue.add(current_node.children{i});
        end
        
    end
    
    if solution ~= 0
        % Output solution by climbing the tree to the root from found element.
        cellfun(@(node) node.data, solution.get_path_to_root({}), 'UniformOutput', false)
        break
    end
end











