function varargout = old_patient(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @old_patient_OpeningFcn, ...
                   'gui_OutputFcn',  @old_patient_OutputFcn, ...
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

function old_patient_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
set(handles.listbox2,'string','','FontSize',12.0);
global techlist gpath;
techlist = 1;
 files = dir(fullfile([gpath,'Patients_Data/Study Hearing Aid/','*.xls']));
set(handles.listbox2,'string',{files.name},'FontSize',12.0);
guidata(hObject, handles);

function varargout = old_patient_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function listbox2_Callback(hObject, eventdata, handles)

function listbox2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
global xlsname row_num opflag cmpnum techlist gpath pname pname2;
index_selected = get(handles.listbox2,'Value');
pnames = get(handles.listbox2,'String');
xlsname =char(pnames(index_selected));
temp = strsplit(xlsname,'.');
pname = temp(1);
switch techlist
    case 1
        xlsname = [gpath,'Patients_Data\Study Hearing Aid\',xlsname];
        pname2 = 'Study Hearing Aid';
    case 2
        xlsname = [gpath,'Patients_Data\Phonak Hearing Aid\',xlsname];
        pname2 = 'Phonak Hearing Aid';
    otherwise
        msgbox('Please Select the Patient Info');
end
% display(xlsname);
opflag = 1;
row_num = xlsread(xlsname,2);
try
    cmpnum = xlsread(xlsname,3);
end
close(old_patient);

function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
function radiobutton3_Callback(hObject, eventdata, handles)
function radiobutton4_Callback(hObject, eventdata, handles)

function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
newButton=get(eventdata.NewValue,'tag');
global techlist gpath;
switch newButton
    case 'radiobutton3'
         files = dir(fullfile([gpath,'Patients_Data/Study Hearing Aid/','*.xls']));
        set(handles.listbox2,'string',{files.name},'FontSize',12.0);
        techlist = 1;
    case 'radiobutton4'
         files = dir(fullfile([gpath,'Patients_Data/Phonak Hearing Aid/','*.xls']));        
        set(handles.listbox2,'string',{files.name},'FontSize',12.0);
        techlist = 2;
end

function pushbutton2_Callback(hObject, eventdata, handles)
close(old_patient);
