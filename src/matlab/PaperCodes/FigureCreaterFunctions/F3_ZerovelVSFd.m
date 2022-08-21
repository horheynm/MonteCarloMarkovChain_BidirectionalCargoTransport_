%% ZeroVel vs Fd/Fs (Uses Emp)
%{
Get:    Fd| 1k1d10, 1k2d7:10; 2:3k1:2d1:10
        Fs| same as above
%}
clear;clc;close all

format shortG
kin.num = 1;
kin.type = 4;
v = struct; ek = struct;

d = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp2\';
tic

for Fs = 1.25
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
        for dd = 1:10
            dyn.num = dd;
            if kin.type == 1
                n = sprintf('%dk1d%d',kin.num,dyn.num);
                n2 = sprintf('_%dk1d%d.eps',kin.num,dyn.num);
                n3 = sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
            else
                n = sprintf('%dk2d%d',kin.num,dyn.num);
                n2 = sprintf('_%dk2d%d.eps',kin.num,dyn.num);
                n3 = sprintf('%d kinesin-2 vs %d dynein',kin.num,dyn.num);
            end
            
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
            v2(dd) =A(1,5);
        end
        c1 = 0;c2 = 1;
        while c1 == 0
            if sign(v2(c2)) == sign(v2(c2+1))
                sol = 0;
            else
                aa = c2:c2+1;
                m = v2(aa(2)) - v2(aa(1)); % y=mx+b
                b = v2(aa(2)) - m*aa(2);
                sol = -b/m;
                c1 = 1;
            end
            if c2 == length(v2)-1
                c1 = 1;
            end
            c2 = c2 + 1;
        end
        if sol == 0
            sol = 10;
        end
        
        % %         v(Fd).mv = A(1,5);
        % %         v(Fd).mrl = A(2,5);
        % %         [v,ek] = emptomatrix3(Fd,v,emp,ek);
        a.zv(Fs,Fd) = sol;
        sol = [];
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
            h = plot(1:8,a.zv(ii,:),'linew',2,'color',col(c1,:)); %a.zv(Fs,Fd)
            str{c1} = sprintf('Fs = %d',ii);
        else
            aa = a.zv;
            h = plot(1:8,aa(:,ii),'linew',2,'color',col(c1,:));
            str{c1} = sprintf('Fd = %d',ii);
        end
         c1=c1+1;
        h.Marker = 'o'; h.MarkerFaceColor = 'w'; h.MarkerSize = 8;
    end
    
    if chooseFd == 1
        xlabel('Detachment force (pN)','FontSize',24);
    else
        xlabel('Stall force (pN)','FontSize',24);
    end
    
    ylabel('N_{dyn}^{offset}','FontSize',24); % Y-axis
    if kin.type ==1
        sa = sprintf('%d kinesin-1',kin.num);
    else
        sa = sprintf('%d kinesin-2',kin.num);
    end
%     title(sa)
    set(gca,'fontsize',18);
    c=columnlegend(2,str);
    c.Position = [0.325 0.38988 0.5 0.50833];
    
    hold off
    set(gca,'XTick', 0:2:8);
    set(gca,'YTick', 0:2:10);
    box off
    
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = -0:1:8;
    ax.YAxis.MinorTick = 'on';
    ax.YAxis.MinorTickValues = 0:1:10;
    box off
    axis([0.8,8.2,0,10.5])
    ax.LineWidth = 2;
    axis square
    c.FontSize = 6;
    
    
    
    if kin.type == 1
                n = sprintf('%dk1d%d',kin.num,dyn.num);
                n2 = sprintf('_%dk1d%d.eps',kin.num,dyn.num);
                n3 = sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
            else
                n = sprintf('%dk2d%d',kin.num,dyn.num);
                n2 = sprintf('_%dk2d%d.eps',kin.num,dyn.num);
                n3 = sprintf('%d kinesin-2 vs %d dynein',kin.num,dyn.num);
            end
    pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
    
    if chooseFd == 1
        nam = 'F2_ZvVSFd';
    else
        nam = 'F2_ZvVSFs';
    end
    name1 = sprintf('%s%s',nam,n2);
    baseFileName1 = sprintf(name1);
    fullFileName1 = fullfile(pathname,baseFileName1);
    
    % set(gcf,'units','inches','position',[8 2 3.5 3]);
    % set(gcf,'paperunits','inches','paperposition',[2 2 3.5 3]);
    
    i=input('save? ');
    if i == 1
        print(fullFileName1,'-r900','-depsc')
    end
    
end
