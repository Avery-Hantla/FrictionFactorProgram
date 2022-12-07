list = {'Colebrook Formula','Holland Equation','Blasius Formula','Laminar Flow',"Von Karman Equation","Swamee and Jain formula","Haaland formula","Churchill formula"};
[indx,~] = listdlg('PromptString',{'Select a formula to use'},'SelectionMode','single','ListString',list);

list = {'Yes','No'};
[indx2,~] = listdlg('PromptString',{'Do you know Reynolds number?'},'SelectionMode','single','ListString',list);

if indx2 == 2 
    prompt = 'What is the density?';
    p = inputdlg(prompt);
    p = cell2mat(p);
    p = str2num(p);

    prompt = 'What is the velocity?';
    V = inputdlg(prompt);
    V = cell2mat(V);
    V = str2num(V);

    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);
    D = cell2mat(D);
    D = str2num(D);

    prompt = 'What is the viscosity?';
    u = inputdlg(prompt);
    u = cell2mat(u);
    u = str2num(u);

    Re = (p*V*D)/u
elseif indx2 ==1 
    prompt = 'What is Reynolds number?';
    Re = inputdlg(prompt);
    Re = cell2mat(Re);
    Re = str2num(Re);
end

if indx == 1 
%Colebrook formula
    prompt = 'What is epsilon?';
    e = inputdlg(prompt);

    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);

    e = cell2mat(e);
    D = cell2mat(D);
    e = str2num(e);
    D = str2num(D);
    
    z = colebrookform(0.025,e,D,Re);

    for x = 1:10
       colebrookform(z,e,D,Re);
    end

    colebrookform(z,e,D,Re)

elseif indx == 2 
%Holland Equation
    prompt = 'What is epsilon?';
    e = inputdlg(prompt);

    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);

    e = cell2mat(e);
    D = cell2mat(D);
    e = str2num(e);
    D = str2num(D);
    f = (1/(-1.8*log10(((e/D)/3.7)^1.11 + 6.9/Re)))^2

elseif indx == 3 
% Blasius Formula
    f = 0.316/(Re^0.25)

elseif indx == 4 
% Laminar flow
    f = 64/Re

elseif indx == 5
% Von Karman
    prompt = 'What is epsilon?';
    e = inputdlg(prompt);
    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);
    e = cell2mat(e);
    D = cell2mat(D);
    e = str2num(e);
    D = str2num(D);

    f = 1/(4*(0.57 - (log10(e/D)))^2)

elseif indx == 6 
% Swamee and Jain formula
    prompt = 'What is epsilon?';
    e = inputdlg(prompt);
    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);
    e = cell2mat(e);
    D = cell2mat(D);
    e = str2num(e);
    D = str2num(D);

    f = 0.25/((log10((e/(3.7*D))+5.74/Re^0.9))^2)
elseif indx == 7 
% Haaland formula
    prompt = 'What is epsilon?';
    e = inputdlg(prompt);
    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);
    e = cell2mat(e);
    D = cell2mat(D);
    e = str2num(e);
    D = str2num(D);

    f = 0.3086/(log10((6.9/Re)+(e/(3.7*D))^1.11))^2

elseif indx == 8 
% Churchill formula
    prompt = 'What is epsilon?';
    e = inputdlg(prompt);
    prompt = 'What is the diameter of the pipe?';
    D = inputdlg(prompt);
    e = cell2mat(e);
    D = cell2mat(D);
    e = str2num(e);
    D = str2num(D);

    A = (-2.457*log((7/Re)^0.9+(e/(3.7*D))))^16;
    B = (37530/Re)^16;
    f = 8*(((8/Re)^12)+(1/(A+B)^1.5))^(1/12)
end

function z = colebrookform(f,e,D,Re)
 z =  (1/(-2*log10(((e/D)/3.7)+(2.51/(Re*sqrt(f))))))^2;
end

