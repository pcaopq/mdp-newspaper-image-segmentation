function rst = search_below(img, rect, ry, ystep)
    %ry is the current row that contains the black pixel
    %i is the height, j is the width
    flag = 0;
    [height, width] = size(img);
    for i = ry+2:-1:ry+3-ystep
        for j = rect.left:min(rect.right, width)-2
            if i+2>height || sum(sum(img(i:i+2,j:j+2).*ones(3,3))) == 9
                flag = 1;
                break;
            end
        end
        if flag
            rst = 0;
            break;
        end
    end
    if ~flag
        rect_tmp = rect;
        rect_tmp.top = ry;
        rst = lowest_row(img, rect_tmp);
    end
end