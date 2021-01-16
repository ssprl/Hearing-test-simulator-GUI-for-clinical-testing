function varargout = practice(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @practice_OpeningFcn, ...
                   'gui_OutputFcn',  @practice_OutputFcn, ...
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

function practice_OpeningFcn(hObject, eventdata, handles, varargin)
setPosition(8,6);
handles.output = hObject;
global counter ini_flag;
% display('ready');
guidata(hObject, handles);
ini_flag = 1;

if ini_flag==1
    ini_flag=0;
    set(handles.pushbutton6,'Enable','off');
    set(handles.pushbutton7,'Enable','on');
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton8,'Enable','off');
    set(handles.pushbutton14,'Enable','off');
    set(handles.pushbutton9,'Enable','off');
    set(handles.radiobutton1,'Enable','off');
    set(handles.radiobutton2,'Enable','off');
    set(handles.radiobutton3,'Enable','off');
    set(handles.popupmenu2,'Enable','off');
    set(handles.pushbutton5,'Enable','off');
    set(handles.pushbutton6,'Enable','off');
    set(handles.pushbutton16,'Enable','off');
    set(handles.pushbutton17,'Enable','off');
    set(handles.edit1,'Enable','off');
    set(handles.edit4,'Enable','off');
    set(handles.text24,'String','');
end

function varargout = practice_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
global counter f1 list_no sposition gpath; 
% display(counter);
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton5,'Enable','on');
set(handles.edit1,'Enable','on');
set(handles.text24,'String',num2str(counter+1));
try 
    close(f1);
end

f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
plotset();
% w3 = imread('w3.png');
% image(w3);
a1 = 'Listen';
a2 = 'Speak the sentence once you are done';
text(0.5,0.5,a1,'fontsize',60,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
text(0.5,0.35,a2,'fontsize',40,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
rootdir = [gpath,'HINT\'];
filename1 = [rootdir,'SegmentedHINTlist',num2str(list_no),'\HINTseg_L',num2str(list_no),'S',num2str(counter+1),'.wav'];
% display(filename1);
[ytemp,Fs1] = audioread(filename1);
% y = [zeros(length(ytemp(:,2)),1),ytemp(:,2)];

pause(1);
sound(ytemp,Fs1);
% sound(ytemp(:,2),Fs1);
% sound(y,Fs1);

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton5_Callback(hObject, eventdata, handles)
set(handles.pushbutton6,'Enable','on');
global f1 tt3 sposition;
handles.response = get(handles.edit1,'String');
tt1 = 'Please confirm that you said the';
tt2 = 'following sentence by saying Yes or No.';
tt3 = [handles.response];
try 
    close(f1);
end
f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
plotset();
text(0.5,0.7,tt1,'fontsize',38,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
text(0.5,0.6,tt2,'fontsize',38,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
text(0.5,0.4,tt3,'fontsize',40,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global counter list_no sposition;
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton14,'Enable','on');
set(handles.radiobutton1,'Enable','on');
set(handles.radiobutton2,'Enable','on');
set(handles.radiobutton3,'Enable','on');
global f1;
try 
    close(f1);
end
f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
plotset();
% w4 = imread('w4.png');
% image(w4);
a1 = 'Please say how confident you were';
a2 = 'that you repeated the sentence';
a3 = 'correctly.';
a4 = '1. Not Confident at all';
a5 = '   2. Somewhat Confident';
a6 = '3. Very Confident        ';
text(0,0.8,a1,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0,0.7,a2,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0,0.6,a3,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
text(0.5,0.40,a4,'fontsize',40,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
text(0.5,0.30,a5,'fontsize',40,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
text(0.5,0.20,a6,'fontsize',40,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');

function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
global confidence;
newButton=get(eventdata.NewValue,'tag');
set(handles.pushbutton14,'Enable','on');
switch newButton
      case 'radiobutton1'          
         confidence = 'Very Confident';
%          display(confidence);
     case 'radiobutton2'         
        confidence = 'Somewhat Confident';
%         display(confidence);
     case 'radiobutton3'         
        confidence = 'Not Confident at all';
%         display(confidence);
end

function uipanel6_CreateFcn(hObject, eventdata, handles)
global confidence;
confidence = 'Very Confident';

function pushbutton7_Callback(hObject, eventdata, handles)
selectFiles_handle=selectFiles;
selectFiles_data_handle = guidata(selectFiles_handle);
set(handles.pushbutton9,'Enable','on');

function pushbutton8_Callback(hObject, eventdata, handles)
global counter f1 typestring levelstring list_no tt3 confidence str score total_correct total_words xlsname C row_num orilength tt4;
% global conditions_counter;
global sposition;
score = str2num(get(handles.edit4,'String'));
if score<=max(orilength,length(tt4)) & score>=0
    total_correct = total_correct+score;
%     display(str);
%     display(tt3);
%     display(score);
    C{counter+1,6} = counter + 1;
    C{counter+1,7} = str;
    C{counter+1,8} = tt3;
    C{counter+1,9} = score;
    C{counter+1,10} = confidence;
    counter = counter + 1;
    set(handles.edit4,'String','');
    set(handles.edit1,'String','');
    set(handles.uitable1,'data','','FontSize',14,'ColumnWidth',{150},'RowStriping','off');
    set(handles.text20,'String','');
    set(handles.text21,'String','');
    set(handles.pushbutton8,'Enable','off');
    set(handles.edit4,'Enable','off');
    set(handles.pushbutton1,'Enable','on');
    set(handles.pushbutton5,'Enable','off');
    try 
        close(f1);
    end
%     f1 =  figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
%     plotset();
% %     w5=imread('w5.png');
%     %     image(w5);
%     a1 = 'Your responses have been recorded';
%     a2 = 'Are you ready for the next sentence ?';
%     a5 = 'Please say YES or NO';
%     text(0,0.6,a1,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
%     text(0,0.5,a2,'fontsize',40,'FontWeight','Bold','FontName','Arial','Clipping','off');
%     text(0.5,0.3,a5,'fontsize',40,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');

    if counter==10
        counter=0;
        try 
            close(f1);
        end
        set(handles.pushbutton7,'Enable','on');
        set(handles.pushbutton5,'Enable','off');
        set(handles.pushbutton1,'Enable','off');
        set(handles.popupmenu2,'Enable','off');
        set(handles.pushbutton16,'Enable','off');
        set(handles.text24,'String','');
         f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
         plotset();
%         w8 = imread('w8.png');
%         image(w8);
    a1 = 'Your practice session is over';        
    text(0.5,0.5,a1,'fontsize',45,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');            
        p = '';
        set(handles.edit1,'String',p);
%         display(counter);
         handles.activex2.controls.stop();
        choice = questdlg('The practice session is over. Do you want to continue ?','Exit Confirm','Yes','No','Yes');
        switch choice
            case 'No'                           
                close(practice);
            case 'Yes'
                try 
                    close(f1);
                end
                 f1 = figure('units','pixels','position',sposition,'menubar','none','numbertitle','off','resize','off');
                  plotset();
                %                  w9 = imread('w9.png');
                %                  image(w9);
                a1 = 'The practice session will start again';
                a3 = 'Are you Ready ?';
                a4 = 'Please say YES or NO';
                text(0,0.6,a1,'fontsize',35,'FontWeight','Bold','FontName','Arial','Clipping','off');
                text(0.5,0.4,a3,'fontsize',35,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');
                text(0.5,0.28,a4,'fontsize',35,'FontWeight','Bold','FontName','Arial','HorizontalAlignment','center','Clipping','off');                
        end
    end
else
    choice = questdlg('Please provide a valid score','Score','OK','OK');
    switch choice
    case 'OK'
        set(handles.edit4,'String','','FontSize',15.0);
    end
end


function pushbutton9_Callback(hObject, eventdata, handles)
global noisetype noiselevel gpath;
% global x;
rootdir = [gpath,'TMB_database\Noise Segments\'];
switch noisetype
    case 1
        dur = 15;
        updateAudio(dur);        
        switch noiselevel
            case 1
                filename=[rootdir 'SNR10.wav'];
            case 2
                filename=[rootdir 'SNR5.wav'];
            case 3
                filename=[rootdir 'SNR0.wav'];
            case 4
                filename=[rootdir 'SNR-5.wav'];
        end
%         if noiselevel == 1
%             filename=[filename,'Easy\','Class1B_Easy.wav'];
%         else
%             filename=[filename,'Hard\','Class1B_Hard.wav'];
%         end
    case 2
        dur = 20;
        updateAudio(dur);        
        switch noiselevel
            case 1
                filename=[rootdir 'SNR10.wav'];
            case 2
                filename=[rootdir 'SNR5.wav'];
            case 3
                filename=[rootdir 'SNR0.wav'];
            case 4
                filename=[rootdir 'SNR-5.wav'];
        end
%         if noiselevel == 1
%             filename=[filename,'Easy\','Class2M_Easy.wav'];
%         else
%             filename=[filename,'Hard\','Class2M_Hard.wav'];
%         end
    case 3
        dur = 25;
        updateAudio(dur);        
        switch noiselevel
            case 1
                filename=[rootdir 'SNR10.wav'];
            case 2
                filename=[rootdir 'SNR5.wav'];
            case 3
                filename=[rootdir 'SNR0.wav'];
            case 4
                filename=[rootdir 'SNR-5.wav'];
        end
    case 4
        dur = 30;
        updateAudio(dur);        
        switch noiselevel
           case 1
                filename=[rootdir 'SNR10.wav'];
            case 2
                filename=[rootdir 'SNR5.wav'];
            case 3
                filename=[rootdir 'SNR0.wav'];
            case 4
                filename=[rootdir 'SNR-5.wav'];
        end
%         if noiselevel == 1
%             filename=[filename,'Easy\','Class3T_Easy.wav'];
%         else
%             filename=[filename,'Hard\','Class3T_Hard.wav'];
%         end
end
% [xtemp,Fs] = audioread(filename);
% x = [xtemp,zeros(length(xtemp),1)];
% noise_player = audioplayer (x,Fs);
% play(noise_player);
handles.activex2.URL = filename;
set(handles.popupmenu2,'Enable','off');
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton9,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton8,'Enable','off');
pause(5);
set(handles.pushbutton1,'Enable','on');
set(handles.pushbutton16,'Enable','on');

function edit6_Callback(hObject, eventdata, handles)

function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton12_Callback(hObject, eventdata, handles)
function pushbutton13_Callback(hObject, eventdata, handles)
function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_Callback(hObject, eventdata, handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_CreateFcn(hObject, eventdata, handles)
function text11_CreateFcn(hObject, eventdata, handles)

function pushbutton14_Callback(hObject, eventdata, handles)
global counter list_no tt3 str total_words orilength tt4;
txt_name = 'adult_HINT.xlsx';
utter_no = counter + 1;
sheet_name = ['List ',num2str(list_no)];
start_pin = ['A',num2str(5+(utter_no-1)*4)];
end_pin = ['G',num2str(5+(utter_no-1)*4)];
xrange = [num2str(start_pin),':',num2str(end_pin)];
[~,ori_txt,~] = xlsread(txt_name,sheet_name,xrange);
total_words = total_words + length(ori_txt);
str = sprintf('%s ', ori_txt{:});

ori2 = ori_txt;
orilength = length(ori_txt);
tt4 = strsplit(tt3);
set(handles.text20,'String',num2str(length(ori2)),'FontSize',12.0);
set(handles.text21,'String',num2str(length(tt4)),'FontSize',12.0);
if length(ori_txt)~=length(tt4)
    addt = length(ori_txt) - length(tt4);
else
    addt = 0;
end

if addt>0
    for n = 1:addt
        tt4{end+1}='';
    end
elseif addt<0
    for n = 1:(-addt)
        ori2{end+1}='';
    end
end
wd = [ori2;tt4];
t = handles.uitable1;
set(t,'data',wd,'FontSize',14,'ColumnWidth',{150},'RowStriping','off');
set(handles.pushbutton14,'Enable','off');
set(handles.radiobutton1,'Enable','on');
set(handles.radiobutton2,'Enable','on');
set(handles.radiobutton3,'Enable','on');
set(handles.pushbutton8,'Enable','on');
set(handles.edit4,'Enable','on');
if counter==9
      set(handles.popupmenu2,'Enable','on');
end

function pushbutton15_Callback(hObject, eventdata, handles)
% quit_confirm_handle=quit_confirm;
global f1;
choice = questdlg('Do you want to close the practice session?','Exit Confirm','Yes','No','Yes');
switch choice
    case 'Yes'
        try 
            close(f1);
        end
        close(practice);
    case 'No'
end
function uipanel4_CreateFcn(hObject, eventdata, handles)

function pushbutton16_Callback(hObject, eventdata, handles)
handles.activex2.controls.pause();
set(handles.pushbutton16,'Enable','off');
set(handles.pushbutton17,'Enable','on');
function pushbutton17_Callback(hObject, eventdata, handles)
handles.activex2.controls.play();
set(handles.pushbutton17,'Enable','off');
set(handles.pushbutton16,'Enable','on');

function uipanel6_ButtonDownFcn(hObject, eventdata, handles)
