function varargout = patient_Info(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @patient_Info_OpeningFcn, ...
                   'gui_OutputFcn',  @patient_Info_OutputFcn, ...
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

function patient_Info_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% first_name = '';
% last_name = '';
code = '';
%hearing_status = 'NH';
SNR_level = 0;
% set(handles.edit4,'String',first_name);
% set(handles.edit5,'String',last_name);
set(handles.edit1,'String',code);
set(handles.edit3,'String',SNR_level);
guidata(hObject, handles);

function varargout = patient_Info_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton3_Callback(hObject, eventdata, handles)
global xlsname row_num opflag cmpnum gpath npflag pname pname2;
% fn = get(handles.edit4,'String');
% ln = get(handles.edit5,'String');
subj = get(handles.edit1,'String');
snrlv = str2num(get(handles.edit3,'String'));
hs = getCurrentPopupString(handles.popupmenu1);
lt = getCurrentPopupString(handles.popupmenu2);
if strcmp(subj,'') 
        msgbox('Please provide subject code');
else
    npflag = 1;
    
    
    pname = [hs,'_',subj];
    x = char(pname);
%     mkdir([gpath,'\Patients_Responses\',lt,'\'],x);
%     mkdir([gpath,'\Patients_Responses\',lt,'\',x],'FM Recordings');
%     mkdir([gpath,'\Patients_Responses\',lt,'\',x],'Original Recordings');
    
    pname2 = lt;
    xlsname = [gpath, 'Patients_Data\',lt,'\',hs,'_',subj,'.xls'];
	xlswrite(xlsname,[{'Subject'},{'SNR'},{'Technologies'},{'Status'};{subj},{snrlv},{lt},{hs}]);
    wrang ='A5:N5';
    xlswrite(xlsname,[{'Noise Type'},{'Noise Level'},{'List Number'},{'Average Score'},{'Average Confidence Level'},{'Rating'},{'Sentence No'}, ...
    {'HINT Sentence'},{'Response'},{'Total Words'},{'Score'},{'Confidence'},{'Confidence Value'},{'Date'}], 'Sheet1',wrang);
    row_num = 6;     
    xlswrite(xlsname,row_num,2);
    opflag = 0;
    cmpnum=[];
    close(patient_Info);
end

function pushbutton4_Callback(hObject, eventdata, handles)
code = '';
SNR_level = 0;
% set(handles.edit4,'String',first_name);
% set(handles.edit5,'String',last_name);
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',1);
set(handles.edit1,'String',code);
set(handles.edit3,'String',SNR_level);

function popupmenu1_KeyPressFcn(hObject, eventdata, handles)
function popupmenu1_ButtonDownFcn(hObject, eventdata, handles)

function popupmenu2_Callback(hObject, eventdata, handles)
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
