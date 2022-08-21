function emp = getEmpRate2(emp,ii,G,Simu)

% out:  emp.t (type 1=kin,10=dyn), emp.f (force)
        
%{
 Flow chart:
(1) Find emp attachement, and detachment time.
(2) find number of kin, dyn
(3) initialize vector, emp, to save [motor type,det time, att time]
(4) save data into emp
%}

% Code below finds the empirical attachment/detachment
E = struct;
for i2 = 1:size(G(ii).a,2)
    rt = 0; s = 1; att = 1; det = 1;
    for i3 = 1:size(G(ii).a,1)-1
        
        if s == 1 && G(ii).a(i3+1,i2) == 0
            s = 0; % originally attached, now detached. Calc kdet
            E(i2).d(1,det) = G(ii).t(i3+1) - rt; % Eirical time for detaching
            E(i2).d(2,det) = G(ii).T(i3+1,i2); % add motor type
            det = det + 1;
            rt = G(ii).t(i3+1); % set the total transition time as the new ref time
        elseif s == 0 && G(ii).a(i3+1,i2) == 1
            s = 1; % originally attached, now detached. Calc kdet
            E(i2).a(1,att) = G(ii).t(i3+1) - rt; % Eirical time for detaching
            E(i2).a(2,att) = G(ii).T(i3+1,i2); % add motor type
            att = att + 1;
            rt = G(ii).t(i3+1); % set the total transition time as the new ref time
        end
    end
end

% code below organizes data into emp
a = Simu(end).count(:,1:2);
if sum(G(ii).a(1,:)) > 1
    sa = sum(a);
else
    sa = a;
end
emp(ii).t = zeros(sa(2),3); % emp = [Type,det,attach];
c = 1; % counter for E
n = 1;
d = 0;
k = 10;

for i2 = 1:size(emp(ii).t,1)
    
    if G(ii).T(1,n) == 1 % assign motor type to emp 
        emp(ii).t(i2,1) = k;
    else
        emp(ii).t(i2,1) = d;
    end

    if c <= a(n,1) && c <= a(n,2) % #detach == # attach
        emp(ii).t(i2,2) = E(n).d(1,c);
        emp(ii).t(i2,3) = E(n).a(1,c);
    elseif a(n,2) == 0 % if the motor never detached
        emp(ii).t(i2,2) = 0;
        emp(ii).t(i2,3) = 0;
        c = 0; 
    else
        emp(ii).t(i2,2) = E(n).d(1,c); % if #detach > # attach
    end
    
    if c == size(E(n).d,2) %if the counter reached the #detach
        c = 1; %reset counter
        n = n +1; %move on to the next motor

            if n <= size(G(ii).T,2) % update the numbering on the motor
                if G(ii).T(1,n) == 1
                    k = k + 10;
                else
                    d = d + 1;
                end
            end
    else
        c = c + 1;
    end
    
    
end
%% Get motor forces

% assign motor numbers
kk = 0; dd = 0;
for i2 = 1:size(G(ii).a,2)
    if G(ii).T(1,i2) == 1
        kk = kk + 1;
    else
        dd = dd + 1;
    end
end
knum = zeros(1,kk);
for i2 = 1:kk
    if i2 == 1
    knum(1) = 10;
    else 
        knum(1,i2) = knum(1,i2-1) + 10;
    end
end

dnum = zeros(1,dd);
for i2 = 1:dd
    if i2 == 1
    dnum(1) = 1;
    else 
        dnum(1,i2) = dnum(1,i2-1) + 1;
    end
end

    

cc=1; kc = 1; dc =1;
for i2 = 1:size(G(ii).a,2)
    for i3 = 1:size(G(ii).a,1)-1
        if G(ii).a(i3,i2) ~= G(ii).a(i3+1,i2)   
            if G(ii).T(i3,i2) == 1
                emp(ii).f(cc,1) =  knum(kc); % motor type, 1=kin, 2=dyn
            else
                emp(ii).f(cc,1) =  dnum(dc); % motor type, 1=kin, 2=dyn
            end
            emp(ii).f(cc,2) = G(ii).a(i3+1,i2); % attach or detach, 1=attached, 0=detached
            emp(ii).f(cc,3) = G(ii).f(i3,i2); % ,force on the motor,
            emp(ii).f(cc,4) = mean(G(ii).f(i3,:)); % average(all_motor)
            cc = cc + 1;
        end
        if i3 == size(G(ii).a,1)-1
            if G(ii).T(i3,i2) == 1
                kc =kc+1;
            else
                dc=dc+1;
            end
        end
    end
end






end








