%Developed by Pablo Vicente-Munuera

createNetworksFromVoronoiDiagrams('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\voronoiDiagrams\');

cd 'E:\Pablo\PhD-miscelanious\voronoiNetworks\results\networks';
calculateLEDAFilesFromDirectory();

analyzeGraphletDistances('E:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\');

%-------------------- biologicalImages ---------------------%
Calculate_neighbors_polygon_distribution('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\biologicalImages\cNT\');

% for i = 1:20
%     fileName = strcat('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\voronoiDiagrams\imagen_', num2str(i), '_Diagrama_', num2str(1), '.mat');
%     load(fileName);
%     celulas_validas_Final = celulas_validas;
%     for j = 2:20
%         fileName = strcat('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\voronoiDiagrams\imagen_', num2str(i), '_Diagrama_', num2str(j), '.mat');
%         load(fileName);
%         celulas_validas_Final = intersect(celulas_validas, 
%     end
% end

createNetworksFromVoronoiDiagrams('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\biologicalImages\');
cd 'E:\Pablo\PhD-miscelanious\voronoiNetworks\results\networks';
calculateLEDAFilesFromDirectory();

filterByNonValidCells( 'E:\Pablo\PhD-miscelanious\voronoiNetworks\results\graphletResults' );

analyzeGraphletDistances('E:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\');

load('E:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\distanceMatrixMeanGCD73.mat')
easyHeatmap(distanceMatrix, names, 'voronoiIterations', 'voronoi', max(distanceMatrix(:)))

distanceMatrixEmboData = distanceMatrix(1:5, 6:end);
namesEmboData = names(1:5);
easyHeatmap(distanceMatrixEmboData, namesEmboData, 'EmboData', '', max(distanceMatrix(:)))

indicesDS1 = [2 5 6 7];
distanceMatrixDS1 = distanceMatrix(indicesDS1, indicesDS1);
namesDS1 = names(indicesDS1);
easyHeatmap(distanceMatrixDS1, namesDS1, 'v1-v2-Eye-cNT', '', max(distanceMatrix(:)))

indicesDS2 = [1 3 4 9 10 11];
distanceMatrixDS2 = distanceMatrix(indicesDS2, indicesDS2);
namesDS2 = names(indicesDS2);
easyHeatmap(distanceMatrixDS2, namesDS2, 'v4-v5-v6-dWP-dWL-BCA', '', max(distanceMatrix(:)))


% names = cellfun(@(x) strsplit(x, '/'), names, 'UniformOutput', false);
% names = cellfun(@(x) x{end}, names, 'UniformOutput', false);
% names = cellfun(@(x) x(16:end), names, 'UniformOutput', false);
% 
% bcaNames = cellfun(@(x) size(strfind(x, 'BC'), 1) > 0, names);
% cntNames = cellfun(@(x) size(strfind(x, 'cNT'), 1) > 0, names);
% dwlNames = cellfun(@(x) size(strfind(x, 'dWL'), 1) > 0, names);
% dwpNames = cellfun(@(x) size(strfind(x, 'dWP'), 1) > 0, names);
% ommNames = cellfun(@(x) size(strfind(x, 'omm'), 1) > 0, names);
% splittedNames = cellfun(@(x) strsplit(x, '_'), names, 'UniformOutput', false);
% splittedNames = cellfun(@(x) x{end}, splittedNames, 'UniformOutput', false);
% 
% v1Names = cellfun(@(x) isequal(x,'1'), splittedNames);
% v2Names = cellfun(@(x) isequal(x,'2'), splittedNames);
% v4Names = cellfun(@(x) isequal(x,'4'), splittedNames);
% v5Names = cellfun(@(x) isequal(x,'5'), splittedNames);
% v6Names = cellfun(@(x) isequal(x,'6'), splittedNames);
% 
% dataset1 = v1Names | v2Names | ommNames | cntNames;
% dataset2 = v4Names | v5Names | v6Names | dwpNames | dwlNames | bcaNames;
% 
% distanceMatrixMean = [mean(distanceMatrixMean(bcaNames, :)); mean(distanceMatrixMean(cntNames, :)); mean(distanceMatrixMean(dwlNames, :)); mean(distanceMatrixMean(dwpNames, :)); mean(distanceMatrixMean(ommNames, :));];
% distanceMatrixDS1 = zeros(4);
% 
% distanceMatrixDS1(1,1) = mean(mean(distanceMatrix(v1Names,v1Names)));
% distanceMatrixDS1(1,2) = mean(mean(distanceMatrix(v1Names,v2Names)));
% distanceMatrixDS1(1,3) = mean(mean(distanceMatrix(v1Names,ommNames)));
% distanceMatrixDS1(1,4) = mean(mean(distanceMatrix(v1Names,cntNames)));
% distanceMatrixDS1(2,1) = mean(mean(distanceMatrix(v2Names,v1Names)));
% distanceMatrixDS1(2,2) = mean(mean(distanceMatrix(v2Names,v2Names)));
% distanceMatrixDS1(2,3) = mean(mean(distanceMatrix(v2Names,ommNames)));
% distanceMatrixDS1(2,4) = mean(mean(distanceMatrix(v2Names,cntNames)));
% distanceMatrixDS1(3,1) = mean(mean(distanceMatrix(ommNames,v1Names)));
% distanceMatrixDS1(3,2) = mean(mean(distanceMatrix(ommNames,v2Names)));
% distanceMatrixDS1(3,3) = mean(mean(distanceMatrix(ommNames,ommNames)));
% distanceMatrixDS1(3,4) = mean(mean(distanceMatrix(ommNames,cntNames)));
% distanceMatrixDS1(4,1) = mean(mean(distanceMatrix(cntNames,v1Names)));
% distanceMatrixDS1(4,2) = mean(mean(distanceMatrix(cntNames,v2Names)));
% distanceMatrixDS1(4,3) = mean(mean(distanceMatrix(cntNames,ommNames)));
% distanceMatrixDS1(4,4) = mean(mean(distanceMatrix(cntNames,cntNames)));
% 
% easyHeatmap(distanceMatrixDS1, {'voronoi1', 'voronoi2', 'omm', 'cNT'}, 'v1-v2-Eye-cNT_MaxChanged', '', max(distanceMatrix(:)));
% 
% distanceMatrixDS2 = zeros(6);
% 
% distanceMatrixDS2(1,1) = mean(mean(distanceMatrix(v4Names,v4Names)));
% distanceMatrixDS2(1,2) = mean(mean(distanceMatrix(v4Names,v5Names)));
% distanceMatrixDS2(1,3) = mean(mean(distanceMatrix(v4Names,v6Names)));
% distanceMatrixDS2(1,4) = mean(mean(distanceMatrix(v4Names,dwpNames)));
% distanceMatrixDS2(1,5) = mean(mean(distanceMatrix(v4Names,dwlNames)));
% distanceMatrixDS2(1,6) = mean(mean(distanceMatrix(v4Names,bcaNames)));
% distanceMatrixDS2(2,1) = mean(mean(distanceMatrix(v5Names,v4Names)));
% distanceMatrixDS2(2,2) = mean(mean(distanceMatrix(v5Names,v5Names)));
% distanceMatrixDS2(2,3) = mean(mean(distanceMatrix(v5Names,v6Names)));
% distanceMatrixDS2(2,4) = mean(mean(distanceMatrix(v5Names,dwpNames)));
% distanceMatrixDS2(2,5) = mean(mean(distanceMatrix(v5Names,dwlNames)));
% distanceMatrixDS2(2,6) = mean(mean(distanceMatrix(v5Names,bcaNames)));
% distanceMatrixDS2(3,1) = mean(mean(distanceMatrix(v6Names,v4Names)));
% distanceMatrixDS2(3,2) = mean(mean(distanceMatrix(v6Names,v5Names)));
% distanceMatrixDS2(3,3) = mean(mean(distanceMatrix(v6Names,v6Names)));
% distanceMatrixDS2(3,4) = mean(mean(distanceMatrix(v6Names,dwpNames)));
% distanceMatrixDS2(3,5) = mean(mean(distanceMatrix(v6Names,dwlNames)));
% distanceMatrixDS2(3,6) = mean(mean(distanceMatrix(v6Names,bcaNames)));
% distanceMatrixDS2(4,1) = mean(mean(distanceMatrix(dwpNames,v4Names)));
% distanceMatrixDS2(4,2) = mean(mean(distanceMatrix(dwpNames,v5Names)));
% distanceMatrixDS2(4,3) = mean(mean(distanceMatrix(dwpNames,v6Names)));
% distanceMatrixDS2(4,4) = mean(mean(distanceMatrix(dwpNames,dwpNames)));
% distanceMatrixDS2(4,5) = mean(mean(distanceMatrix(dwpNames,dwlNames)));
% distanceMatrixDS2(4,6) = mean(mean(distanceMatrix(dwpNames,bcaNames)));
% distanceMatrixDS2(5,1) = mean(mean(distanceMatrix(dwlNames,v5Names)));
% distanceMatrixDS2(5,2) = mean(mean(distanceMatrix(dwlNames,v5Names)));
% distanceMatrixDS2(5,3) = mean(mean(distanceMatrix(dwlNames,v6Names)));
% distanceMatrixDS2(5,4) = mean(mean(distanceMatrix(dwlNames,dwpNames)));
% distanceMatrixDS2(5,5) = mean(mean(distanceMatrix(dwlNames,dwlNames)));
% distanceMatrixDS2(5,6) = mean(mean(distanceMatrix(dwlNames,bcaNames)));
% distanceMatrixDS2(6,1) = mean(mean(distanceMatrix(bcaNames,v5Names)));
% distanceMatrixDS2(6,2) = mean(mean(distanceMatrix(bcaNames,v5Names)));
% distanceMatrixDS2(6,3) = mean(mean(distanceMatrix(bcaNames,v6Names)));
% distanceMatrixDS2(6,4) = mean(mean(distanceMatrix(bcaNames,dwpNames)));
% distanceMatrixDS2(6,5) = mean(mean(distanceMatrix(bcaNames,dwlNames)));
% distanceMatrixDS2(6,6) = mean(mean(distanceMatrix(bcaNames,bcaNames)));

% easyHeatmap(distanceMatrixDS2, {'v4', 'v5', 'v6', 'dWP', 'dWL', 'BCA'}, 'v4-v5-v6-dWP-dWL-BCA', '', max(distanceMatrixDS2(:)));
% easyHeatmap(distanceMatrixDS2, {'v4', 'v5', 'v6', 'dWP', 'dWL', 'BCA'}, 'v4-v5-v6-dWP-dWL-BCA_changedMax', '', max(distanceMatrix(:)));
% easyHeatmap(distanceMatrixMean, {'BCA', 'cNT', 'dWL', 'dWP', 'omm'}, 'emboData', '')


%--------- generate again voronoi diagrams ----------%

for i = 1:20
    fileName = strcat('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\voronoiDiagrams\imagen_', num2str(i));
    generateVoronoi( 20, 1024, 500, fileName );
end

createNetworksFromVoronoiDiagrams('E:\Pablo\PhD-miscelanious\voronoiNetworks\data\voronoiDiagrams\data');
cd 'D:\Pablo\PhD-miscelanious\voronoiNetworks\results\networks';
calculateLEDAFilesFromDirectory();

filterByNonValidCells( 'E:\Pablo\PhD-miscelanious\voronoiNetworks\results\graphletResults' );

%---------------------%
%Valid cells from a fixed path length, which will lead to 
%a circular ROI of valid cells.

[ finalValidCells ] = getValidCellsFromROI('D:\Pablo\PhD-miscelanious\voronoiNetworks\data\', 5);

[ finalValidCells ] = getValidCellsFromROI('D:\Pablo\PhD-miscelanious\voronoiNetworks\data\', 4);

image = BC062b_adaptated;
image = im2bw(image(:,:,1), 0.2);
if sum(image(:) == 255) > sum(image(:) == 0) || sum(image(:) == 1) > sum(image(:) == 0)
    Img_L = bwlabel(image);
else
    image = image == 0;
    Img_L = bwlabel(image);
end

figure;
imshow(Img_L, colorcube(max(Img_L(:))));

figure;
maxCellLabel = max(cellfun(@(x) max(x), vecinos));
noValidCells = setxor(1:maxCellLabel, celulas_validas);
Img_L_Show = ismember(Img_L, celulas_validas);
imshow(Img_L_Show, colorcube)

figure;
Img_L_Show = ismember(Img_L, finalValidCells) .* Img_L;
imshow(Img_L_Show, colorcube(max(Img_L(:))));

filterByNonValidCells( 'D:\Pablo\PhD-miscelanious\voronoiNetworks\results\graphletResults' );

%---- max path length 4 ------%
analyzeGraphletDistances('D:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\maxLength4\');

load('D:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\maxLength4\distanceMatrixMeanGCD11.mat')
easyHeatmap(distanceMatrix, names, 'voronoiIterations_MaxPathLength4GCD11', 'voronoi', max(distanceMatrix(:)))

distanceMatrixEmboData = distanceMatrix(1:5, 6:end);
namesEmboData = names(1:5);
easyHeatmap(distanceMatrixEmboData, namesEmboData, 'EmboData_MaxPathLength4GCD11', '', max(distanceMatrix(:)))

indicesDS1 = [2 5 6 7];
distanceMatrixDS1 = distanceMatrix(indicesDS1, indicesDS1);
namesDS1 = names(indicesDS1);
easyHeatmap(distanceMatrixDS1, namesDS1, 'v1-v2-Eye-cNT_MaxPathLength4GCD11', '', max(distanceMatrix(:)))

indicesDS2 = [1 3 4 9 10 11];
distanceMatrixDS2 = distanceMatrix(indicesDS2, indicesDS2);
namesDS2 = names(indicesDS2);
easyHeatmap(distanceMatrixDS2, namesDS2, 'v4-v5-v6-dWP-dWL-BCA_MaxPathLength4GCD11', '', max(distanceMatrix(:)))

%---- maxPath length 5 ---%

analyzeGraphletDistances('D:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\maxLength5\');

load('D:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\maxLength5\distanceMatrixMeanGCD11.mat')
easyHeatmap(distanceMatrix, names, 'voronoiIterations_MaxPathLength5GCD11', 'voronoi', max(distanceMatrix(:)))

distanceMatrixEmboData = distanceMatrix(1:5, 6:end);
namesEmboData = names(1:5);
easyHeatmap(distanceMatrixEmboData, namesEmboData, 'EmboData_MaxPathLength5GCD11', '', max(distanceMatrix(:)))

indicesDS1 = [2 5 6 7];
distanceMatrixDS1 = distanceMatrix(indicesDS1, indicesDS1);
namesDS1 = names(indicesDS1);
easyHeatmap(distanceMatrixDS1, namesDS1, 'v1-v2-Eye-cNT_MaxPathLength5GCD11', '', max(distanceMatrix(:)))

indicesDS2 = [1 3 4 9 10 11];
distanceMatrixDS2 = distanceMatrix(indicesDS2, indicesDS2);
namesDS2 = names(indicesDS2);
easyHeatmap(distanceMatrixDS2, namesDS2, 'v4-v5-v6-dWP-dWL-BCA_MaxPathLength5GCD11', '', max(distanceMatrix(:)))


load('D:\Pablo\PhD-miscelanious\voronoiNetworks\results\distanceMatrix\maxLength5\distanceMatrixMeanGCD73.mat')
easyHeatmap(distanceMatrix, names, 'voronoiIterations_MaxPathLength5GCD73', 'voronoi', max(distanceMatrix(:)))

distanceMatrixEmboData = distanceMatrix(1:5, 6:end);
namesEmboData = names(1:5);
easyHeatmap(distanceMatrixEmboData, namesEmboData, 'EmboData_MaxPathLength5GCD73', '', max(distanceMatrix(:)))

indicesDS1 = [2 5 6 7];
distanceMatrixDS1 = distanceMatrix(indicesDS1, indicesDS1);
namesDS1 = names(indicesDS1);
easyHeatmap(distanceMatrixDS1, namesDS1, 'v1-v2-Eye-cNT_MaxPathLength5GCD73', '', max(distanceMatrix(:)))

indicesDS2 = [1 3 4 9 10 11];
distanceMatrixDS2 = distanceMatrix(indicesDS2, indicesDS2);
namesDS2 = names(indicesDS2);
easyHeatmap(distanceMatrixDS2, namesDS2, 'v4-v5-v6-dWP-dWL-BCA_MaxPathLength5GCD73', '', max(distanceMatrix(:)))

