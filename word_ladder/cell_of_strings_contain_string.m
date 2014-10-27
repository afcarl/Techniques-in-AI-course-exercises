function [ result ] = cell_of_strings_contain_string( cell_of_strings, string_to_find )
    % Checks whether a cell of strings contain a particular string.
    % Input:
    % @cell_of_strings - input cell of strings to search for a string
    % @string_to_find - string to search for in the cell
    % Outpu:
    % @result - boolean value depending on the result of search.
    
    matches = cellfun(@(string_to_compare) strcmp(string_to_compare, string_to_find), cell_of_strings);
    result = any(matches);
end

