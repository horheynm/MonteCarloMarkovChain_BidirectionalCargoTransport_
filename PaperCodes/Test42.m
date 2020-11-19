%% Cargo transport, get emp rates (attach and detach)
%{

Variable names::

kin.spr      kinesin spring constant
kin.num      number of kin in the system
kin.type     type of kin
    == 1; kinesin1
    == 2; kin2

dyn.spr      dynein spring constant
dyn.type     type of the dynein motor
    == 1; Kunwar dynein without catchbond, -212nm/s
    == 2; Yildiz dynein with out catchbond, -513 nm/s
dyn.catch    dynein catchbond
    == 0; no catchbond
    == 1; catchbond
dyn.Fs      dynein's stall force
dyn.Fd      dynein's detachment force

F  external force applied to the cargo. Usually zero

runs    number of simulation samples

A    matix that contains [number of kin, number of dyn, dynein's
stall force, dynein's detachment force, average velocity, standard
deviation of the velocity with weights based on time, SEM]

B = matix that contains

D = matix that contains the runlength for each simulation sample

E = matix that contains the simulation time for eahc simulation sample

allvel = velocity for each simulation sample, so D/E

G = structure in a vector format from Simu

meanvel = vector that contains mean velocity for each time a variable in
the loop changes (you assign it). Ex. In optical trap simualtion, meanvel
will contain mean velocity for different forces. In multi-motor simualtion,
gives you the mean velocity for different dynein motors

emp = sturcutre that contains info to get empirical kinetics

sav = variable where you assign Matlab to save data to a specified folder.
(look at SaveData2 to see how it is saved)

sendtext = send a text to your phone when simulation is complete

category = the assumption used when running the simulation
    1 == obtain empirical kinetics. Let the motor behave natrually. ie, if the
motor decides to detach from the MT, then let it detach
    2 == obtain effective diffusion. To get Deff, the simulation time must the
same for all simualtion samples, so in this case, when only a single motor
is attached to the MT, reroll the dice again if the result from the
Gillespie assigns the motor to detach.
    3 == Obtain position vs time traces with empirical kinetic assumption. Run
it if you want traces
    4 == never detach any motors from the MT. I made this to show that Fd is
key, and Fs can affect transport if detachment is ignored. Also used to get
~26 nm/s from Yildiz dynein
    5 == save files to a certain folder when the variable [sav] is 1, and
SaveData2.m funtion is called



% % % % % % % % % % % % % % % % % %%  % %% % % % % % % % % % % % %% % %


Emp2 code
%%%         ---------    Test42.m    ---------          %%%
%%%         --------- Fs(1:8)Fd(1:8) ---------          %%%

* 1k1d1t1c0   Completed    ||  1k2d1t1c0   Completed
* 1k1d2t1c0   Completed    ||  1k2d2t1c0   Completed
* 1k1d3t1c0   Completed    ||  1k2d3t1c0   Completed
* 1k1d4t1c0   Completed    ||  1k2d4t1c0   Completed
* 1k1d5t1c0   Completed    ||  1k2d5t1c0   Completed
* 1k1d6t1c0   Completed    ||  1k2d6t1c0   Completed
* 1k1d7t1c0   Compelted    ||  1k2d7t1c0   Completed
* 1k1d8t1c0   Completed    ||  1k2d8t1c0   Compelted
* 1k1d9t1c0   Completed    ||  1k2d9t1c0   Completed
* 1k1d10t1c0  Completed    ||  1k2d10t1c0  Completed

* 2k1d1t1c0   Completed    ||  2k2d1t1c0  Completed
* 2k1d2t1c0   Completed    ||  2k2d2t1c0  Completed
* 2k1d3t1c0   Completed    ||  2k2d3t1c0  Completed
* 2k1d4t1c0   Completed    ||  2k2d4t1c0  Completed
* 2k1d5t1c0   Completed    ||  2k2d5t1c0  Completed
* 2k1d6t1c0   Completed    ||  2k2d6t1c0  Completed
* 2k1d7t1c0   Completed    ||  2k2d7t1c0  Completed
* 2k1d8t1c0   Completed    ||  2k2d8t1c0  Completed
* 2k1d9t1c0   Completed    ||  2k2d9t1c0  Completed
* 2k1d10t1c0  Completed    ||  2k2d10t1c0  1,2,3,4,5,6,7,8

* 3k1d1t1c0               ||  3k2d1t1c0   C3:: All
* 3k1d2t1c0   ________    ||  3k2d2t1c0   _________
* 3k1d3t1c0   ________    ||  3k2d3t1c0   _________
* 3k1d4t1c0   ________    ||  3k2d4t1c0   _________
* 3k1d5t1c0   ________    ||  3k2d5t1c0   _________
* 3k1d6t1c0   ________    ||  3k2d6t1c0   _________
* 3k1d7t1c0   ________    ||  3k2d7t1c0   _________
* 3k1d8t1c0   ________    ||  3k2d8t1c0   _________
* 3k1d9t1c0   ________    ||  3k2d9t1c0   _________
* 3k1d10t1c0  C2:: All    ||  3k2d10t1c0  C3:: All
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


* 4k1d1t1c0   Running     ||  4k2d1t1c0   C1:: All
* 5k1d1t1c0   ________    ||  5k2d1t1c0   _________
* 6k1d1t1c0   ________    ||  6k2d1t1c0   _________
* 7k1d1t1c0   ________    ||  7k2d1t1c0   _________
* 8k1d1t1c0   ________    ||  8k2d1t1c0   _________
* 9k1d1t1c0   ________    ||  9k2d1t1c0   _________

* 4k1d2t1c0   B1: All     ||  4k2d2t1c0   C1:: All
* 5k1d2t1c0   ________    ||  5k2d2t1c0   _________
* 6k1d2t1c0   ________    ||  6k2d2t1c0   _________
* 7k1d2t1c0   ________    ||  7k2d2t1c0   _________
* 8k1d2t1c0   ________    ||  8k2d2t1c0   _________
* 9k1d2t1c0   ________    ||  9k2d2t1c0   _________

* 4k1d3t1c0   B1: All     ||  4k2d3t1c0   C1:: All
* 5k1d3t1c0   ________    ||  5k2d3t1c0   _________
* 6k1d3t1c0   ________    ||  6k2d3t1c0   _________
* 7k1d3t1c0   ________    ||  7k2d3t1c0   _________
* 8k1d3t1c0   ________    ||  8k2d3t1c0   _________
* 9k1d3t1c0   ________    ||  9k2d3t1c0   _________

%}

clear;  clc; format shortG;
close all;

% rng(1); % random number generator

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

% CHANGE VARIABLES FROM HERE %%%%%%


sav = 1; % save file?
sendtext=0; % send text once Simulation Completed?
category = 1;
%{
category decides what kind of assumption you want to use. For example, to
obtain empirical kinetic rates, the motor can move freely, and detach
freely. On the other hand, if you want to obtain effective Diffusion, then
we need to obtain the same time for each simulation sample. Also, if the
variable [sav] is one, you can call SavaData2.m to save the called
variables to a specified folder. (Mine is different than yours, so you
gotta change it).
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - -- -- - -

1 == obtain empirical kinetics. Let the motor behave natrually. ie, if the
motor decides to detach from the MT, then let it detach

2 == obtain effective diffusion. To get Deff, the simulation time must the
same for all simualtion samples, so in this case, when only a single motor
is attached to the MT, reroll the dice again if the result from the
Gillespie assigns the motor to detach.

3 == Obtain position vs time traces with empirical kinetic assumption. Run
it if you want traces

4 == never detach any motors from the MT. I made this to show that Fd is
key, and Fs can affect transport if detachment is ignored. Also used to get
~26 nm/s from Yildiz dynein

5 == save files to a certain folder when the variable [sav] is 1, and
SaveData2.m funtion is called

%}

tic
for T=[1] % which kinesin familu? 1 == kin1, 2 == kin2
    kin.type = T;
    for kn = 1 % how many kinesin in the simuation? you can also make it a loop, kn = 1:10
        kin.num = kn; %
        
        for Fs = 1:8 % What is the stall force of the dynein motor?
            dyn.Fs = Fs;
            
            for Fd = 1:8 % what is the detachment force of the motor
                dyn.Fd = Fd;
                for cb = [0]
                    dyn.catch = cb; % do you want dynein to have catchbond? 0 == no, 1 == yes
                    dyn.type = 1; % what type of dynein motor? 1 == 212 nm/s regular dynein motor, 2 == Yildiz DDB 513 nm/s motor
                    
                    for dn = [1] % how many dynein mtoor?
                        dyn.num = dn;
                        name = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
                        fprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,category);
                        h = waitbar(0,name);
                        for ii = 1:runs
                            Simu = tOhashi33(F,dyn,kin,category);
                            
                            if category == 1 % if you want to get empirical kinetic rates, gotta do some analysis
                                G = getsimpleG2(G,Simu,ii); % G(z2,ii) = G(dyn.num,runs)
                                emp = getEmpRate3(emp,ii,G);
                            elseif category == 3
                                trace(Simu,name,kin)
                            end
                            
                            D(ii) = Simu(end-1).cX - Simu(1).cX;  % Store every run length for each sample
                            E(ii) = Simu(end).t; % store every simulation time
                            h = waitbar(ii/runs);
                        end
                        
                        allvel(:) = D(:)./E(:);  % mean velocity of all obtained Simu data.
                        meanvel = mean(allvel(:)); % the mean velocity for allvel.
                        
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
                        
                        fprintf('      %1.1fmin %2.1fs\n',floor(toc/60),rem(toc,60))
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

kin2, dyn.num = 2:3


9k2d1t1c0Fs800Fd700cat1

%}

