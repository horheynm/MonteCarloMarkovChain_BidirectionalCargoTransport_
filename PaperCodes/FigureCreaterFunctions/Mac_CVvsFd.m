
%% Cargo vel vs Fd

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

cat = 1; % DO NOT CHANGE
kin.num = 1;
kin.type = 1;

dyn.num = 1;
dyn.type = 1;
dyn.catch = 0; % DO NOT CHANGE
v = struct; ek = struct;

tic
for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
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
        load(f2);
        v(Fd).mv = A(1,5);
        v(Fd).mrl = A(2,5);
        %          [v,ek] = emptomatrix3(Fd,v,emp,ek);
        a(Fs,Fd) = A(1,5);
        fprintf('Fs=%d,Fd=%d,%1.2fs\n',Fs,Fd,toc)
    end
end
%%
close;
figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

if kin.type == 1
    n3 = sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
else
    n3 = sprintf('%d kinesin-2 vs %d dynein',kin.num,dyn.num);
end

chooseFd = 1;
hold on; str = [];
% l = [1,2,4,8];
l = 1:8;
% col=hsv(length(l));

legend_num = length(l); motType =1; % choose kinesin for plot
% [col] = kincolor64dyn(kin,legend_num,motType);
col = cool(length(l));
for ii = 1:length(col)
    co(ii,:) = col(end-ii+1,:);
end
col = co;

c1 = 1;

for ii = l
    if chooseFd == 1
        h = plot(1:8,a(ii,:),'linew',2,'color',col(c1,:));
        str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
    else
        aa = a';
        h = plot(1:8,aa(ii,:),'linew',2,'color',col(c1,:));
        str{c1} = sprintf('Fd = %d',ii); c1=c1+1;
    end
    
    h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
end

if chooseFd == 1
    xlabel('Detachment force (pN)','FontSize',24);
else
    xlabel('Stall force (pN)','FontSize',24);
end

ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
title(n3)
set(gca,'Linew',2);
set(gca,'FontSize',12);
if kin.num == 1 && kin.type == 1 && dyn.num == 1
    set(gca,'fontsize',16);
    c=columnlegend(3,str);
    c.Position = [0.24464 -0.067263 0.55 0.40833];
elseif kin.num == 1 && kin.type == 1 && dyn.num == 2
    set(gca,'fontsize',16);
    c=columnlegend(3,str);
    c.Position = [0.24107 0.41131 0.58 0.50833];
else
    set(gca,'fontsize',18);
    c=columnlegend(2,str);
    c.Position = [0.26964 0.38988 0.5 0.50833];
end

hold off

set(gca,'XTick', 0:2:8);
set(gca,'YTick', -200:200:800);
box off

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;
box off
axis([0.8,8.2,-220,800])
ax.LineWidth = 2;
axis square
set(gca,'FontSize',30);
c.FontSize = 6;

pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('3B_kin1CVvsFd');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end


%%

clear;clc;close all; format shortG

cat = 1; % DO NOT CHANGE
kin.num = 1;
kin.type = 2;

dyn.num = 1;
dyn.type = 1;
dyn.catch = 0; % DO NOT CHANGE
v = struct; ek = struct;

tic
for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
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
        load(f2);
        v(Fd).mv = A(1,5);
        v(Fd).mrl = A(2,5);
        %          [v,ek] = emptomatrix3(Fd,v,emp,ek);
        a(Fs,Fd) = A(1,5);
        fprintf('Fs=%d,Fd=%d,%1.2fs\n',Fs,Fd,toc)
    end
end
%%
close;
figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

if kin.type == 1
    n3 = sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
else
    n3 = sprintf('%d kinesin-2 vs %d dynein',kin.num,dyn.num);
end

chooseFd = 1;
hold on; str = [];
% l = [1,2,4,8];
l = 1:8;
% col=hsv(length(l));

legend_num = length(l); motType =1; % choose kinesin for plot
% [col] = kincolor64dyn(kin,legend_num,motType);
col = summer(length(l));
for ii = 1:length(col)
    co(ii,:) = col(end-ii+1,:);
end
col = co;

c1 = 1;

for ii = l
    if chooseFd == 1
        h = plot(1:8,a(ii,:),'linew',2,'color',col(c1,:));
        str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
    else
        aa = a';
        h = plot(1:8,aa(ii,:),'linew',2,'color',col(c1,:));
        str{c1} = sprintf('Fd = %d',ii); c1=c1+1;
    end
    
    h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
end

if chooseFd == 1
    xlabel('Detachment force (pN)','FontSize',24);
else
    xlabel('Stall force (pN)','FontSize',24);
end

ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
title(n3)
set(gca,'Linew',2);
set(gca,'FontSize',12);
if kin.num == 1 && kin.type == 1 && dyn.num == 1
    set(gca,'fontsize',16);
    c=columnlegend(3,str);
    c.Position = [0.24464 -0.067263 0.55 0.40833];
elseif kin.num == 1 && kin.type == 1 && dyn.num == 2
    set(gca,'fontsize',16);
    c=columnlegend(3,str);
    c.Position = [0.24107 0.41131 0.58 0.50833];
else
    set(gca,'fontsize',18);
    c=columnlegend(2,str);
    c.Position = [0.26964 0.38988 0.5 0.50833];
end

hold off

set(gca,'XTick', 0:2:8);
set(gca,'YTick', -200:200:800);
box off

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;
box off
axis([0.8,8.2,-220,800])
ax.LineWidth = 2;
axis square
set(gca,'FontSize',30);
c.FontSize = 6;

pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('3B_kin1CVvsFd');
baseFileName1 = sprintf(nam);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end

%%
clear;clc;close all; format shortG

cat = 1; % DO NOT CHANGE
kin.num = 1;
kin.type = 2;

dyn.num = 1;
dyn.type = 1;
dyn.catch = 0; % DO NOT CHANGE
v = struct; ek = struct;

tic
for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
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
        load(f2);
        v(Fd).mv = A(1,5);
        v(Fd).mrl = A(2,5);
        %          [v,ek] = emptomatrix3(Fd,v,emp,ek);
        a(Fs,Fd) = A(1,5);
        fprintf('Fs=%d,Fd=%d,%1.2fs\n',Fs,Fd,toc)
    end
end