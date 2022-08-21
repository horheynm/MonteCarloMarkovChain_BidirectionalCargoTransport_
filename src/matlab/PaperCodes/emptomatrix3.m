function [v,ek] = emptomatrix3(Fd,v,emp,ek)
% Date created: 3/21/17
% Last updated: 3/22/17
% Organizes, emp (structure) into v (strcuture)
% output, v.k, v.kd, v.r

%% Homogenize the motnum. 
% assign 1 for kin, 2 for dyn

% emp.td
for ii = 1:size(emp,2)
    for i2 = 1:size(emp(ii).td,1)
        if rem(emp(ii).td(i2),100) == 0
            emp(ii).td(i2) = 1;
        else
            emp(ii).td(i2) = 2;
        end
    end
end

% emp.f
for ii = 1:size(emp,2)
    for i2 = 1:size(emp(ii).f,1)
        if rem(emp(ii).f(i2,1),100) == 0
            emp(ii).f(i2,1) = 1;
        else
            emp(ii).f(i2,1) = 2;
        end
    end
end

% emp.ta
% emp(ii).ta = zeros(1,2);
cemp=0; % counter for empty matrix
for ii = 1:size(emp,2)
    % if the motor never reattached to the MT, make a zero matrix
    if iscellstr(emp(ii).ta) == 1
%         emp(ii).ta = zeros(1,2);
        cemp=1;
    end
    if cemp ==0
        for i2 = 1:size(emp(ii).ta,1)
            if rem(emp(ii).ta(i2,1),100) == 0
                emp(ii).ta(i2,1) = 1;
            else
                emp(ii).ta(i2,1) = 2;
            end
        end
    end
    cemp=0;
end

%% Put emp.ta, emp.td, and emp.f into structure v2a,v2a,v2c

% emp.td into v2d matrix
for ii = 1:size(emp,2)
    if ii == 1 
        v2d = emp(ii).td;
    else % from 2nd counter, allocate new matrix size. v2 = Size(v2) + size(emp(ii).t)
        v3 = v2d;%v(Fd).r;
        v2d = zeros(size(v3,1) + size(emp(ii).td,1),2);
        v2d(1:size(v3,1),:) = v3;
        v2d(size(v3,1)+1:end,:) = emp(ii).td;
    end
end

% emp.ta into v2a matrix
v2a = [];
c=0;
for ii = 1:4%size(emp,2)
    if ii > 1
        if iscellstr(emp(ii-1).ta) == 1 && iscellstr(emp(ii).ta) ~= 1
            if isempty(v2a) == 1
                c = 1;
            end
        end
    end
    if iscellstr(emp(ii).ta) ~= 1
        if c == 1
            v2a = emp(ii).ta;
            c = 0;
        end
        if ii == 1 
            v2a = emp(ii).ta;
        else % from 2nd counter, allocate new matrix size. v2 = Size(v2) + size(emp(ii).t)
            if emp(ii).ta(1) ~= 0
                v3a = v2a;%v(Fd).r;
                v2a = zeros(size(v3a,1) + size(emp(ii).ta,1),2);
                v2a(1:size(v3a,1),:) = v3a;
                v2a(size(v3a,1)+1:end,:) = emp(ii).ta;
            end
        end
    end
end


% emp.f into v2c matrix
for ii = 1:size(emp,2)
    if ii == 1
        v2f = emp(ii).f;
    else % from 2nd counter, allocate new matrix size. v2 = Size(v2) + size(emp(ii).t)
        if isempty(emp(ii).f)==0
            if emp(ii).f(1) ~= 0
                v3c = v2f;%v(Fd).r;
                v2f = zeros(size(v3c,1) + size(emp(ii).f,1),4);
                v2f(1:size(v3c,1),:) = v3c;
                v2f(size(v3c,1)+1:end,:) = emp(ii).f;
            end
        end
        
    end
end
% verified

%% organize into v.k, v.d
% v.k = all kin, v.d = all dyn
% first allocate size for v.k and v.d

vd = struct; va=struct; vf=struct;

% ---------  Organize v2d into vd   ----------- 
k = 0;d = 0;
for ii = 1:size(v2d,1)
    if v2d(ii,1) == 1
        k = k + 1;
    else 
        d = d + 1;
    end
end
vd.k = zeros(k,2);
vd.d = zeros(d,2);

kk=1; dd=1;

% organize vd.k and vd.d
for ii = 1:size(v2d,1)
    if v2d(ii,1) == 1
        vd.k(kk,:) = v2d(ii,:);
        kk = kk + 1;
    else 
        vd.d(dd,:) = v2d(ii,:);
        dd = dd + 1;
    end
end

%  -------  Organize v2a into va -------------
k2 = 0;d2 = 0;
for ii = 1:size(v2a,1)
    if v2a(ii,1) == 1
        k2 = k2 + 1;
    else 
        d2 = d2 + 1;
    end
end
va.k = zeros(k2,2);
va.d = zeros(d2,2);

kk2=1; dd2=1;

% organize into va.k and va.d
for ii = 1:size(v2a,1)
    if v2a(ii,1) == 1
        va.k(kk2,:) = v2a(ii,:);
        kk2 = kk2 + 1;
    else 
        va.d(dd2,:) = v2a(ii,:);
        dd2 = dd2 + 1;
    end
end

%  -------  Organize v2f into vf -------------
k3 = 0;d3 = 0;
for ii = 1:size(v2f,1)
    if v2f(ii,1) == 1
        k3 = k3 + 1;
    else 
        d3 = d3 + 1;
    end
end
vf.k = zeros(k3,4);
vf.d = zeros(d3,4);

kk3=1; dd3=1;

% organize into va.k and va.d
for ii = 1:size(v2f,1)
    if v2f(ii,1) == 1
        vf.k(kk3,:) = v2f(ii,:);
        kk3 = kk3 + 1;
    else 
        vf.d(dd3,:) = v2f(ii,:);
        dd3 = dd3 + 1;
    end
end
% VERIFIED

%% organize va vd vf into v

% change this to ta, td,... bc it is disp time, not kinetics
v(Fd).ka = va.k;
v(Fd).kd = vd.k;
v(Fd).da = va.d;
v(Fd).dd = vd.d;
v(Fd).kf = vf.k;
v(Fd).df = vf.d;


%% emperical det/att for kin and dyn
% k = 1/average(time);
ek(Fd).r = zeros(2);
ek(Fd).r(1,1) = 1/ mean(v(Fd).kd(:,2)); % kin emp det
ek(Fd).r(2,1) = 1/ mean(v(Fd).ka(:,2)); % kin emp att
ek(Fd).r(1,2) = 1/ mean(v(Fd).dd(:,2)); % dyn emp det
ek(Fd).r(2,2) = 1/ mean(v(Fd).da(:,2)); % dyn emp att
kin = [ek(Fd).r(1,1);ek(Fd).r(2,1)];
dyn= [ek(Fd).r(1,2);ek(Fd).r(2,2)];
str = {'kdet';'kon'};
ek(Fd).table = table(kin,dyn,'RowNames',str);


% v.k = [kin,detTime, attTime];
% v.d = [dyn,detTime, attTime];
% v.r = [kin_emp_det, dyn_emp_det, kin_emp_att, dyn_emp_det];
% Completed and verified 2/26/17

end