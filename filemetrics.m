function [MovTime,EucError_1s,linIndex,AspectRatio,totjerk,dir_error,ext_error] = filemetrics(file)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    % Delete firsts not registered rows
    file = file(find(file.nose_x|file.nose_y|file.l_shoulder_x|file.l_shoulder_y|file.r_shoulder_x|file.r_shoulder_x,1):end,:);
    
    % Delete blinds targets
    file = file(file.repetition ~= 7,:);
    
    % Delete centrals targets
    file = file(file.target_x ~= 600 & file.target_y ~= 325,:);
    
    % Founds errors on state that generate [0 2] sequences and changes those 2 into
    % zeros
    indx_err = strfind(file.state', [0 2]) + 1;
    if ~isnan(indx_err)
        for i=1:length(indx_err)
            file.state(indx_err(i)) = 0;
            for j=1:2
                indx_err(i) = indx_err(i) + 1;
                if file.state(indx_err(i)) == 2
                    file.state(indx_err) = 0;
                    j = 1;
                end
            end
        end
    end
    clearvars j i indx_err
    
    % Allocating MovTime, EucError_1s, linIndex, AspectRatio, totjerk, dir_error and ext_error memory 
    columns = file.block(end);
    max_rows = max(file.repetition.*(file.target+1));
    
    [MovTime,EucError_1s,linIndex,AspectRatio,totjerk,dir_error,ext_error] = deal(NaN(max_rows,columns));
    clear max_rows

    % Preparing cells for metrics
    num_elements = sum(ischange(file.trial) & file.block == 1)+1;
    [MovTime(1:num_elements,1),EucError_1s(1:num_elements,1),linIndex(1:num_elements,1),AspectRatio(1:num_elements,1), totjerk(1:num_elements,1), dir_error(1:num_elements,1),ext_error(1:num_elements,1)] = deal(0);
    for i = 2:columns
        num_elements = sum(ischange(file.trial) & file.block == i);
        [MovTime(1:num_elements,i),EucError_1s(1:num_elements,i),linIndex(1:num_elements,i),AspectRatio(1:num_elements,i), totjerk(1:num_elements,i), dir_error(1:num_elements,i),ext_error(1:num_elements,i)] = deal(0);
    end
    clearvars i columns num_elements
    
    % Filling cells with metrics
    indx = [1;find(ischange(file.trial));length(file.trial)+1];
    for i = 1:length(indx)-1
        element_to_change = find(MovTime == 0,1);
        Time = file.time(indx(i):indx(i+1)-1);
        CursorXY = [file.cursor_x(indx(i):indx(i+1)-1),file.cursor_y(indx(i):indx(i+1)-1)];
        Target = [file.target_x(indx(i)+1),file.target_y(indx(i)+1)];
        [MovTime(element_to_change),EucError_1s(element_to_change),linIndex(element_to_change),AspectRatio(element_to_change), totjerk(element_to_change), dir_error(element_to_change),ext_error(element_to_change)] = computereachmetrics(Time,CursorXY,Target);
    end
    clearvars i Time CursorXY Target element_to_change indx
end

