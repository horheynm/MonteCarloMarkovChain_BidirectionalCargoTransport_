function [sorted2] = count_multiple_time(E)              % count how many an event happened.
                                                                   % [8 x X] matrix for now
    
sorted2 = zeros(8,size(E,2));

for row = 1:size(E,2)
    for col = 1:size(E,1)
        if E(col,row) <= 0.0001;
            sorted2(1,row) = sorted2(1,row) + 1;
        elseif E(col,row) <= 0.0005
            sorted2(2,row) = sorted2(2,row) + 1;
        elseif E(col,row) <= 0.001
            sorted2(3,row) = sorted2(3,row) + 1;
        elseif E(col,row) <= 0.005
            sorted2(4,row) = sorted2(4,row) + 1;
        elseif E(col,row) <= 0.01
            sorted2(5,row) = sorted2(5,row) + 1;
        elseif E(col,row) <= 0.1
            sorted2(6,row) = sorted2(6,row) + 1;
        elseif E(col,row) <= 1
            sorted2(7,row) = sorted2(7,row) + 1;
        else 
            sorted2(8,row) = sorted2(8,row) + 1;
        end
    end
end
      
end
