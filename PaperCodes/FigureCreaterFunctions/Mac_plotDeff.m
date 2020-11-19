
%% D_eff vs Fd

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

cat = 2;        % do not change
kin.num = 1;        
kin.type = 1;

dyn.num = 1;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change

c=1; 
 
tic
for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
        if kin.type == 4
            kin.type =2;
        end
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
        load(f2)
        
        v(Fs,Fd) = A(2,6);
        
        fprintf('Fs=%d,Fd=%d, %1.0fmin %2.0fs,',Fs,Fd,floor(toc/60),rem(toc,60));
        cl = clock;
        fprintf('        %d:%d;%2.0f\n',cl(4),cl(5),cl(6));
        
    end
end

close;figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on; str = [];
% l = [1,2,4,8];
l = 1:8;

legend_num = length(l); motType =1; % choose kinesin for plot
% [col] = kincolor64dyn(kin,legend_num,motType);
col = hsv(length(l));
c1 = 1;
for ii = l
    h = plot(1:8,v(ii,:),'linew',2,'color',col(ii,:));
    str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
    xlabel('Detachment force (pN)','FontSize',24);
    h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
end
str2 = fprintf('%d kinesin-%d vs %d Bell-dynein\n',kin.num,kin.type,dyn.num);

ylabel('D_{eff} (nm^2/s)','FontSize',24); % Y-axis
set(gca,'fontsize',24);
L = legend(str); L.Box = 'off'; L.Location = 'NorthEast';
hold off
% set(gca,'FontSize',24);
set(gca,'XTick', 0:1:8);
set(gca,'YTick', 0:200:1200);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:100:1200;
box off
axis([0.8,8.2,0,1200])
ax.LineWidth = 2;
axis square


pathname1 = '/Volumes/Seagate/BiophysPaper2017/figs/';
n = '/DeffvsFd/';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
nam = sprintf('%dk%dd%d',kin.num,kin.type,dyn.num);
name1 = sprintf('%s%s',nam);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('Enter "1" to save figure \n');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end




%%
