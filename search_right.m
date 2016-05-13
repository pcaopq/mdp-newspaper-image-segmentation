function rst = search_right(img, x, y, xstep)
%x is the width, y is the height
%j is the height, i is the width
    find_black = 0;
    [height, width] = size(img);
    for j= y:min(y+2, height)
        for i = min(x+2,width):-1:x+3-xstep
            if img(j, i) == 0
                rst = i-x+1;
                find_black = 1;
                break;
            end
        end
        if find_black
            break;
        end
    end
    if ~find_black
        rst = 0;
    end
end

