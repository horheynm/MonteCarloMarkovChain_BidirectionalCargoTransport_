%% Cargo transport, get diff rates (attach and detach)
%{
%}

clear;  clc; format shortG; close all;

kin.spr = 0.3; % kinesin spring constant, Vale/Coppin 1996 and Nedelec 2002.
kin.num = 0;
kin.step = 100/8;
kin.num = 1;

dyn.spr = 0.065; % Oiwa/Sakakibara 2005, dyn.spr = 0.01 from Gennerich NatCom 2015
dyn.type = 2; %1=kunwar maxVel=-212nm/s, 2=yildiz with cargo, maxVel=-513, 3 == yildiz DDB, no cargo
dyn.catch = 0; % Dynein's catch bond
dyn.step = 212/8;
dyn.Fs = 0;
dyn.Fd =0;
dyn.num = 0;

runs = 200000; % number of iterations
% ----------------------------------------------------

% intialize vectors
A = []; B = []; D = []; E = []; % A = [kin.num,dyn.num, Fd, Fs, mean(cargovel), SD]
allvel =[]; meanvel = []; emp = [];

% - - - - - - - - - - -- - - -

sav = 1; sendtext=0; category = 4; 
tic
for motnum = 2
    if motnum == 1
        kin.num = 1;
        dyn.num = 0; dyn.Fs = 1; dyn.Fd = 1;
        
    else
        dyn.num = 1;
        kin.num = 0;
        kin.type = 2;
    end
    if dyn.num == 1
        for Fs = [1.25,4.3]
            dyn.Fs = Fs;
            for Fd = 0.87/1.25*Fs;
                dyn.Fd = Fd;
                for cb = [1]
                    dyn.catch = cb;
                    for dt = [1] % dynein type
                        dyn.type = dt;
                        z = 1;
%                         if category == 4 % always 4 DO NOT CHANGE
%                             meanvel(z) = mean(allvel(:,z));
%                             meanrt(z) = mean(E(:,z));
%                             A(z,1) = F;         % array of force, mean vel, std, sem == used to plot
%                             A(z,2) = meanvel(z);
%                             fprintf('Optrap, %dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d\n',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
%                             fprintf('runs=%d,sav=%d,text=%d\n',runs,sav,sendtext)
%                             fprintf('- - - - -- - - - -- - - - - \n')
%                         end
                        for F = -8:1/2:6
                            name = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d, F = %d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category,F);
                            h = waitbar(0,name);
                            for ii = 1:runs
                                Simu = tOhashi33(F,dyn,kin,category);
                                h = waitbar(ii/runs);
                                D(ii,z) = Simu(end-1).cX - Simu(1).cX;  % Get the final position of the cargo
                                E(ii,z) = Simu(end).t;
                                
                            end
                            allvel(:,z) = D(:,z)./E(:,z);  % mean velocity of all obtained Simu data.
                            A(z,1) = -1*F;
                            A(z,2) = mean(allvel(:,z));
                            A(z,3) = std(allvel(:,z),E(:,z));
                            A(z,4) = A(z,3)/sqrt(runs);
                            
                            B(z,1) = -1*F;         % array of force, mean RL, std, sem
                            B(z,2) = mean(D(:,z));
                            B(z,3) = std(D(:,z));
                            B(z,4) = std(D(:,z))/sqrt(runs);
                            
                            C(z,1) = -1*F;
                            C(z,2) = mean(E(:,z));
                            C(z,3) = std(E(:,z));
                            C(z,4) = std(E(:,z))/sqrt(runs);
                            
                            z = z+1;
                            
                            fprintf('F=%1.1f %1.0fmin %2.0fs,',F,floor(toc/60),rem(toc,60));
                            cl = clock;
                            fprintf('        %d:%d;%2.0f\n',cl(4),cl(5),cl(6));    close(h);
                        end
                        if sav == 1
                            SaveData2(kin,dyn,A,D,E,emp,category)
                        end
                    end
                end
            end
        end
    else
        for kt = [1,2]
            kin.type = kt;
            z = 1;
            if category == 4
                fprintf('Optrap, %dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d\n',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
                fprintf('runs=%d,sav=%d,text=%d\n',runs,sav,sendtext)
                fprintf('- - - - -- - - - -- - - - - \n')
            end
            for F = -6:1/2:6
                name = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
                h = waitbar(0,name);
                for ii = 1:runs
                    Simu = tOhashi33(F,dyn,kin,category);
                    h = waitbar(ii/runs);
                    D(ii,z) = Simu(end-1).cX - Simu(1).cX;  % Get the final position of the cargo
                    E(ii,z) = Simu(end).t;
                    
                end
                allvel(:,z) = D(:,z)./E(:,z);  % mean velocity of all obtained Simu data.
                meanvel(z) = mean(allvel(:,z));
                meanrt(z) = mean(E(:,z));
                A(z,1) = -1*F;         % array of force, mean vel, std, sem == used to plot
                A(z,2) = meanvel(z)
                A(z,3) = std(allvel(:,z),E(:,z));
                A(z,4) = A(z,3)/sqrt(runs);
                
                B(z,1) = -1*F;         % array of force, mean RL, std, sem
                B(z,2) = mean(D(:,z));
                B(z,3) = std(D(:,z));
                B(z,4) = std(D(:,z))/sqrt(runs);
                
                C(z,1) = -1*F;
                C(z,2) = meanrt(z);
                C(z,3) = std(E(:,z));
                C(z,4) = std(E(:,z))/sqrt(runs);
                
                close(h);
                z = z+1;
                
                fprintf('F=%2.0f, %1.0fmin %2.0fs,',F, floor(toc/60),rem(toc,60));
                cl = clock;
                fprintf('        %d:%d;%2.0f\n',cl(4),cl(5),cl(6));
            end
            if sav == 1
                SaveData2(kin,dyn,A,D,E,emp,category)
            end
        end
    end
end


figure; subplot(2,1,1)
plot(A(:,1),A(:,2))
subplot(2,1,2)
plot(B(:,1),B(:,2))

