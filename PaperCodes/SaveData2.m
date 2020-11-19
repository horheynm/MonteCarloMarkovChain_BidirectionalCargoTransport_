function SaveData2(kin,dyn,A,D,E,emp,cat)

A;D;E;emp;
if kin.type == 1
    kt = 1;
else
    kt = 2;
end

n = sprintf('%dk%dd%dt%dc%d',kin.num,kt,dyn.num,dyn.type,dyn.catch);
n2 = sprintf('%dk%dd%dt%dc%dFs%2.0fFd%2.0fcat%d',kin.num,kt,dyn.num,dyn.type,dyn.catch,dyn.Fs*100,dyn.Fd*100,cat);

if cat == 1
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017_2/data/emp2/');
elseif cat == 2
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017_2/data/diff2/');
elseif cat == 3
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017_2/data/trace2/');
elseif cat == 4
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017_2/data/opt2/');
elseif cat == 5
    pathname = fileparts('/Volumes/Seagate/BiophysPaper2017_2/data/kinvsdyn/');
end


f = fullfile(pathname,n);
if exist(f,'dir') == 0
    mkdir(pathname,n)
end

f2 = fullfile(f,n2);
save(f2)
% if exist(f2,'file')

end
