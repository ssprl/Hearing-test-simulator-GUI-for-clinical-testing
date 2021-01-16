function varargout = selectFiles(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selectFiles_OpeningFcn, ...
                   'gui_OutputFcn',  @selectFiles_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function selectFiles_OpeningFcn(hObject, eventdata, handles, varargin)
setPosition(4,4);
handles.output = hObject;
cmpinfo = {'Babble 10dB   ','Babble 5dB  ','Babble 0dB   ','Babble -5dB  ','Machinery 10dB   ','Machinery 5dB   ',...
    'Machinery 0dB   ','Machinery -5dB   ','Traffic 10dB   ','Traffic 5dB   ','Traffic 0dB   ','Traffic -5dB   '};
displaystr='Complete: ';
global opflag cmpnum;
if opflag == 1
    for n = 1:length(cmpnum)
        displaystr = [displaystr,char(cmpinfo{cmpnum(n)})];
    end
    d{1} = displaystr;
    set(handles.text5,'String',d,'FontSize',12);
else
%     set(handles.text5,'String','This is a new patient\n','FontSize',12);
    for n = 1:length(cmpnum)
        displaystr = [displaystr,char(cmpinfo{cmpnum(n)})];
    end
    d{1} = displaystr;
    set(handles.text5,'String',d,'FontSize',12);
end
guidata(hObject, handles);


function varargout = selectFiles_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function uipanel1_CreateFcn(hObject, eventdata, handles)
global noisetype noiselevel list_no typestring levelstring;
noisetype = 1;
noiselevel = 2;
list_no = 1;
levelstring = '5dB';
typestring = '15';

function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
global noisetype typestring;
newButton=get(eventdata.NewValue,'tag');
switch newButton
     case 'radiobutton10'
         noisetype = 1;
         typestring = '15';
          
     case 'radiobutton11'
        noisetype = 2;
        typestring = '20';
     
     case 'radiobutton12'
        noisetype = 3;
        typestring = '25';
     
    case 'radiobutton13'
        noisetype = 4;
        typestring = '30';
end

function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
newButton=get(eventdata.NewValue,'tag');
global noiselevel levelstring;
switch newButton
    case 'radiobutton4'
        levelstring = '10dB';
        noiselevel = 1;                 
    case 'radiobutton5'
        levelstring = '5dB';
        noiselevel = 2;
    case 'radiobutton8'
        levelstring = '0dB';
        noiselevel = 3;
    case 'radiobutton9'
        levelstring = '-5dB';
        noiselevel = 4;         
end

function pushbutton1_Callback(hObject, eventdata, handles)
global list_no counter total_words total_correct;
list_str = getCurrentPopupString(handles.popupmenu1);
list_no = str2num(list_str);
counter = 0;
total_words = 0;
total_correct = 0;
close(selectFiles);

function text5_CreateFcn(hObject, eventdata, handles)
