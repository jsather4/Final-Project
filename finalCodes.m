function [] = finalCodes()
global goo;
goo.fig = figure();
 

goo.p = plot(0,0);
 

goo.p.Parent.Position = [.15,.3,.75,.6];
 

goo.textx = uicontrol('style','text','string', 'X Values','units','normalized','position', [.15, .1, .1,.05]);
 

goo.xvalues = uicontrol('style','edit','units','normalized','position', [.1, .05, .2, .05]);
 

goo.texty = uicontrol('style','text','string', 'Y Values','units','normalized','position', [.35, .1, .1,.05]);
 

goo.yvalues = uicontrol('style','edit','units','normalized','position', [.3, .05, .2, .05]);
 

goo.button = uicontrol('style','pushbutton','string','Plot','units','normalized','position', [.7, .05, .1, .05], 'CallBack', @Button_CallBack);
 

goo.reset = uicontrol('style','pushbutton','string','Reset','units','normalized', 'position', [.8, .05, .1, .05],'CallBack',@Reset_CallBack);
 

goo.title = uicontrol('style','edit','string','Title','units', 'normalized','position',[.25,.95,.5,.05]);
goo.editAxisX = uicontrol('style','edit','string','x Axis Title','units', 'normalized','position',[.45,.25,.1,.02]);
goo.editAxisY = uicontrol('style','edit','string','y Axis Title','units', 'normalized','position',[.05,.5,.1,.02]);

 

goo.buttgroup1 = uibuttongroup(goo.fig,'units','normalized','position', [.9,.2,.1,.25], 'SelectionChangedFcn',@SelecA_CallBack);
goo.r1a = uicontrol(goo.buttgroup1, 'style', 'radiobutton', 'string','Red','units','normalized','position',[0,.15,.8,.1],'HandleVisibility' ,'off');
goo.r1b = uicontrol(goo.buttgroup1, 'style', 'radiobutton', 'string','Blue','units','normalized','position',[0,.3,.8,.1], 'HandleVisibility' ,'off'); 
goo.r1c = uicontrol(goo.buttgroup1, 'style', 'radiobutton', 'string','Green','units','normalized','position',[0,.45,.8,.1], 'HandleVisibility' ,'off');
goo.r1d = uicontrol(goo.buttgroup1, 'style', 'radiobutton', 'string','Black','units','normalized','position',[0,.6,.8,.1], 'HandleVisibility' ,'off');
goo.r1e = uicontrol(goo.buttgroup1, 'style', 'radiobutton', 'string','Yellow','units','normalized','position',[0,.75,.8,.1], 'HandleVisibility' ,'off');
 

goo.buttgroup1.Visible = 'on';
 

goo.buttgroup2 = uibuttongroup(goo.fig,'units','normalized','position', [.9,.45,.1,.25], 'SelectionChangedFcn',@SelecB_CallBack);
goo.r2b = uicontrol(goo.buttgroup2, 'style', 'radiobutton', 'string','Star','units','normalized','position',[0,.35,.8,.1], 'HandleVisibility' ,'off');
goo.r2c = uicontrol(goo.buttgroup2, 'style', 'radiobutton', 'string','Circle','units','normalized','position',[0,.55,.8,.1], 'HandleVisibility' ,'off');
goo.r2d = uicontrol(goo.buttgroup2, 'style', 'radiobutton', 'string','X','units','normalized','position',[0,.75,.85,.1], 'HandleVisibility' ,'off');
 

goo.buttgroup2.Visible = 'on';
end
 

function Button_CallBack(~,~)
global goo

x = str2num(goo.xvalues.String);
y = str2num(goo.yvalues.String);
%use str2double if we ditch the plotting multiple points

if length(x) == length(y)
    scatter(x,y)
else
    msgbox('Invalid Plot','error','modal')
end 
end
 
function Reset_CallBack(~,~)
global goo
x = str2num(goo.xvalues.String);
y = str2num(goo.yvalues.String);
cla(scatter(x,y))
set(goo.xvalues, 'String', '');
set(goo.yvalues, 'String', '');
set(goo.title, 'String', 'Title');
set(goo.editAxisX, 'String', 'x Axis Title');
set(goo.editAxisY, 'String', 'y Axis Title');
end
 
function SelecA_CallBack(~,~)
global goo
x = str2num(goo.xvalues.String);
y = str2num(goo.yvalues.String);

if goo.r1a.Value
    cla(scatter(x,y))
    scatter(x,y,'r')
goo.answer = 1;
end

if goo.r1b.Value
    cla(scatter(x,y))
    scatter(x,y,'b')
goo.answer = 1;
end

if goo.r1c.Value
    cla(scatter(x,y))
    scatter(x,y,'g')
goo.answer = 1;
end

if goo.r1d.Value
    cla(scatter(x,y))
    scatter(x,y,'k')
goo.answer = 1;
end

if goo.r1e.Value
    cla(scatter(x,y))
    scatter(x,y,'y')
goo.answer = 1;
end

end
 

function SelecB_CallBack(~,~)
global goo
x = str2num(goo.xvalues.String);
y = str2num(goo.yvalues.String);

if goo.r2b.Value
    cla(scatter(x,y))
    scatter(x,y,'*')
goo.answer = 1;
end

if goo.r2c.Value
    cla(scatter(x,y))
    scatter(x,y,'o')
goo.answer = 1;
end

if goo.r2d.Value
    cla(scatter(x,y))
    scatter(x,y,'x')
goo.answer = 1;
end

end