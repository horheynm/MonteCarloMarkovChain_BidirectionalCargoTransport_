%% Used to get figures
% Kinesin force velocity 

clear;clc;close all
pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k1\');
name3 = '1k1'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
figure(1); hold on
h1 = plot(zeros(1,100),linspace(0,800,size(zeros(1,100),2)),'linew',1,'color','k','linestyle','-');
h2 = plot(-1.*A(:,1),A(:,2),'linew',2); h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1k2\');
name3 = '1k12'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
h3 = plot(-1.*A(:,1),A(:,2),'linew',2); h3.Color = [0.2 0.8 0.4]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;

% set(gca,'LineWidth',3);  
% set(gca,'FontSize',40);  
xlabel('Force (pN)','FontSize',24);
ylabel('Velocity (nm/s)','FontSize',24); % Y-axis
ax = legend([h2 h3],{'Kinesin-1','Kinesin-2'},'location','southeast','fontsize',24);  % Only the blue and green lines appear
ax.Box = 'off';
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

%% dynein FV
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
rect = [0.27, 0.5, .21, .1];
set(ax1, 'Position', rect)

% ax=text(-4.2,-55,'Dynein');
% set(ax,'FontSize',16,'fontweight','Bold'); legend('location','southwest')
% legend boxoff;

% title({'Theoretical Figure 2: kin1 and kin2 RL'},'Fontsize',25)
set(gca,'XTick', -6:2:6); 
set(gca,'YTick', -200:100:200); 

ax = gca;
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):50:ax.YAxis.Limits(2);
ax.Box = 'off';

axis([-6.4,6.4,-250,100])
hold on;
axis normal

%% Kinesin FRL

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


%% dynein RL
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
h2 = plot((B(1:end,1)),abs(B(1:end,2)),'linew',2); hold on; h2.Color = [0.8 0.2 0.2]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;

pathname2 = ('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\opt\1d\');
name3 = '1d_Fs=430_Fd=299'; count = 1;
baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
load(fullFileName2);
% h2 = plot(-1*(B(1:12,1)),B(1:12,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
% h2 = plot(-1*(B(13:end,1)),B(13:end,2),'linew',2); hold on; h2.Color = [0.2,0.6,1]; h2.MarkerFaceColor = 'w';h2.MarkerSize = 11;
h3 = plot((B(1:end,1)),abs(B(1:end,2)),'linew',2); hold on; h3.Color =[0.4 0 0.2]; h3.MarkerFaceColor = 'w';h3.MarkerSize = 11;


set(gca,'LineWidth',2);  
set(gca,'FontSize',24);  
xlabel('Force (pN)','FontSize',24);
ylabel('Run length (nm)','FontSize',24); % Y-axis
hold off
box off

ax = legend([h2,h3],'Fs = 1.25','Fs = 4.3','location','northeast');  % Only the blue and green lines appear
legend boxoff; 
rect = [0.23, 0.57, .25, .2];
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

axis([-6.4,6.4,0,250])
hold on;
%% Figure 3, 
% 1kin1 vs dyn1:10, Fs = 1.25
% 1kin2 vs dyn 1:10
clear; clc; close all
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


% kin2, Fs = 1.25
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
axis normal

%% 
clear; clc; close all
load t1
figure(1); hold on
for ii = 1:5
    plot(G(ii).t,G(ii).x./1000,'linew',2,'color',[0.2,0.6,1]);
    if ii == 5
        h1 = plot(G(ii).t,G(ii).x./1000,'linew',2,'color',[0.2,0.6,1]);
    end
end
load t2
for ii = 1:5
    plot(G(ii).t,G(ii).x./1000,'linew',2,'color',[0.2 0.8 0.4]);
    if ii == 5
        h2 = plot(G(ii).t,G(ii).x./1000,'linew',2,'color',[0.2 0.8 0.4]);
    end
end

xlabel('Time (s)','FontSize',20);
ylabel('Cargo position (\mum)','FontSize',20); % Y-axis
ax = legend([h1(1),h2(1)],'1 kinesin-1 vs 1 dynein','1 kinesin-2 vs 1 dynein');%,'location','southeast','fontsize',24);  % Only the blue and green lines appear
ax.Box = 'off';
hold off
set(gca,'FontSize',20);
set(gca,'XTick', -0:1:3); 
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:0.5:3;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:0.5:3;

axis square
axis([-0.1,3,-0.6,3])
ax.LineWidth = 2;
axis normal

%% figure 4
clear; clc; close all
ii=1;

format shortG
kin.num = 1; kin.type = 4; 
dyn.num = 4;

v = struct;
col = hsv(5);
a =zeros(8);
fs = [1,2,4,6,8];
figure(1); hold on

for Fs = 1:5
    dyn.Fs = fs(Fs);
    for Fd = 1:8
        dyn.Fd = Fd;
        if kin.type == 1
            name3 = sprintf('%1.0fk1_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
            dname = ('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d1\');
        else
            name3 = sprintf('%1.0fk2_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
            dname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d4\';
        end
        
        file = name3;
        fname = fullfile(dname,file);
        load(fname);
        
%         v(Fs,Fd).mv = A(1,5);
        a(Fs,Fd) = A(1,5);
%         v(Fd).mrl = B(1,5);
%         v = emptomatrix(Fd,v,emp);
        
    end
    
    plot(1:8,a(Fs,:),'linew',2,'color',col(Fs,:));
end

xlabel('Detachment force (pN)','FontSize',20);
ylabel('Cargo velocity (nm/s)','FontSize',20); % Y-axis
% ax = legend('Fs=1','Fs=2','Fs=3','Fs=4','Fs=5','Fs=6','Fs=7','Fs=8'); %,'location','southeast','fontsize',24);  % Only the blue and green lines appear
ax = legend('Fs=1','Fs=2','Fs=4','Fs=6','Fs=8');
ax.Box = 'off';
hold off
set(gca,'FontSize',20);
set(gca,'XTick', -0:2:8); 
set(gca,'YTick', -200:200:800);
box off
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;

axis square
axis([0.7,8.2,-200,800])
ax.LineWidth = 2;
axis normal
str = sprintf('%d kinesin-2, %d dynein',kin.num,dyn.num);
title(str)

print -depsc2 1k2d4.eps




