function [ simplexTable, posX, posY ] = simplex_one_iter(simplexTable)
%�����η���Ŀ�꺯�����ֵ%
%���뵥���α�����µ����α����У� ����%
[row, ~] = size(simplexTable);
[~, posX] = min(simplexTable(1, 1: end - 1));%�������У�����������
tmp = simplexTable(:, end) ./ simplexTable(:, posX);
tmp(tmp <= 0) = max(tmp) + 1;%������С��ֵ
[~, posY] = min(tmp(2:end));%�������У�������z��
posY = posY + 1;
disp([posX, posY]);
simplexTable(posY, :) = simplexTable(posY, :)/simplexTable(posY, posX);%���У���Ԫ
for iRow = 1: row
    if iRow ~= posY
        simplexTable(iRow, :) = simplexTable(iRow, :) - simplexTable(posY, :) * simplexTable(iRow, posX);
    end% i�� - ���� * i��������ϵ��
end
disp(simplexTable);
end
