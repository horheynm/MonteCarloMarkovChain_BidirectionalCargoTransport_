%% Bidirectional cargo transport
%{
 Created: 03.31.2017
 Last modified: 04.12.17
* Instatenous velocity was taken out

Authors: Kazuka G. Ohashi, Brandon Mentley and Nate Deffenbaugh
%} 

%% cargo_bsm_time

function Simu = tOhashi31WHJF(F,dyn,kin,cat)

pfs = 8; motor_type_ss = [pfs, -pfs]; % SPECIFY STEPPING SIZE OF THE MOTOR, KIN AND DYN BOTH TAKE 8nm STEP

motX = pfs*round(3*randn(1,kin.num + dyn.num));  % distribute motors around cargo
motA = ones(1,kin.num + dyn.num);  % start all attached
motT = [1*ones(1,kin.num),2*ones(1,dyn.num)];  % Motor types
motS = [motor_type_ss(1)*ones(1,kin.num),motor_type_ss(2)*ones(1,dyn.num)];  % motor step sizes

cX = Test4b_cargo(motT,motA,motX,F,kin,dyn);  % call function to get initial cargo position
motF = Test4b_motF(motT,motX,motA,cX,kin,dyn);  % call function to get initial forces on each motor

Simu = struct;  %  Simu array records necessary information
Simu(1).motX = motX;     % motor position
Simu(1).motA = motA;     % motor attached / detached from MT
Simu(1).motF = motF;     % force on motor
Simu(1).motT = motT;     % type of motor
Simu(1).cX = cX; % cargo position
Simu(1).t(1) = 0; % simulation time

cc = 1;  % position & time index (counter)

Simu(1).Ks = zeros(kin.num + dyn.num,4);


%{ 
------------------  FLOW CHART OF THE CODE  ------------------------

 1. If at least one motor is bound on MT
   2. Obtain kinetic rates of each motor ->  Ks = setRates(mm,vel,motT,motA,motF,Ks,dyn,kin)
   3. Obtain dwell time by summing up Ks -> Dw = (1/sum(sum(Ks)))*log(1/rand(1))
   4. Get the probability based on Ks -> for ii = 1:size(Ks,1)
   5. Assign random number R, and find which motor and which event happens
   next -> R = rand(1).... motnum = ceil(Pr/4);
   6. Obtain new motor position and attachment status -> simEvent(motnum,ratenum,motX,motA,motS,cX,pfs)
   7. Update vectors 
   8. If at least one motor is bound on MT and the simulation time is less
      than 5s, then go back to 1. If one of the above is not satisfied, proceed to 9
 9. Terminate the simulation and the function tOhashi28WHJF

--------------------------------------------------------------------------
%}

AttachCounter = 1; % run until all motors detach from MT

while AttachCounter == 1 % while at least one motor is attached to the MT
    if sum(Simu(end).motA) > 0  
        Ks = zeros(kin.num + dyn.num,4); % empty matrix to store [kattach, kdetach, kfor, kback]
        
        for mm = 1:length(motT)
            Ks = setRates(mm,motT,motA,motF,Ks,dyn,kin,cat); % CALL FUNCTION TO OBTAIN THE KNETICS OF kattach, kdetach, kfor, kback
            if motA(mm) == 0  % if a motor is detached, make motor position = cargo position
                motX(mm) = cX; % position of the motor is right under the cargo. Doesnt mess up forces on the motor, bc its dependent on cX, and cX is dependent on motX
            end
        end
        
        Dw = (1/sum(sum(Ks)))*log(1/rand(1)); % Gillespie Algorithm; Ks is used to obtain the dwell time
        Pmode_counter = 1; % coutner for Pmode, Probabililty of the motor's mode
        Pcount = 1; % counter for probability
        Pmode = zeros(1,size(Ks,1)*size(Ks,2)); % Empty matrix for the storing the probability of Ks
        
        for ii = 1:size(Ks,1) % calculate the probability of the next mode based on the kinetics
            for jj = 1:size(Ks,2)
                Pmode(Pcount) = Ks(ii,jj) / sum(sum(Ks)); % calculate probability
                if Pcount > 1 
                    if Pmode(Pcount) ~= 0 % however, if the probability was zero, dont assign the previous probability in the empty matrix
                        Pmode(Pcount) = Pmode(Pcount) + Pmode(Pcount-Pmode_counter);
                        Pmode_counter = 1; 
                    else % if there was some probability, aka there was some kinetic valueif there is another probability to calculate, add the previous probability so that sum(all Prob) = 1;
                        Pmode(Pcount) = 0; % if its zero, keep it zero, add a counter for ~= 0
                        Pmode_counter = Pmode_counter + 1;
                    end
                end
                Pcount = Pcount + 1;
            end
        end
        R = rand(1);
        Pr = find(R < Pmode,1); % find where the random number from 0<R<1 falls within the assigned probability
        ratenum = rem(Pr,4); % find ratenum, 1=attaches, 2=detaches, 3=8nm forward, 4=8nm backward 
        if ratenum == 0
            ratenum = 4;
        end
        motnum = ceil(Pr/4); % find which motor's mode 

        [motX,motA] = simEvent(motnum,ratenum,motX,motA,motS,cX,pfs); % execute the mode of the motor
   
        if sum(motA) > 0 % if any of the motors are attached, then get cX, motF
            cX = Test4b_cargo(motT,motA,motX,F,kin,dyn); % cX = CARGO POSITION, UPDATE CARGO POSITION BASED ON INDIVIDUAL MOTOR POSITION
            motF = Test4b_motF(motT,motX,motA,cX,kin,dyn); % OBTAIN FORCE ACTING ON INDIVIDUAL MOTOR BASED ON THEIR POSITION
        end

        % UPDATE THE VARIABLES INTO THE STRUCTURE
        Simu(cc+1).motX = motX;%
        Simu(cc+1).motA = motA;%
        Simu(cc+1).motF = motF;%
        Simu(cc+1).motT = motT;% 
        Simu(cc+1).cX = cX;%
        Simu(cc+1).t = Simu(cc).t + Dw;
        cc = cc + 1;
         
    else 
        AttachCounter = 0;
    end
    if Simu(end).t >= 5; % IF RUN TIME IS OVER 10 SEC, TERMINATE THE CODE
        AttachCounter = 0;
        Simu(end).t = 5;
    end
end

% Simu(cc).t= 50;
end

%% setRates

%  This function takes motor positions, forces, and statuses and       %%
%  calculates rate constants based on current conditions of each motor %%

function Ks = setRates(mm,motT,motA,motF,Ks,dyn,kin,cat)
cat;
kon=5; % 1/s

switch motT(mm)
    % it's a kinesin (motor type (motT(mm)) = 1  %
    case 1  % if motor is a kinesin (motT=1)
        % if motor is detached, set on rate
        if motA(mm) == 0
            % on rate
            Ks(mm,1) = kon;
            % off rate
            Ks(mm,2) = 0;
            % rate at which it steps forward
            Ks(mm,3) = 0;
            % rate at which it steps backward
            Ks(mm,4) = 0;
            
            % if motor is attached
        else
            [kfor,kback] = getRates(kin,mm,motF);
            % set on rate to zero since its already on
            Ks(mm,1) = 0;
            
            % define forward stepping rate
            Ks(mm,3) = kfor;
            
            % define the backward stepping rate
            Ks(mm,4) = kback;
            
            % define the off rate
            kdet = getkdet(kin,dyn,motT,motF,motA,mm,Ks,cat);
            Ks(mm,2) = kdet;
            
        end
        
        % it's a dynein (not well defined yet)
    case 2
        % negate the force because it prefers to walk to the (-) end
        motF(mm) = -1*motF(mm);
        % if motor is detached
        if motA(mm) == 0
            % on rate
            Ks(mm,1) = kon;
            % off rate zero since it's already detached
            Ks(mm,2) = 0;
            % rate at which it steps forward
            Ks(mm,3) = 0;
            % rate at which it steps backward
            Ks(mm,4) = 0;
            
            % if motor is attached
        else
            % set on rate to zero since its already on
            Ks(mm,1) = 0;
            
            %  YILDIZ DYNEIN
            %
            %             if motF(mm) < (-3+dyn.Fs-4.8/1.8)
            %                 Ks(mm,3) = 370.8/8;
            %                 Ks(mm,4) = 0;
            %             elseif motF(mm) < dyn.Fs
            %                 Ks(mm,3) = abs((1.8*60.507*(exp(-1.8* (motF(mm)-(dyn.Fs-4.8/1.8)) / 4.114))*( 1- exp((-4.8+1.8*(motF(mm)-(dyn.Fs-4.8/1.8)))/4.114)))/8);
            %                 Ks(mm,4) = 0;
            % %             elseif motF(mm) = dyn.Fs
            % %                  Ks(mm,3) = abs((1.8*60.507*(exp(-1.8* (motF(mm)-(dyn.Fs-4.8/1.8)) / 4.114))*( 1- exp((-4.8+1.8*(motF(mm)-(dyn.Fs-4.8/1.8)))/4.114)))/8);
            % %                  Ks(mm,4) = Ks(mm,3);
            %             else
            %                 Ks(mm,3) = 0;
            %                 Ks(mm,4) = abs((1.8*60.507*(exp(-1.8* (motF(mm)-(dyn.Fs-4.8/1.8)) / 4.114))*( 1- exp((-4.8+1.8*(motF(mm)-(dyn.Fs-4.8/1.8)))/4.114)))/8);
            %             end
            
            kforF0 = 318/9; % 318/9 1/s, 212 nm/s @ 0pN || 8*(kfor-kback) = 212nm
            if motF(mm) <= 0; % if it is an assiting load
                Ks(mm,3) = kforF0; % kfor
            elseif motF(mm) < 4/3*dyn.Fs; % if it is hindering load
                Ks(mm,3) = kforF0*(1 - 3/4*motF(mm)/dyn.Fs);
            else
                Ks(mm,3) = 0;
            end
            
            Ks(mm,4) = 0.25*kforF0; % Vale Gennerich 2007, Cell: Fig s17
            Ks(mm,2) = getkdet(kin,dyn,motT,motF,motA,mm,Ks,cat);
            
        end  
end 

end

%% simEvent
% This function finds new motor position/ state

function [motX,motA] = simEvent(motnum,ratenum,motX,motA,motS,cX,pfs)

switch ratenum
    case 1      % attach that motor to the microtubule if it is a kon
        motA(motnum) = 1;
        motX(motnum) = pfs*round((cX + pfs*round(3*randn))/pfs);
        motX(motnum) = pfs*round(cX/pfs);
    case 2      % detach that motor from the microtubule if it is a koff
        motA(motnum) = 0;
        motX(motnum) = cX;
        
    case 3      % step that motor forward if it is forward stepping rate
        motX(motnum) = motX(motnum) + motS(motnum);
    case 4      % step that motor backward if it is a backward stepping rate
        motX(motnum) = motX(motnum) - motS(motnum);
end

end

%% getRates
% Get the kinetic rates for motors

function [kfor,kback] = getRates(kin,mm,motF)

if motF(mm) <= 0 % if assisting load, assume k= k(F=0). k maximized at F=0
    motF(mm) = 0;
end

switch kin.type
    case 1 % Andreasson kin1
        k2 = 2753;  k3 = 99;    delta = 3.6;
        kback = 0.03*motF(mm)*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3))/4;
        kfor = (k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3));
    case 2 % Andreasson kif3a
        k2 = 530;   k3 = 68;    delta = 1.1;
        k5 = 23.5;
        kstep = 1.03*(k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3));
        kfor = 1.03*kstep;
        kback = 0.03*(k5+k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3)); % constant
    case 3 % Andreasson kif3b
        k2 = 1730;  k3 = 81.2;    delta = 2.8;
        kstep = (k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3));
        kfor = 1.08*kstep;
        kback = 0.08*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3)); % constant
    case 4 %kif3a/b
        delta = 2.25; k2 = 1469; k3 = 66.76;
        kback = 0.06*motF(mm)*(k2*k3*exp(-4*delta/4.114)/(k2*exp(-4*delta/4.114) + k3))/4;
        kfor = k2*k3*exp(-motF(mm)*delta/4.114)/(k2*exp(-motF(mm)*delta/4.114) + k3);
        
end

end

%% getPdet
% Find whether the motor detaches, based on kdet

function koff = getkdet(kin,dyn,motT,motF,motA,mm,Ks,cat)
RL = 0;
counter_koff = 0;
counter_RL = 0;

if motT(mm) == 1 % if the motor is a kinesin
    switch kin.type
        case 1 % Andreasson kin1
            if motF(mm) < 0 % Assiting load, +end of MT
                Lo = 87; deltaL = 0.27; % Milic, PNAS, 2014
            else
                Lo = 1203;  deltaL = 2.3; % Andreasson, CurrentBiology, 2015
            end
            
        case 2 % Andreasson kif3a
            Lo = 182;   deltaL = 1.7;
        case 3 % Andreasson kif3b
            Lo = 182;   deltaL = 1.7;
            
        case 4 %kif3a/b
            if motF(mm) < 0
                kdet = 15*exp(abs(motF(mm))/2); % Theoretical RL => (kfor - kback)*8 / koff
                counter_koff = 1;
                counter_RL = 1;
            elseif motF(mm) < 1
                RL = 380*exp(-1*abs(motF(mm))/0.86754); %-F*deltaL/4.114, detal = 3.5691.
                counter_RL = 1;
            else
                Lo = 182; deltaL = 1.7;
            end
    end
    
else % if the motor is a dynein
    koff0 = 1; % kunwar PNAS
    if dyn.catch == 0
        kdet = koff0*exp(abs(motF(mm))/(dyn.Fd));
    else
        if motF(mm) < dyn.Fs
            kdet = koff0*exp(abs(motF(mm))/(0.87*dyn.Fs/1.25));
        else
            kdet = 1/(0.254*(1-exp(-motF(mm)*1.25/(1.97*dyn.Fs))));
        end
    end
    
    counter_koff = 1;
    counter_RL = 1;
end

if counter_RL == 0
%     disp(motF(mm));
    RL = (Lo*exp(-abs(motF(mm))*deltaL/4.114));
%     disp(RL)
end

if counter_koff == 0
    kdet = 8*abs(Ks(mm,3)-Ks(mm,4))/RL;
end

koff = kdet;

% line added 01.28.17; 
% if only one motor attached, then dont detach so it can go thru 3s to get
% Deff
if cat == 2 % if the category is 2, if you want to get apparent diffusion, so we want fixed t
    if sum(motA) == 1
        koff = 0;
    end
end

end

%% Get cargo position
function cX = Test4b_cargo(motT,motA,motX,F,kin,dyn)

%  Commented 3/21/15 by WOH  %

% First, set counters to zero
m = 0;   % number of attached kinesins
n = 0;   % number of attached dyneins
xk = 0;  % used to sum up kinesin positions for spring calculation
xd = 0;  % used to sum up dynein positions for spring calculation
         % motX is position of motor mm that is passed in function call
         
for mm = 1:length(motT)  % go through every motor, motT is type
    switch motT(mm)
        case 1  % if it's a kinesin
            if motA(mm) == 1  % if the motor is attached
                xk = xk + motX(mm);  % sum up kinesin positions (will subtract m*cX later)
                m = m + 1;           % increment counter of attached motors
            end
        case 2  % if it's a dynein
            if motA(mm) == 1  % if the motor is attached
                xd = xd + motX(mm);  % sum up dynein positions (will subtract m*cX later)
                n = n + 1;           % increment counter of attached motors
            end
    end
end

%  If there are no kin or dyn attached, this function should not be called
%  This code detects that and returns before a zero denominator error

if m+n==0
    display('m+n=0 in denominator, cargo_pos_hookean')
    return
end

%  *** Debugging code 3/21 WH  ***
%  display('cX in cargo_pos_hookean after calculation')

%  Calculate new cargo position based on all motor positions  %
cX = (-F + kin.spr*xk + dyn.spr*xd)/(m*kin.spr + n*dyn.spr);
cX = round(cX,3); % fix matlab bug where cX(numerator) / cX(den) ~=1 when motnum = 1. Bug shows 1.0000000004. This messes up kinetic 

end

%%  Get motor forces
%  This function takes new cargo position and motor positions  %%
%  and calculates force on each motor using hookean springs    %%

function [motF] = Test4b_motF(motT,motX,motA,cX,kin,dyn)
motF = zeros(1,length(motT));
% display(motX)
% display(cX)
for mm = 1:length(motT)
    switch motT(mm)
        case 1
            motF(mm) = kin.spr*motA(mm)*(motX(mm) - cX); % +ive = hindering, -ive = assiting
        case 2
            motF(mm) = dyn.spr*motA(mm)*(motX(mm) - cX); % +ive = assisting, -ive = hindering
    end
end


end






