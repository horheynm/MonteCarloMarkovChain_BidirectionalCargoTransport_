%% CargoVel vs Fd/Fs (Uses Emp)
%{
Get:    Fd| 1k1d10, 1k2d7:10; 2:3k1:2d1:10
        Fs| same as above
%}
clear;clc;close all

format shortG
kin.num = 1;
kin.type = 1;
dyn.num = 7;
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
tic
for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
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
        a(Fs,Fd) = A(1,5);
        
        fprintf('Fs=%d,Fd=%d,%1.2f\n',Fs,Fd,toc)
    end
    
end
%%

for chooseFd = [1,0]
    close;
    figure(1);
    set(gcf,'PaperUnits','inches');
    set(gcf,'PaperSize', [10 10]);
    set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
    set(gcf,'PaperPositionMode','auto');
    set(gcf,'color','w');
    
    hold on; str = [];
    % l = [1,2,4,8];
    l = 1:8;
    col=hsv(length(l));c1 = 1;
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
    c.FontSize = 6;
    
    pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
    
    if chooseFd == 1
        nam = 'F2_CvVSFd';
    else
        nam = 'F2_CvVSFs';
    end
    name1 = sprintf('%s%s',nam,n2);
    baseFileName1 = sprintf(name1);
    fullFileName1 = fullfile(pathname,baseFileName1);
    
    i=input('save? ');
    if i == 1
        print(fullFileName1,'-r900','-depsc')
    end
end
