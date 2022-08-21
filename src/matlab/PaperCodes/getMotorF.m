function mf = getMotorF(mf,G,ii)


% Find when motors detached/reattached
cc=1; 
for i2 = 1:size(G(ii).a,2)
    for i3 = 1:size(G(ii).a,1)-1
        if G(ii).a(i3,i2) ~= G(ii).a(i3+1,i2)    
            mf(ii).f(cc,1) =  G(ii).T(i3,i2); % motor type, 1=kin, 2=dyn
            mf(ii).f(cc,2) = G(ii).a(i3+1,i2); % attach or detach, 1=attached, 0=detached
            mf(ii).f(cc,3) = G(ii).f(i3,i2); % ,force on the motor,
            mf(ii).f(cc,4) = mean(G(ii).f(i3,i2)); % average(motF)
            cc = cc + 1;
        end
    end
end

end
