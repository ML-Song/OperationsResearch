function [ simplexTable, posX, posY ] = simplex_one_iter(simplexTable)
%???????????????????????????????%
%?????????????????A???posx???posy%
[row, ~] = size(simplexTable);
[~, posX] = min(simplexTable(1, 1: end - 1));%????????????
tmp = simplexTable(:, end) ./ simplexTable(:, posX);
tmp(tmp < 0) = max(tmp) + 1;%?????
[~, posY] = min(tmp(2:end));%?????z?
posY = posY + 1;%????
disp([posX, posY]);
simplexTable(posY, :) = simplexTable(posY, :)/simplexTable(posY, posX);%?????
for iRow = 1: row
    if iRow ~= posY
        simplexTable(iRow, :) = simplexTable(iRow, :) - simplexTable(posY, :) * simplexTable(iRow, posX);
    end% i? - ?? * i??????
end
disp(simplexTable);
end
