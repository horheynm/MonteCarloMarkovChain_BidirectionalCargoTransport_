%% Traces Tie 1k1 vs 10d
% 2D
clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\traces\1k1d11\');
name3 = '1k1_11d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

for ii =1:runs
    plot(G(ii).t,G(ii).cX,'color',[0,0.447,0.741],'linew',2)
end

xlabel('Time (s)','FontSize',24);
ylabel('Position (nm)','FontSize',24); % Y-axis
% ax = legend([h2 h3],{'Kinesin-1','Kinesin-2'},'location','southeast','fontsize',24);  % Only the blue and green lines appear
% ax.Box = 'off';
% hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -800:200:800);
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1/2:5;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -800:100:600;
% box on
axis([0,5,-600,600])
ax.LineWidth = 2;
axis normal
L=legend('1 kinesin-1 vs 11 dynein');
L.Box = 'off';
L.Location = 'North';
L.Position =  [0.22      0.83         0.6     0.097619];
L.FontSize = 16;
axis square

pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_k1VS11dyn.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r900','-depsc')

%% traces tie, 1k2 vs 4dyn
clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\traces\1k2d5\');
name3 = '1k2_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

for ii =1:runs
    plot(G(ii).t,G(ii).cX,'color',[0.2 0.8 0.4],'linew',2)
end

xlabel('Time (s)','FontSize',24);
ylabel('Position (nm)','FontSize',24); % Y-axis
% ax = legend([h2 h3],{'Kinesin-1','Kinesin-2'},'location','southeast','fontsize',24);  % Only the blue and green lines appear
% ax.Box = 'off';
% hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -600:200:700);
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1/2:5;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -600:100:700;
% box on
axis([0,5,-600,600])
ax.LineWidth = 2;
axis normal
L=legend('1 kinesin-2 vs 5 dynein');
L.Box = 'off';
L.FontSize = 16;
L.Position =  [0.21      0.85         0.6     0.097619];
axis square

pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_kin2VS5dyn.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r900','-depsc')

%% traces tie, 1k1 vs 1
clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\traces\1k1d1\');
name3 = '1k1_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

for ii =1:runs
    plot(G(ii).t,G(ii).cX./1000,'color',[0,0.447,0.741],'linew',2)
end

xlabel('Time (s)','FontSize',24);
ylabel('Position (\mum)','FontSize',24); % Y-axis
hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -600:200:700);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', 0:1:4);
box off
axis square
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1/2:5;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:.5:4;
% box on
axis([0,5,-0.5,4])
ax.LineWidth = 2;
L=legend('1 kinesin-1 vs 1 dynein');
L.Box = 'off';
L.FontSize = 16;
L.Position =  [0.24      0.85         0.6     0.097619];
axis square

pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_kin1VS1dyn.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r900','-depsc')

%% traces tie, 1k2 vs 1
clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\traces\1k2d1\');
name3 = '1k2_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

for ii =1:runs
    plot(G(ii).t,G(ii).cX./1000,'color',[0.2 0.8 0.4],'linew',2)
end

xlabel('Time (s)','FontSize',24);
ylabel('Position (\mum)','FontSize',24); % Y-axis
hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -.400:.400:1.600);
set(gca,'XTick', 0:1:5); 
box off
axis square
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1/2:5;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -.400:.200:1.200;
% box on
axis([0,5,-.400,1.4])
ax.LineWidth = 2;
L=legend('1 kinesin-2 vs 1 dynein');
L.Box = 'off';
L.FontSize = 16;
L.Position =  [0.24      0.85         0.6     0.097619];
axis square

pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_kin2VS1dyn.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r900','-depsc')

%% Catch
%% 1k1 d1 catch bond

clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\tracesCatch\1k1d1\');
name3 = '1k1_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

for ii =1:runs
    plot(G(ii).t,G(ii).cX./1000,'color',[0,0.447,0.741],'linew',2)
end

xlabel('Time (s)','FontSize',24);
ylabel('Position (\mum)','FontSize',24); % Y-axis
hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -600:200:700);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', 0:1:4);
box off
axis square
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1/2:5;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:.5:4;
% box on
axis([0,5,-0.5,4])
ax.LineWidth = 2;
axis square

pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_TraceCatch_1k1d1125_.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r900','-depsc')

%% 

clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\tracesCatch\1k2d1\');
name3 = '1k2_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

for ii =1:runs
    plot(G(ii).t,G(ii).cX,'color',[0.2 0.8 0.4],'linew',2)
end

xlabel('Time (s)','FontSize',24);
ylabel('Position (nm)','FontSize',24); % Y-axis
hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -400:200:600);
set(gca,'XTick', 0:1:5); 
set(gca,'yTick', -400:200:600);
box off
axis square
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1/2:5;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -400:100:600;
box on
axis([0,5,-100,600])
ax.LineWidth = 2;
axis square
box off
pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_TraceCatch_1k2d1125.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r900','-depsc')   `
