% Biophys paper figures
% 3/24/17

%% kin FV
for a=1
clear;clc;close all
figure(1);clf;
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');


pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k1\');
name3 = '1k1'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
figure(1); hold on
h1 = plot(zeros(1,100),linspace(0,800,size(zeros(1,100),2)),'linew',1,'color','k','linestyle','-');
h2 = plot(-1.*A(5:29,1),A(5:29,2),'linew',2); h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

pathname2 = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k2\');
name3 = '1k12'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
h3 = plot(-1.*A(5:29,1),A(5:29,2),'linew',2); h3.Color = [0.2 0.8 0.4]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;

% set(gca,'LineWidth',3);  
% set(gca,'FontSize',40);  
xlabel('Force (pN)','FontSize',24);
ylabel('Velocity (nm/s)','FontSize',24); % Y-axis
ax = legend([h2 h3],{'Kinesin-1','Kinesin-2'},'location','southeast','fontsize',24);  % Only the blue and green lines appear
ax.Box = 'off';
ax.Position = [0.67 0.4 0.1 0.1];
clear ax
hold off
set(gca,'FontSize',24);
set(gca,'XTick', -6:2:6); 
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):100:ax.YAxis.Limits(2);
% box on
axis([-6.4,6.4,0,800])
ax.LineWidth = 2;
axis normal

pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F1A_kinFV.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);

% set(gcf,'units','inches','position',[8 2 3.5 3]);
% set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);

print(fullFileName1,'-r10000','-depsc')
end
%% kin RL
for a=1
clear; close all;clc
% figure(2); close; ax = gcf; p = ax.Position; ax.Position = 1.2*p; %ax.Position(1) = p(1) -100; ax.Position(2) = p(2) -100;

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

% text(
hold on; 
h1 = plot(zeros(1,100),linspace(0,1500,size(zeros(1,100),2)),'linew',2,'color','k','linestyle','-');

% h1 = plot(zeros(1,100),linspace(0,1300,size(zeros(1,100),2)),'linew',3,'color','k');
pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k1\');
name3 = '1k1'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

% h2 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
% h2 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
h2 = plot(-1*(B(1:end,1)),B(1:end,2)/1000,'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k2\');
name3 = '1k12'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
% h3 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); h3.Color = [0.2 0.8 0.4]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;
% h3 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); h3.Color = [0.2 0.8 0.4]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;
h3 = plot(-1*(B(1:end,1)),B(1:end,2)/1000,'linew',2); h3.Color = [0.2 0.8 0.4]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;
%
set(gca,'LineWidth',2);  
set(gca,'FontSize',24);  
xlabel('Force (pN)','FontSize',24);
ylabel('Run length (\mum)','FontSize',24); % Y-axis
hold off
box on

ax = legend([h2 h3],{'Kinesin-1','Kinesin-2'},'location','northeast');  % Only the blue and green lines appear
legend boxoff; 
rect = [0.60, 0.431, .25, .2];
set(ax, 'Position', rect)
% set(ax,'FontSize',16,'fontweight','Bold'); legend('location','southwest')
% legend boxoff;


% title({'Theoretical Figure 2: kin1 and kin2 RL'},'Fontsize',25)
set(gca,'XTick', -6:2:6); 
set(gca,'YTick', 0:.400:1.200); 


ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):.200:ax.YAxis.Limits(2);
ax.Box = 'off';
axis([-6.4,6.4,0,1.300])
hold on; 
pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F1_kinRL.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')
end
%% dyn FV
for a=1
clear;clc;close all
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.6 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

% text(3,-170,'Dynein','FontSize',35)

hold on; 
h0 = plot(linspace(-7,7,size(zeros(1,100),2)),zeros(1,100),'linew',1,'color','k','linestyle','-');
h1 = plot(zeros(1,100),linspace(-400,300,size(zeros(1,100),2)),'linew',1,'color','k','linestyle','-');

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1d\');
name3 = '1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);

h2 = plot((-1.*A(:,1)),A(:,2),'linew',2); hold on; h2.Color =  [0.8 0.2 0.2]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

name3 = '1d_Fs=430_Fd=299'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);


h3 = plot((-1.*A(:,1)),A(:,2),'linew',2); h3.Color =[0.4 0 0.2]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;


set(gca,'LineWidth',2);  
set(gca,'FontSize',24);  
xlabel('Force (pN)','FontSize',24);
ylabel('Velocity (nm/s)','FontSize',24); % Y-axis
hold off
box on
ax1 = legend([h2,h3],'Fs = 1.25','Fs = 4.3');
% 
% ax = legend([h2 h3],{'Kinesin-1','Kinesin-2'},'location','northeast');  % Only the blue and green lines appear
legend boxoff; 
rect = [0.26, 0.5, .21, .1];
set(ax1, 'Position', rect)
ax1.FontSize = 15;

% ax=text(-4.2,-55,'Dynein');
% set(ax,'FontSize',16,'fontweight','Bold'); legend('location','southwest')
% legend boxoff;

% title({'Theoretical Figure 2: kin1 and kin2 RL'},'Fontsize',25)
set(gca,'XTick', -6:2:8); 
set(gca,'YTick', -200:100:200); 

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):50:ax.YAxis.Limits(2);
ax.Box = 'off';

axis([-6.4,8.4,-250,100])
hold on;
axis normal
pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F1_dynFV.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')
end
%% dyn RL
for a=1
clear; close all;clc

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on; 
% % text(-5,120,'Dynein','FontSize',24)
h1 = plot(zeros(1,100),linspace(0,1500,size(zeros(1,100),2)),'linew',2,'color','k','linestyle','-');

% h1 = plot(zeros(1,100),linspace(0,1300,size(zeros(1,100),2)),'linew',3,'color','k');

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1d\');
name3 = '1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
% h2 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
% h2 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
h2 = plot((-1.*B(1:end,1)),abs(B(1:end,2)),'linew',2); hold on; h2.Color = [0.8 0.2 0.2]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1d\');
name3 = '1d_Fs=430_Fd=299'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
% h2 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
% h2 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
h3 = plot((-1.*B(1:end,1)),abs(B(1:end,2)),'linew',2); hold on; h3.Color =[0.4 0 0.2]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;


set(gca,'LineWidth',2);  
set(gca,'FontSize',24);  
xlabel('Force (pN)','FontSize',24);
ylabel('Run length (nm)','FontSize',24); % Y-axis
hold off
box off

ax = legend([h2,h3],'Fs = 1.25','Fs = 4.3','location','northeast');  % Only the blue and green lines appear
legend boxoff; 
rect = [0.63, 0.57, .25, .2];
set(ax, 'Position', rect)
% set(ax,'FontSize',16,'fontweight','Bold'); legend('location','southwest')
% legend boxoff;

% title({'Theoretical Figure 2: kin1 and kin2 RL'},'Fontsize',25)
set(gca,'XTick', -6:2:8); 
set(gca,'YTick', 0:50:250); 

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):25:ax.YAxis.Limits(2);

axis([-6.4,8.4,0,250])
hold on;
pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F1_dynRL.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')
end
%% 1k1 vs 0:10 dyn, 1k2 vs 0:10 dyn
% 1kin1 vs dyn1:10, Fs = 1.25
% 1kin2 vs dyn 1:10
for a=1
clear; close all;clc

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
kin.num =1;
dyn.Fs = 1.25;
dyn.Fd = 0.87;
a = 0:10;
ii=1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d0\');
name3 = '1k1_0d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d1\');
name3 = '1k1_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d2\');
name3 = '1k1_2d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d3\');
name3 = '1k1_3d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d4\');
name3 = '1k1_4d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d5\');
name3 = '1k1_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d6\');
name3 = '1k1_6d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d7\');
name3 = '1k1_7d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d8\');
name3 = '1k1_8d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d9\');
name3 = '1k1_9d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d10\');
name3 = '1k1_10d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

close;
hold on;
h1 = plot(a,y,'linew',2);
  h1.MarkerFaceColor = 'w';
h1.Marker = 'o';
h1.Color = [0,0.447,0.741];
h1.MarkerSize = 8;
plot(-1:11,zeros(1,13),'linew',2,'color','k')
    

% --- --- ---- --  kin2, Fs = 1.25 --- --- --- --- --- --- 
a = 0:10;
ii=1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d0\');
name3 = '1k2_0d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d1\');
name3 = '1k2_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d2\');
name3 = '1k2_2d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d3\');
name3 = '1k2_3d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d4\');
name3 = '1k2_4d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d5\');
name3 = '1k2_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d6\');
name3 = '1k2_6d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d7\');
name3 = '1k2_7d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d8\');
name3 = '1k2_8d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d9\');
name3 = '1k2_9d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d10\');
name3 = '1k2_10d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

hold on;
h2 = plot(a,y,'linew',2);
h2.MarkerFaceColor = [0.1 0.8 0.1];
h2.Marker = '^';
h2.Color = [0.1 0.5 0.1];
h2.MarkerSize = 8;

L = legend([h1,h2],'Kinesin-1','Kinesin-2');
legend boxoff; 
L.Location = 'northeast';
% rect = [0.2, 0.47, .25, .2];
% set(L, 'Position', rect)
box off
axis square
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:10;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;

set(gca,'XTick', 0:2:10);   % X-tIck
set(gca,'YTick',-200:200:900);  % Y-tick
axis([-0.5 10.5 -200 900]);  % axis values
axis square; box off;
set(gca,'LineWidth',2);   % Axis Width
set(gca,'FontSize',22);  % Axis font size
% set(gca,'FontWeight','Bold');
xlabel('Number of dynein','FontSize',24);
ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
hold off

pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F2_1kinVS10dyn.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')
end
%% 2:3kin1 vs 0:10 dyn, 2k2 vs 0:10 dyn

for a=1
clear; close all;clc

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
kin.num =1;
dyn.Fs = 1.25;
dyn.Fd = 0.87;
a = 0:10;
ii=1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d0\');
name3 = '2k1_0d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d1\');
name3 = '2k1_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d2\');
name3 = '2k1_2d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d3\');
name3 = '2k1_3d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d4\');
name3 = '2k1_4d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d5\');
name3 = '2k1_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d6\');
name3 = '2k1_6d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d7\');
name3 = '2k1_7d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d8\');
name3 = '2k1_8d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d9\');
name3 = '2k1_9d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k1d10\');
name3 = '2k1_10d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

close;
hold on;
h1 = plot(a,y,'linew',2);
  h1.MarkerFaceColor = 'w';
h1.Marker = 'o';
h1.Color = [0,0.447,0.741];
h1.MarkerSize = 8;
plot(-1:11,zeros(1,13),'linew',2,'color','k')
    
    
set(gca,'XTick', 0:2:10);   % X-tIck
set(gca,'YTick',-200:200:800);  % Y-tick
axis([-0.3 10.3 -200 800]);  % axis values
axis square; box off;
set(gca,'LineWidth',2);   % Axis Width
set(gca,'FontSize',22);  % Axis font size
% set(gca,'FontWeight','Bold');
xlabel('Number of dynein','FontSize',24);
ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
hold off

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:10;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;
hold on;

% --- --- ---- ---- ----  3 kin1 vs 0:10 dyn --- ---- ---- ----- ----- --


kin.num =1;
dyn.Fs = 1.25;
dyn.Fd = 0.87;
a = 0:10;
ii=1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d0\');
name3 = '3k1_0d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d1\');
name3 = '3k1_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d2\');
name3 = '3k1_2d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d3\');
name3 = '3k1_3d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d4\');
name3 = '3k1_4d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d5\');
name3 = '3k1_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d6\');
name3 = '3k1_6d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d7\');
name3 = '3k1_7d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d8\');
name3 = '3k1_8d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d9\');
name3 = '3k1_9d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k1d10\');
name3 = '3k1_10d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

hold on;
h2 = plot(a,y,'linew',2);
  h2.MarkerFaceColor = [0.4,0.7,0.9];
h2.Marker = 'o';
h2.Color = [0,0.447,0.741];
h2.MarkerSize = 8;
plot(-1:11,zeros(1,13),'linew',2,'color','k')
    
    
set(gca,'XTick', 0:2:10);   % X-tIck
set(gca,'YTick',-200:200:850);  % Y-tick
axis([-0.5 10.5 -200 850]);  % axis values
axis square; box off;
set(gca,'LineWidth',2);   % Axis Width
set(gca,'FontSize',22);  % Axis font size
% set(gca,'FontWeight','Bold');
xlabel('Number of dynein','FontSize',24);
ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
hold off

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:10;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;
end % 2,3kin1

% --- --- ---- -- ----  kin2, Fs = 1.25 --- --- --- --- --- --- 
for a=1
% clear; close all;clc

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
kin.num =1;
dyn.Fs = 1.25;
dyn.Fd = 0.87;
a = 0:10;
ii=1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d0\');
name3 = '2k2_0d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d1\');
name3 = '2k2_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d2\');
name3 = '2k2_2d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d3\');
name3 = '2k2_3d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d4\');
name3 = '2k2_4d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d5\');
name3 = '2k2_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d6\');
name3 = '2k2_6d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d7\');
name3 = '2k2_7d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d8\');
name3 = '2k2_8d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d9\');
name3 = '2k2_9d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\2k2d10\');
name3 = '2k2_10d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

hold on;
h3 = plot(a,y,'linew',2);
h3.MarkerFaceColor = 'w';
h3.Marker = '^';
h3.Color = [0.1 0.5 0.1];
h3.MarkerSize = 8;

% --- --- ---- ---- ----  3 kin2 vs 0:10 dyn --- ---- ---- ----- ----- --


kin.num =1;
dyn.Fs = 1.25;
dyn.Fd = 0.87;
a = 0:10;
ii=1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d0\');
name3 = '3k2_0d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d1\');
name3 = '3k2_1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d2\');
name3 = '3k2_2d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d3\');
name3 = '3k2_3d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d4\');
name3 = '3k2_4d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d5\');
name3 = '3k2_5d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d6\');
name3 = '3k2_6d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d7\');
name3 = '3k2_7d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d8\');
name3 = '3k2_8d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d9\');
name3 = '3k2_9d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\3k2d10\');
name3 = '3k2_10d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
y(ii) = A(1,5); ii =ii+1;



hold on;
h4 = plot(a,y,'linew',2);
h4.MarkerFaceColor = [0.1 0.8 0.1];
h4.Marker = '^';
h4.Color = [0.1 0.5 0.1];
h4.MarkerSize = 8;
    
    
set(gca,'XTick', 0:2:10);   % X-tIck
set(gca,'YTick',-200:200:850);  % Y-tick
axis([-0.5 10.5 -200 850]);  % axis values
axis square; box off;
set(gca,'LineWidth',2);   % Axis Width
set(gca,'FontSize',22);  % Axis font size
% set(gca,'FontWeight','Bold');
xlabel('Number of dynein','FontSize',24);
ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
hold off

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:10;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;
L=legend([h1,h2,h3,h4],'2 kinesin-1','3 kinesin-1','2 kinesin-2','3 kinesin-2');
L.Box= 'off';
L.FontSize = 12;
L.Position = [0.55744 0.71468 0.2125 0.2131];
axis([-0.5,10.5,-200,900])

pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F3_2,3kinVS10dyn.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')

end

%% traces: 1k1 vs 10 dyn



%% Empirical rates

% Empirical attach/detach
clear; clc;
format shortG
kin.num = 1; kin.type = 1;
dyn.num = 2;
v = struct;ek=struct;

for Fs = 1
    dyn.Fd = Fs;
    for Fd = 1:2
        dyn.Fs = Fd;
        if kin.type == 1
            name3 = sprintf('%1.0fk1_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
            dname = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d2\');
        else
            name3 = sprintf('%1.0fk2_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
            dname = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d1\');
        end
        
        file = name3;
        fname = fullfile(dname,file);
        load(fname);
        
        v(Fd).mv = A(1,5);
        v(Fd).mrl = A(2,5);
        
        [v,ek] = emptomatrix3(Fd,v,emp,ek);
        
    end
end

%% catchbond dynein FV=RL
clear; close all;clc

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on; 
% % text(-5,120,'Dynein','FontSize',24)
h1 = plot(zeros(1,100),linspace(0,1500,size(zeros(1,100),2)),'linew',2,'color','k','linestyle','-');

% h1 = plot(zeros(1,100),linspace(0,1300,size(zeros(1,100),2)),'linew',3,'color','k');

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1dcatch\');
name3 = '1d_Fs=125_Fd=87'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
% h2 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
% h2 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
h2 = plot((-1.*B(1:end,1)),abs(B(1:end,2)),'linew',2); hold on; h2.Color = [0.8 0.2 0.2]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1d\');
name3 = '1d_Fs=430_Fd=299'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
% h2 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
% h2 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
h3 = plot((-1.*B(1:end,1)),abs(B(1:end,2)),'linew',2); hold on; h3.Color =[0.4 0 0.2]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;

set(gca,'LineWidth',2);  
set(gca,'FontSize',24);  
xlabel('Force (pN)','FontSize',24);
ylabel('Run length (nm)','FontSize',24); % Y-axis
hold off
box off

ax = legend([h2,h3],'Fs = 1.25','Fs = 4.3','location','northeast');  % Only the blue and green lines appear
legend boxoff; 
rect = [0.63, 0.57, .25, .2];
set(ax, 'Position', rect)
% set(ax,'FontSize',16,'fontweight','Bold'); legend('location','southwest')
% legend boxoff;

% title({'Theoretical Figure 2: kin1 and kin2 RL'},'Fontsize',25)
set(gca,'XTick', -6:2:8); 
set(gca,'YTick', 0:50:250); 

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):25:ax.YAxis.Limits(2);

axis([-6.4,8.4,0,250])
hold on;
pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = 'F1_dynRLcatch.eps';
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')