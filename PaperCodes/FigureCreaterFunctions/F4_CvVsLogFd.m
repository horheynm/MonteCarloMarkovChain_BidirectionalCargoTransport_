%% Test40 Log(Fd)

clear;clc;close all

format shortG
cat = 5;
kin.num = 1;
kin.type = 1;
dyn.num =1;
dyn.Fs = 4.3;
dyn.type = 2;
x = [1,3,10,20,30,50,100];
% figure(1);clf;
% set(gcf,'PaperUnits','inches');
% set(gcf,'PaperSize', [10 10]);
% set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
% set(gcf,'PaperPositionMode','auto');hold on
% hold on;

tic
for d2 = 0 %[0,1]
    dyn.catch = d2;c1=0;
    for kk = [1,4]
        kin.type = kk;
        c1=c1+1;c2=1;
        if kin.type == 1
            kt = 1;
        else
            kt = 2;
        end
        
        for Fd = x
            dyn.Fd = Fd;
            n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
            n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kt,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
            pathname = fileparts('W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\kinvsdyn\');
            f = fullfile(pathname,n);
            f2 = fullfile(f,n2);
            load(f2)
            
            v(c1,c2) =  A(1,5);
            c2 = c2 + 1;
        end
        
    end
%     figure(1); clf;hold on;
%%
close    

h1 = semilogx(x,v(1,:),'linew',2);
    h1.MarkerFaceColor = 'w';
    h1.Marker = 'o';
    h1.Color = [0,0.447,0.741];
    h1.MarkerSize = 8;hold on
    
    xl = get(gca,'XLim');
    h2 = semilogx(x,v(2,:),'linew',2);
    h2.MarkerFaceColor = [0.1 0.8 0.1];
    h2.Marker = '^';
    h2.Color = [0.1 0.5 0.1];
    h2.MarkerSize = 8;
    set(gcf,'PaperUnits','inches');
    set(gcf,'PaperSize', [10 10]);
    set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
    set(gcf,'PaperPositionMode','auto');hold on
    axis square
    h3 = semilogx(xl(1):xl(2),zeros(1,length(xl(1):xl(2))),'linew',2,'color','k');
hold on;
    




xlabel('Number of dynein','FontSize',24);
ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
% set(gcf,'color','w');

% s1 = sprintf('%d kinesin-1',kin.num);
% s2 =  sprintf('%d kinesin-2',kin.num);
s1 = 'One kinesin-1';
s2 = 'Two kinesin-2';

L = legend([h1,h2],s1,s2);
L.Box = 'off';
L.FontSize = 18;ax = gca;
ax.LineWidth = 2;
ax.FontSize = 18;
set(gca,'XTick', [1,3,10,20,30,50,100]);
set(gca,'YTick', -200:200:800);
axis([0,110,-300,800])
box off

% box off
% ax = gca;
% ax.XAxis.MinorTick = 'on';
% ax.XAxis.MinorTickValues = -0:1:8;
ax.YAxis.MinorTick = 'on';
ax.YAxis.MinorTickValues = -200:100:800;
% box off



    
pathname = 'W:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
n2 = sprintf('_%dkd%d.eps',kin.num,dyn.num);
nam = sprintf('F3_CvVSNdync%d',dyn.catch);

name1 = sprintf('%s%s',nam,n2);
baseFileName1 = sprintf(name1);
fullFileName1 = fullfile(pathname,baseFileName1);
print(fullFileName1,'-r900','-depsc')


end

