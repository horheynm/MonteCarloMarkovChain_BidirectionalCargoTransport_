%% Fig for emp kinetic rates.
%  YOu need to run Mac_getEk before running this. 
%Both kin and dyn

%{
Directions:
        a(Fs,Fd) = ek(Fs,Fd).r(1,1); % Kinesin emp kdet
        b(Fs,Fd) = ek(Fs,Fd).r(1,2); % dyn emp kdet
        c(Fs,Fd) = ek(Fs,Fd).r(2,1); % kin kon
        d(Fs,Fd) = ek(Fs,Fd).r(2,2); % dyn kon
%}

clear;close all;clc
kin.num = 1; % --- --- ---  Change this to [1], [2], ..., [10]  --- --- --- ---      
kin.type = 2; % --- --- ---  Change this to [1] or [2]  --- --- --- --- 

dyn.num = 1; % --- --- ---  Change this to [1], [2], ..., [10]  --- --- --- --- 
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change
pathname1 = '/Volumes/Seagate/BiophysPaper2017/data/';

n = '/ek/';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end

n3 = sprintf('%dk%dd%d_ek',kin.num,kin.type,dyn.num);
f2 = fullfile(f,n3);
load (f2)
% - % - % - % - % - % - % - % - % - % - % - % - % - % - % - % - % - % - %

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
if kin.type ==1
    col =cool(length(l));
else
    col = summer(length(l));
end
for ii = 1:length(col)
    co(ii,:) = col(end-ii+1,:);
end
col = co;


c1 = 1;
for ii = l
    h = plot(1:8,a(ii,:),'linew',2,'color',col(ii,:));
    str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
    xlabel('Detachment force (pN)','FontSize',24);
    h.Marker = 's'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
end

if kin.type == 1
    ss = sprintf('Kinesin-1 k_{off}^{Emp} (1/s)');
else
    ss = sprintf('Kinesin-2 k_{off}^{Emp} (1/s)');
end

str2 = fprintf('%d kinesin-%d vs %d Bell-dynein',kin.num,kin.type,dyn.num);
% % % % % title(str2)
if motType ==1
    disp(' ');
    disp(' ');
    disp('FOR KINESIN!!!');
else
    disp(' ');
    disp(' ');
    disp('FOR DYNEIN!!!');
end
    
ylabel(ss,'FontSize',24); % Y-axis
set(gca,'fontsize',24);
L = legend(str); L.Box = 'off'; L.Location = 'NorthEast';


% % if dyn.num >= 1 && kin.type == 1
% %     set(gca,'FontSize',20)
% %     c=columnlegend(2,str,'NorthEast');
% %     c.Position = [0.29143 0.48134 0.30357 0.40357];
% % elseif  kin.type == 4 && dyn.num == 1
% %     set(gca,'fontsize',18)
% %     c=columnlegend(2,str,'NorthEast');
% %     c.Position = [0.27893 0.43849 0.50357 0.45119];
% % elseif kin.type == 4 && dyn.num > 1
% %     set(gca,'fontsize',18)
% %     c=columnlegend(2,str,'NorthEast');
% %     
% %     c.Position = [0.27714 -0.0043671 0.50357 0.45119];
% % else
% %     c.Position = [0.5 0.55 0.3 0.31];
% % end

hold off
% set(gca,'FontSize',24);
set(gca,'XTick', 0:1:8);
set(gca,'YTick', 0:2:12);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:1:12;
box off
axis([0.8,8.2,0,12])
ax.LineWidth = 2;
axis square

pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
if kin.type == 1
nam = sprintf('4A_kdetk%d',kin.type);
else
    nam = sprintf('4B_kdetk%d',kin.type);

end
name1 = sprintf('%s%s',nam);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
i=input('save? ');
if i == 1
%     exportfig(gcf,fullFileName1,'Color','rgb');
    print(fullFileName1,'-r900','-depsc')
end

%%
% Dynein 
clear;close all;clc

% THESE VALUES FROM kin.num TO dyn.catch SHOULD HAVE THE SAME VALUES AS
% ABOVE!!

kin.num = 1; % --- --- ---  Change this to [1], [2], ..., [10]  --- --- --- ---      
kin.type = 2; % --- --- ---  Change this to [1] or [2]  --- --- --- --- 

dyn.num = 1; % --- --- ---  Change this to [1], [2], ..., [10]  --- --- --- --- 
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change

pathname1 = '/Volumes/Seagate/BiophysPaper2017/data/';

n = '/ek/';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end

n3 = sprintf('%dk%dd%d_ek',kin.num,kin.type,dyn.num);
f2 = fullfile(f,n3);
load (f2)
% - % - % - % - % - % - % - % - % - % - % - % - % - % - % - % - % - % - %


close;figure(1);
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

hold on; str = [];
% l = [1,2,4,8];
l = 1:8;
% col=hsv(length(l));

legend_num = 8; motType = 2;
[col] = kincolor64dyn(kin,legend_num,motType);

c1 = 1;
for ii = l
    h = plot(1:8,b(ii,:),'linew',2,'color',col(ii,:));
    str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
    xlabel('Detachment force (pN)','FontSize',24);
    h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
end

if kin.type == 1 && motType == 1
    ss = sprintf('Kinesin-1 k_{off}^{Emp} (s^{-1})');
elseif kin.type == 2 && motType == 1
    ss = sprintf('Kinesin-2 k_{off}^{Emp} (s^{-1})');
else
    ss = sprintf('Dynein k_{off}^{Emp} (s^{-1})');
end

str2 = fprintf('%d kinesin-%d vs %d Bell-dynein',kin.num,kin.type,dyn.num);
if motType ==1
    disp(' ');
    disp(' ');
    disp('FOR KINESIN!!!');
else
    disp(' ');
    disp(' ');
    disp('FOR DYNEIN!!!');
end
    
    
% title(str2)
ylabel(ss,'FontSize',24); % Y-axis
set(gca,'fontsize',24);
L = legend(str); L.Box = 'off'; L.Location = 'NorthEast';


% % if dyn.num >= 1 && kin.type == 1
% %     set(gca,'FontSize',20)
% %     c=columnlegend(2,str,'NorthEast');
% %     c.Position = [0.29143 0.48134 0.30357 0.40357];
% % elseif  kin.type == 4 && dyn.num == 1
% %     set(gca,'fontsize',18)
% %     c=columnlegend(2,str,'NorthEast');
% %     c.Position = [0.27893 0.43849 0.50357 0.45119];
% % elseif kin.type == 4 && dyn.num > 1
% %     set(gca,'fontsize',18)
% %     c=columnlegend(2,str,'NorthEast');
% %     
% %     c.Position = [0.27714 -0.0043671 0.50357 0.45119];
% % else
% %     c.Position = [0.5 0.55 0.3 0.31];
% % end

hold off
set(gca,'FontSize',24);
set(gca,'XTick', 0:1:8);
set(gca,'YTick', 0:2:12);

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = -0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = 0:1:12;
box off
axis([0.8,8.2,0,12])
ax.LineWidth = 2;
axis square


pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';


pathname1 = '/Volumes/Seagate/BiophysPaper2017/Figures/';
n = '//';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end
if kin.type == 1
    nam = sprintf('4C_kdetk%d',kin.type);
else
    nam = sprintf('4D_kdetk%d',kin.type);
end
name1 = sprintf('%s%s',nam);
endname1 = sprintf('%s%s',nam);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname1,n,baseFileName1);

i=input('save? ');
if i == 1
    print(fullFileName1,'-r900','-depsc')
end



