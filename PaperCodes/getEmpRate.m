function emp = getEmpRate(emp,z2,ii,G)

% This function obtains G, which has the motor type, T, time, t, and state,
% a, and obtains the empirical time for attachment and detachment.


att = 0; % attachment counter
det = 0; % detachment counter

for i2 = 1:size(G(z2,ii).a,2)
    rt = 0; s = 1; att = 1; det = 1;
    for i3 = 1:size(G(z2,ii).a,1)-1
        
        if s == 1 && G(z2,ii).a(i3+1,i2) == 0
            s = 0; % originally attached, now detached. Calc kdet
            emp(ii,z2,i2).d(1,det) = G(z2,ii).t(i3+1) - rt; % empirical time for detaching
            emp(ii,z2,i2).d(2,det) = G(z2,ii).T(i3+1,i2); % add motor type
            det = det + 1;
            rt = G(z2,ii).t(i3+1); % set the total transition time as the new ref time
        elseif s == 0 && G(z2,ii).a(i3+1,i2) == 1
            s = 1; % originally attached, now detached. Calc kdet
            emp(ii,z2,i2).a(1,att) = G(z2,ii).t(i3+1) - rt; % empirical time for detaching
            emp(ii,z2,i2).a(2,att) = G(z2,ii).T(i3+1,i2); % add motor type
            att = att + 1;
            rt = G(z2,ii).t(i3+1); % set the total transition time as the new ref time
        end
    end
end




end

            
            
            
    
    

        
