function edit = getEdit(kin,dyn)
% MAX RN: edit = 37; 04/05/17

if kin.num == 1 && dyn.num == 1 % 1:1
    edit = 1;
elseif kin.num == 1 && dyn.num == 2
    edit = 2;
elseif kin.num == 1 && dyn.num == 3
    edit = 3;
elseif kin.num == 1 && dyn.num == 4
    edit = 4;
elseif kin.num == 1 && dyn.num == 5
    edit = 5;
elseif kin.num == 1 && dyn.num == 6
    edit = 6;
elseif kin.num == 1 && dyn.num == 7
    edit = 7;
elseif kin.num == 1 && dyn.num == 8
    edit = 8;
elseif kin.num == 1 && dyn.num == 9
    edit = 9;
elseif kin.num == 1 && dyn.num == 10
    edit = 10;
elseif kin.num == 1 && dyn.num == 11
    edit= 37;
end

if kin.num == 1 && dyn.num == 0 % 1:0
    edit = 11;
elseif kin.num == 0 && dyn.num == 1 % 1:0
    edit = 12;
end

% 2 kin, n dyn
if kin.num == 2 && dyn.num == 1 % 1:1
    edit = 13;
elseif kin.num == 2 && dyn.num == 2
    edit = 14;
elseif kin.num == 2 && dyn.num == 3
    edit = 15;
elseif kin.num == 2 && dyn.num == 4
    edit = 16;
elseif kin.num == 2 && dyn.num == 5
    edit = 17;
elseif kin.num == 2 && dyn.num == 6
    edit = 18;
elseif kin.num == 2 && dyn.num == 7
    edit = 19;
elseif kin.num == 2 && dyn.num == 8
    edit = 20;
elseif kin.num == 2 && dyn.num == 9
    edit = 21;
elseif kin.num == 2 && dyn.num == 10
    edit = 22;
end

% 3 kin, n dyn
if kin.num == 2 && dyn.num == 0 
    edit = 23;
elseif kin.num == 0 && dyn.num == 2 
    edit = 24;
end

if kin.num == 3 && dyn.num == 1 
    edit = 25;
elseif kin.num == 3 && dyn.num == 2
    edit = 26;
elseif kin.num == 3 && dyn.num == 3
    edit = 27;
elseif kin.num == 3 && dyn.num == 4
    edit = 28;
elseif kin.num == 3 && dyn.num == 5
    edit = 29;
elseif kin.num == 3 && dyn.num == 6
    edit = 30;
elseif kin.num == 3 && dyn.num == 7
    edit = 31;
elseif kin.num == 3 && dyn.num == 8
    edit = 32;
elseif kin.num == 3 && dyn.num == 9
    edit = 33;
elseif kin.num == 3 && dyn.num == 10
    edit = 34;
end

if kin.num == 3 && dyn.num == 0 
    edit = 35;
elseif kin.num == 0 && dyn.num == 3
    edit = 36;
end

if kin.num == 4 && dyn.num == 1
    edit = 37;
elseif kin.num == 5 && dyn.num == 1
    edit = 38;
elseif kin.num == 6 && dyn.num == 1
    edit = 39;
elseif kin.num == 7 && dyn.num == 1
    edit = 40;
elseif kin.num == 8 && dyn.num == 1
    edit = 41;
elseif kin.num == 9 && dyn.num == 1
    edit = 42;
elseif kin.num == 10 && dyn.num == 1
    edit = 43;
end

if kin.num == 4 && dyn.num == 2
    edit = 44;
elseif kin.num == 5 && dyn.num == 2
    edit = 45;
elseif kin.num == 6 && dyn.num == 2
    edit = 46;
elseif kin.num == 7 && dyn.num == 2
    edit =47;
elseif kin.num == 8 && dyn.num == 2
    edit = 48;
elseif kin.num == 9 && dyn.num == 2
    edit = 49;
elseif kin.num == 10 && dyn.num == 2
    edit = 50;
end

if kin.num == 4 && dyn.num == 3
    edit = 51;
elseif kin.num == 5 && dyn.num == 3
    edit = 52;
elseif kin.num == 6 && dyn.num == 3
    edit = 53;
elseif kin.num == 7 && dyn.num == 3
    edit = 54;
elseif kin.num == 8 && dyn.num == 3
    edit = 55;
elseif kin.num == 9 && dyn.num == 3
    edit = 56;
elseif kin.num == 10 && dyn.num == 3
    edit = 57;
end

if kin.num == 0 && dyn.num == 2
    edit = 58;
elseif  kin.num == 0 && dyn.num == 3
    edit = 59;
elseif  kin.num == 0 && dyn.num == 4
    edit = 60;
elseif  kin.num == 0 && dyn.num == 5
    edit = 61;
elseif  kin.num == 0 && dyn.num == 6
    edit = 62;
elseif  kin.num == 0 && dyn.num == 7
    edit = 63;
elseif  kin.num == 0 && dyn.num == 8
    edit = 64;
elseif  kin.num == 0 && dyn.num == 9
    edit = 65;
elseif  kin.num == 0 && dyn.num == 10
    edit = 66;
end
if kin.num == 5 && dyn.num == 5
    edit = 67;
elseif kin.num == 5&& dyn.num == 10
    edit = 68;
elseif kin.num == 10 && dyn.num == 5
    edit = 69;
elseif kin.num == 10 && dyn.num == 10
    edit = 70;
    
end

end

