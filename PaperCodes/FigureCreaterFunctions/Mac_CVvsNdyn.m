
%% Cargo vel vs Ndyn or N_kin

%{ 
Directions:
 Run the code with fixed codes below
cat = 5;
kin.num = 1;
dyn.Fd = 0.87*dyn.Fs / 1.25;
dyn.type = 1;

 For the codes below, change the variables to a, b, labled as [a], [b]
dyn.Fs = [1,25] or [4.3]
dyn.catch = [0] or [1]

SO IN TOTAL, YOU SHOULD GET FOUR FIGURES. 
%}


clear;clc;close all; format shortG

cat = 5; % DO NOT CHANGE
kin.num = 1; % DO NOT CHANGE

dyn.Fs = 1.25; % -- - -- --Change, either to [1.25] or [4.3] -- - - - ---- ---
dyn.Fd = 0.87*dyn.Fs/1.25; 
dyn.type = 1; % DO NOT CHANGE
dyn.catch = 0;%--- --- ----  change, either to [0] or [1] --- --- --- --- 

c=1; c2=1; N = 0:10;
for kt = 1:2
    kin.type = kt;
for mn = N % Motor Numbers

    dyn.num = mn; % dyn.num = or kin.num = 
    n = sprintf('%dk%dd%dt%dc%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch);
    n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
    
    if cat == 1
        pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
    elseif cat == 2
        pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
    elseif cat == 3
        pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
    elseif cat == 4
        pathname = fileparts('/Users/kazu/Desktop/export/data/n/');
    elseif cat == 5
        pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
    end
    
    f = fullfile(pathname,n);
    f2 = fullfile(f,n2);
    load(f2,'A')
    V(c2,c) = A(1,5);
    c=c+1;
end
c2 = c2+1; 
c=1;
end

fprintf('Fd: %1.2f, Fs: %1.2f\n',dyn.Fd, dyn.Fs);

set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');hold on

xl = get(gca,'XLim'); axi = -0.4:0.1:10.4;
h3 = plot(axi,zeros(1,length(axi)),'linew',2,'color','k');

h1 = plot(N,V(1,:),'linew',2);
h1.MarkerFaceColor = 'w';
h1.Marker = 'o';
h1.Color = [0,0.447,0.741];
h1.MarkerSize = 10;hold on

h2 = plot(N,V(2,:),'linew',2);
h2.MarkerFaceColor = [0.1 0.8 0.1];
h2.Marker = '^';
h2.Color = [0.1 0.5 0.1];
h2.MarkerSize = 10;

axis square;
axis([-0.4,10.4,-200,800])

L = legend([h1,h2],'One kinesin-1','One kinesin-2');
L.Box = 'off';
L.FontSize = 20;
xlabel('Dynein population')
ylabel('Cargo velocity (nm/s)');


ax = gca;
ax.FontSize = 24;
ax.LineWidth = 2;
ax.XTick = 0:2:10;
ax.YTick = -200:200:800;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:101;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;

if dyn.Fs == 1.25 && dyn.catch == 0
    nam = 'CvVSNdyn125Reg';
elseif dyn.Fs == 4.3 && dyn.catch == 0
    nam = 'CvVSNdyn430Reg';
elseif dyn.Fs == 1.25 && dyn.catch == 1
    nam = 'CvVSNdyn125Catch';
elseif dyn.Fs == 4.3 && dyn.catch == 1
    nam = 'CvVSNdyn430Catch';
end

pathname1 = '/Volumes/Seagate/BiophysPaper2017/figs/';
n = '/CVvsNdyn/';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end

name1 = sprintf('%s%s',nam,n2);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('save? If yes, type in "1" and enter ');
if i == 1
    exportfig(gcf,fullFileName1,'Color','rgb')
end

