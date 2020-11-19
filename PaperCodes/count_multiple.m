function sorted = count_multiple(D)              % count how many an event happened.
                                                    % [7 x X] matrix for now
sorted = zeros(7,size(D,2));
for row = 1:size(D,2)
    for col = 1:size(D,1)
        if D(col,row) == 0;
            sorted(2,row) = sorted(2,row) + 1;
        elseif D(col,row) == 8
            sorted(3,row) = sorted(3,row) + 1;
        elseif D(col,row) == 16
            sorted(4,row) = sorted(4,row) + 1;
        elseif D(col,row) == 24
            sorted(5,row) = sorted(5,row) + 1;
        elseif D(col,row) == 32
            sorted(6,row) = sorted(6,row) + 1;
        elseif D(col,row) >32
            sorted(7,row) = sorted(7,row) + 1;
        else % if RL is less than 0, if it takes backstep more than forward step
            sorted(1,row) = sorted(1,row) + 1;
        end
    end
end

      
end
