%% test_cargo
% assuming that no new motors bind or unbind to the cargo during the
% simulation.

clear; close all hidden; set(0,'defaultfigurewindowstyle','docked')
%% Simulation

% force
F = 0; % pN

% spring constant
kin.spr = 0.3;% very approximate estimate based on Vale/Coppin, 1996 and Nedelec, 2002

% maximum stepping rate for dynein
dyn.step = 212/8; % [1/s],
% dynein spring constant
dyn.spr = 0.065;   % from Oiwa/Sakakibara, 2005, = 0.01 from Gennerich NatCom 2015
% dyneinc catchbond
dyn.catch = 0;
% dynein stall force
dyn.Fs=1.25;
% dynein detachment force
dyn.Fd=0.87;
% simulation category
category=1; % 1 = reg. TOW, allowed to detach || 2=fixed time, last motor not allowed to detach

% type of kinesin motor
kin.type = 1; % 1 == kinesin1, 4 == kin2
% number of kinesins
kin.num = 1;
% number of dyneins
dyn.num = 5;

% run simulation
disp '--------------'
tic
Simu = tOhashi31WHJF(F,dyn,kin,category);
toc

%% Plotting

% fill Simu into arrays
% Simu(end).t = 5;
for ii = 1:length(Simu)
    
    motX(ii,:) = Simu(ii).motX;
    motA(ii,:) = Simu(ii).motA;
    motF(ii,:) = Simu(ii).motF;
    time(ii,:) = Simu(ii).t;
    carX(ii,:) = Simu(ii).cX;
    
end

figure
subplot(3,1,1)
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
% set(gca,'Position', [0.13,0.43548,0.775,0.18988]);

hold on; grid on;
% title('Position vs. Time (blue: cargo, green: kinesin, red/brown: dynein)')
xlabel('Time (s)')
ylabel('Position (nm)')
set(gca,'FontSize',18); set(gca,'linew',2)
kn=1;
dn=1;

hh=plot(time,carX,'linew',5,'Color',[1,0.9,0.2],'MarkerEdgeColor',[1,0.8,0.4]);str{1} = 'Cargo';
for mm = 1:length(Simu(1).motT)
    switch Simu(1).motT(mm)
        case 1
            MotorColor(mm,:) = .4*rand(1,3)+[0,.6,0];
            h(mm) = plot(time,motX(:,mm),'Color',MotorColor(mm,:),'linewidth',2);
            if kin.type == 1
                str{mm+1} = sprintf('#%d kinesin-1',kn);
            else
                str{mm+1} = sprintf('#%d kinesin-2',kn);
            end
            kn=kn+1;
        case 2
            MotorColor(mm,:) = .4*rand(1,3)+[.6,0,0];
            h(mm) = plot(time,motX(:,mm),'Color',MotorColor(mm,:),'linewidth',2);
            str{mm+1} = sprintf('#%d dynein',dn);
            dn=dn+1;
    end
end
axis([0,Simu(end).t,min(min([motX,carX])),max(max([motX,carX]))])
L=legend(str);
if length(Simu(ii).motX) > 8
    L.FontSize = 8;
else
    L.FontSize = 16;
end

L.Box = 'off'; L.Location = 'Eastoutside';
length(Simu);
Simu(end);
disp '--------------'

%% Animation
cHt = 70;
dt = diff(time);
c=get(gca,'colororder');

% h_fig = gcf;
% set(h_fig,'KeyPressFcn',@(h_obj,evt) disp(evt.Key));

for ii = 1:length(Simu)
    
    subplot(3,1,1)
    time_line = plot([Simu(ii).t,Simu(ii).t],get(gca,'YLim'),'color',c(1,:),'linewidth',4);
    
    %---------------------------------
    subplot(3,1,2);
    hold off;
    % plot the cargo symbol
    h=plot(Simu(ii).cX,cHt,'o','MarkerSize',50,'MarkerFaceColor',[1,0.9,0.2],'MarkerEdgeColor',[1,0.8,0.4],'linew',3);
    axis equal
    hold on;
    set(gca,'ylim',[0,max(get(gca,'ylim'))+0.3*max(get(gca,'ylim'))])
    
    
    % plot motors symbols
    for jj = 1:length(Simu(ii).motX)
        
        % define X and Y positions for symbols
        if Simu(ii).motA(jj) == 0
            currX(jj) = Simu(ii).cX + 3*randn;
            currY(jj) = cHt - 3*abs(randn);
        else
            currX(jj) = Simu(ii).motX(jj);
            currY(jj) = 0;
        end
        
        % plot the tether for the motor
        plot([Simu(ii).cX,currX(jj)],[cHt,currY(jj)],'Color',MotorColor(jj,:),'linewidth',2);
        
        % plot the symbol for the motor
        switch Simu(ii).motT(jj)
            case 1
                plot(currX(jj),currY(jj),'^','Color',MotorColor(jj,:),'MarkerSize',15,'MarkerFaceColor',MotorColor(jj,:));
            case 2
                plot(currX(jj),currY(jj),'h','Color',MotorColor(jj,:),'MarkerSize',19,'MarkerFaceColor',MotorColor(jj,:));
        end
        %         axis equal
        
    end
    
    % plot motors numbers
    for jj = 1:length(Simu(ii).motX)
        text(currX(jj),currY(jj),num2str(jj),'VerticalAlignment','middle','HorizontalAlignment','center','Color','w')
    end
    
    set(gca,'FontSize',18); set(gca,'linew',2)
    set(gca,'ytick',[]); ax=gca;
    %     xlabel('Position (nm)'); axis equal
    
    str2posx = max(get(gca,'Xlim')) - (max(get(gca,'Xlim')) -min(get(gca,'Xlim')))*0.3;
    str2posy = max(get(gca,'Ylim')) -(max(get(gca,'Ylim')) -min(get(gca,'Ylim')))*0.5;
    str2=sprintf('Simulation time:\n%1.4fs',Simu(ii).t);
    T=text(str2posx,str2posy,str2); T.FontSize = 16; axis equal
%     h1=uicontrol('style','text','units','normalized','position',[0.63,0.5,0.1,0.1],'string',str2);
%     h1.BackgroundColor = 'w'; h1.FontSize = 16;
%     h1=plot(max(get(gca,'xlim'))*0.1,max(get(gca,'xlim'))*0.1,'w');
%     L=legend(h1,str2);L.Box = 'off'; L.Location ='eastoutside';
    
    
    %---------------------------------
    subplot(3,1,3)
    hold off;
    axis([min(min([motX,carX])),max(max([motX,carX])),0,cHt+0.5*cHt])
    % plot the cargo symbol
    plot(Simu(ii).cX,cHt,'o','MarkerSize',50*70/diff(get(gca,'YLim')),'MarkerFaceColor',[1,0.9,0.2],'MarkerEdgeColor',[1,0.8,0.4]);
    
    hold on;axis([min(min([motX,carX])),max(max([motX,carX])),0,cHt+0.5*cHt])
    plot([min(min([motX,carX])),max(max([motX,carX]))],[0,0],'k','linewidth',2)
    
    
    % plot motors symbols
    for jj = 1:length(Simu(ii).motX)
        
        % define X and Y positions for symbols
        if Simu(ii).motA(jj) == 0
            currX(jj) = Simu(ii).cX + 3*randn;
            currY(jj) = cHt - 3*abs(randn);
        else
            currX(jj) = Simu(ii).motX(jj);
            currY(jj) = 0;
        end
        
        % plot the tether for the motor
        plot([Simu(ii).cX,currX(jj)],[cHt,currY(jj)],'Color',MotorColor(jj,:),'linewidth',1);
        
        % plot the symbol for the motor
        switch Simu(ii).motT(jj)
            case 1
                plot(currX(jj),currY(jj),'^','Color',MotorColor(jj,:),'MarkerSize',15*70/diff(get(gca,'YLim')),'MarkerFaceColor',MotorColor(jj,:));
            case 2
                plot(currX(jj),currY(jj),'h','Color',MotorColor(jj,:),'MarkerSize',19*70/diff(get(gca,'YLim')),'MarkerFaceColor',MotorColor(jj,:));
        end
        
    end
    set(gca,'FontSize',18); set(gca,'linew',2); box on;
    set(gca,'ytick',[])
    xlabel('Position (nm)')
    
    if ii < length(Simu)
        pause(dt(ii)*1)
    end
    %     mov(ii) = getframe(gcf);
    set(time_line,'linestyle','none')
    
end

% movie2avi(mov,'1k2d4.avi', 'compression', 'None');
%
