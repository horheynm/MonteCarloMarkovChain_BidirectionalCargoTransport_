%% Deff vs Fd/Fs
% kin1
%{
Get:    Fd| 1k1d10, 1k2d8:10; 2:2k1:2
        Fs| same as above
%}

clear;clc;close all

format shortG
kin.num = 1;
kin.type = 1;
dyn.num = 0;
v = struct; ek = struct;
co=0;

if kin.type == 1
    n = sprintf('%dk1d%d',kin.num,dyn.num);
    n2 = sprintf('_%dk1d%d.eps',kin.num,dyn.num);
    n3 = sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
else
    n = sprintf('%dk2d%d',kin.num,dyn.num);
    n2 = sprintf('_%dk2d%d.eps',kin.num,dyn.num);
    n3 = sprintf('%d kinesin-2 vs %d dynein',kin.num,dyn.num);
end
d = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\diff\';

for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
        if kin.type == 1
            name3 = sprintf('%1.0fk1_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
            %             dname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\diff\1k1d1\';
        else
            name3 = sprintf('%1.0fk2_%1.0fd_Fs=%2.0f_Fd=%2.0f',kin.num,dyn.num,dyn.Fs*100,dyn.Fd*100);
            %             dname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\diff\1k2d3';
        end
        
        file = name3;
        dname = fullfile(d,n);
        fname = fullfile(dname,file);
        load(fname);
        
        dif(Fd) = A(2,6); % get std of RL;
        Deff(Fs,Fd) = dif(Fd);%^2 / (2*5); % var(RL) / (2*t); t=5s = [nm^2/s
        
    end
end
%%
for chooseFd = [0]
    close;
    figure(1); close
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
        if chooseFd == 1 % f(Fd)
            h = plot(1:8,Deff(ii,:),'linew',2,'color',col(c1,:));
            str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
        else
            aa = Deff';
            h = plot(1:8,aa(ii,:),'linew',2,'color',col(c1,:));
            str{c1} = sprintf('Fd = %d',ii); c1=c1+1;
        end
        h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
    end
    
    if chooseFd == 1
        xlabel('Detachment force (pN)');
    else
        xlabel('Stall force (pN)');
    end
    
    ylabel(ss);
    title(n3);
    if chooseFd == 0 && kin.type ==4 && (dyn.num ==2 || dyn.num == 3)
        set(gca,'fontsize',12); co = 1;
    elseif chooseFd ==0 && kin.type ==1 && (dyn.num ==3 )
        set(gca,'fontsize',15); co = 1;
    else
        set(gca,'fontsize',18)
    end
    if kin.type == 1 && ( dyn.num > 3)
        set(gca,'fontsize',12);        
        c=columnlegend(3,str,'NorthEast');
        co=2;
    else
        c=columnlegend(2,str,'NorthEast');
    end
    if kin.type == 1 || kin.type == 4 && dyn.num == 1 && kin.num == 1
        c.Position = [0.3 -0.04 0.5 0.51];
    elseif kin.type == 1 && dyn.num == 2 && kin.num == 1
        c.Position = [0.3 -0.04 0.5 0.51];
    elseif kin.type == 1 || kin.type == 4 && kin.num == 1
        c.Position = [0.38429      0.34087      0.40357      0.55119];
    end
    if co == 1 && kin.type == 4
        c.Position = [0.38429      0.58      0.45      0.33];
        set(gca,'fontsize',18);
    elseif co == 1&&kin.type ==1
        c.Position = [0.29643, -0.099524,0.5,0.51];
    end
    if co==2 && dyn.num == 4
        c.Position = [0.24465, -0.14, 0.5, 0.51];
    else
        c.Position = [0.25894,0.40524, 0.5, 0.51];
        set(gca,'fontsize',18)
    end
    
    hold off
    set(gca,'XTick', 0:2:8);
    set(gca,'YTick', 0:100:500);
    box off
    
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = -0:1:8;
    ax.YAxis.MinorTick = 'on';
    ax.YAxis.MinorTickValues = -0:50:max(get(gca,'ylim'));
    box off
    axis([0.8,8.2,0,500])
    ax.LineWidth = 2;
    axis square
    c.FontSize = 6;        set(gca,'fontsize',18)
    
    pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
    if chooseFd == 1
        nam = 'F2_DeffVSFd';
    else
        nam = 'F2_DeffVSFs';
    end
    name1 = sprintf('%s%s',nam,n2);
    
    baseFileName1 = sprintf(name1);
    fullFileName1 = fullfile(pathname,baseFileName1);
    
    i=input('save? ');
    if i == 1
        print(fullFileName1,'-r900','-depsc')
    end
end