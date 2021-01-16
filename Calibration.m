function varargout = Calibration(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calibration_OpeningFcn, ...
                   'gui_OutputFcn',  @Calibration_OutputFcn, ...
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
function Calibration_OpeningFcn(hObject, eventdata, handles, varargin)     
handles.output = hObject;
global stopflag;
stopflag = 0;
set(handles.pushbutton9,'Enable','off');
guidata(hObject, handles);

function varargout = Calibration_OutputFcn(hObject, eventdata, handles) 
setPosition(3,3);
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class1B\10\Testing_Babble_10.wav']);
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Class1B_Easy_Calibration.wav']);
% sp = [ytemp(:,1),zeros(length(ytemp(:,1)),1)];
% sp = ytemp;
et = audioplayer(ytemp,Fs1);
play(et);


function pushbutton2_Callback(hObject, eventdata, handles)
% SPEECH
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\HINT_concated.wav']);
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Speech_Calibration.wav']);
% sp = [zeros(length(ytemp(:,2)),1),ytemp(:,2)];
sp = ytemp;
et = audioplayer(sp,Fs1);
play(et);

function pushbutton4_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class1B\5\Testing_Babble_5.wav']);
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Class1B_Hard_Calibration.wav']);
% sp = [ytemp(:,1),zeros(length(ytemp(:,1)),1)];
et = audioplayer(ytemp,Fs1);
play(et);

function pushbutton5_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class2M\10\Testing_Machinery_10.wav']);
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Class2M_Easy_Calibration.wav']);
% sp = [ytemp(:,1),zeros(length(ytemp(:,1)),1)];
et = audioplayer(ytemp,Fs1);
play(et);

function pushbutton6_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class2M\5\Testing_Machinery_5.wav']);
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Class2M_Hard_Calibration.wav']);
% sp = [ytemp(:,1),zeros(length(ytemp(:,1)),1)];
et = audioplayer(ytemp,Fs1);
play(et);

function pushbutton7_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class3T\10\Testing_DrivingCar_10.wav']);
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Class3T_Easy_Calibration.wav']);
% sp = [ytemp(:,1),zeros(length(ytemp(:,1)),1)];
et = audioplayer(ytemp,Fs1);
play(et);

function pushbutton8_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
% [ytemp,Fs1] = audioread([gpath,'TMB_database\Calibration\Class3T_Hard_Calibration.wav']);
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class3T\5\Testing_DrivingCar_5.wav']);
% sp = [ytemp(:,1),zeros(length(ytemp(:,1)),1)];
et = audioplayer(ytemp,Fs1);
play(et);

function pushbutton9_Callback(hObject, eventdata, handles)
global et stopflag;
stop(et);
set(handles.pushbutton1,'Enable','on');
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton4,'Enable','on');
set(handles.pushbutton5,'Enable','on');
set(handles.pushbutton6,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton8,'Enable','on');
set(handles.pushbutton11,'Enable','on');
set(handles.pushbutton12,'Enable','on');
set(handles.pushbutton13,'Enable','on');
set(handles.pushbutton14,'Enable','on');
set(handles.pushbutton15,'Enable','on');
set(handles.pushbutton16,'Enable','on');
stopflag = 1;

function pushbutton3_Callback(hObject, eventdata, handles)
global stopflag et;
    if stopflag ~=1
       try
            stop(et);
       end
        close(Calibration);
    else
        close(Calibration);
    end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class1B\0\Testing_Babble_0.wav']);
et = audioplayer(ytemp,Fs1);
play(et);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class1B\-5\Testing_Babble_-5.wav']);
et = audioplayer(ytemp,Fs1);
play(et);
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class2M\0\Testing_Machinery_0.wav']);
et = audioplayer(ytemp,Fs1);
play(et);
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class2M\-5\Testing_Machinery_-5.wav']);
et = audioplayer(ytemp,Fs1);
play(et);
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class3T\0\Testing_DrivingCar_0.wav']);
et = audioplayer(ytemp,Fs1);
play(et);
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global et stopflag gpath;
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton11,'Enable','off');
set(handles.pushbutton12,'Enable','off');
set(handles.pushbutton13,'Enable','off');
set(handles.pushbutton14,'Enable','off');
set(handles.pushbutton15,'Enable','off');
set(handles.pushbutton9,'Enable','on');
stopflag = 0;
[ytemp,Fs1] = audioread([gpath,'TMB_database\Class3T\-5\Testing_DrivingCar_-5.wav']);
et = audioplayer(ytemp,Fs1);
play(et);
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
