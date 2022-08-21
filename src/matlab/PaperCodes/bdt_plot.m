% LAST EDITTED 062116
% school comp
function sol = bdt_plot(A,name,count,kin,dyn,edit,B,D,E,emp)
B;D;E;emp;
close; figure(count);
clf; hold on
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
plot(0:0.01:10.1,zeros(1,length(0:0.01:10.1)),'--','color',[0.5,0.5,0.5]','linew',2)
set(gca,'FontName','Helvetica');
hold on;
switch kin.type
    case 1
        h1 = plot(A(1:end,2),A(1:end,3),'linew',3,'Marker','o');
        h1.Color = [0,0.447,0.741];
        %         h11 = plot(A(1:end,2),A(1:end,3),'o');
        name2 = sprintf('Fs=%1.1f,Fd=%1.1f,kin1',dyn.Fs,dyn.Fd);
        name3 = sprintf('Fs=%2.0f_Fd=%2.0f_kin1',dyn.Fs*100,dyn.Fd*100);
        if edit == 1
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1regkoff\');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1\');
        elseif edit == 2
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1catchbond\');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1_2\');
        elseif edit == 3
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1Fsonly\');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1_3\');
        elseif edit == 4
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\BCT_Fs_1.25\');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1_4\');
        elseif edit == 5
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\BCT_Fs_4.3\');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin1_4\');
        elseif edit == 6
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D\');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D_M\');
        elseif edit == 7
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('/Users/kazu/Desktop/data/kin1_3D/');
        elseif edit == 8 %test 27a, Fs = 1.25, Fd=4.3, find zerovel; 1:1~10 kin:dyn
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_catch\');
        elseif edit == 9
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_varydyn\');
        elseif edit == 10 % Test 28a, varyFd, catchbond, find zero_vel
             pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_catch_varyFd\');
        elseif edit == 11 % test27a, Fs = 1.25, 4.3, catchbond
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_reg_yildiz\');
        elseif edit == 12 % Test31a, Yildiz dynein, vary Fd and Fs
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_3D_yildiz\');
        elseif edit == 13
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_3D_2\');
        elseif edit == 14 % 1 kin1, sum(Ks)
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum\');
        elseif edit == 15 % 2 kin1, sum(Ks)
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum_2\');
         elseif edit == 16 % 3 kin1, sum(Ks)
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum_3\');
        elseif edit == 17
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum1\');
        elseif edit == 18
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum2\');
        elseif edit == 19
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum3\');
        elseif edit == 20
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum1b\');
        elseif edit == 21
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum2b\');
        elseif edit == 22
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin1_sum3b\');
        
        elseif edit == 23 % Get the #of dyn for draw, <vel>, <RL>, || sved in data2, kin1sum
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kin1sum\1kin1\');
        elseif edit == 24
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kin1sum\2kin1\');
        elseif edit == 25
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kin1sum\3kin1\\');
            
        elseif edit == 26 % (Run time)=3s, get D_eff
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\1kin1\');
        elseif edit == 27
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\2kin1\');
        elseif edit == 28
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\3kin1\\');
        elseif edit == 29
             pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\0kin\');
            
        elseif edit == 30 % (Run time)=3s, get D_eff, no detachment
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeffkoff0\1kin1\');
        elseif edit == 31
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeffkoff0\2kin1\');
        elseif edit == 32
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeffkoff0\3kin1\');
        elseif edit == 33
             pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeffkoff0\0kin\');
        
        elseif edit == 34 % (Run time)=3s, get empiritcal on rate, mark each detach and reattach
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\1kin1\');
        elseif edit == 35
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\2kin1\');
        elseif edit == 36
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\3kin1\');
        elseif edit == 37
             pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
             pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\0kin\');
             
        elseif edit == 38 % CATCHBOND, (Run time)=3s, get empiritcal on rate, mark each detach and reattach,
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\1kin1\');
        elseif edit == 39
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\2kin1\');
        elseif edit == 40
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\3kin1\');
        elseif edit == 41
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\0kin\');
            
        end
        
        h1.MarkerFaceColor = 'w';
    case 4
        h1 = plot(A(1:end,2),A(1:end,3),'linew',3,'Marker','^');
        h1.Color = [0.1 0.5 0.1];
        %         h11 = plot(A(1:end,2),A(1:end,3),'^');
        h1.MarkerFaceColor = [0.4 0.8 0.5];
        name2 = sprintf('Fs=%1.1f,Fd=%1.1f,kin2',dyn.Fs,dyn.Fd);
        name3 = sprintf('Fs=%2.0f_Fd=%2.0f_kin2',dyn.Fs*100,dyn.Fd*100);
        %         pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin2regkoff\');
        %         pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\071216\kin2\');
        %                     pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin2_3D\');
        %             pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin2_3D_M\');
        %
        if edit == 7
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_3D\');
        elseif edit == 8
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_catch\');
        
        elseif edit == 10 % test28b, varyFd, catchbond, find zero_vel
             pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_catch_varyFd\');
        elseif edit == 11
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_reg_yildiz\');
         elseif edit == 12 % Test31a, Yildiz dynein, vary Fd and Fs
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_3D_yildiz\');
        elseif edit == 13
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_3D_2\');
        elseif edit == 14
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum\');
        elseif edit == 15 % 2 kin1, sum(Ks)
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum_2\');
        elseif edit == 16 % 3 kin2, sum(Ks)
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum_3\');
        elseif edit == 17
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum1\');
        elseif edit == 18
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum2\');
        elseif edit == 19
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum3\');
        elseif edit == 20
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum1b\');
        elseif edit == 21
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum2b\');
        elseif edit == 22
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data\kin2_sum3b\');
               
        elseif edit == 23 % Get the #of dyn for draw, <vel>, <RL>, || data2, kin1sum
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kin1sum\1kin2\');
        elseif edit == 24
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kin1sum\2kin2\');
        elseif edit == 25
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kin1sum\3kin2\\');
            
        elseif edit == 26 % RT=3s, get D_eff
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\1kin2\');
        elseif edit == 27
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\2kin2\');
        elseif edit == 28
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\3kin2\\');
        elseif edit == 29
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\0kin\');
            
        elseif edit == 30 % (Run time)=3s, get D_eff, no detachment
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeffkoff0\1kin2\');
        elseif edit == 31
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\2kin2\');
        elseif edit == 32
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\3kin2\');
        elseif edit == 33
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\kinDeff\0kin\');
            
        elseif edit == 34 % (Run time)=3s, get empiritcal on rate, mark each detach and reattach
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\1kin2\');
        elseif edit == 35
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\2kin2\');
        elseif edit == 36
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\3kin2\');
        elseif edit == 37
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\mark\0kin\');
            
        elseif edit == 38 % CATCHBOND, (Run time)=3s, get empiritcal on rate, mark each detach and reattach,
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\1kin2\');
        elseif edit == 39
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\2kin2\');
        elseif edit == 40
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\3kin2\');
        elseif edit == 41
            pathname = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\081516\kin1_3D');
            pathname2 = fileparts('X:\My Documents\MATLAB\Research\MATLAB\Research\kgo5020\data2\markcatch\0kin\');
            
        end
        
end
h1.MarkerSize = 9;

% h2 = plot(A(12:22,2),A(12:22,3),'linew',3);
% h3 = plot(A(23:end,2),A(23:end,3),'linew',3);

% h11.MarkerFaceColor = 'w';
% h12 = plot(A(12:22,2),A(12:22,3),'^');
% h12.MarkerSize = 9;
% h12.Color = h2.Color;
% h12.MarkerFaceColor = [1,0.5,0]
% h12.LineWidth = 2;
% 
% h13 = plot(A(23:end,2),A(23:end,3),'s');
% h13.MarkerSize = 9;
% h13.Color = h3.Color;
% h13.MarkerFaceColor = 'w'
% h13.LineWidth = 2;

set(gca,'XTick', 0:2:10);   % X-tIck
set(gca,'YTick',-200:200:800);  % Y-tick
axis([-0.3 10.3 -200 800]);  % axis values
axis square; box off;
set(gca,'LineWidth',3);   % Axis Width
set(gca,'FontSize',30);  % Axis font size
% set(gca,'FontWeight','Bold');
xlabel('Number of dynein','FontSize',22);
ylabel('Motor velocity (nm/s)','FontSize',22); % Y-axis
hold off
% ax = legend([h1,h2,h3],'One kinesin-1','Two kinesin-1','Three kinesin-1');
if kin.type == 1
    ax = legend(h1,'One kinesin-1');
elseif kin.type == 4
    ax = legend(h1,'One kinesin-2');
end

set(ax,'FontSize',16,'fontweight','Bold');
legend boxoff

title(name,'FontSize',20); % Y-axi

% ------------------------------------------------------------------
% Find the off-set velocity in Bidirectional cargo transport
c1 = 0;c2 = 1;
while c1 == 0
    if sign(A(c2,3)) == sign(A(c2+1,3))
        sol = 0;
    else
        aa = c2:c2+1;
        m = A(aa(2),3) - A(aa(1),3);
        b = A(aa(2),3) - m*A(aa(2),2);
        sol = -b/m;
        c1 = 1;
    end
    if c2 == length(A)-1
        c1 = 1;
    end
    c2 = c2 + 1;
end

fprintf('zero vel @: %f, Fs=%1.1f, Fd=%1.1f\n', sol,dyn.Fs,dyn.Fd)

% baseFileName = sprintf(name2,count);
% fullFileName = fullfile(pathname,baseFileName);
% % export
% 
% print('-painters','-dpng','-r600', fullFileName)
% close all

baseFileName2 = sprintf(name3,count);
fullFileName2 = fullfile(pathname2,baseFileName2);
save(fullFileName2)

end

% ------------------------------------------------------------------


% set(gcf, 'color', 'none');
% set(gca, 'color', 'none');

% export_fig kin1ma041816.png