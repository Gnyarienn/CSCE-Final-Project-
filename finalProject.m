function [] = finalProject()

global plotter;

close all;
%the strings are intialized here so they can be updated by the callback function later
plotter.xComponent = ""; 
plotter.yComponent = "";

%simple text UI control is used to define simple instructions and other
%basic text elements of the interface.
plotter.figure = figure('numbertitle','off','name','Vector Field Plotter','units','normalized'); 
plotter.enterEquationDisplayMessage = uicontrol('style','text','units','normalized','position',[0.05 0.1 0.3 0.1],'string','Enter the u and v velocity components a 2-D fluid vector field :');
plotter.velocitySymbol = uicontrol('style','text','units','normalized','position',[0.35 0.150 0.1 0.05],'string','V(u,v) =');
plotter.iUnitVector = uicontrol('style','text','units','normalized','position',[0.55 0.150 0.05 0.05],'string','i     +');
plotter.jUnitVector = uicontrol('style','text','units','normalized','position',[0.68 0.150 0.1 0.05],'string','j');
plotter.enterXPosition = uicontrol('style','edit','units','normalized','position',[0.45 0.150 0.1 0.05],'callback',{@displayX}); %edit box to recieve user input in the form a string for the u componenet of the vector.
plotter.enterYPosition = uicontrol('style','edit','units','normalized','position',[0.62 0.150 0.1 0.05],'callback',{@displayY}); %edit box to recieve user input in the form a string for the v componenet of the vector.
plotter.plotButton = uicontrol('style', 'pushbutton','units','normalized','position',[0.85 0.150 0.1 0.05],'string','Plot','callback',{@graphPlot}); %pushbutton to enable user the plot the graph.
plotter.q = quiver(0,0,0,0); % creating an empty figure to adjust its position for the vector field graph.
plotter.q.Parent.Position = [0.15 0.30 0.7 0.60]; 
set(gca,'XColor', 'none','YColor','none') % removing the axes of the graph which will reappear when the 'plot' pushbutton is activated.
title('Vector Field');



end


function [] = displayX(hObject, eventdata, handles)
%this callback function extracts the user input string from the interface. In this
%case, the input is the x/u component of the vector field.
global plotter; 
plotter.xComponent = get(hObject,'string');
end

function [] = displayY(hObject, eventdata, handles)
%this callback function extracts the user input string from the interface. In this
%case, the input is the y/v component of the vector field.
global plotter;
plotter.yComponent = get(hObject,'string');
end

function [] = graphPlot(event,source)
%This call back function plots the graph
global plotter;
syms x;
syms y;
[x,y] = meshgrid(-5:5,-5:5); %meshgrid is first defined which will be used as coordinates for the vector field
u=eval(plotter.xComponent); % eval() converts the user string into an equation 
v=eval(plotter.yComponent);
plotter.q = quiver(x,y,u,v,'r');%the quiver command is used for plotting vectors because it represents each point with a direction and its magnitude.
q.MaxHeadSize =1; % This adjust the size of the arrow so it won't be too large
title('Vector field')
end



