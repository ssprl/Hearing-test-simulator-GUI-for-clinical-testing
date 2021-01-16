function setPosition(x,y)
    scrsz = get(0,'ScreenSize');
    pos_act = get(gcf,'Position');
    xr = scrsz(3);
    xp = round(xr/x);
    yr = scrsz(4);
    yp = round(yr/y);
    set(gcf,'Position',[xp yp pos_act(3) pos_act(4)]);
end

