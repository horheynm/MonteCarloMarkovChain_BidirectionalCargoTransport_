function G = getsimpleG2(G,Simu,ii) 
% -- -- -- VERIFIED 3/22/17 -- -- -- 
% This code will save the matrix Simu, into an single matrix G, so that we
% can save data from each run
% G.a = motor attachment, row = motnum, col = event(ii)
% G.x = motor positions, row = motnum, col=event(ii)
% G.t = time at event (ii), row=1, col=event(ii)
% G.T = motor type, row=motnum, col=event(ii)
% G.f = forces on motor, row=motnum, col=event(ii)
% -- --- -- -- -- -- -- -- -- -- -- -- 

% motor attachment
a = zeros(length(Simu),length(Simu(end).motA));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).motA)
        a(i2,j2) = Simu(i2).motA(j2);   
    end
end
G(ii).a = a;

% motor position
x = zeros(length(Simu),length(Simu(end).motX));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).motX)
        x(i2,j2) = Simu(i2).motX(j2);   
    end
end
G(ii).x = x;


% Sim time
t = zeros(length(Simu),1);
for i2 = 1:length(Simu)
    t(i2) = Simu(i2).t;
end
G(ii).t = t;

% Mot type
T = zeros(length(Simu),length(Simu(end).motT));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).motT)
        T(i2,j2) = Simu(i2).motT(j2);   
    end
end
G(ii).T = T;

% motor force
f = zeros(length(Simu),length(Simu(end).motF));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).motF)
        f(i2,j2) = Simu(i2).motF(j2);   
    end
end
G(ii).f = f;

% cX
cX = zeros(length(Simu),length(Simu(end).cX));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).cX)
        cX(i2,j2) = Simu(i2).cX(j2);   
    end
end
G(ii).cX = cX;


end

