function varargout = inventory(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inventory_OpeningFcn, ...
                   'gui_OutputFcn',  @inventory_OutputFcn, ...
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

function inventory_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = inventory_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
global gpath;
dos(['explorer ', gpath,'Patients_Data']);


function pushbutton3_Callback(hObject, eventdata, handles)
global gpath;
dos(['explorer ', gpath,'Patients_Responses']);

function pushbutton4_Callback(hObject, eventdata, handles)
close(inventory);
