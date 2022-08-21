%% kin1,dyn empirical det/attach rate vs Fd

% kd emp vs Fd

clear;clc;close all

format shortG
kin.num = 1;
kin.type = 1;
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
        a(Fs,Fd) = ek(Fd).r(2,1); % Kinesin emp kon
        b(Fs,Fd) = ek(Fd).r(2,2); % dyn emp kon
        
        fprintf('Fs=%d,Fd=%d, %1.0fmin %2.0fs\n',Fs,Fd,floor(toc/60),rem(toc,60))
        
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
            xlabel('Detachment force (pN)','FontSize',24);
        else
            aa = a';
            h = plot(1:8,aa(ii,:),'linew',2,'color',col(c1,:));
            str{c1} = sprintf('Fd = %d',ii); c1=c1+1;
            xlabel('Stall force (pN)','FontSize',24);
        end
        h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
    end
    
    if kin.type == 1
        ss = sprintf('Kinesin-1 k_{on}^{Emp} (1/s)');
    else
        ss = sprintf('Kinesin-2 k_{on}^{Emp} (1/s)');
    end
    
    ylabel(ss,'FontSize',24); % Y-axis
    title(n3)
    
    if dyn.num >= 1 && kin.type == 1
        set(gca,'fontsize',18)
        c=columnlegend(2,str,'NorthEast');
        c.Position = [0.27893 0.43849 0.50357 0.45119];
    elseif  kin.type == 4 && dyn.num == 1
        set(gca,'fontsize',18)
        c=columnlegend(2,str,'NorthEast');
        c.Position = [0.27893 0.43849 0.50357 0.45119];
    elseif kin.type == 4 && dyn.num > 1
        set(gca,'fontsize',18)
        c=columnlegend(2,str,'NorthEast');
        
        c.Position = [0.27714 -0.0043671 0.50357 0.45119];
    else
        c.Position = [0.5 0.55 0.3 0.31];
    end
    
    % c.Location = 'NorthWest';
    % ax = legend(str);
    % ax.Box = 'off';
    % clear ax
    hold off
    set(gca,'FontSize',20);
    set(gca,'XTick', 0:2:8);
    set(gca,'YTick', 0:4:12);
    
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = -0:1:8;
    ax.YAxis.MinorTick = 'on';
    ax.YAxis.MinorTickValues = 0:2:10;
    box off
    axis([0.8,8.2,0,12])
    ax.LineWidth = 2;
    axis square
    c.FontSize = 6;
    
    
    % s=sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
    % title(s)
    
    pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
    
    if chooseFd == 1
        nam = 'F2_kEmpVSFd';
    else
        nam = 'F2_kEmpVSFs';
    end
    name1 = sprintf('%s%s',nam,n2);
    baseFileName1 = sprintf(name1);
    fullFileName1 = fullfile(pathname,baseFileName1);
    
    i=input('save? ');
    if i == 1
        print(fullFileName1,'-r900','-depsc')
    end
    
end
%% Dynein koff EMp

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
            h = plot(1:8,b(ii,:),'linew',2,'color',col(c1,:));
            str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
            xlabel('Detachment force (pN)','FontSize',24);
            
        else
            bb = b';
            h = plot(1:8,bb(ii,:),'linew',2,'color',col(c1,:));
            str{c1} = sprintf('Fs = %d',ii); c1=c1+1;
            xlabel('Stall force (pN)','FontSize',24);
            
        end
        
        h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
    end
    
    xlabel('Detachment force (pN)','FontSize',24);
    
    ss=sprintf('Dynein k_{on}^{Emp} (1/s)');
    
    ylabel(ss,'FontSize',24); % Y-axis
    title(n3)
    
    if dyn.num >= 1
        set(gca,'fontsize',18)
        c=columnlegend(2,str,'NorthEast');
        c.Position = [0.35393 0.48849 0.4357 0.4119];
    else
        c.Position = [0.5 0.55 0.3 0.31];
    end
    
    % c.Location = 'NorthWest';
    % ax = legend(str);
    % ax.Box = 'off';
    % clear ax
    hold off
    set(gca,'FontSize',20);
    set(gca,'XTick', 0:2:8);
    set(gca,'YTick', 0:4:12);
    
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = -0:1:8;
    ax.YAxis.MinorTick = 'on';
    ax.YAxis.MinorTickValues = 0:2:10;
    box off
    axis([0.8,8.2,0,12])
    ax.LineWidth = 2;
    axis square
    c.FontSize = 6;
    
    % s=sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
    % title(s)
    
    pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
    
    if chooseFd == 1
        nam = 'F2_dEmpVSFd';
    else
        nam = 'F2_dEmpVSFs';
    end
    name1 = sprintf('%s%s',nam,n2);
    baseFileName1 = sprintf(name1);
    fullFileName1 = fullfile(pathname,baseFileName1);
    
    i=input('save? ');
    if i == 1
        print(fullFileName1,'-r900','-depsc')
    end
end








