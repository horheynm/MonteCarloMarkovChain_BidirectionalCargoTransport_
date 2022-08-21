%% Kin FV Overlap, superimposed

clear;clc;close all
delta = 2.25; k2 = 1469; k3 = 66.76;

F = 0:0.01:6;mm=1;
for ii=1:length(F)
    motF = F(ii);
    kback(ii) = 0.06*motF(mm)*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3))/4;
    kfor(ii) = k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3);
    kstep(ii) = kfor(ii) - kback(ii);
    modF(ii) = F(ii);
end
h2 = plot(modF,8*kstep,'linew',8);hold on
h2.Color = 'k';

load('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k2\1k12');
hold on
h3=plot(A(38:end,1),A(38:end,2),'linew',3);hold on
h3.Color = [0.1 0.5 0.1];

k2 = 2753;  k3 = 99;    delta = 3.6;
F = 0:0.01:6;mm=1;
for ii=1:length(F)
    motF = F(ii);
    kback(ii) = 0.03*motF(mm)*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3))/4;
    kfor(ii) = (k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3));
    kstep(ii) = kfor(ii) - kback(ii);
    modF(ii) = F(ii);
end

h4 = plot(modF,8*kstep,'linew',8);hold on
h4.Color = [.5 .5 .5];

load('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k1\1k1');
h1=plot(A(13:end,1),A(13:end,2),'linew',3);hold on
h1.Color = [0,0.447,0.741];

figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

xlabel('Force (pN)');
ylabel('Motor velocity (nm/s)','FontSize',24); % Y-axis
set(gca,'fontsize',18);
hold off
set(gca,'XTick', 0:1:8);
set(gca,'YTick', 0:200:800);
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1/2:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:100:800;
box off
axis([-0.2,6.2,0,800])
ax.LineWidth = 2;
axis square
c.FontSize = 6;

L=legend([h1,h3,h4,h2],'Approximated kinesin-1','Approximated kinesin-2','Experimental kinesin-1','Experimental kinesin-2')
L.Box = 'off';
L.FontSize = 12;
L.Position = [0.2476 0.2027  0.3911 0.2131];

pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
nam = sprintf('F3_KinFVSup');

name1 = nam;
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')

%% Kin FRL Overlap, superimposed
clear;clc;close all


k2 = 2753;  k3 = 99;    delta = 3.6;
F = -6:0.01:6;mm=1;f=F;
for ii=1:length(F)
    motF2 = F(ii);
    if F(ii) <0 
        F(ii) = 0;
        Lo = 87; deltaL = 0.27;% Milic, PNAS, 2014
    else
        Lo = 1203;  deltaL = 2.3; % Andreasson, CurrentBiology, 2015
    end
    motF = F(ii);
    kback(ii) = 0.03*motF(mm)*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3))/4;
    kfor(ii) = (k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3));
    kstep(ii) = kfor(ii) - kback(ii);
    modF(ii) = F(ii);
    RL(ii) = (Lo*exp(-abs(motF2(mm))*deltaL/4.114));
end
h4 = plot(f(1:find(f == 0)-1),RL(1:find(f == 0)-1),'linew',8);hold on
h44 = plot(f(find(f== 0):end),RL(find(f == 0):end),'linew',8);hold on
h4.Color = [.5 .5 .5];
h44.Color = h4.Color;


load('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k1\1k1');
h1=plot(B(1:end,1),B(1:end,2),'linew',3);hold on
h1.Color = [0,0.447,0.741];



delta = 2.25; k2 = 1469; k3 = 66.76;

F = -6:0.01:6;   mm=1;f=F;
for ii=1:length(F)
    motF = F(ii);
    kback(ii) = 0.06*motF(mm)*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3))/4;
    kfor(ii) = k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3);
    kstep(ii) = kfor(ii) - kback(ii);
    modF(ii) = F(ii);
    if motF(mm) < 0
        RL(ii) = 8*63.8579/(15*exp(abs(motF(mm))/2));
    elseif motF(mm) < 1
        RL(ii) = 380*exp(-1*abs(motF(mm))/0.86754);
    else
        Lo = 182; deltaL = 1.7;
        RL(ii) = (Lo*exp(-abs(motF(mm))*deltaL/4.114));
    end
    
end
h2 =  plot(f(1:find(f == 0)-1),RL(1:find(f == 0)-1),'linew',8);hold on
% h222 = plot(f(find(f== 0)+:end),RL(find(f == 0):end),'linew',8);hold on
h22 = plot(f(max(find(RL == 182*exp(-1.7/4.114))):end),RL(max(find(RL == 182*exp(-1.7/4.114))):end),'linew',8);
h222 = plot(0,380,'Marker','o','linew',8,'color','k');
h2.Color = 'k';
h22.Color = 'k';

load('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k2\1k12');
hold on
h3=plot(B(26:end,1),B(26:end,2),'linew',3);hold on
h3.Color = [0.1 0.5 0.1];


figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

xlabel('Force (pN)');
ylabel('Run length (nm)'); % Y-axis
set(gca,'fontsize',18);
hold off
set(gca,'XTick', -6:2:8);
set(gca,'YTick', 0:300:1200);
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:150:1200;
box off
axis([-6.2,6.2,-50,1300])
ax.LineWidth = 2;
axis normal

L=legend([h1,h3,h4,h2],'Approximated kinesin-1','Approximated kinesin-2','Experimental kinesin-1','Experimental kinesin-2')
L.Box = 'off';
L.FontSize = 10;
L.Position = [0.1601 0.7027 0.3911 0.2131];

pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
nam = sprintf('F3_KinFRLSup')
name1 = nam;
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')



