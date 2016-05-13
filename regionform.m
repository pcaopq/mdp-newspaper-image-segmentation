function blocks = regionform(pattern)
    num_patterns = size(pattern, 1);
    [avh, hgap, vgap] = get_block_gap(pattern);
    
    blocks = [];
    for i = 1:num_patterns
        i
%         if i == 2000
%             figure,
%             img = imread('post3.jpg');
%             img = im2bw(img, 0.7);
%             imshow(img), hold on, draw_patterns(blocks)
%         end
        grouped = false;
        [b, index] = getblocks(blocks, pattern(i).type);
        num_blocks = size(b, 1);
        delete = [];
        
        for j = 1:num_blocks
            found = false;
            num_patterns = size(b(j).patterns, 2);
%             if near(pattern(i).para, b(j).para, hgap, vgap, 1)
                for k = 1:num_patterns
                    if near(pattern(i).para, b(j).patterns(k).para, hgap, vgap, 1)
                        found = true;
                        break;
                    end
                end
                
                if found
                    if ~grouped
%                         addpat(patterns(i), b(j));
                        b(j).patterns = [b(j).patterns pattern(i)];
                        b(j) = get_block_para(b(j));
                        initial_block = j;
                        grouped = true;
                    else
                        b(initial_block) = merge_blocks(b(initial_block), b(j));
                        b(initial_block) = get_block_para(b(initial_block));
                        delete = [delete; j];
                    end
                end
%             end
        end
        
        b(delete) = [];
        blocks(index) = [];
        blocks = [blocks; b];
        
        if ~grouped
%             b = newblock(patterns(i));
%             addpat(patterns(i), b);
            b = struct('patterns',struct(...
                'rects', struct('left', [], 'top', [], 'right', [], 'bottom', []),...
                'para', struct('left', [], 'top', [], 'right', [], 'bottom', [], 'width', [], 'height', [], 'area', [], 'bp_density', [], 'num_bp', [], 'nbr', [], 'mbrl', [],'sp', [], 'vbrl', []),...
                'type', []), 'para',struct('left', [], 'right', [], 'bottom', [], 'top', [], 'width', [], 'height', [], 'area', []), 'type', []);
            b.patterns = pattern(i);
            b.type = pattern(i).type;
            b = get_block_para(b);
            blocks = [blocks; b];
        end
    end
end
%     load('pattern_img_0003_classifed.mat');
%     load('pattern_title.mat');
%     [boxes, delete] = generate_boxes(pattern);
%     [line_patterns, patterns] = extract_line_boxes(pattern, boxes, delete, 2);
%     num_patterns = size(pattern, 1);
%     [avh, hgap, vgap] = get_block_gap(pattern);
%     blocks = [];  