function [bData31dataAll] = importAlldataLee2SRaw(aFolderName,a01,aFolderNameC2,aC31,aSelection4)
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
bData31PositionAll = [];
bData31dataAll = [];

aFullPath = ass.folder;    
%%% aFolderNameC2 = '02-Selective-Tracking';
for aa1 = 1:numel(ass)
    aCheckName1 = [aFullPath '\' assCell{aa1,1}];   
    %%% aC31 = '*31_SEL_near_NPC.xlsx';
    aCheckName31 = [aCheckName1 '\' aFolderName '\' aFolderNameC2 '\' aC31];
    aCheckDir31 = dir(aCheckName31);
    
if isempty(aCheckDir31) == 0
    % Data
    aCheckDir31name = aCheckDir31.name;
    bImportName31 = [aCheckName1 '\' aFolderName '\' aFolderNameC2 '\' aCheckDir31name];
    bData31 = importdata(bImportName31);
 
%     if numel(bData31.data) ~= 1
%     bData32.data.Sheet1 = bData31.data;
%     bData32.textdata.Sheet1 = bData31.textdata;
%     else
%         bData32 = bData31;
%     end

 bData32 = bData31; 
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % Only for "aC31 = '*45_SEL_19um_s_speed.xlsx';"
%     if strcmp(aC31,'*45_SEL_19um_s_speed.xlsx') == 1
% %             strcmp(aC31,'*32_SEL_Total_Movement_um_near_NPC.xlsx') == 1 ||...
% %             strcmp(aC31,'*32_SEL_Total_Acceleration_um_near_NPC.xlsx') == 1 ||...
% %             strcmp(aC31,'*32_SEL_Total_Velocity_um_near_NPC.xlsx') == 1 ||...
% %             strcmp(aC31,'*33_SEL_Track_Total_Speed.xlsx') == 1 ||...
% %             strcmp(aC31,'*44_SEL_Track_19ms_um_movement_1data.xlsx') == 1 ||...
% %             strcmp(aC31,'*44_SEL_Track_19ms_um_movement_2func.xlsx') == 1 ||...
% %             strcmp(aC31,'*45_SEL_Track_19um_s_speed_1data.xlsx') == 1 ||...
% %             strcmp(aC31,'*45_SEL_Track_19um_s_speed_1func.xlsx') == 1
%         if numel(bData32.data.Sheet1(:,1)) == 3
%              if  numel(bData32.data.Sheet1(1,:)) == 7
%                     bData32 = [NaN bData32.data.Sheet1(1,:)]; 
%                     bData32(2,:) = [NaN bData32.data.Sheet1(2,:)]; 
%                     bData32(3,:) = [NaN bData32.data.Sheet1(3,:)]; 
%                     bData32.data.Sheet1 = bData32;
%                 else if numel(bData32.data.Sheet1(1,:)) == 6
%                     bData32 = [NaN NaN bData32.data.Sheet1(1,:)];   
%                     bData32(2,:) = [NaN NaN bData32.data.Sheet1(2,:)];  
%                     bData32(3,:) = [NaN NaN bData32.data.Sheet1(3,:)];  
%                     bData32.data.Sheet1 = bData32;
%                     else if numel(bData32.data.Sheet1(1,:)) == 5
%                         bData32  = [NaN NaN NaN bData32.data.Sheet1(1,:)];   
%                         bData32(2,:)  = [NaN NaN NaN bData32.data.Sheet1(2,:)]; 
%                         bData32(3,:)  = [NaN NaN NaN bData32.data.Sheet1(3,:)]; 
%                         bData32.data.Sheet1 = bData32;
%                     end
%                 end
%              end
%         end
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         if numel(bData32.data.Sheet1(:,1)) == 2
%              if  numel(bData32.data.Sheet1(1,:)) == 7
%                     bData32 = [NaN bData32.data.Sheet1(1,:)];
%                     bData32(2,:) = [NaN bData32.data.Sheet1(2,:)]; 
%                     bData32.data.Sheet1 = bData32;
%                 else if numel(bData32.data.Sheet1(1,:)) == 6
%                     bData32 = [NaN NaN bData32.data.Sheet1(1,:)];   
%                     bData32(2,:) = [NaN NaN bData32.data.Sheet1(2,:)];  
%                     bData32.data.Sheet1 = bData32;
%                     else if numel(bData32.data.Sheet1(1,:)) == 5
%                         bData32  = [NaN NaN NaN bData32.data.Sheet1(1,:)];   
%                         bData32(2,:)  = [NaN NaN NaN bData32.data.Sheet1(2,:)]; 
%                         bData32.data.Sheet1 = bData32;
%                     end
%                 end
%              end
%         end
%       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       if numel(bData32.data.Sheet1(:,1)) == 1  
%                 if  numel(bData32.data.Sheet1(1,:)) == 7
%                         bData32.data.Sheet1 = [NaN bData32.data.Sheet1(1,:)]; 
%                     else if numel(bData32.data.Sheet1(1,:)) == 6
%                         bData32.data.Sheet1 = [NaN NaN bData32.data.Sheet1(1,:)];   
%                         else if numel(bData32.data.Sheet1(1,:)) == 5
%                             bData32.data.Sheet1  = [NaN NaN NaN bData32.data.Sheet1(1,:)];   
%                         end
%                     end
%                 end
%           end
%     end 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%     bData31data = cell2mat(struct2cell(bData32.data));
%     bData31dataAll = [bData31dataAll; bData31data];
    
    bData31data = bData32;
    bData31dataAll = [bData31dataAll; bData31data];
  
% %     for aa2 = 1:numel(bData31data(:,1))
% %         aa3 = char(string(aa2));
% %         aa4 = ([assCell{aa1,1} '_Position_' aa3]);
% %         bData31Position{aa2,1} = aa4;
% %     end
% %         bData31PositionAll = [bData31PositionAll; bData31Position];
        % clear data
        bData31data = [];
        bData31 = [];
        bData32 = [];
        bImportName31 = [];
        bData31Position = [];
        aCheckDir31name = [];
end
end

% Data selection
% bData31dataAll(aSelection4,:) = [];
% bData31PositionAll{aSelection4,:} = [];

for ss=aSelection4
    bData31dataAll(ss,:) = [];
% %     bData31PositionAll{ss,:} = [];
end
% %     bData31PositionAll=bData31PositionAll(~any(cellfun('isempty', bData31PositionAll), 2), :); 
end
       



