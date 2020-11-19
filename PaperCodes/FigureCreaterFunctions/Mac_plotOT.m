%% Optical trap figures
%{
% Description: 
%  Run this code to obtain the force-velocity and the force run
% length curves for kinesin-1, kin2 and dynein. 
% 
% Inputs: 
%   cat:        category, should be 4, which is the opt trap
    kin.num     kin population, should be either 0 or 1
    kin.type    kin family, either 1 or 2 for kin1 and kin2
    dyn.num     dyn popualtion
    dyn.type    type of dynein, usually 1
    dyn.catch   for kin, should be 1, else, 1,25 or 4.3 for dyn
    dyn. Fd     0.87/1.25*Fs

%}

clear;clc;close all; format shortG
fprintf('Kin1 and kin2 FV');
cat = 4;        % do not change
kin.num = 1;        
kin.type = 1;kt = kin.type;

dyn.num = 0;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change
dyn.Fs = 1; dyn.Fd = 1; % do not change

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);

if cat == 1
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
elseif cat == 2
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
elseif cat == 3
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
elseif cat == 4
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/opt2/');
elseif cat == 5
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
end

f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)


close all; figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on;
h3 = plot(zeros(1,100),linspace(0,800,length(zeros(1,100))),'color','k','linewidth',2);

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2);
h1 = plot(fliplr(A(a2,1)')',A(a2,2),'linew',2); % plot kinesin-1 FV from -6 to 6pN
h1.MarkerFaceColor = 'w';h1.Color = [0,0.447,0.741];
h1.MarkerSize = 10;hold on; axis([-6.3,6.3,0,800]);


% LOAD KINESIN 2 DATA.
kin.type = 2;kt = kin.type;

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2);
h2 = plot(fliplr(A(a2,1)')',A(a2,2),'linew',2); % plot kinesin-1 FV from -6 to 6pN
h2.MarkerFaceColor = 'w';h2.Color = [0.1 0.5 0.1];
h2.MarkerSize = 10;hold on; axis([-6.3,6.3,0,800]);

set(gca,'XTick', -6:2:6);
set(gca,'YTick', 0:200:800);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:100:800;
box off
axis([-6.2,6.2,0,800])
ax.LineWidth = 2;

set(gca,'fontsize',28);

L = legend([h1,h2],'Kinesin-1','Kinesin-2');
L.Box = 'off';
L.Position = [0.58035 0.34047 0.27679 0.1631];

ylabel('Motor velocity (nm/s)');
xlabel('Force (pN)');



pathname1 = '/Volumes/Seagate/BiophysPaper2017/';
n = '/Figures/';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('1A_kinFV');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end




%% kin RL

clear;clc;close all; format shortG
fprintf('kin1 and kin2 FRL');
cat = 4;        % do not change
kin.num = 1;        
kin.type = 1;kt = kin.type;
1
dyn.num = 0;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change
dyn.Fs = 1; dyn.Fd = 1; % do not change

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);

if cat == 1
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
elseif cat == 2
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
elseif cat == 3
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
elseif cat == 4
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/opt2/');
elseif cat == 5
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
end

f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)


close all; figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on;
h3 = plot(zeros(1,100),linspace(0,1200,length(zeros(1,100))),'color','k','linewidth',2);

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D);
h1 = plot(fliplr(A(a2,1)')',(D2(a2)),'linew',2); % plot kinesin-1 FV from -6 to 6pN

h1.MarkerFaceColor = 'w';h1.Color = [0,0.447,0.741];
h1.MarkerSize = 10;hold on; axis([-6.3,6.3,0,1200]);


% LOAD KINESIN 2 DATA.
kin.type = 2;kt = kin.type;

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D);
h2 = plot(fliplr(A(a2,1)')',D2(a2),'linew',2); % plot kinesin-1 FV from -6 to 6pN
h2.MarkerFaceColor = 'w';h2.Color = [0.1 0.5 0.1];
h2.MarkerSize = 10;hold on; axis([-6.3,6.3,0,1200]);

set(gca,'XTick', -6:2:6);
set(gca,'YTick', 0:300:1200);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:150:1200;
box off
ax.LineWidth = 2;

set(gca,'fontsize',28);

L = legend([h1,h2],'Kinesin-1','Kinesin-2');
L.Box = 'off';
L.Position = [0.58035 0.34047 0.27679 0.1631];

ylabel('Run length (nm)');
xlabel('Force (pN)');


pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('1B_kinRL');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end


%% Dyn FV


clear;clc;close all; format shortG
fprintf('Reg dynein Fs 1.25 and 4.3 FV\n');
cat = 4;        % do not change
kin.num = 0;        
kin.type = 2;kt = kin.type;

dyn.num = 1;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change
dyn.Fs = 1.25; dyn.Fd = 0.87; % do not change

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);

if cat == 1
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
elseif cat == 2
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
elseif cat == 3
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
elseif cat == 4
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/opt2/');
elseif cat == 5
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
end

f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

close all; figure(1); hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on;
h3 = plot(zeros(1,100),linspace(-1000,1200,length(zeros(1,100))),'color','k','linewidth',2);
% h4 = plot(-10:1:10,zeros(length(-10:1:10)),'linew',2','color','k');

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D);
h1 = plot(fliplr(A(a2,1)')', abs(D2 (a2)),'linew',2); % plot dynein FV from -6 to 6pN
h1.MarkerFaceColor = 'w';h1.Color = [0.8 0.2 0.2];  % Dyn 1.25 color
h1.MarkerSize = 10;hold on; axis([-6.3,6.3,0, 250]); hold on

% LOAD DYn 4.3
kin.type = 2;kt = kin.type;
dyn.Fs = 4.3; dyn.Fd = 0.87/1.25*dyn.Fs; % do not change
n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D); hold on;
h2 = plot(fliplr(A(a2,1)')',abs(D2(a2)),'linew',2); % plot kinesin-1 FV from -6 to 6pN
h2.MarkerFaceColor = 'w';h2.Color = [0.6 0.1 0.2];
h2.MarkerSize = 10;hold on; 


set(gca,'XTick', -6:2:6);
set(gca,'YTick', -200:50:1200);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:50/2:250;
box off
ax.LineWidth = 2;
set(gca,'fontsize',28);

L = legend([h1,h2],'Fs = 1.25','Fs= 4.3');
L.Box = 'off';
L.Position = [0.62232 0.60714 0.25982 0.15119];

ylabel('Run length (nm)');
xlabel('Force (pN)');

pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('1D_dynRL');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end




%% Dyn FRL

clear;clc;close all; format shortG
fprintf('Reg dynein Fs 1.25 and 4.3 FRL\n');

cat = 4;        % do not change
kin.num = 0;        
kin.type = 2;kt = kin.type;

dyn.num = 1;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change
dyn.Fs = 4.3; dyn.Fd = 0.87/1.25*dyn.Fs; % do not change

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);

if cat == 1
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
elseif cat == 2
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
elseif cat == 3
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
elseif cat == 4
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/opt2/');
elseif cat == 5
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
end

f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

close all; figure(1); hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on;
h3 = plot(zeros(1,100),linspace(-1000,1200,length(zeros(1,100))),'color','k','linewidth',2);
h4 = plot(-10:1:10,zeros(length(-10:1:10)),'linew',2','color','k');

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D);
h1 = plot(fliplr(A(a2,1)')', (A(a2,2)),'linew',2); % plot dynein FV from -6 to 6pN
h1.MarkerFaceColor = 'w';h1.Color = [0.8 0.2 0.2];  % Dyn 1.25 color
h1.MarkerSize = 10;hold on; axis([-6.3,6.3,-250, 100]); hold on

% LOAD DYn 4.3
kin.type = 2;kt = kin.type;
dyn.Fs = 4.3; dyn.Fd = 0.87/1.25*dyn.Fs; % do not change
n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D); hold on;
h2 = plot(fliplr(A(a2,1)')',(A(a2,2)),'linew',2); % plot kinesin-1 FV from -6 to 6pN
h2.MarkerFaceColor = 'w';h2.Color = [0.6 0.1 0.2];
h2.MarkerSize = 10;hold on; 

set(gca,'XTick', -6:2:6);
set(gca,'YTick', -200:100:1200);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:50:250;
box off
ax.LineWidth = 2;
set(gca,'fontsize',28);

L = legend([h1,h2],'Fs = 1.25','Fs= 4.3');
L.Box = 'off';
L.Position = [0.23125 0.41904 0.25982 0.15119];

ylabel('Velocity (nm/s)');
xlabel('Force (pN)');

pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('1C_dynFV');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end


%% Yildiz dynein FV



clear;clc;close all; format shortG
fprintf('Yildiz dynein Fs 1.25 and 4.3 FV\n');
cat = 4;        % do not change
kin.num = 0;        
kin.type = 2;kt = kin.type;

dyn.num = 1;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change
dyn.Fs = 4.3; dyn.Fd = 0.87/1.25*dyn.Fs; % do not change

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);

if cat == 1
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
elseif cat == 2
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
elseif cat == 3
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
elseif cat == 4
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/opt2/');
elseif cat == 5
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
end

f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

close all; figure(1); hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on;
h3 = plot(zeros(1,100),linspace(-1000,1200,length(zeros(1,100))),'color','k','linewidth',2);
% h4 = plot(-10:1:10,zeros(length(-10:1:10)),'linew',2','color','k');

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D);
h1 = plot(fliplr(A(a2,1)')', abs(D2 (a2)),'linew',2); % plot dynein FV from -6 to 6pN
h1.MarkerFaceColor = 'w';h1.Color = [0.8 0.2 0.2];  % Dyn 1.25 color
h1.MarkerSize = 10;hold on; axis([-6.3,6.3,0, 250]); hold on

% LOAD DYn 4.3
kin.type = 2;kt = kin.type;
dyn.Fs = 4.3; dyn.Fd = 0.87/1.25*dyn.Fs; % do not change
n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
f = fullfile(pathname,n);
f2 = fullfile(f,n2);
load(f2)

a1(1) = find(A == -6); a1(2)=find(A == 6); a2 = a1(1):a1(2); D2 = mean(D); hold on;
h2 = plot(fliplr(A(a2,1)')',abs(D2(a2)),'linew',2); % plot kinesin-1 FV from -6 to 6pN
h2.MarkerFaceColor = 'w';h2.Color = [0.6 0.1 0.2];
h2.MarkerSize = 10;hold on; 


set(gca,'XTick', -6:2:6);
set(gca,'YTick', -200:50:1200);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -6:1:6;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:50/2:250;
box off
ax.LineWidth = 2;
set(gca,'fontsize',28);

L = legend([h1,h2],'Fs = 1.25','Fs= 4.3');
L.Box = 'off';
L.Position = [0.62232 0.60714 0.25982 0.15119];

ylabel('Run length (nm)');
xlabel('Force (pN)');

pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('1D_dynRL');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end





