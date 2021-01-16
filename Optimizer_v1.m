function varargout = Optimizer_v1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Optimizer_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @Optimizer_v1_OutputFcn, ...
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

function Optimizer_v1_OpeningFcn(hObject1, eventdata, handles1, varargin)
setPosition(5,6);
global fw1 sposition gpath npflag opflag freq devid1 devid2 freq2;
% sposition = [1 1 1600 1200]; % initial sposition
% sposition = [2222 88 1280 1024]; % this lab pc position accordign to thiblab position
sposition = [1281 1 1280 1024]; %thiblab sposition
gpath = ['C:\Users\thiblab\Documents\MATLAB\Optimizer_May_2_2016\'];
% gpath = 'C:\Users\thiblab\Documents\MATLAB\';
freq = 44100;
freq2 = 44100;
devid1 = 0;
devid2 = 2;
npflag = 0;
opflag = 0;
handles1.output = hObject1;
logo = imread('logo.png');
imshow(logo,'Parent',handles1.axes1);
fw1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
plotset();
% w1 = imread('w1.png');
% image(w1);
a1 = 'Please relax while we setup the';
a2 = 'condition';
a3 = 'When we are ready, you will see a';
a4 = 'prompt to begin';
text(0,0.7,a1,'fontsize',45,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0,0.6,a2,'fontsize',45,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0,0.4,a3,'fontsize',45,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0,0.3,a4,'fontsize',45,'FontWeight','Bold','FontName','Arial','Clipping','off');
% try
%     winopen([gpath,'Start_Relay.bat']);
% end
guidata(hObject1, handles1);

function varargout = Optimizer_v1_OutputFcn(hObject1, eventdata, handles1) 
varargout{1} = handles1.output;

function pushbutton1_Callback(hObject1, eventdata, handles1)
patient_Info_handle=patient_Info;

function pushbutton2_Callback(hObject1, eventdata, handles1)
global f1 fw1 sposition opflag npflag;
if (opflag==0 && npflag==0)
    msgbox('Please enter New Patient information or select an Old Patient');
else
    try 
        close(fw1);
    end
    f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
        plotset();
    % w7 = imread('w7.png');
    % image(w7);
    a1 = 'This will be your Regular Session';
    a3 = 'Are you Ready ?';
    a4 = 'Please say YES or NO';
    text(0,0.7,a1,'fontsize',45,'FontWeight','Bold','FontName','Arial','Clipping','off');
    text(0.5,0.5,a3,'fontsize',45,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
    text(0.5,0.35,a4,'fontsize',45,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
    StartTest_handle = StartTest;
end

function pushbutton3_Callback(hObject1, eventdata, handles1)
old_patient_handle=old_patient;
old_patient_data_handle = guidata(old_patient_handle);

function pushbutton4_Callback(hObject1, eventdata, handles1)
practice_handle=practice;
global f1 fw1 sposition ;
try 
    close(fw1);
end
f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
plotset();
% w2 = imread('w2.png');
% image(w2);
a1 = 'This will be your Practice Session to';
a2 = 'get familiar with the process';
a3 = 'Are you Ready ?';
a4 = 'Please say YES or NO';
text(0,0.7,a1,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0,0.6,a2,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0.5,0.4,a3,'fontsize',45,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
text(0.5,0.25,a4,'fontsize',45,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');

function pushbutton5_Callback(hObject1, eventdata, handles1)
inventoru_handle = inventory;

function pushbutton6_Callback(hObject1, eventdata, handles1)
try 
%     clear all;
    close all force;
end
function pushbutton1_KeyPressFcn(hObject1, eventdata, handles1)
function pushbutton1_CreateFcn(hObject1, eventdata, handles1)
function pushbutton8_Callback(hObject, eventdata, handles)
Calibration_handle=Calibration;

function pushbutton9_Callback(hObject, eventdata, handles)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
