function trace2(Simu,name,kin,saveTraceYN,iii,runs)
%%
% if nargin < 4
% z=1;
% end


z = 1;
if length(Simu) ~= 1
    S = struct;
    for ii = 1:length(Simu)
        S.t(ii) = Simu(ii).t;
        S.cX(ii) = Simu(ii).cX;
        S.motA(ii,1:length(Simu(ii).motA)) = Simu(ii).motA;
        S.motT(ii,1:length(Simu(ii).motT)) = Simu(ii).motT;
    end
end

ScX = S.cX;ScX = ScX';
St = S.t;St = St';
SmotA = S.motA;
SmotT = S.motT;

figure(z);hold on;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');

lockin = (find(S.motT(end,:) == 1));
locdyn = (find(S.motT(end,:) == 2));


% GO backwards, because intially, you know that all motors are bound to MT

S.t = fliplr(S.t);
S.cX = fliplr(S.cX);

c = 1; 

% find what color plot by finding how many motors are bound
% % sumkin1= sum(S.motA(end,lockin)); sumdyn1 = sum(S.motA(end,locdyn));
% % if sumkin1 >0 && sumdyn1 > 0
% %     col(c,:) = [0.5,0.5,0.5];
% %     a(c) = 1;
% % elseif sumkin1 >0 && sumdyn1 == 0
% %     if kin.type == 1
% %         col(c,:) = [0,0.447,1];
% %     else
% %         col(c,:) = [0.1 0.9 0.1];
% %     end
% %     a(c) = 2;
% % elseif sumkin1 == 0 && sumdyn1 >0
% %     col(c,:) = [0.85 ,0.325,0.098];
% %     a(c) = 3;
% % end
% % c=c+1;


% flip motA
counter1 = 0;
for jj = 1:size(S.motA,1)
    motA(jj,:) = S.motA(end-counter1,:);
    counter1 = counter1 + 1;
end
S.motA = motA;


p = struct; col2 = S.motA(1,:); pt = 1; 
for ii = 2:size(S.motA,1)
    if sum(S.motA(ii-1,:) ~= S.motA(ii,:)) > 0
        p(c).t = S.t(pt:ii);
        p(c).cX = S.cX(pt:ii);
        p(c).pt = size(S.t,2)-pt+1;
        pt=ii;
        col2(c,:) = S.motA(ii,:);
        sumkin = sum(S.motA(ii-1,lockin));
        sumdyn = sum(S.motA(ii-1,locdyn));
        
        if sumkin >0 && sumdyn > 0
            col(c,:) = [0.5,0.5,0.5];
            a(c) = 1;
        elseif sumkin >0 && sumdyn == 0
            if kin.type == 1
                col(c,:) = [0,0.447,1];
            else
                col(c,:) = [0.1 0.9 0.1];
            end
            a(c) = 2;
        elseif sumkin == 0 && sumdyn >0
            col(c,:) = [0.9 ,0,0.3];
            a(c) = 3;
        end
        c = c+ 1;
        
        disp(ii)
        
    end
    if ii == size(S.motA,1)
        p(c).t = S.t(pt:ii);
        p(c).cX = S.cX(pt:ii);
        p(c).pt = pt;
        col(c,:) = [0.5,0.5,0.5];
        a(c) = 1;
    end
end

%     
% for ii = 1:size(S.motA,1)-1
%     if ii > 1
%         if sum(S.motA(ii,:) ~= S.motA(ii-1,:)) ~= 0
%             p(c).t = S.t(pt:ii+1);
%             p(c).cX = S.cX(pt:ii+1);
%             pt = ii+1;
%             
%             col2(c+1,:) = S.motA(ii+1,:);
%             
%             sumkin = sum(S.motA(ii,lockin));
%             sumdyn = sum(S.motA(ii,locdyn));
%             
%             if sumkin >0 && sumdyn > 0
%                 col(c,:) = [0.5,0.5,0.5];
%                 a(c) = 1;
%             elseif sumkin >0 && sumdyn == 0
%                 if kin.type == 1
%                     col(c,:) = [0,0.447,1];
%                 else
%                     col(c,:) = [0.1 0.9 0.1];
%                 end
%                 a(c) = 2;
%             elseif sumkin == 0 && sumdyn >0
%                 col(c,:) = [0.9 ,0,0.3];
%                 a(c) = 3;
%             end
%             c = c+ 1;
%             
%         end
%     end
%     
%     if ii == size(S.motA,1)-1
%         p(c).t = S.t(pt:ii+1);
%         p(c).cX = S.cX(pt:ii+1);
%         col(c,:) = [0.5,0.5,0.5];
%         a(c) = 1;
%     end
%     
% end

counter2 =0;
for kk = 1:length(col)
    col3(kk,:) = col(end-counter2,:);
    counter2 = counter2 + 1;
end
col = [];
col = col3;

figure(z); hold on;
counter = 0;
for ii = 1:c

    x = fliplr(p(ii).t);
    y = fliplr(p(ii).cX);
    if a(ii) == 1
        h1 = plot(x,y,'linew',2,'color',col(end-counter,:));
    elseif a(ii) == 2
        h2 = plot(x,y,'linew',2,'color',col(end-counter,:));
    elseif a(ii) == 3
        h3 = plot(x,y,'linew',2,'color',col(end-counter,:));
%     else
%         plot(x,y,'linew',2,'color',col(ii,:));
    end
    counter = counter + 1;
    x = []; y = [];
end

zt = fliplr(S.t);
zcX = fliplr(S.cX);
zmotA = fliplr(S.motA);


if (exist('h1','var') == 1) && (exist('h2','var') == 1) && (exist('h3','var') == 1) 
    L = legend([h1,h2,h3],'Both kinesin and dynein attached','Only kinesin attached','Only dynein attached');
    L.Location = 'NorthWest';
    L.Box = 'off';  L.FontSize = 16;
    
end

% 

xlabel('Time (s)','FontSize',20);    
ylabel('Position (\mum)','FontSize',20); % Y-axis
axis square
set(gca,'FontSize',20);  % Axis font size
set(gca,'LineWidth',2);   % Axis Width
% set(gca,'FontWeight','Bold');
box on

ax = gca;
axis([0,5,-1000,4000]);
set(gca,'TickLength',[0.01,0.025]);
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0:5:50;
% title(name)
pathname1 = '/Volumes/Seagate/BiophysPaper2017/figs/';
        n = '/PosVsTimeDeff/';

if iii == runs
    i=saveTraceYN;
    if i ==1
        f = fullfile(pathname1,n);
        if exist(f,'dir') == 0
            mkdir(pathname1,n)
        end
    end
end

% nam = sprintf('%dk%dd%d',kin.num,kin.type,dyn.num);
% name1 = sprintf('%s%s',nam);
baseFileName1 = sprintf(name);
fullFileName1 = fullfile(pathname1,n,baseFileName1);
%
%%
if iii == runs
    i=saveTraceYN;
    if i == 1
        %     exportfig(gcf,fullFileName1,'Color','rgb');
        print(fullFileName1,'-r900','-depsc')
    end
%     close
end

end




        
