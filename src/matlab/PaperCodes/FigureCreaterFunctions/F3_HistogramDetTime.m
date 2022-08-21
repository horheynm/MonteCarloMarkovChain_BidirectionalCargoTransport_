% F2_empirical kinetics
% 1k1 1:10d, kin kd

% 1k1d0
clear;clc;close all
hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

format shortG
kin.num = 1; kin.type = 1;
dyn.num = 1;
v = struct; ek = struct;


if kin.type == 1
    n = sprintf('%dk1d%d',kin.num,dyn.num);
    n2 = sprintf('_%dk1d%d.eps',kin.num,dyn.num);
    n3 = sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
else 
    n = sprintf('%dk2d%d',kin.num,dyn.num);
    n2 = sprintf('_%dk2d%d.eps',kin.num,dyn.num);
    n3 = sprintf('%d kinesin-2 vs %d dynein',kin.num,dyn.num);
end
d = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\';


for Fs = 1
    dyn.Fs = Fs;
    for Fd = 1
        dyn.Fd = Fd;
        if kin.type == 1
            name3 = sprintf('%1.0fk1_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
%             dname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k1d1\';
        else
            name3 = sprintf('%1.0fk2_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
%             dname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\1k2d1';
        end
        
        file = name3;
        dname = fullfile(d,n);
        fname = fullfile(dname,file);
        load(fname);
        
        v(Fd).mv = A(1,5);
        v(Fd).mrl = A(2,5);
        [v,ek] = emptomatrix3(Fd,v,emp,ek);
        
    end
end

%% Kin1/2 kdet emp historgram

close; figure(2);clf
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w'); axis square
h=histogram(v(Fd).kd(:,2),20); hold on
clear h; set(gca,'FontSize',14)

x=get(gca,'YLim');
c = get(gca,'ColorOrder');
h = plot(mean(v(Fd).kd(:,2))*ones(1,length(0:1:x(2))),0:1:x(2),'linew',2,'color',c(2,:));
str = sprintf('Mean(t) = %1.4fs',mean(v(Fd).kd(:,2)));

str2 = sprintf('k_{det}^{emp} = %1.4f s^{-1}',1/mean(v(Fd).kd(:,2)));
l1 = get(gca,'XLim'); l2 = get(gca,'YLim');
str3 = sprintf('Std(t) = %1.4fs',std(v(Fd).kd(:,2)));
str4 = sprintf('n = %d',numel(v(Fd).kd(:,2)));

for ii = 1:3
    h1(ii) = plot(l1(2),l2(2),'w','Marker','o','MarkerFaceColor','w');
end

strt = {str,str3,str2,str4};
L=legend([h,h1(1),h1(2),h1(3)],strt);
L.Box = 'off'; L.Location = 'NorthEast';

if kin.type == 1
    ss = sprintf('Kinesin-1 frequency');
else
    ss = sprintf('Kinesin-2 frequency');
end

xlabel('Time (s)'); ylabel(ss); title(n3); axis square
axis([get(gca,'XLim'),get(gca,'YLim')])

nam = 'F2_KinKdetHIST';
pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
name1 = sprintf('%s%s',nam,n2);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
input('');
print(fullFileName1,'-r900','-depsc')


%% Dynein kdet emp historgram
close; figure(2);clf
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w'); axis square
h=histogram(v(Fd).dd(:,2),20); hold on
clear h; set(gca,'FontSize',14)

x=get(gca,'YLim');
c = get(gca,'ColorOrder');
h = plot(mean(v(Fd).kd(:,2))*ones(1,length(0:1:x(2))),0:1:x(2),'linew',2,'color',c(2,:));
str = sprintf('Mean(t) = %1.4fs',mean(v(Fd).kd(:,2)));

str2 = sprintf('k_{det}^{emp} = %1.4f s^{-1}',1/mean(v(Fd).kd(:,2)));
l1 = get(gca,'XLim'); l2 = get(gca,'YLim');
str3 = sprintf('Std(t) = %1.4fs',std(v(Fd).kd(:,2)));
str4 = sprintf('n = %d',numel(v(Fd).kd(:,2)));

for ii = 1:3
    h1(ii) = plot(l1(2),l2(2),'w','Marker','o','MarkerFaceColor','w');
end

strt = {str,str3,str2,str4};
L=legend([h,h1(1),h1(2),h1(3)],strt);
L.Box = 'off'; L.Location = 'NorthEast';


ss = sprintf('Dynein frequency');


xlabel('Time (s)'); ylabel(ss); title(n3); axis square;
axis([get(gca,'XLim'),get(gca,'YLim')])



pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';

nam = 'F2_DynKdetHIST';
name1 = sprintf('%s%s',nam,n2);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);


input('');
print(fullFileName1,'-r900','-depsc')

