function [bData31_1dataAll, bData31_1PositionAll, bData31_2dataAll, bData31_2PositionAll] = importAlldataLee2mat(aFolderName,a01,aC31)
% 2019/05/20
% import all data to be one!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PATH
%%% aFolderName = '11-Tracking-062F-2000H-5P05G1LDG';
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fold loading
%%% a01 = 'N*P*';
ass = dir(a01);
assCell = struct2cell(ass)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check
bData31_1PositionAll = [];
bData31_1dataAll = [];
bData31_2PositionAll = [];
bData31_2dataAll = [];

aFullPath = ass.folder;    
%%% aFolderNameC1 = '02-Selective-Tracking';
% Checking 
for aa1 = 1:numel(ass)
    aCheckName1 = [aFullPath '\' assCell{aa1,1}];   
    %%% aC31 = '*31_SEL_near_NPC.xlsx';
    aCheckName31 = [aCheckName1 '\' aFolderName '\' aC31];
    aCheckDir31 = dir(aCheckName31);
    aCheckDir31name = aCheckDir31.name;
    bImportName31 = [aCheckName1 '\' aFolderName '\' aCheckDir31name];
    
    bCheckName31 = [aCheckName1 '\' aFolderName '\03-Individual-Tracking-Record\*.tif'];
    bCheckDir31 = dir(bCheckName31);
    cc1 = numel(bCheckDir31);
   
    if cc1 > 0 
    bData31 = importdata(bImportName31);
    bData31_1 = bData31.w05TTN;
    bData31_2 = bData31.w01OPN;
    else
    bData31_1 = [];
    bData31_2 = [];
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    bData31_1data = bData31_1;
    bData31_2data = bData31_2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 1
    if isempty(bData31_1data) == 0
        for aa2 = 1:numel(bData31_1data(:,1))
            aa3 = char(string(aa2));
            aa4 = ([assCell{aa1,1} '_Position_' aa3]);
            bData31_1Position{aa2,1} = aa4;
        end
        % 2
         for aa2 = 1:numel(bData31_2data(:,1))
            aa3 = char(string(aa2));
            aa4 = ([assCell{aa1,1} '_Position_' aa3]);
            bData31_2Position{aa2,1} = aa4;
         end
        bData31_1PositionAll = [bData31_1PositionAll; bData31_1Position];
        bData31_2PositionAll = [bData31_2PositionAll; bData31_2Position];
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % 1
        % bData31_1data = bData31_1;
        bData31_1dataAll = [bData31_1dataAll; bData31_1data];    
        % 2
        % bData31_2data = bData31_2;
        bData31_2dataAll = [bData31_2dataAll; bData31_2data];  
   
    end
    
        % clear data
        bData31_1data = [];
        bData31_1 = [];
        bData31_1Position = [];
        bData31_2data = [];
        bData31_2 = [];
        bData31_2Position = [];
        aCheckDir31name = [];
end

end

    


       



