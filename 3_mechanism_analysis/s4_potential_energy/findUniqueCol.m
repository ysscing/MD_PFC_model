function uniqueCols = findUniqueCol(stable_data, exit_flag, tolerance)
    data = stable_data(:,exit_flag > 0);
    uniqueCols = data(:,1); 
    for i = 2:size(data, 2)
        isUnique = true;
        for j = 1:size(uniqueCols, 2)
            if max(abs(data(:, i) - uniqueCols(:, j))) < tolerance
                isUnique = false;
                break;
            end
        end
        
        if isUnique
            uniqueCols = [uniqueCols data(:, i)];
        end
    end
end

