clear; close all; clc;

%% Fig1
plotXY(-2.5,2.5,-2.5,2.5,true,20)
x = linspace(-2.5,2.5, 100);
y = x+0.5+1/3*sin(2*pi*1/3*x);
hold on;
plot(x,y,'k','linewidth',2)
plot(0.5, 0.5+0.5+1/3*sin(2*pi*1/3*0.5),'o','markerfacecolor','r','markeredgecolor','none','markersize',8)
t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
t.FontSize = 20;

%% Fig 2. 한 점 (x,y)에서 순간 변화율과 평균 변화율 (사진)
plotXY(-2.5,2.5,-2.5,2.5,true,20)
x = linspace(-2.5,2.5, 100);
y = x+0.5+1/3*sin(2*pi*1/3*x);

hold on;
plot(x,y,'k','linewidth',2)
xx = 0.5;

h(1) = plot(xx, xx+0.5+1/3*sin(2*pi*1/3*xx),'o','markerfacecolor','r','markeredgecolor','none','markersize',8);
t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
t.FontSize = 20;

dydx = 1+1/3*2*pi*1/3*cos(2*pi*1/3*xx);
x = linspace(xx-1,xx+1,10);
h(2) = plot(x, dydx*(x-xx) + xx+0.5+1/3*sin(2*pi*1/3*xx),'color','b','linewidth',2);

slope = (xx+0.5+1/3*sin(2*pi*1/3*xx))/xx;
if xx ==0
    h(3) = line([0,0],[0,2],'color','r','linewidth',2);
elseif xx > 0
    x = linspace(0,xx+0.5,10);
    h(3) = plot(x, slope*x,'color','r','linewidth',2);
elseif xx<0
    x = linspace(xx-0.5,0,10);
    h(3)= plot(x, slope*x,'color','r','linewidth',2);
end


%% Fig 3. 한 점 (x,y)에서 순간 변화율과 평균 변화율 (동영상)
clear v
v = VideoWriter('fig3.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F

plotXY(-2.5,2.5,-2.5,2.5,true,20)
x = linspace(-2.5,2.5, 100);
y = x+0.5+1/3*sin(2*pi*1/3*x);

hold on;
plot(x,y,'k','linewidth',2)
i=1;
for xx = linspace(-3,3,100)
    
    h(1) = plot(xx, xx+0.5+1/3*sin(2*pi*1/3*xx),'o','markerfacecolor','r','markeredgecolor','none','markersize',8);
    %     t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
    %     t.FontSize = 20;
    
    dydx = 1+1/3*2*pi*1/3*cos(2*pi*1/3*xx);
    x = linspace(xx-1,xx+1,10);
    h(2) = plot(x, dydx*(x-xx) + xx+0.5+1/3*sin(2*pi*1/3*xx),'color','b','linewidth',2);
    
    slope = (xx+0.5+1/3*sin(2*pi*1/3*xx))/xx;
    if xx ==0
        h(3) = line([0,0],[0,2],'color','r','linewidth',2);
    elseif xx > 0
        x = linspace(0,xx+0.5,10);
        h(3) = plot(x, slope*x,'color','r','linewidth',2);
    elseif xx<0
        x = linspace(xx-0.5,0,10);
        h(3)= plot(x, slope*x,'color','r','linewidth',2);
    end
    drawnow;
    
    F(i)=getframe(gcf);
    if xx<3
        delete(h)
    end
    i=i+1;
end


for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)

%% Fig 4
plotXY(-2.5,2.5,-2.5,2.5,true,20)
x = linspace(-2.5,2.5, 500);
y = x+1/3*sin(2*pi*1/3*x);
hold on;
plot(x,y,'k','linewidth',2)
plot(0.5, 0.5+1/3*sin(2*pi*1/3*0.5),'o','markerfacecolor','r','markeredgecolor','none','markersize',8)
t = text(0.6307, 0.7953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
t.FontSize = 20;

%% Fig 5. 한 점 (x,y) -> (0,0) 순간 변화율과 평균 변화율 (동영상)
clear v
v = VideoWriter('fig5.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F

plotXY(-2.5,2.5,-2.5,2.5,true,20)
x = linspace(-2.5,2.5, 100);
y = x+1/3*sin(2*pi*1/3*x);

hold on;
plot(x,y,'k','linewidth',2)
i=1;
for xx = linspace(3,eps,200)
    
    h(1) = plot(xx, xx+1/3*sin(2*pi*1/3*xx),'o','markerfacecolor','r','markeredgecolor','none','markersize',8);
    %     t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
    %     t.FontSize = 20;
    
    dydx = 1+1/3*2*pi*1/3*cos(2*pi*1/3*xx);
    x = linspace(xx-1,xx+1,10);
    h(2) = plot(x, dydx*(x-xx) + xx+1/3*sin(2*pi*1/3*xx),'color','b','linewidth',2);
    
    slope = (xx+1/3*sin(2*pi*1/3*xx))/(xx+eps);
    if xx == eps
        slope = dydx;
        x = linspace(0,xx+2,10);
        h(3) = plot(x, slope*x,'color','r','linewidth',2);
    elseif xx >0
        x = linspace(0,xx+2,10);
        h(3) = plot(x, slope*x,'color','r','linewidth',2);
    elseif xx<0
        x = linspace(xx-0.5,0,10);
        h(3)= plot(x, slope*x,'color','r','linewidth',2);
    end
    drawnow;
    
    F(i)=getframe(gcf);
    
    if xx>eps
        delete(h)
    end
    i=i+1;
end


for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)


%% Fig 6. 한 점 (x,y) -> (inf, inf) 순간 변화율과 평균 변화율
figure;
set(gcf,'position',[500,100,1000,650])
set(gcf,'color','w');

xx = 3.72;

if xx<20
    plotXY(-20,20,-20,20,false,15)
    x = linspace(-20,20, 500);
elseif xx<100
    plotXY(-20+20*xx/99,xx,-20+20*xx/99,xx,false,10)
    x = linspace(-20,xx, 500);
else
    plotXY(0,xx,0,xx,false,10)
    x = linspace(-20,xx, 500);
end

y = 1/5*x+5+2*sin(2*pi*1/3*x).*exp(-x.^2/100);

hold on;
plot(x,y,'k','linewidth',2)

h(1) = plot(xx, 1/5*xx+5+2*sin(2*pi*1/3*xx).*exp(-xx.^2/100),'o','markerfacecolor','r','markeredgecolor','none','markersize',8);
%     t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
%     t.FontSize = 20;

%     dydx = 1+1/3*2*pi*1/3*cos(2*pi*1/3*xx);
dydx = ...
    -2/15*xx.*exp((-xx.^2)/100).*sin(2*pi*xx/3)+...
    4*pi*exp((-xx.^2)/100).*cos(2*pi*xx/3)/3+...
    1/5;
XLIMs = xlim;
dst = diff(XLIMs);
x = linspace(xx-dst/10,xx+dst/10,10);
h(2) = plot(x, dydx*(x-xx) + 1/5*xx+5+2*sin(2*pi*1/3*xx).*exp(-xx.^2/100),'color','b','linewidth',2);

slope = (1/5*xx+5+2*sin(2*pi*1/3*xx).*exp(-xx.^2/100))/(xx+eps);
if xx == eps
    slope = dydx;
    x = linspace(0,xx+2,10);
    h(3) = plot(x, slope*x,'color','r','linewidth',2);
elseif xx >0
    x = linspace(0,xx+2,10);
    h(3) = plot(x, slope*x,'color','r','linewidth',2);
elseif xx<0
    x = linspace(xx-0.5,0,10);
    h(3)= plot(x, slope*x,'color','r','linewidth',2);
end
%% Fig 7. 한 점 (x,y) -> (inf, inf) 순간 변화율과 평균 변화율 (동영상)
clear v
v = VideoWriter('fig7.mp4','MPEG-4');
v.FrameRate = 30;
v.Quality = 100;
open(v);

clear F
i=1;
figure;
set(gcf,'position',[500,100,1000,650])
set(gcf,'color','w');
endpoint = 3000;
for xx = [linspace(3.72,20,200),linspace(20,100,100),linspace(100,endpoint,500)]
    
    if xx<20
        plotXY(-20,20,-20,20,false,15)
        x = linspace(-20,20, 500);
    elseif xx<100
        plotXY(-20+20*xx/99,xx,-20+20*xx/99,xx,false,10)
        x = linspace(-20,xx, 500);
    else
        plotXY(0,xx,0,xx,false,10)
        x = linspace(-20,xx, 500);
    end
    
    y = 1/5*x+5+2*sin(2*pi*1/3*x).*exp(-x.^2/100);
    
    hold on;
    plot(x,y,'k','linewidth',2)
    
    h(1) = plot(xx, 1/5*xx+5+2*sin(2*pi*1/3*xx).*exp(-xx.^2/100),'o','markerfacecolor','r','markeredgecolor','none','markersize',8);
    %     t = text(0.6307, 1.2953, '$$ (x,y) = (g(t), f(t)) $$','Interpreter','latex');
    %     t.FontSize = 20;
    
    %     dydx = 1+1/3*2*pi*1/3*cos(2*pi*1/3*xx);
    dydx = ...
        -2/15*xx.*exp((-xx.^2)/100).*sin(2*pi*xx/3)+...
        4*pi*exp((-xx.^2)/100).*cos(2*pi*xx/3)/3+...
        1/5;
    XLIMs = xlim;
    dst = diff(XLIMs);
    x = linspace(xx-dst/10,xx+dst/10,10);
    h(2) = plot(x, dydx*(x-xx) + 1/5*xx+5+2*sin(2*pi*1/3*xx).*exp(-xx.^2/100),'color','b','linewidth',2);
    
    slope = (1/5*xx+5+2*sin(2*pi*1/3*xx).*exp(-xx.^2/100))/(xx+eps);
    if xx == eps
        slope = dydx;
        x = linspace(0,xx+2,10);
        h(3) = plot(x, slope*x,'color','r','linewidth',2);
    elseif xx >0
        x = linspace(0,xx+2,10);
        h(3) = plot(x, slope*x,'color','r','linewidth',2);
    elseif xx<0
        x = linspace(xx-0.5,0,10);
        h(3)= plot(x, slope*x,'color','r','linewidth',2);
    end
    drawnow;
    
    F(i)=getframe(gcf);
    
    %     if xx>eps
    if xx<endpoint
        cla
    end
    %     end
    i=i+1;
end


for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;
    writeVideo(v, frame);
end

close(v)
