function [ simplexTable, posX, posY ] = simplex_one_iter(simplexTable)
%单纯形法解目标函数最大值%
%输入单纯形表，输出新单纯形表，主列， 主行%
[row, ~] = size(simplexTable);
[~, posX] = min(simplexTable(1, 1: end - 1));%计算主列，不包括解列
tmp = simplexTable(:, end) ./ simplexTable(:, posX);
tmp(tmp <= 0) = max(tmp) + 1;%计算最小正值
[~, posY] = min(tmp(2:end));%计算主行，不包括z行
posY = posY + 1;
disp([posX, posY]);
simplexTable(posY, :) = simplexTable(posY, :)/simplexTable(posY, posX);%主行／主元
for iRow = 1: row
    if iRow ~= posY
        simplexTable(iRow, :) = simplexTable(iRow, :) - simplexTable(posY, :) * simplexTable(iRow, posX);
    end% i行 - 主行 * i行在主列系数
end
disp(simplexTable);
end
