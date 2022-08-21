%% kin1,dyn empirical det/attach rate vs Fd

% kd emp vs Fd

clear;clc;close all

format shortG
kin.num = 1;
kin.type = 1;
dyn.catch = 1;
% v = struct; ek = struct;


if dyn.catch == 0
    d = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\emp\';
else
    d = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\data3\catch\';
end

tic
kc=0;
dyn.Fs = 4.3; Fs = dyn.Fs;
dyn.Fd = 0.87*Fs/1.25;Fd = dyn.Fd;
for kk = [1,4]
    kin.type = kk;
    kc=kc+1;
    for dd = 0:10
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
        
        v(kc,dd+1) = A(1,5);
        rl(kc,dd+1) = A(2,5);
        %             [v,ek] = emptomatrix3(Fd,v,emp,ek);
        %             a(Fs,Fd) = ek(Fd).r(2,1); % Kinesin emp kon
        %             b(Fs,Fd) = ek(Fd).r(2,2); % dyn emp kon
        %
        fprintf('Fs=%1.2f,Fd=%1.2f, %1.0fmin %2.0fs\n',kin.type,dyn.num,floor(toc/60),rem(toc,60))
    end
end


%%
for kt= [1,4]
    close;
    figure(1);
    set(gcf,'PaperUnits','inches');
    set(gcf,'PaperSize', [10 10]);
    set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
    set(gcf,'PaperPositionMode','auto');
    set(gcf,'color','w');
    
    hold on; str = [];
    if kt == 1
        h1 = plot(0:10,v(1,:),'linew',2);
        h1.MarkerFaceColor = 'w';
        h1.Marker = 'o';
        h1.Color = [0,0.447,0.741];
        h1.MarkerSize = 8;
        
    else
        h2 = plot(0:10,v(2,:),'linew',2);
        h2.MarkerFaceColor = [0.1 0.8 0.1];
        h2.Marker = '^';
        h2.Color = [0.1 0.5 0.1];
        h2.MarkerSize = 8;
    end
    
    % s=sprintf('%d kinesin-1 vs %d dynein',kin.num,dyn.num);
    % title(s)
    
    
    
end

 h3 = plot(-1:11,zeros(1,13),'linew',2,'color','k');
    xlabel('Number of dynein','FontSize',24);
    ylabel('Cargo velocity (nm/s)','FontSize',24); % Y-axis
    
    L = legend([h1,h2],'1 kinesin-1','1 kinesin-2');
    L.Box = 'off';
    L.FontSize = 20;
    % ax.Position = [0.67 0.4 0.1 0.1];
    clear ax
    hold off
    set(gca,'FontSize',24);
    set(gca,'XTick', 0:2:10);
    set(gca,'YTick', -200:200:800);
    box off
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = -0:1:8;
    ax.YAxis.MinorTick = 'on';
    ax.YAxis.MinorTickValues = -200:100:800;
    box off
    axis([-0.2,10.2,-200,800])
    ax.LineWidth = 2;
    axis normal
    
    pathname = 'X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\061016\figs\';
    
    if Fs == 4.3 && dyn.catch == 1
        nam = 'F2_CvVSNdyn43Catch';
    elseif Fs == 1.25 && dyn.catch == 1
        nam = 'F2_CvVSNdyn125Catch';
    elseif Fs == 1.25 && dyn.catch == 0
        nam = 'F2_CvVSNdyn125Reg';
    elseif Fs == 1.25 && dyn.catch == 0
        nam = 'F2_CvVSNdyn125Reg';
    end

    name1 = sprintf('%s%s',nam,n2);
    baseFileName1 = sprintf(name1);
    fullFileName1 = fullfile(pathname,baseFileName1);

i=input('save? ');
if i == 1
    print(fullFileName1,'-r900','-depsc')
end
