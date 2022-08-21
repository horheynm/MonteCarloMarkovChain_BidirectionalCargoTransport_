function G = getG(G,Simu,c2,c1,z2,ii)
% This code will save the matrix Simu, into an single matrix G, so that we
% can save data from each run
% G.e = empirical att/det
% G.m = motor position
% G.a = motor attachment status to the MT


% empirical attachment/detachment
G(c1,c2,z2,ii).e = zeros(size(Simu(end).count,1)+2,size(Simu(end).count,2)); %G(Fs,Fd,dyn.num,runs)
g = Simu(end).count;
G(c1,c2,z2,ii).e = g;

for hh = 1:size(G(c1,c2,z2,ii).e,1)-2
    if Simu(end).motT(hh) == 1
        G(c1,c2,z2,ii).e(end-1,:) = G(c1,c2,z2,ii).e(end-1,:) + G(c1,c2,z2,ii).e(hh,:);
    else
        G(c1,c2,z2,ii).e(end,:) = G(c1,c2,z2,ii).e(end,:) + G(c1,c2,z2,ii).e(hh,:);
    end
end

% motor attachment
a = zeros(length(Simu),length(Simu(end).motA));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).motA)
        a(i2,j2) = Simu(i2).motA(j2);   
    end
end
G(c1,c2,z2,ii).a = a;

% motor position
x = zeros(length(Simu),length(Simu(end).motX));
for i2 = 1:length(Simu)
    for j2 = 1:length(Simu(end).motX)
        x(i2,j2) = Simu(i2).motX(j2);   
    end
end
G(c1,c2,z2,ii).x = x;


% Sim time
t = zeros(length(Simu),1);
for i2 = 1:length(Simu)
    t(i2) = Simu(i2).t;
end
G(c1,c2,z2,ii).t = t;

end

