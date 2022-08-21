%% kin1,dyn empirical det/attach rate vs Fd

% kd emp vs Fd

clear;clc;close all; format shortG

cat = 1;        % do not change
kin.num = 1;        
kin.type = 2;

dyn.num = 1;
dyn.type = 1;   % do not change
dyn.catch = 0;  % Do not change

ek = struct; v = struct;
c=1; c2=1; N = 0:10;
 
tic
for Fs = 1:8
    dyn.Fs = Fs;
    for Fd = 1:8
        dyn.Fd = Fd;
        if kin.type == 4
            kin.type =2;
        end
        n = sprintf('%dk%dd%dt%dc%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch);
        n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kin.type,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);
        
        if cat == 1
            pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/emp2/');
        elseif cat == 2
            pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/diff2/');
        elseif cat == 3
            pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/trace2/');
        elseif cat == 4
            pathname = fileparts('/Users/kazu/Desktop/export/data/n/');
        elseif cat == 5
            pathname = fileparts('/Volumes/Seagate/BiophysPaper2017/data/kinvsdyn/');
        end
        
        f = fullfile(pathname,n);
        f2 = fullfile(f,n2);
        load(f2)
        
        v(Fd).mv = A(1,5);
        v(Fd).mrl = A(2,5);
        [v,ek] = emptomatrix3(Fs,Fd,v,emp,ek);
        a(Fs,Fd) = ek(Fs,Fd).r(1,1); % Kinesin emp kdet
        b(Fs,Fd) = ek(Fs,Fd).r(1,2); % dyn emp kdet
        c(Fs,Fd) = ek(Fs,Fd).r(2,1); % kin kon
        d(Fs,Fd) = ek(Fs,Fd).r(2,2); % dyn kon
        
        fprintf('Fs=%d,Fd=%d, %1.0fmin %2.0fs,',Fs,Fd,floor(toc/60),rem(toc,60));
        cl = clock;
        fprintf('        %d:%d;%2.0f\n',cl(4),cl(5),cl(6));
        
    end
end

pathname1 = '/Volumes/Seagate/BiophysPaper2017/data/';
n = '/ek/';
f = fullfile(pathname1,n);
if exist(f,'dir') == 0
    mkdir(pathname1,n)
end

n3 = sprintf('%dk%dd%d_ek',kin.num,kin.type,dyn.num);
f2 = fullfile(f,n3);
sav2 = 1;
if sav2 == 1
save(f2)
end
