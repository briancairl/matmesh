function cleanfig(f)
    a = get(f,'CurrentAxes');
    set(a,'XTick',[])
    set(a,'YTick',[])
    set(a,'ZTick',[])
    set(a,'Color','k')
    set(f,'Color','k')
end