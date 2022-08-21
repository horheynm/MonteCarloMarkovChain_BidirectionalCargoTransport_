function v = emptomatrix2(Fd,v,emp)
% Date created: 2/24/17
% Last updated: 2/26/17
% Organizes, emp (structure) into v (strcuture)
% output, v.k, v.kd, v.r

%% Homogenize the motnum. 
% assign 1 for kin, 2 for dyn
for ii = 1:size(emp,2)
    for i2 = 1:size(emp(ii).t,1)
        if rem(emp(ii).t(i2),10) == 0
            emp(ii).t(i2) = 1;
        else
            emp(ii).t(i2) = 2;
        end
    end
end

% put the attachment/detachment time into one matrix v2
for ii = 1:size(emp,2)
    if ii == 1 
        v2 = emp(ii).t;
    else % from 2nd counter, allocate new matrix size. v2 = Size(v2) + size(emp(ii).t)
        v3 = v2;%v(Fd).r;
        v2 = zeros(size(v3,1) + size(emp(ii).t,1),3);
        v2(1:size(v3,1),:) = v3;
        v2(size(v3,1)+1:end,:) = emp(ii).t;
    end
end

%% organize into v.k, v.d
% v.k = all kin, v.d = all dyn
% first allocate size for v.k and v.d
vv = struct;
k = 0;d = 0;
for ii = 1:size(v2,1)
    if v2(ii,1) == 1
        k = k + 1;
    else 
        d = d + 1;
    end
end
vv(Fd).k = zeros(k,3);
vv(Fd).d = zeros(d,3);

kk =1; dd = 1;
% organize into v.k and v.d
for ii = 1:size(v2,1)
    if v2(ii,1) == 1
        vv(Fd).k(kk,:) = v2(ii,:);
        kk = kk + 1;
    else 
        vv(Fd).d(dd,:) = v2(ii,:);
        dd = dd + 1;
    end
end


%% allocate size of v(Fd).kd and v(Fd).ka
kd = 0; ka = 0; 
for ii = 1:size(vv(Fd).k,1)
    if vv(Fd).k(ii,2) ~= 0
        kd = kd + 1;
    end
    
    if vv(Fd).k(ii,3) ~= 0
        ka = ka + 1;
    end
end
v(Fd).kd = zeros(kd,1);
v(Fd).ka = zeros(ka,1);

dd = 0; da = 0;
for ii = 1:size(vv(Fd).d,1)
    if vv(Fd).d(ii,2) ~= 0
        dd = dd + 1;
    end
    
    if vv(Fd).d(ii,3) ~= 0
        da = da + 1;
    end
end
v(Fd).dd = zeros(dd,1);
v(Fd).da = zeros(da,1);
% intial vectors, v.kd .ka .dd.da
% verified, and completed 2/26/17


%% get rid of zeros (detached, but did not reattach, tf #det >#att).
kd2 = 1; ka2 = 1;
for ii = 1:size(vv(Fd).k)  
    if vv(Fd).k(ii,2) ~= 0 && vv(Fd).k(ii,3) ~= 0% if v(Fd).k both has det time and att time
        v(Fd).kd(kd2,1) = vv(Fd).k(ii,2);
        v(Fd).ka(ka2,1) = vv(Fd).k(ii,3);
        kd2 = kd2 + 1; 
        ka2 = ka2 + 1;
    elseif vv(Fd).k(ii,2) ~= 0 && vv(Fd).k(ii,3) == 0 % zero time for attachment
        v(Fd).kd(kd2,1) = vv(Fd).k(ii,2);
        kd2 = kd2 + 1;     
    end
end
% v(Fd).kd, v(Fd).ka
% Completed, and verified 2/26/17

dd2 = 1; da2 = 1;
for ii = 1:size(vv(Fd).d)  
    if vv(Fd).d(ii,2) ~= 0 && vv(Fd).d(ii,3) ~= 0% if v(Fd).d both has det time and att time
        v(Fd).dd(dd2,1) = vv(Fd).d(ii,2);
        v(Fd).da(da2,1) = vv(Fd).d(ii,3);
        dd2 = dd2 + 1; 
        da2 = da2 + 1;
    elseif vv(Fd).d(ii,2) ~= 0 && vv(Fd).d(ii,3) == 0 % zero time for attachment
        v(Fd).dd(dd2,1) = vv(Fd).d(ii,2);
        dd2 = dd2 + 1;     
    end
end
% v(Fd).dd, v(Fd).da
% Completed, and verified 2/26/17


%% emperical det/att for kin and dyn
% k = 1/average(time);
v(Fd).r = zeros(2);
v(Fd).r(1,1) = 1/ mean(v(Fd).kd); % kin emp det
v(Fd).r(1,2) = 1/ mean(v(Fd).ka); % kin emp att
v(Fd).r(2,1) = 1/ mean(v(Fd).dd); % dyn emp det
v(Fd).r(2,2) = 1/ mean(v(Fd).da); % dyn emp att

% v.k = [kin,detTime, attTime];
% v.d = [dyn,detTime, attTime];
% v.r = [kin_emp_det, dyn_emp_det, kin_emp_att, dyn_emp_det];
% Completed and verified 2/26/17

end