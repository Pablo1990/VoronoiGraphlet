function [  ] = pipelineGraphletsVoronoi( typeOfData )
%PIPELINEGRAPHLETSVORONOI Pipeline of the project
%   From the start to the beggining, all should be done here
%   or, at least, the main functionalities.
%   
%   typeOfData: name of the directory we're using
%
%   Developed by Pablo Vicente-Munuera
    clearvars -except typeOfData
    addpath(genpath('src\'))

    dataDir = strcat('data\', typeOfData);
    %Firstly, we calculate neighbours and valid cells
    
    disp('Calculating neighbours and valid cells');
    Calculate_neighbors_polygon_distribution(dataDir);
    validCellsDir = strcat('results\validCellsMaxPathLength\', typeOfData);
    mkdir(validCellsDir, 'maxLength4');
    mkdir(validCellsDir, 'maxLength5');
    %ValidCells of max path length 4 and 5.
    disp('Valid cells from ROI');
    getValidCellsFromROI(dataDir, 4, validCellsDir);
    getValidCellsFromROI(dataDir, 5, validCellsDir);
    
    networksDir = strcat('results\networks\', typeOfData);
    if exist(networksDir, 'dir') ~= 7
        mkdir(networksDir);
    end
    
    disp('Creating network');
     createNetworksFromVoronoiDiagrams(strcat(validCellsDir, 'maxLength5\'), networksDir);
    
    
    disp('Leda files...');
    calculateLEDAFilesFromDirectory(networksDir, typeOfData);
    graphletResultsDir = strcat('results\graphletResults\', typeOfData);
    if exist(graphletResultsDir, 'dir') ~= 7
        mkdir(graphletResultsDir);
    end
    
    %Now, we have to wait until .ndump2 are created
    answer = 'n';
    while answer ~= 'y'
        answer = input('Are .ndump2 created? [y/n] ');
    end
    %After that, 
    graphletResultsFilteredDir = strcat('results\graphletResultsFiltered\', typeOfData);
    mkdir(graphletResultsFilteredDir);
    if isempty(strfind(typeOfData, 'Weighted'))
        mkdir(graphletResultsFilteredDir, 'Basica');
        mkdir(graphletResultsFilteredDir, 'BasicaParcial');
        mkdir(graphletResultsFilteredDir, 'Total');
        mkdir(graphletResultsFilteredDir, 'TotalParcial');
    else
        mkdir(graphletResultsFilteredDir, 'Basica\NeighboursOfCancerCells');
        mkdir(graphletResultsFilteredDir, 'Basica\CancerCells');
        mkdir(graphletResultsFilteredDir, 'BasicaParcial\NeighboursOfCancerCells');
        mkdir(graphletResultsFilteredDir, 'BasicaParcial\CancerCells');
        mkdir(graphletResultsFilteredDir, 'Total\NeighboursOfCancerCells');
        mkdir(graphletResultsFilteredDir, 'Total\CancerCells');
        mkdir(graphletResultsFilteredDir, 'TotalParcial\NeighboursOfCancerCells');
        mkdir(graphletResultsFilteredDir, 'TotalParcial\CancerCells');
    end
    
    
%     for i = 12:73
%         filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength5\'), 'finalValidCells', i, strcat('WithGraphlet', num2str(i)));
%     end
    %Basica
    filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength4\'), 'finalValidCells', 16:73, 'Basica');
    %BasicaParcial
    filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength4\'), 'finalValidCells', [9, 15, 16:73], 'BasicaParcial');
    %Total
    filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength5\'), 'finalValidCells', [50, 51, 63:65, 55, 56, 69, 70], 'Total');
    %TotalParcial
    filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength5\'), 'finalValidCells', [9, 15, 23, 24, 37:39, 50:59, 63:73], 'TotalParcial');
    
    %Valid cells
%     filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength5\'), 'validCells', [], '');
%     filterByNonValidCells(graphletResultsDir, strcat(validCellsDir, 'maxLength4\'), 'validCells', [], '');

%     %Individual cells
%     graphletResultsIndividual = strcat('results\graphletResultsIndividual\', typeOfData);
% %     mkdir(strcat(graphletResultsIndividual, 'Total'));
% %     mkdir(strcat(graphletResultsIndividual, 'TotalParcial'));
% %     mkdir(strcat(graphletResultsIndividual, 'Basica'));
% %     mkdir(strcat(graphletResultsIndividual, 'BasicaParcial'));
%      getSpecialIndividualCells(graphletResultsDir, strcat(graphletResultsIndividual, 'Total\'), dataDir, strcat(validCellsDir, 'maxLength5\'), [50, 51, 63:65, 55, 56, 69, 70]);
% %     getSpecialIndividualCells(graphletResultsDir, strcat(graphletResultsIndividual, 'TotalParcial\'), dataDir, strcat(validCellsDir, 'maxLength5\'), [9, 15, 23, 24, 37:39, 50:59, 63:73]);
% %     getSpecialIndividualCells(graphletResultsDir, strcat(graphletResultsIndividual, 'BasicaParcial\'), dataDir, strcat(validCellsDir, 'maxLength4\'), [9, 15, 16:73]);
% %     getSpecialIndividualCells(graphletResultsDir, strcat(graphletResultsIndividual, 'Basica\'), dataDir, strcat(validCellsDir, 'maxLength4\'), 16:73);
%     
%     distanceDir = strcat('results\distanceMatrix\', typeOfData);
% 
%     mkdir(distanceDir, 'Basica');
%     mkdir(distanceDir, 'BasicaParcial');
%     mkdir(distanceDir, 'Total');
%     mkdir(distanceDir, 'TotalParcial');
%     
%     comparisonDir = 'results\comparisons\EveryFile\';
%     mkdir(comparisonDir, strcat('Total\AgainstVoronoi1\', typeOfData));
%     mkdir(comparisonDir, strcat('Total\AgainstHexagons\', typeOfData));
%     mkdir(comparisonDir, strcat('TotalParcial\AgainstVoronoi1\', typeOfData));
%     mkdir(comparisonDir, strcat('TotalParcial\AgainstHexagons\', typeOfData));
%     mkdir(comparisonDir, strcat('Basica\AgainstVoronoi1\', typeOfData));
%     mkdir(comparisonDir, strcat('Basica\AgainstHexagons\', typeOfData));
%     mkdir(comparisonDir, strcat('BasicaParcial\AgainstVoronoi1\', typeOfData));
%     mkdir(comparisonDir, strcat('BasicaParcial\AgainstHexagons\', typeOfData));
%     
%     if isempty(strfind(typeOfData, 'Weighted')) == 0
%         mkdir(comparisonDir, strcat('Basica\AgainstHexagons\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('Basica\AgainstHexagons\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('BasicaParcial\AgainstHexagons\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('BasicaParcial\AgainstHexagons\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('Total\AgainstHexagons\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('Total\AgainstHexagons\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('TotalParcial\AgainstHexagons\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('TotalParcial\AgainstHexagons\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('Basica\AgainstVoronoi1\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('Basica\AgainstVoronoi1\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('BasicaParcial\AgainstVoronoi1\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('BasicaParcial\AgainstVoronoi1\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('Total\AgainstVoronoi1\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('Total\AgainstVoronoi1\', typeOfData, 'CancerCells'));
%         mkdir(comparisonDir, strcat('TotalParcial\AgainstVoronoi1\', typeOfData, 'NeighboursOfCancerCells'));
%         mkdir(comparisonDir, strcat('TotalParcial\AgainstVoronoi1\', typeOfData, 'CancerCells'));
%     end
%     
%     getPercentageOfHexagons('results\graphletResultsFiltered\allOriginal\', '', 'maxLength5');
%     getPercentageOfHexagons('results\graphletResultsFiltered\allOriginal\', '', 'maxLength4');
end