function trace(Simu,name,kin,z)
if nargin < 4
z=1;
end

if length(Simu) ~= 1
    S = struct;
    for ii = 1:length(Simu)
        S.t(ii) = Simu(ii).t;
        S.cX(ii) = Simu(ii).cX;
    end
    a = 1;
end
k = find(Simu(end).motT == 1);
d = find(Simu(end).motT == 2);
kincol = winter(length(k));
dyncol = autumn(length(d));
allattachedcol = [1,1,1];
m = [length(k),length(d)];
bothcol = nchoosek(max(m),min(m));


figure(z); hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

if kin.type == 1
    x =  [0,0.447,0.741];
else
    x = [0.1 0.5 0.1];
end


if a == 1
    plot(S.t,S.cX/1000,'linew',2,'Color',x)
else
    plot(Simu.t,Simu.rl,'linew',2)
end
xlabel('Time (s)','FontSize',20);    
ylabel('Position (\mum)','FontSize',20); % Y-axis
axis square
set(gca,'FontSize',20);  % Axis font size
set(gca,'LineWidth',2);   % Axis Width
% set(gca,'FontWeight','Bold');
box on
xlim([0,5]);
ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:5:50;
title(name)
end




        
