function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 11-Dec-2023 02:03:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% init variables
global pre_theta1;
global pre_theta2;
global pre_d3;
global pre_theta4;
global path;
global x_real;
global y_real;
global z_real;
global roll_real;
global pitch_real;
global yaw_real;
% test init state
pre_theta1 = 0;
pre_theta2 = 0;
pre_d3 = 0;
pre_theta4 = 0;
path = [300; 0 ;155];
x_real = 300;
y_real = 0;
z_real = 155;
set(handles.SRoll_txt,'string','None');
set(handles.SPitch_txt,'string','None');


% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
global path;
global theta;
global alpha;
global a;
global d;
[~,n] = size(path);
temp = path(:,n);
clearvars -global path;
path = temp(:,1);
[~,path] = DRAW(d,theta,a,alpha,path);

cla(handles.axesq);
cla(handles.axesv);
cla(handles.axesa);
hold(handles.axesq, 'on');
hold(handles.axesv, 'on');
hold(handles.axesa, 'on');
set(handles.axesq, 'XLimSpec', 'Tight');
set(handles.axesv, 'XLimSpec', 'Tight');
set(handles.axesa, 'XLimSpec', 'Tight');
ylabel(handles.axesq, '$q$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.axesv, '$v$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.axesa, '$a$', 'interpreter', 'latex', 'fontsize', 13);


cla(handles.QT2);
cla(handles.VT2);
cla(handles.AT2);
hold(handles.QT2, 'on');
hold(handles.VT2, 'on');
hold(handles.AT2, 'on');
set(handles.QT2, 'XLimSpec', 'Tight');
set(handles.VT2, 'XLimSpec', 'Tight');
set(handles.AT2, 'XLimSpec', 'Tight');
ylabel(handles.QT2, '$QT2$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.VT2, '$VT2$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.AT2, '$AT2$', 'interpreter', 'latex', 'fontsize', 13);

cla(handles.QT4);
cla(handles.VT4);
cla(handles.AT4);
hold(handles.QT4, 'on');
hold(handles.VT4, 'on');
hold(handles.AT4, 'on');
set(handles.QT4, 'XLimSpec', 'Tight');
set(handles.VT4, 'XLimSpec', 'Tight');
set(handles.AT4, 'XLimSpec', 'Tight');
ylabel(handles.QT4, '$QT4$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.VT4, '$VT4$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.AT4, '$AT4$', 'interpreter', 'latex', 'fontsize', 13);

cla(handles.plotx);
cla(handles.ploty);
cla(handles.plotz);
cla(handles.PLOTX);
cla(handles.PLOTY);
cla(handles.PLOTZ);

cla(handles.QD3);
cla(handles.VD3);
cla(handles.AD3);
hold(handles.QD3, 'on');
hold(handles.VD3, 'on');
hold(handles.AD3, 'on');
set(handles.QD3, 'XLimSpec', 'Tight');
set(handles.VD3, 'XLimSpec', 'Tight');
set(handles.AD3, 'XLimSpec', 'Tight');
ylabel(handles.QD3, '$QD3$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.VD3, '$VD3$', 'interpreter', 'latex', 'fontsize', 13);
ylabel(handles.AD3, '$AD3$', 'interpreter', 'latex', 'fontsize', 13);



% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function set_coordinate(x,y,z,pitch,roll,yaw, handles)
set(handles.x_real,'string',num2str(x));
set(handles.y_real,'string',num2str(y));
set(handles.z_real,'string',num2str(z));
set(handles.roll_real,'string',num2str(roll));
set(handles.pitch_real,'string',num2str(pitch));
set(handles.yaw_real,'string',num2str(yaw));
% hoach dinh duong di q,a,v

% --- Executes on button press in Inverse.
function Inverse_Callback(hObject, eventdata, handles)
global SXfw;
global SYfw;
global SZfw;
global SYawfw;
global theta1fw;
global theta2fw;
global d3fw;
global theta4fw;

[theta1fw, theta2fw, d3fw, theta4fw] = Inverse(SXfw,SYfw,SZfw,deg2rad(SYawfw));
set(handles.STheta1_txt,'string',num2str(theta1fw));
set(handles.STheta2_txt,'string',num2str(theta2fw));
set(handles.Sd3_txt,'string',num2str(d3fw));
set(handles.STheta4_txt,'string',num2str(theta4fw));
set(handles.STheta1, 'value', theta1fw );
set(handles.STheta2, 'value', theta2fw );
set(handles.Sd3, 'value', d3fw );
set(handles.STheta4, 'value', theta4fw );
Forward_Callback(hObject, eventdata, handles);
set(handles.text_warning,'string','MODE INVERSE');
% hObject    handle to Inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Forward.
function Forward_Callback(hObject, eventdata, handles)
hold off;
rotate3d on;
global theta1fw;
global theta2fw;
global d3fw; 
global theta4fw;
global pre_theta1;
global pre_theta2;
global pre_d3;
global pre_theta4; 
global theta;
global d;
global a;
global alpha;
global path;
clear px py pz;
%DH
d = [155 0 0 -10];
theta = [0 0 0 0];
a = [ 125 175 0 0];
alpha = [0 0 0 pi];

%SETTING ON GUI
sx = str2double(get(handles.SX_txt, 'String'));
sy = str2double(get(handles.SY_txt, 'String'));
sz = str2double(get(handles.SZ_txt, 'String'));
% Tăng kích thước lớn hơn (đặt giá trị theo mong muốn)
lineWidth2 = 2.5;
% Đổi màu sang đỏ (có thể thay đổi giá trị theo mong muốn)
lineColor2 = [0 1 0];  % Màu đỏ: [R G B]
%SET UP INIT
x_real = 300;
y_real = 0;
z_real = 155;
qmax = sqrt((sx - x_real)^2 + (sy - y_real)^2 + (sz - z_real)^2);

QT1_MAX = abs(theta1fw-theta(1));
QT2_MAX = abs(theta2fw-theta(2));
QD3_MAX = abs(d3fw-d(3));
QT4_MAX = abs(theta4fw-theta(4));
% Tăng kích thước lớn hơn (đặt giá trị theo mong muốn)
lineWidth = 2.5;
% Đổi màu sang đỏ (có thể thay đổi giá trị theo mong muốn)
lineColor = [1 0 0];  % Màu đỏ: [R G B]
%TYPING ON GUI
vmax = str2double(get(handles.v_max, 'String'));
amax = str2double(get(handles.a_max, 'String'));
%lay thong tin cua profile
contents2 = cellstr(get(handles.profile, 'String'));
PLOT2 = contents2{get(handles.profile, 'Value')};
if strcmp(PLOT2, 'LSPB')
    [q_theta1,v_theta1,a_theta1,t_theta1,~] = LSPB2(QT1_MAX,vmax, amax);    
    [q_theta2,v_theta2,a_theta2,t_theta2,~] = LSPB2(QT2_MAX, vmax, amax);
    [q_d3,v_d3,a_d3,t_d3,~] = LSPB2(QD3_MAX, vmax, amax);
    [q_theta4,v_theta4,a_theta4,t_theta4,~] = LSPB2(QT4_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve')
    [t_theta1,q_theta1,v_theta1,a_theta1] = Scurve(QT1_MAX,vmax, amax);
    [t_theta2,q_theta2,v_theta2,a_theta2] = Scurve(QT2_MAX, vmax, amax);
    [t_d3,q_d3,v_d3,a_d3] = Scurve(QD3_MAX, vmax, amax);
    [t_theta4,q_theta4,v_theta4,a_theta4] = Scurve(QT4_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve7')
    [t_theta1,q_theta1,v_theta1,a_theta1] = Scurve7(QT1_MAX, vmax, amax,1);
    [t_theta2,q_theta2,v_theta2,a_theta2] = Scurve7(QT2_MAX, vmax, amax,1);
    [t_d3,q_d3,v_d3,a_d3] = Scurve7(QD3_MAX, vmax, amax,1);
    [t_theta4,q_theta4,v_theta4,a_theta4] = Scurve7(QT4_MAX, vmax, amax,1);
end
theta1 = theta(1);
T = linspace(0, sum([t_theta1, t_theta2, t_d3, t_theta4]), length(t_theta1) +length(t_theta2)+length(t_d3)+length(t_theta4) );
% Chuyen dong theo theta1
for i1 = 1:length(t_theta1)
    if theta1fw*pi/180-theta(1) < 0
        theta(1) = theta1 - q_theta1(i1)*pi/180;
    else
        theta(1) = theta1 + q_theta1(i1)*pi/180;
    end
JOINT1(QT1_MAX,i1,vmax,amax, handles);
[joint4,path] = DRAW(d,theta,a,alpha,path);
[~, n] = size(path);
set_coordinate(path(1,n),path(2,n),path(3,n),0,0,path(6,n),handles);
% tọa độ x y z
px(i1) = joint4(1);
py(i1) = joint4(2);
pz(i1) = joint4(3);

qv(i1)= q_theta1(i1);
vv(i1)= v_theta1(i1);
av(i1)= a_theta1(i1);

% Thay đổi dòng vẽ đồ thị
plot(handles.plotx, t_theta1(1:i1), px(1:i1), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotx,'Positon(mm)')
grid (handles.plotx, 'on')
plot(handles.ploty, t_theta1(1:i1), py(1:i1), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.ploty,'Positon(mm)')
grid (handles.ploty, 'on')
plot(handles.plotz, t_theta1(1:i1), pz(1:i1), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotz,'Positon(mm)')
grid (handles.plotz, 'on')

plot(handles.axesq,T(1:i1),qv(1:i1),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesq,[0 tmax, 0 qmax])
xlabel(handles.axesq,'Time(s)')
ylabel(handles.axesq,'Positon(mm)')
grid (handles.axesq, 'on')
plot(handles.axesv,T(1:i1), vv(1:i1),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesv,[0 tmax, 0 vmax])
xlabel(handles.axesv,'Time(s)')
ylabel(handles.axesv,'Velocity(mm/s)')
grid (handles.axesv, 'on')
plot(handles.axesa,T(1:i1), av(1:i1),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesa,[0 tmax, -amax amax])
xlabel(handles.axesa,'Time(s)')
ylabel(handles.axesa,'Acc')
grid (handles.axesa, 'on')
pause(0.05);
end
% Chuyen dong theo theta2
theta2 = theta(2);
% Chuyen dong theo theta1
for i2 = 1:length(t_theta2)
    if theta2fw*pi/180-theta(1) < 0
        theta(2) = theta2 - q_theta2(i2)*pi/180;
    else
        theta(2) = theta2 + q_theta2(i2)*pi/180;
    end
JOINT2(QT2_MAX,i2,vmax,amax, handles);
[joint4,path] = DRAW(d,theta,a,alpha,path);
[~, n] = size(path);
set_coordinate(path(1,n),path(2,n),path(3,n),0,0,path(6,n),handles);
i1 = length(t_theta1);
px(i2+i1) = joint4(1);
py(i2+i1) = joint4(2);
pz(i2+i1) = joint4(3);
qv(i2+i1)= q_theta2(i2)+QT1_MAX;
vv(i2+i1)= v_theta2(i2);
av(i2+i1)= a_theta2(i2);

i2s = i1+i2 -1;
% Thay đổi dòng vẽ đồ thị
plot(handles.plotx, t_theta2(1:i2), px(i1:i2s), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotx,'Positon(mm)')
grid (handles.plotx, 'on')
plot(handles.ploty, t_theta2(1:i2), py(i1:i2s), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.ploty,'Positon(mm)')
grid (handles.ploty, 'on')
plot(handles.plotz, t_theta2(1:i2), pz(i1:i2s), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotz,'Positon(mm)')
grid (handles.plotz, 'on')

plot(handles.axesq,T(1:i2+i1),qv(1:i2+i1),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesq,[0 tmax, 0 qmax])
xlabel(handles.axesq,'Time(s)')
ylabel(handles.axesq,'Positon(mm)')
grid (handles.axesq, 'on')
plot(handles.axesv,T(1:i2+i1), vv(1:i2+i1),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesv,[0 tmax, 0 vmax])
xlabel(handles.axesv,'Time(s)')
ylabel(handles.axesv,'Velocity(mm/s)')
grid (handles.axesv, 'on')
plot(handles.axesa,T(1:i2+i1), av(1:i2+i1),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesa,[0 tmax, -amax amax])
xlabel(handles.axesa,'Time(s)')
ylabel(handles.axesa,'Acc')
grid (handles.axesa, 'on')
pause(0.05);
end
% Chuyen dong theo d3
d3 = d(3);
for i3 = 1:length(t_d3)
    if d3fw - d(3) < 0
        d(3) = d3 - q_d3(i3);
    else
        d(3) = d3 + q_d3(i3);
    end
JOINT3(QD3_MAX,i3,vmax,amax, handles);
[joint4,path] = DRAW(d,theta,a,alpha,path);
[~, n] = size(path);
set_coordinate(path(1,n),path(2,n),path(3,n),0,0,path(6,n),handles);
i2 = length(t_theta2);
i1 = length(t_theta1);
px(i3+i2+i1) = joint4(1);
py(i3+i2+i1) = joint4(2);
pz(i3+i2+i1) = joint4(3);

qv(i3+i2+i1)= q_d3(i3)+QT1_MAX+QT2_MAX;
vv(i3+i2+i1)= v_d3(i3);
av(i3+i2+i1)= a_d3(i3);

% Thay đổi dòng vẽ đồ thị
plot(handles.plotx, t_theta2(1:i3), px(i2+i1+1:i3+i1+i2), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotx,'Positon(mm)')
grid (handles.plotx, 'on')
plot(handles.ploty, t_theta2(1:i3), py(i2+i1+1:i3+i1+i2), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.ploty,'Positon(mm)')
grid (handles.ploty, 'on')
plot(handles.plotz, t_theta2(1:i3), pz(i2+i1+1:i3+i1+i2), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotz,'Positon(mm)')
grid (handles.plotz, 'on')

plot(handles.axesq,T(1:i2+i1+i3),qv(1:i2+i1+i3),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesq,[0 tmax, 0 qmax])
xlabel(handles.axesq,'Time(s)')
ylabel(handles.axesq,'Positon(mm)')
grid (handles.axesq, 'on')
plot(handles.axesv,T(1:i2+i1+i3), vv(1:i2+i1+i3),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesv,[0 tmax, 0 vmax])
xlabel(handles.axesv,'Time(s)')
ylabel(handles.axesv,'Velocity(mm/s)')
grid (handles.axesv, 'on')
plot(handles.axesa,T(1:i2+i1+i3), av(1:i2+i1+i3),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesa,[0 tmax, -amax amax])
xlabel(handles.axesa,'Time(s)')
ylabel(handles.axesa,'Acc')
grid (handles.axesa, 'on')
pause(0.1);
end
% Chuyen dong theo theta4
theta4 = theta(4);
% Chuyen dong theo theta1
for i4 = 1:length(t_theta4)
    if theta4fw*pi/180-theta(4) < 0
        theta(4) = theta4 - q_theta4(i4)*pi/180;
    else
        theta(4) = theta4 + q_theta4(i4)*pi/180;
    end
JOINT4(QT4_MAX,i4,vmax,amax, handles);
[joint4,path] = DRAW(d,theta,a,alpha,path);
[~, n] = size(path);
set_coordinate(path(1,n),path(2,n),path(3,n),0,0,path(6,n),handles);
i2 = length(t_theta2);
i1 = length(t_theta1);
i3 = length(t_d3);

px(i4+i1+i2+i3) = joint4(1);
py(i4+i1+i2+i3) = joint4(2);
pz(i4+i1+i2+i3) = joint4(3);

qv(i4+i1+i2+i3)= q_theta4(i4)+QT1_MAX+QT2_MAX+QD3_MAX;
vv(i4+i1+i2+i3)= v_theta4(i4);
av(i4+i1+i2+i3)= a_theta4(i4);

% Thay đổi dòng vẽ đồ thị
plot(handles.plotx, t_theta4(1:i4), px(i1+i2+i3+1:i1+i2+i3+i4), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotx,'Positon(mm)')
grid (handles.plotx, 'on')
plot(handles.ploty, t_theta4(1:i4), py(i1+i2+i3+1:i1+i2+i3+i4), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.ploty,'Positon(mm)')
grid (handles.ploty, 'on')
plot(handles.plotz, t_theta4(1:i4), pz(i1+i2+i3+1:i1+i2+i3+i4), 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.plotz,'Positon(mm)')
grid (handles.plotz, 'on')

plot(handles.axesq,T(1:i2+i1+i3+i4),qv(1:i2+i1+i3+i4),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesq,[0 tmax, 0 qmax])
xlabel(handles.axesq,'Time(s)')
ylabel(handles.axesq,'Positon(mm)')
grid (handles.axesq, 'on')
plot(handles.axesv,T(1:i2+i1+i3+i4), vv(1:i2+i1+i3+i4),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesv,[0 tmax, 0 vmax])
xlabel(handles.axesv,'Time(s)')
ylabel(handles.axesv,'Velocity(mm/s)')
grid (handles.axesv, 'on')
plot(handles.axesa,T(1:i2+i1+i3+i4), av(1:i2+i1+i3+i4),'LineWidth', lineWidth2, 'Color', lineColor2);
% axis(handles.axesa,[0 tmax, -amax amax])
xlabel(handles.axesa,'Time(s)')
ylabel(handles.axesa,'Acc')
grid (handles.axesa, 'on')

pause(0.1);
pre_theta1 = deg2rad(theta1fw);
pre_theta2 = deg2rad(theta2fw);
pre_theta4 = deg2rad(theta4fw);
pre_d3 = d3fw;
set(handles.text_warning,'string','MODE FORWARD');
end


% Gộp tất cả các vector px thành một vector px_total
px_total = [px(1:i1), px(i1+1:i1+i2), px(i1+i2+1:i1+i2+i3), px(i1+i2+i3+1:i1+i2+i3+i4)];
py_total = [py(1:i1), py(i1+1:i1+i2), py(i1+i2+1:i1+i2+i3), py(i1+i2+i3+1:i1+i2+i3+i4)];
pz_total = [pz(1:i1), pz(i1+1:i1+i2), pz(i1+i2+1:i1+i2+i3), pz(i1+i2+i3+1:i1+i2+i3+i4)];

% Vẽ đồ thị cho px_total
plot(handles.PLOTX, T, px_total, 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.PLOTX, 'Position X (mm)');
grid(handles.PLOTX, 'on');
plot(handles.PLOTY, T, py_total, 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.PLOTY, 'Position Y(mm)');
grid(handles.PLOTY, 'on');
plot(handles.PLOTZ, T, pz_total, 'LineWidth', lineWidth, 'Color', lineColor);
ylabel(handles.PLOTZ, 'Position Z(mm)');
grid(handles.PLOTZ, 'on');

% hObject    handle to Forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function STheta1_txt_Callback(hObject, eventdata, handles)
global theta1fw;
theta1fw = get(handles.STheta1_txt, 'string');
theta1fw = str2num(theta1fw);
if (theta1fw <= 125) & (theta1fw >= -125)
   set(handles.STheta1, 'value', theta1fw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -125 den 125');
end
% hObject    handle to STheta1_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of STheta1_txt as text
%        str2double(get(hObject,'String')) returns contents of STheta1_txt as a double


% --- Executes during object creation, after setting all properties.
function STheta1_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STheta1_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function STheta2_txt_Callback(hObject, eventdata, handles)
global theta2fw;
theta2fw = get(handles.STheta2_txt, 'string');
theta2fw = str2num(theta2fw);
if (theta2fw <= 145) & (theta2fw >= -145)
   set(handles.STheta2, 'value', theta2fw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -145 den 145');
end
% hObject    handle to STheta2_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of STheta2_txt as text
%        str2double(get(hObject,'String')) returns contents of STheta2_txt as a double


% --- Executes during object creation, after setting all properties.
function STheta2_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STheta2_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sd3_txt_Callback(hObject, eventdata, handles)
global d3fw;
d3fw = get(handles.Sd3_txt, 'string');
d3fw = str2num(d3fw);
if (d3fw <= 20) & (d3fw >= -300)
   set(handles.Sd3, 'value', d3fw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -300 den 20');
end
% hObject    handle to Sd3_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sd3_txt as text
%        str2double(get(hObject,'String')) returns contents of Sd3_txt as a double


% --- Executes during object creation, after setting all properties.
function Sd3_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sd3_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function STheta4_txt_Callback(hObject, eventdata, handles)
global theta4fw;
theta4fw = get(handles.STheta4_txt, 'string');
theta4fw = str2num(theta4fw);
if (theta4fw <= 360) & (theta4fw >=-360)
   set(handles.STheta4, 'value', theta4fw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -360 den 360');
end
% hObject    handle to STheta4_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of STheta4_txt as text
%        str2double(get(hObject,'String')) returns contents of STheta4_txt as a double


% --- Executes during object creation, after setting all properties.
function STheta4_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STheta4_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function STheta1_Callback(hObject, eventdata, handles)
global theta1fw;
theta1fw = get(handles.STheta1,'value');
set(handles.STheta1_txt,'string',num2str(theta1fw));
% hObject    handle to STheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function STheta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function STheta2_Callback(hObject, eventdata, handles)
global theta2fw;
theta2fw = get(handles.STheta2,'value');
set(handles.STheta2_txt,'string',num2str(theta2fw));
% hObject    handle to STheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function STheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Sd3_Callback(hObject, eventdata, handles)
global d3fw;
d3fw = get(handles.Sd3,'value');
set(handles.Sd3_txt,'string',num2str(d3fw));
% hObject    handle to Sd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Sd3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function STheta4_Callback(hObject, eventdata, handles)
global theta4fw;
theta4fw = get(handles.STheta4,'value');
set(handles.STheta4_txt,'string',num2str(theta4fw));
% hObject    handle to STheta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function STheta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STheta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function SX_txt_Callback(hObject, eventdata, handles)
global SXfw;
SXfw = get(handles.SX_txt, 'string');
SXfw = str2num(SXfw);
if (SXfw <= 1000) & (SXfw >= -1000)
   set(handles.SX, 'value', SXfw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -5 den 5');
end
% hObject    handle to SX_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SX_txt as text
%        str2double(get(hObject,'String')) returns contents of SX_txt as a double


% --- Executes during object creation, after setting all properties.
function SX_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SX_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SY_txt_Callback(hObject, eventdata, handles)
global SYfw;
SYfw = get(handles.SY_txt, 'string');
SYfw = str2num(SYfw);
if (SYfw <= 500) & (SYfw >= -500)
   set(handles.SY, 'value', SYfw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -5 den 5');
end
% hObject    handle to SY_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SY_txt as text
%        str2double(get(hObject,'String')) returns contents of SY_txt as a double


% --- Executes during object creation, after setting all properties.
function SY_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SY_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SZ_txt_Callback(hObject, eventdata, handles)
global SZfw;
SZfw = get(handles.SZ_txt, 'string');
SZfw = str2num(SZfw);
if (SZfw <= 500) & (SZfw >= -500)
   set(handles.SZ, 'value', SZfw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -5 den 5');
end
% hObject    handle to SZ_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SZ_txt as text
%        str2double(get(hObject,'String')) returns contents of SZ_txt as a double


% --- Executes during object creation, after setting all properties.
function SZ_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SZ_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SRoll_txt_Callback(hObject, eventdata, handles)
global SRollfw;
SRollfw = get(handles.SRoll_txt, 'string');
SRollfw = str2num(SRollfw);
if (SRollfw <= 180) & (SRollfw >= -180)
   set(handles.SRoll, 'value', SRollfw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -180 den 180');
end
% hObject    handle to SRoll_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SRoll_txt as text
%        str2double(get(hObject,'String')) returns contents of SRoll_txt as a double


% --- Executes during object creation, after setting all properties.
function SRoll_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SRoll_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SPitch_txt_Callback(hObject, eventdata, handles)
global SPitchfw;
SPitchfw = get(handles.SPitch_txt, 'string');
SPitchfw = str2num(SPitchfw);
if (SPitchfw <= 180) & (SPitchfw >= -180)
   set(handles.SPitch, 'value', SPitchfw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -180 den 180');
end
% hObject    handle to SPitch_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SPitch_txt as text
%        str2double(get(hObject,'String')) returns contents of SPitch_txt as a double


% --- Executes during object creation, after setting all properties.
function SPitch_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SPitch_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SYaw_txt_Callback(hObject, eventdata, handles)
global SYawfw;
SYawfw = get(handles.SYaw_txt, 'string');
SYawfw = str2num(SYawfw);
if (SYawfw <= 180) & (SYawfw >= -180)
   set(handles.SYaw, 'value', SYawfw );
else
   set(handles.text_warning,'string','Nhap gia tri trong khoang tu -180 den 180');
end
% hObject    handle to SYaw_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SYaw_txt as text
%        str2double(get(hObject,'String')) returns contents of SYaw_txt as a double


% --- Executes during object creation, after setting all properties.
function SYaw_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SYaw_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SX_Callback(hObject, eventdata, handles)
global SXfw;
SXfw = get(handles.SX,'value');
set(handles.SX_txt,'string',num2str(SXfw));
% hObject    handle to SX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SY_Callback(hObject, eventdata, handles)
global SYfw;
SYfw = get(handles.SY,'value');
set(handles.SY_txt,'string',num2str(SYfw));
% hObject    handle to SY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SZ_Callback(hObject, eventdata, handles)
global SZfw;
SZfw = get(handles.SZ,'value');
set(handles.SZ_txt,'string',num2str(SZfw));
% hObject    handle to SZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SRoll_Callback(hObject, eventdata, handles)
global SRollfw;
SRollfw = get(handles.SRoll,'value');
set(handles.SRoll_txt,'string',num2str(SRollfw));
% hObject    handle to SRoll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SRoll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SRoll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SPitch_Callback(hObject, eventdata, handles)
global SPitchfw;
SPitchfw = get(handles.SPitch,'value');
set(handles.SPitch_txt,'string',num2str(SPitchfw));
% hObject    handle to SPitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SPitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SPitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SYaw_Callback(hObject, eventdata, handles)
global SYawfw;
SYawfw = get(handles.SYaw,'value');
set(handles.SYaw_txt,'string',num2str(SYawfw));
% hObject    handle to SYaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SYaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SYaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function text_warning_Callback(hObject, eventdata, handles)
% hObject    handle to text_warning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_warning as text
%        str2double(get(hObject,'String')) returns contents of text_warning as a double


% --- Executes during object creation, after setting all properties.
function text_warning_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_warning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_real_Callback(hObject, eventdata, handles)
% hObject    handle to x_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_real as text
%        str2double(get(hObject,'String')) returns contents of x_real as a double


% --- Executes during object creation, after setting all properties.
function x_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_real_Callback(hObject, eventdata, handles)
% hObject    handle to y_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_real as text
%        str2double(get(hObject,'String')) returns contents of y_real as a double


% --- Executes during object creation, after setting all properties.
function y_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_real_Callback(hObject, eventdata, handles)
% hObject    handle to z_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_real as text
%        str2double(get(hObject,'String')) returns contents of z_real as a double


% --- Executes during object creation, after setting all properties.
function z_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function roll_real_Callback(hObject, eventdata, handles)
% hObject    handle to roll_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roll_real as text
%        str2double(get(hObject,'String')) returns contents of roll_real as a double


% --- Executes during object creation, after setting all properties.
function roll_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roll_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pitch_real_Callback(hObject, eventdata, handles)
% hObject    handle to pitch_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pitch_real as text
%        str2double(get(hObject,'String')) returns contents of pitch_real as a double


% --- Executes during object creation, after setting all properties.
function pitch_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pitch_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yaw_real_Callback(hObject, eventdata, handles)
% hObject    handle to yaw_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yaw_real as text
%        str2double(get(hObject,'String')) returns contents of yaw_real as a double


% --- Executes during object creation, after setting all properties.
function yaw_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yaw_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Workspace.
function Workspace_Callback(hObject, eventdata, handles)
hold off;
rotate3d on;
global theta1fw;
global theta2fw;
global d3fw; 
global theta4fw;
global pre_theta1;
global pre_theta2;
global pre_d3;
global pre_theta4; 
global theta;
global d;
global a;
global alpha;
global path;
% thong so robot
    d = [155 0 0 -10];
    theta = [0 0 0 0];
    a = [ 125 175 0 0];
    alpha = [0 0 0 pi];
    path = [300; 0; 155];
    path = DRAW(d,theta,a,alpha,path);
%ve hinh robot
if get(hObject, 'Value')
    set(handles.text_warning,'string','MODE WORKSPACE');
    path = PlotWorkspace2(d,theta,a,alpha,path);
    
else
    set(handles.text_warning,'string','OFF WORKSPACE');
    d = [155 0 0 -10];
    theta = [0 0 0 0];
    a = [ 125 175 0 0];
    alpha = [0 0 0 pi];
    path = [300; 0; 155];
    path = DRAW(d,theta,a,alpha,path);

end
% hObject    handle to Workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Workspace

% --- Executes on button press in Coordinate.
function Coordinate_Callback(hObject, eventdata, handles)
hold off;
rotate3d on;
global theta1fw;
global theta2fw;
global d3fw; 
global theta4fw;
global pre_theta1;
global pre_theta2;
global pre_d3;
global pre_theta4; 
global theta;
global d;
global a;
global alpha;
global path;
% thong so robot
    d = [155 0 0 -10];
    theta = [0 0 0 0];
    a = [ 125 175 0 0];
    alpha = [0 0 0 pi];
    path = [300; 0; 155];
%ve hinh robot
if get(hObject, 'Value')
    path = PlotWorkspace(d,theta,a,alpha,path);
    set(handles.text_warning,'string','MODE COORDINATE');

else
    set(handles.text_warning,'string','OFF COORDINATE');
    d = [155 0 0 -10];
    theta = [0 0 0 0];
    a = [ 125 175 0 0];
    alpha = [0 0 0 pi];
    path = [300; 0; 155];
    path = DRAW(d,theta,a,alpha,path);

end
% hObject    handle to Coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Coordinate


% --- Executes on selection change in SELECT.
function SELECT_Callback(hObject, eventdata, handles)
% hObject    handle to SELECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(handles.SELECT, 'String'));
PLOT = contents{get(handles.SELECT, 'Value')};
if strcmp(PLOT, 'THETA1')
    set(handles.THETA1, 'Visible', 'on');
    set(handles.THETA2, 'Visible', 'off');
    set(handles.D3, 'Visible', 'off');
    set(handles.THETA4, 'Visible', 'off');
elseif strcmp(PLOT, 'THETA2')
    set(handles.THETA1, 'Visible', 'off');
    set(handles.THETA2, 'Visible', 'on');
    set(handles.D3, 'Visible', 'off');
    set(handles.THETA4, 'Visible', 'off');
elseif strcmp(PLOT, 'D3')
    set(handles.THETA1, 'Visible', 'off');
    set(handles.THETA2, 'Visible', 'off');
    set(handles.D3, 'Visible', 'on');
    set(handles.THETA4, 'Visible', 'off');
elseif strcmp(PLOT, 'THETA4')
    set(handles.THETA1, 'Visible', 'off');
    set(handles.THETA2, 'Visible', 'off');
    set(handles.D3, 'Visible', 'off');
    set(handles.THETA4, 'Visible', 'on');
end

% Hints: contents = cellstr(get(hObject,'String')) returns SELECT contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SELECT


% --- Executes during object creation, after setting all properties.
function SELECT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SELECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_max_Callback(hObject, eventdata, handles)
% hObject    handle to v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_max as text
%        str2double(get(hObject,'String')) returns contents of v_max as a double


% --- Executes during object creation, after setting all properties.
function v_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_max_Callback(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_max as text
%        str2double(get(hObject,'String')) returns contents of a_max as a double


% --- Executes during object creation, after setting all properties.
function a_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_max_Callback(hObject, eventdata, handles)
% hObject    handle to t_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_max as text
%        str2double(get(hObject,'String')) returns contents of t_max as a double


% --- Executes during object creation, after setting all properties.
function t_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function JOINT1(QT1_MAX,i,vmax,amax, handles)
%lay thong tin cua profile
contents2 = cellstr(get(handles.profile, 'String'));
PLOT2 = contents2{get(handles.profile, 'Value')};
if strcmp(PLOT2, 'LSPB')
    [q_theta1,v_theta1,a_theta1,t_theta1,~] = LSPB2(QT1_MAX,vmax, amax);
elseif strcmp(PLOT2, 'Scurve')
    [t_theta1,q_theta1,v_theta1,a_theta1] = Scurve(QT1_MAX,vmax, amax);
elseif strcmp(PLOT2, 'Scurve7')
    [t_theta1,q_theta1,v_theta1,a_theta1] = Scurve7(QT1_MAX,vmax, amax,1);
end
% JOINT 1
plot(handles.QT1,t_theta1(1:i),q_theta1(1:i));
ylabel(handles.QT1,'Positon(mm)')
grid (handles.QT1, 'on')
plot(handles.VT1,t_theta1(1:i),v_theta1(1:i));
ylabel(handles.VT1,'Velocity(mm/s)')
grid (handles.VT1, 'on')
plot(handles.AT1,t_theta1(1:i),a_theta1(1:i));
ylabel(handles.AT1,'Acc')
grid (handles.AT1, 'on')

function JOINT2(QT2_MAX,i,vmax,amax, handles)
%lay thong tin cua profile
contents2 = cellstr(get(handles.profile, 'String'));
PLOT2 = contents2{get(handles.profile, 'Value')};
if strcmp(PLOT2, 'LSPB')
    [q_theta2,v_theta2,a_theta2,t_theta2,~] = LSPB2(QT2_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve')
    [t_theta2,q_theta2,v_theta2,a_theta2] = Scurve(QT2_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve7')
    [t_theta2,q_theta2,v_theta2,a_theta2] = Scurve7(QT2_MAX, vmax, amax,1);
end
% JOINT 2
plot(handles.QT2,t_theta2(1:i),q_theta2(1:i));
ylabel(handles.QT2,'Positon(mm)')
grid (handles.QT2, 'on')
plot(handles.VT2,t_theta2(1:i),v_theta2(1:i));
ylabel(handles.VT2,'Velocity(mm/s)')
grid (handles.VT2, 'on')
plot(handles.AT2,t_theta2(1:i),a_theta2(1:i));
ylabel(handles.AT2,'Acc')
grid (handles.AT2, 'on')

function JOINT3(QD3_MAX,i,vmax,amax, handles)
%lay thong tin cua profile
contents2 = cellstr(get(handles.profile, 'String'));
PLOT2 = contents2{get(handles.profile, 'Value')};
if strcmp(PLOT2, 'LSPB')
    [q_d3,v_d3,a_d3,t_d3,~] = LSPB2(QD3_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve')
    [t_d3,q_d3,v_d3,a_d3] = Scurve(QD3_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve7')
    [t_d3,q_d3,v_d3,a_d3] = Scurve7(QD3_MAX, vmax, amax,1);
end
% JOINT 3
plot(handles.QD3,t_d3(1:i),q_d3(1:i));
ylabel(handles.QD3,'Positon(mm)')
grid (handles.QD3, 'on')
plot(handles.VD3,t_d3(1:i),v_d3(1:i));
ylabel(handles.VD3,'Velocity(mm/s)')
grid (handles.VD3, 'on')
plot(handles.AD3,t_d3(1:i),a_d3(1:i));
ylabel(handles.AD3,'Acc')
grid (handles.AD3, 'on')

function JOINT4(QT4_MAX,i,vmax,amax, handles)
%lay thong tin cua profile
contents2 = cellstr(get(handles.profile, 'String'));
PLOT2 = contents2{get(handles.profile, 'Value')};
if strcmp(PLOT2, 'LSPB')
    [q_theta4,v_theta4,a_theta4,t_theta4,~] = LSPB2(QT4_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve')
    [t_theta4,q_theta4,v_theta4,a_theta4] = Scurve(QT4_MAX, vmax, amax);
elseif strcmp(PLOT2, 'Scurve7')
    [t_theta4,q_theta4,v_theta4,a_theta4] = Scurve7(QT4_MAX, vmax, amax,1);
end
% JOINT 4
plot(handles.QT4,t_theta4(1:i),q_theta4(1:i));
ylabel(handles.QT4,'Positon(mm)')
grid (handles.QT4, 'on')
plot(handles.VT4,t_theta4(1:i),v_theta4(1:i));
ylabel(handles.VT4,'Velocity(mm/s)')
grid (handles.VT4, 'on')
plot(handles.AT4,t_theta4(1:i),a_theta4(1:i));
ylabel(handles.AT4,'Acc')
grid (handles.AT4, 'on')


% --- Executes on button press in qav.
function qav_Callback(hObject, eventdata, handles)
cla(handles.axesq);
cla(handles.axesv);
cla(handles.axesa);
%TYPING ON GUI
vmax = str2double(get(handles.v_max, 'String'));
amax = str2double(get(handles.a_max, 'String'));
tmax = str2double(get(handles.t_max, 'String'));
%SETTING ON GUI
sx = str2double(get(handles.SX_txt, 'String'));
sy = str2double(get(handles.SY_txt, 'String'));
sz = str2double(get(handles.SZ_txt, 'String'));
% Tăng kích thước lớn hơn (đặt giá trị theo mong muốn)
lineWidth2 = 2.5;
% Đổi màu sang đỏ (có thể thay đổi giá trị theo mong muốn)
lineColor2 = [0 0 1];  % Màu đỏ: [R G B]
%SET UP INIT
x_real = 100;
y_real = 0;
z_real = 10;
qmax = sqrt((sx - x_real)^2 + (sy - y_real)^2 + (sz - z_real)^2);
%lay thong tin cua profile
contents2 = cellstr(get(handles.profile, 'String'));
PLOT2 = contents2{get(handles.profile, 'Value')};
if strcmp(PLOT2, 'LSPB')
    [t, q, v, a]=LSPB(qmax, vmax, amax,tmax);
elseif strcmp(PLOT2, 'Scurve')
    [t, q, v, a]=Scurve(qmax, vmax, amax);
elseif strcmp(PLOT2, 'Scurve7')
    [t, q, v, a]=Scurve7(qmax, vmax, amax,1);
end
for k = 1:length(t)
     plot(handles.axesq,t(1:k),q(1:k),'LineWidth', lineWidth2, 'Color', lineColor2);
    % axis(handles.axesq,[0 tmax, 0 qmax])
     xlabel(handles.axesq,'Time(s)')
     ylabel(handles.axesq,'Positon(mm)')
     grid (handles.axesq, 'on')

     plot(handles.axesv,t(1:k), v(1:k),'LineWidth', lineWidth2, 'Color', lineColor2);
    % axis(handles.axesv,[0 tmax, 0 vmax])
     xlabel(handles.axesv,'Time(s)')
     ylabel(handles.axesv,'Velocity(mm/s)')
     grid (handles.axesv, 'on')

     plot(handles.axesa,t(1:k), a(1:k),'LineWidth', lineWidth2, 'Color', lineColor2);
    % axis(handles.axesa,[0 tmax, -amax amax])
     xlabel(handles.axesa,'Time(s)')
     ylabel(handles.axesa,'Acc')
     grid (handles.axesa, 'on')
     
end

% hObject    handle to qav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in profile.
function profile_Callback(hObject, eventdata, handles)
% hObject    handle to profile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns profile contents as cell array
%        contents{get(hObject,'Value')} returns selected item from profile


% --- Executes during object creation, after setting all properties.
function profile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to profile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.


% --- Executes on selection change in SELECT2.
function SELECT2_Callback(hObject, eventdata, handles)
% hObject    handle to SELECT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SELECT2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SELECT2
contents3 = cellstr(get(handles.SELECT2, 'String'));
PLOT3 = contents3{get(handles.SELECT2, 'Value')};
if strcmp(PLOT3, 'E1')
    set(handles.E1, 'Visible', 'on');
    set(handles.E2, 'Visible', 'off');
elseif strcmp(PLOT3, 'E2')
    set(handles.E1, 'Visible', 'off');
    set(handles.E2, 'Visible', 'on');
end


% --- Executes during object creation, after setting all properties.
function SELECT2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SELECT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
