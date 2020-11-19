function emp = getEmpRate3(emp,ii,G)
%{
 VERIFIED 3/22/17
% output    = emp.f, forces on the motor
%               emp.f(1) = motnum
                emp.f(2) = attach/detached, 0=detached, 1=attached
                emp.f(3) = force on the motor at attach/detach
                emp.f(4) = mean(force) of all motors       
%           = emp.td = time at motors detached
                emp.td(1) = motor type, X00 = kinesin, X(single digit) =
                dynein
                emp.td(2) = time taken for the motor to detach
%           = emp.ta = time at motors attached
                emp.ta(1) = same as above emp.td(1)
                emp.ta(2) = time taken for the motor to reattach to MT

 Flow chart:
(1) Find emp attachement, and detachment time.
(2) find number of kin, dyn
(3) initialize vector, emp, to save [motor type,det time, att time]
(4) save data into emp
%}
%% assign motor numbers
% for each motor, categorize them into numbers. X00 = kin, Y(single digit) = dynein. 
% output, knum, dnum
% knum = [100,200,...];
% dnum = [1,2,...}]; 

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
    knum(1) = 100;
    else 
        knum(1,i2) = knum(1,i2-1) + 100;
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
% VERIFIED 3/22/17

%% Code below finds the empirical attachment/detachment

s=1; % state, originally attached.
cd=1; % counter detachment
ca=1; % coutner atachment
kc=1;dc=1; 
emp(ii).ta = [];

for i2 = 1:size(G(ii).a,2)
    ref = 0;s=1;
    for i3 = 1:size(G(ii).a,1)-1
        if s == 1 % if motor is attached, find where it detaches
            if G(ii).a(i3,i2) == 1 && G(ii).a(i3+1,i2) == 0 % if event(ii) is attached, and event(ii+1) is detaches
                if G(ii).T(i3,i2) == 1
                    emp(ii).td(cd,1) =  knum(kc); % motor type, 1=kin, 2=dyn
                else
                    emp(ii).td(cd,1) =  dnum(dc); % motor type, 1=kin, 2=dyn
                end
                emp(ii).td(cd,2) = G(ii).t(i3+1) - ref;
%                 fprintf('detached at: %1.5f,ref: %1.5f,T:%d \n',G(ii).t(i3+1),ref,G(ii).T(i3,i2))                
                ref = G(ii).t(i3+1);
                
                s=0;
                cd=cd+1;
            end
        else
            if G(ii).a(i3,i2) == 0 && G(ii).a(i3+1,i2) == 1 %%&& isempty(emp(ii).ta) ~= 1
                if G(ii).T(i3,i2) == 1
                    emp(ii).ta(ca,1) =  knum(kc); % motor type, 1=kin, 2=dyn
                else
                    emp(ii).ta(ca,1) =  dnum(dc); % motor type, 1=kin, 2=dyn
                end
                emp(ii).ta(ca,2) = G(ii).t(i3+1)-ref;
%                 fprintf('attached at: %1.5f,ref: %1.5f,T:%d \n',G(ii).t(i3+1),ref,G(ii).T(i3,i2))                

                ref = G(ii).t(i3+1);
                s=1;
                ca=ca+1;
            end
%             if isempty(emp(ii).ta) == 1
%                 emp(ii).ta = 'no motors reattached';
%             end
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

if G(ii).t(end) < 3
    if isempty(emp(ii).ta) == 1
        emp(ii).ta = {'no motors reattached'};
    end
end
        

%% motor forces
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








