%% Cargo transport, cV vs Ndyn,Nkin
%{ 
%%% open Check_Data
%%%         ---------    Test41.m    ---------          %%%
* 1k1d(0:10)t1c0Fs125   Completed    ||  1k2d(0:10)t1c0Fs125   Completed
    * Regular dyn, Bell model, Fs=1.25
* 1k1d(0:10)t1c0Fs430   Completed    ||  1k2d(0:10)t1c0Fs430   Completed
    * Regular dyn, Bell model, Fs=4.3
* 1k1d(0:10)t1c1Fs125   Completed    ||  1k2d(0:10)t1c1Fs125   Completed
    * Kunwar dyn, Catchbond model, Fs=1.25
* 1k1d(0:10)t1c1Fs430   Completed    ||  1k2d(0:10)t1c1Fs430   Completed
    * Kunwar dyn, Catchbond model, Fs=4.3
* 1k1d(0:10)t2c0Fs430   Completed    ||  1k2d(0:10)t2c0Fs430   Completed
    * Yildiz  dyn, Bell model, Fs = 4.3
* 1k1d(0:10)t2c1Fs430   Completed    ||  1k2d(0:10)t2c1Fs430   Completed
    * Yildiz  dyn, Catchbond model, Fs = 4.3

* 2k1d(0:10)t1c0Fs125   Completed    ||  2k2d(0:10)t1c0Fs125   Completed
* 2k1d(0:10)t1c0Fs430   Completed    ||  2k2d(0:10)t1c0Fs430   Completed
* 2k1d(0:10)t1c1Fs125   Completed    ||  2k2d(0:10)t1c1Fs125   Completed
* 2k1d(0:10)t1c1Fs430   Completed    ||  2k2d(0:10)t1c1Fs430   Completed
* 2k1d(0:10)t2c0Fs430   Completed    ||  2k2d(0:10)t2c0Fs430   Completed
* 2k1d(0:10)t2c1Fs430   Completed    ||  2k2d(0:10)t2c1Fs430   Completed

* 3k1d(0:10)t1c0Fs125   Completed    ||  3k2d(0:10)t1c0Fs125   Completed
* 3k1d(0:10)t1c0Fs430   Completed    ||  3k2d(0:10)t1c0Fs430   Completed
* 3k1d(0:10)t1c1Fs125   Completed    ||  3k2d(0:10)t1c1Fs125   Completed
* 3k1d(0:10)t1c1Fs430   Completed    ||  3k2d(0:10)t1c1Fs430   Completed
* 3k1d(0:10)t2c0Fs430   Completed    ||  3k2d(0:10)t2c0Fs430   Completed
* 3k1d(0:10)t2c1Fs430   Completed    ||  3k2d(0:10)t2c1Fs430   Completed

* (0:10)k1d1t1c0Fs125   Completed    ||  (0:10)k2d1t1c0Fs125    Completed
* (0:10)k1d1t1c0Fs430   Completed    ||  (0:10)k2d1t1c0Fs430    Completed
* (0:10)k1d1t1c1Fs125   Completed    ||  (0:10)k2d1t1c1Fs125    Completed
* (0:10)k1d1t1c1Fs430   Completed    ||  (0:10)k2d1t1c1Fs430    Completed
* (0:10)k1d1t2c0Fs430   Completed    ||  (0:10)k2d1t2c0Fs430    Completed
* (0:10)k1d1t2c1Fs430   Completed    ||  (0:10)k2d1t2c1Fs430    Completed

* (0:10)k1d2t1c0Fs125   Completed    ||  (0:10)k2d2t1c0Fs125    Completed
* (0:10)k1d2t1c0Fs430   Completed    ||  (0:10)k2d2t1c0Fs430    Completed
* (0:10)k1d2t1c1Fs125   Completed    ||  (0:10)k2d2t1c1Fs125    Completed
* (0:10)k1d2t1c1Fs430   Completed    ||  (0:10)k2d2t1c1Fs430    Completed
* (0:10)k1d2t2c0Fs430   Completed    ||  (0:10)k2d2t2c0Fs430    Completed
* (0:10)k1d2t2c1Fs430   Completed    ||  (0:10)k2d2t2c1Fs430    Completed

* (0:10)k1d3t1c0Fs125   Completed    ||  (0:10)k2d3t1c0Fs125   Completed
* (0:10)k1d3t1c0Fs430   Completed    ||  (0:10)k2d3t1c0Fs430   Completed
* (0:10)k1d3t1c1Fs125   Completed    ||  (0:10)k2d3t1c1Fs125   Completed
* (0:10)k1d3t1c1Fs430   Completed    ||  (0:10)k2d3t1c1Fs430   Completed
* (0:10)k1d3t2c0Fs430   Completed    ||  (0:10)k2d3t2c0Fs430   Completed
* (0:10)k1d3t2c1Fs430   Completed    ||  (0:10)k2d3t2c1Fs430   Completed

%}
clear;  clc; format shortG;
close all;
kin.spr = 0.3; % kinesin spring constant, Vale/Coppin 1996 and Nedelec 2002.
dyn.spr = 0.065; % Oiwa/Sakakibara 2005, dyn.spr = 0.01 from Gennerich NatCom 2015
dyn.type = 1; %1=kunwar maxVel=-212nm/s, 2=yildiz with cargo, maxVel=-513, 3 == yildiz DDB, no cargo
dyn.catch = 0; % Dynein's catch bond
F=0; % Extenal force
runs = 10000; % number of iterations
% ----------------------------------------------------

% intialize vectors
A = zeros(1,6); % A = [kin.num,dyn.num, Fd, Fs, mean(cargovel), SD]
B = A; % B = [kin.num,dyn.num, Fd, Fs, mean(RL), SD]
D = zeros(runs,1); % vector of all run length
E = D; % vector of all run time
allvel = E; % vector that contains <vel>
G = struct; % structure that contains {mot attach, cargo position, RT, mot type, mot force, cargo Pos}
meanvel = 0; % vector that contain mean velocity of allvel
emp = struct; % structure that contains empirical kinetics
fd = 1;fs = 0;dd = 0; % counters

% - - - - - - - - - - -- - - -
sav = 1; % save file?
sendtext=0; % send text once Simulation Completed?
category = 5;
%{
1=emp, 2=diff, 3=trace_for_emp(regular tug of war, 4=never detach motors,
5 = cv vs (Nkin or Ndyn)

* (0:10)k1d2t1c1Fs430   '9k1d2t1c1Fs430Fd299' 
%}
tic
for T=[1] % Change this for ylab(Nkin)
    kin.type = T;
    for kn = [3] % CHANGE THIS for xlab(Ndyn) [1,2,3]
        dyn.num = kn; % FLIP for xlab
        dyn.Fs = 4.3; % CHANGE THIS for xlab(Ndyn) [1.25,4.3]
        for dt = [1]
        dyn.type = dt;

        for Fd = 0.87*dyn.Fs/1.25
            dyn.Fd = Fd;
            
            for dd = [1]
                dyn.catch = dd;
                
                for dn = 9:10
                    kin.num = dn; % FLIP for xlab
                    
                    name = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
                    fprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
                    
                    h = waitbar(0,name);
                    for ii = 1:runs
                        Simu = tOhashi33(F,dyn,kin,category);
                        if category == 1
                            G = getsimpleG2(G,Simu,ii); % G(z2,ii) = G(dyn.num,runs)
                            emp = getEmpRate3(emp,ii,G);
                        end
                        
                        D(ii) = Simu(end-1).cX - Simu(1).cX;  % Get the final position of the cargo
                        E(ii) = Simu(end).t;
                        h = waitbar(ii/runs);
                        
                    end
                    
                    allvel(:) = D(:)./E(:);  % mean velocity of all obtained Simu data.
                    meanvel = mean(allvel(:));
                    
                    A(1,1) = kin.num;         % array of force, mean vel, std, sem == used to plot
                    A(1,2) = dyn.num;
                    A(1,3) = dyn.Fd;
                    A(1,4) = dyn.Fs;
                    A(1,5) = meanvel;
                    A(1,6) = std(allvel(:),E(:));
                    A(1,7) = std(allvel(:),E(:)) / sqrt(runs);
                    
                    A(2,1) = kin.num;         % array of force, mean RL, std, sem == used to plot
                    A(2,2) = dyn.num;
                    A(2,3) = dyn.Fd;
                    A(2,4) = dyn.Fs;
                    A(2,5) = mean(D);
                    A(2,6) = std(D);
                    A(2,7) = std(D) / sqrt(runs);
                    
                    if sav == 1
                        SaveData2(kin,dyn,A,D,E,emp,category)
                    end
                    
                    fprintf('       %1.1fmin %2.1fs\n',floor(toc/60),rem(toc,60))
                    
                    close(h);
                end
            end
        end
        end
    end
end

st = toc;
tt = sprintf('    \nSimulation time: %d minutes %2.2f seconds\n',floor(st/60),rem(st,60));
nn = [name,tt];
disp(nn)
if sendtext ==1
    iphone(nn) % send text when simulation is done
end


%{
to dos
get zero vel
get figures for
1. cv
2. zero vel
3. deff
4. kemp

%}
% % % figure
% % % boxplot(allvel)

%{
Notes:

* To get ~26nm/s vel for kin1 vs DDB, set category as 2 (forcely leave the
last motor onto the MT for 5s) and Fd as 30, and use simple kdet

* To get the same above with catchbond, set Fd as
%}

