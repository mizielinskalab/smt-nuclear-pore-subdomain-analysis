function opt = ErrorLee02T4OC_3C(pe_All,peYS,FDname,ffs,cSave2,yLa1,yLa2,CS)
% ErrorLee02T4(e6V2Control,e6V2TDP43,e6S2Control,e6S2TDP43,YTD11,YTD12,YTD21,YTD22,YTD31,YTD32,FDname,ffs,cSave2,yLa1,yLa2)
% function opt = ErrorLee01(mYS1,mYS2,mYS3,tSCY,tSCY2,VW,ffs,yLa,F4name,eHistsize)
% Error bar / plot
% 2019/08/15 by Lee
% 2020/01/17 by Lee
%%%%%%%%%%%%%%%%%%%%%%%%cSave2
% Data
YTD11 = peYS{:,1};
YTD12 = peYS{:,2};
YTD21 = peYS{:,3};
YTD22 = peYS{:,4};
YTD31 = peYS{:,5};
YTD32 = peYS{:,6};
%%%%%%%%%%%%
eeP2_1 = pe_All{:,1};
eeP2_2 = pe_All{:,2};
eeP2_3 = pe_All{:,3};
eeP2_4 = pe_All{:,4};
%%%
eeE2_1 = pe_All{:,5};
eeE2_2 = pe_All{:,6};
eeE2_3 = pe_All{:,7};
eeE2_4 = pe_All{:,8};
%%%
eeE3_1 = pe_All{:,9};
eeE3_2 = pe_All{:,10};
eeE3_3 = pe_All{:,11};
eeE3_4 = pe_All{:,12};
% % Colour spot
% CoM = [0.52 0.52 0.51];  % middle: Battleship grey
% CoL = [0.93 0.57 0.13];  % left: carrot orange 
% CoR = [0.63 0.79 0.95];  % right: baby blue eyes
% CoB = [0.4 0.6 0.8];     % Both: blue Gray
% CoG = [0.7 0.75 0.71];   % asg grey
%%%%%%%%%%%%%%%%%%%%
% Plots
% ffs = 27;
% e_colors = lines(numel(eeP2Control(:,1)));
% blue (dark -> light)
blu0 = [0.011, 0.133, 0.768]; 
blu1 = [0.090, 0.235, 0.992];
blu2 = [0.327, 0.441, 0.992];
blu3 = [0.592, 0.670, 0.992];
blu4 = [0.784, 0.815, 0.992];
% magenta (dark -> light)
mag0 = [0.803, 0.015, 0.749];
mag1 = [0.992, 0.010, 0.929];
mag2 = [0.992, 0.457, 0.929];
mag3 = [0.992, 0.786, 0.929];
mag4 = [0.992, 0.901, 0.929];
% black (dark -> light)
bla0 = [0, 0 ,0];
bla1 = [0.3490, 0.3490, 0.3490];
bla2 = [0.5, 0.5 ,0.5];
bla3 = [0.6510, 0.6510, 0.6510];
bla4 = [0.8510, 0.8510, 0.8510];
% cyan (dark -> light)
cya0 = [0, 1 ,1];
cya1 = [0.3, 1 ,1];
cya2 = [0.6, 1,1];
cya3 = [0.75, 1,1];
cya4 = [0.9, 1,1];
%%%%%%%%%%%%%%%%%%%%
e_colors = [bla1; blu1; mag1; cya1];
% e_colorsT = [b0; b1; m1; m0]; 
% e_colorsT1 = [b0; b1; b3; b4]; 
% e_colorsT2 = [m0; m1; m3; m4]; 
% e_colorsBar = [b1; b2; b3; b4; m1; m2; m3; m4]; 
% e_colorsBar = [bla1; bla2;bla3;bla4;blu1;blu2;blu3;blu4;mag1;mag2;mag3;mag4;cya1;cya2;cya3;cya4];
e_colorsBar = [bla1;bla3;blu1;blu3;mag1;mag3;cya1;cya3];
e_colorsT1 = [bla1; bla2;bla3;bla4]; 
e_colorsT2 = [blu1;blu2;blu3;blu4]; 
e_colorsT3 = [mag1;mag2;mag3;mag4]; 
e_colorsT4 = [cya1;cya2;cya3;cya4]; 
%%%%%%%%%%%%%%%%%%%%%%%%%
% Scale x and y
% YT11 = [1:1:4]
% YT12 = [1 4]
% set(gca,'YTick',YT11,'FontSize',ffs+4);
% set(gca,'YLim',YT12);
%%%%%%%
YTD13 = (YTD12(1,2) - YTD12(1,1))/5;
YTD23 = (YTD22(1,2) - YTD22(1,1))/5;
YTD33 = (YTD32(1,2) - YTD32(1,1))/5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name
% FDname = ['F21_Dwell_percentage_all']; 

for aa = 1:3
    if aa == 1
        YT11 = YTD11;
        YT12 = YTD12;
        YT13 = (YTD12(1,2) - YTD12(1,1))/5;
        FDnameL = [FDname '_01_'];
    end
    if aa == 2
        YT11 = YTD21;
        YT12 = YTD22;
        YT13 = (YTD22(1,2) - YTD22(1,1))/5;
        FDnameL = [FDname '_02_'];
    end
    if aa == 3
        YT11 = YTD31;
        YT12 = YTD32;
        YT13 = (YTD32(1,2) - YTD32(1,1))/5;
        FDnameL = [FDname '_03_'];
    end
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Velocity (um/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ffs = 27;
% e_colors = lines(numel(e6V2Control(:,1)));
% Figure
set(gcf,'units','centimeters','position',[1 1 27.5 26.3],'paperposition',[0 0 25 25]);
set(gca,'units','centimeters','position',[4.5 3.3 22 22]);

% fc = [0.7 0.75 0.71] 
% colour spot
for DD=1:numel(eeP2_1(:,1))
     plot(eeP2_1(DD,:),'-','Marker','o','MarkerFaceColor',e_colorsT1(DD, :),...
         'Color',e_colorsT1(DD,:),'LineWidth',3);
     hold on;
end
% for DD=1:numel(eeP2_2(:,1))
%      plot(eeP2_2(DD,:),':','Marker','o','MarkerFaceColor',e_colorsT2(DD, :),...
%          'Color',e_colorsT2(DD,:),'LineWidth',3);
%      hold on;
% end
for DD=1:numel(eeP2_3(:,1))
     plot(eeP2_3(DD,:),'--','Marker','o','MarkerFaceColor',e_colorsT3(DD, :),...
         'Color',e_colorsT3(DD,:),'LineWidth',3);
     hold on;
end
for DD=1:numel(eeP2_4(:,1))
     plot(eeP2_4(DD,:),'-.','Marker','o','MarkerFaceColor',e_colorsT4(DD, :),...
         'Color',e_colorsT4(DD,:),'LineWidth',3);
     hold on;
end

% By Lee!

% for DD=1:numel(e6V2TDP43(:,1))
%      errorbar(e6V2Control(DD,:),e6S2Control(DD,:),'Color',e_colors(DD, :),'linewidth',1)
%      errorbar(e6V2TDP43(DD,:),e6S2TDP43(DD,:),'Color',e_colors(DD, :),'linewidth',1)
%      hold on;
% end

% Label
xLa = 'Nuclear pore complex';
% yLa1 = 'Velocity (m/s)';
xLa1 = 'Cytoplasmic ring (Filament)';
xLa2 = 'Nuclear pore (Centre)';
xLa3 = 'Nuclear ring (Basket)';

xlabel(xLa,'FontSize',ffs+10);
ylabel(yLa1,'FontSize',ffs+10);
set(gca,'XTick',1:1:3,'FontSize',ffs+4,'XTicklabels',{'S1(F)','S2(N)','S3(B)'});
% set(gca,'XTick',1:1:3,'FontSize',ffs-7,'XTicklabels',{xLa1,xLa2,xLa3})
set(gca,'XLim',[0.8 3.2]);
set(gca,'YTick',YT11,'FontSize',ffs+4);
set(gca,'YLim',YT12);
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off');
% legend
e_legend1 = legend({'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)'},...
    'Location','northeastoutside','FontSize',ffs-8);
% % legend
% e_legend1 = legend({'Import-aborted(C)','Import-transmitted(C)','Export-aborted(C)','Export-transmitted(C)',...
%     'Import-aborted(T)','Import-transmitted(T)','Export-aborted(T)','Export-transmitted(T)'},...
%     'Location','northeastoutside','FontSize',ffs-8);
legend('boxoff');
% title(e_legend1,'Control');

grid off
hold on;

% Image write
F6name = [cSave2 FDnameL '01Location'];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r300',F6name)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save txt values
save3All = [eeP2_1;eeP2_2;eeP2_3;eeP2_4];
save4AllTable = table(save3All(:,1),save3All(:,2),save3All(:,3),...
    'VariableNames',{'S1_F','S2_N','S3_B'});
% save4AllTable.Properties.RowNames = {'Import-aborted(C)','Import-transmitted(C)','Export-aborted(C)','Export-transmitted(C)',...
%     'Import-aborted(T)','Import-transmitted(T)','Export-aborted(T)','Export-transmitted(T)'};
save4AllTable.Properties.RowNames = {'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(0.1M)','Aborted(Close)(0.1M)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)'};

%%%%%%%%%%%%%%%%%
writetable(save4AllTable,F6name,'Delimiter','bar','WriteRowNames',true);
F6nameX = [F6name '.xlsx'];
writetable(save4AllTable,F6nameX,'WriteRowNames',true,'Sheet',1);
clear save3All save4AllTable;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% scale change
set(gca,'YTick',YT12(1,1):YT13:YT12(1,2),'FontSize',ffs+4);
set(gca,'YLim',YT12);
set(gca,'Yticklabel',0:0.2:1);
% yLa2 = 'Velocity (a.u.)';
ylabel(yLa2,'FontSize',ffs+10);

% Image write
F6name = [cSave2 FDnameL '02PS'];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r300',F6name)
close gcf

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save txt values
save3All = [(eeP2_1-YT12(1,1))./(YT12(1,2)-YT12(1,1)); (eeP2_2-YT12(1,1))./(YT12(1,2)-YT12(1,1));...
    (eeP2_3-YT12(1,1))./(YT12(1,2)-YT12(1,1)); (eeP2_4-YT12(1,1))./(YT12(1,2)-YT12(1,1))];
save4AllTable = table(save3All(:,1),save3All(:,2),save3All(:,3),...
    'VariableNames',{'S1_F','S2_N','S3_B'});
save4AllTable.Properties.RowNames = {'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(0.1M)','Aborted(Close)(0.1M)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)'};
%%%%%%%%%%%%%%%%%
writetable(save4AllTable,F6name,'Delimiter','bar','WriteRowNames',true);
F6nameX = [F6name '.xlsx'];
writetable(save4AllTable,F6nameX,'WriteRowNames',true,'Sheet',1);
clear save3All save4AllTable;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STD
%%%%%%%%%%%%%%%%%%%%%%%%%%
% color
% e_c1 = e_colors(2:end,:); 
% e_c2 = brighten(e_c1,0.8)
% Error bar
eError01V_1IN = [eeP2_1;eeP2_3;eeP2_4];
eError01V_2ER = [eeE2_1;eeE2_3;eeE2_4];
% Grouped bar + errorbars (no 3rd-party helper)
Y = eError01V_1IN';
E = eError01V_2ER';
hb = bar(Y,'grouped');
hold on;
% Apply bar colors if provided
if ~isempty(e_colorsBar)
    for ii = 1:min(numel(hb), size(e_colorsBar,1))
        hb(ii).FaceColor = 'flat';
        hb(ii).CData = repmat(e_colorsBar(ii,:), size(hb(ii).CData,1), 1);
    end
end
for ii = 1:numel(hb)
    if isprop(hb(ii),'XEndPoints')
        x = hb(ii).XEndPoints;
        y = hb(ii).YEndPoints;
    else
        x = hb(ii).XData + hb(ii).XOffset;
        y = hb(ii).YData;
    end
    ei = E(:,ii);
    he = errorbar(x, y, ei, 'LineStyle','none');
    if isprop(he,'CapSize'); he.CapSize = CS; end
end

% Figure
set(gcf,'units','centimeters','position',[1 1 27.5 26.3],'paperposition',[0 0 25 25]);
set(gca,'units','centimeters','position',[4.5 3.3 22 22]);

% Label
xLa = 'Nuclear pore complex';
% yLa1 = 'Velocity (m/s)';
xLa1 = 'Cytoplasmic ring (Filament)';
xLa2 = 'Nuclear pore (Centre)';
xLa3 = 'Nuclear ring (Basket)';

xlabel(xLa,'FontSize',ffs+10);
ylabel(yLa1,'FontSize',ffs+10);
% set(gca,'XTick',1:1:3,'FontSize',ffs+4,'XTicklabels',{'S1(F)','S2(N)','S3(B)'});
set(gca,'FontSize',ffs+4,'XTicklabels',{'S1(F)','S2(N)','S3(B)'});
% set(gca,'XTick',1:1:3,'FontSize',ffs-7,'XTicklabels',{xLa1,xLa2,xLa3})
% set(gca,'XLim',[0.8 3.2]);
set(gca,'YTick',YT11,'FontSize',ffs+4);
set(gca,'YLim',YT12);
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off');
% legend
e_legend1 = legend({'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)'},...
    'Location','northeastoutside','FontSize',ffs-8);
legend('boxoff');
% title(e_legend1,'Control');

grid off
hold on;

% Image write
F6name = [cSave2 FDnameL '03STD'];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r300',F6name)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save txt values
eError01V_1IN = [eeP2_1;eeP2_2;eeP2_3;eeP2_4];
eError01V_2ER = [eeE2_1;eeE2_2;eeE2_3;eeE2_4];
save3All = [eError01V_1IN;eError01V_2ER;];
save4AllTable = table(save3All(:,1),save3All(:,2),save3All(:,3),...
    'VariableNames',{'S1_F','S2_N','S3_B'});
save4AllTable.Properties.RowNames = {'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(0.1M)','Aborted(Close)(0.1M)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)',...
    'Transmitted(Open)(C) STD','Aborted(Close)(C) STD',...
    'Transmitted(Open)(0.1M) STD','Aborted(Close)(0.1M) STD',...
    'Transmitted(Open)(1M) STD','Aborted(Close)(1M) STD',...
    'Transmitted(Open)(10M) STD','Aborted(Close)(10M) STD'};
%%%%%%%%%%%%%%%%%
writetable(save4AllTable,F6name,'Delimiter','bar','WriteRowNames',true);
F6nameX = [F6name '.xlsx'];
writetable(save4AllTable,F6nameX,'WriteRowNames',true,'Sheet',1);
clear save3All save4AllTable;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% scale change
set(gca,'YTick',YT12(1,1):YT13:YT12(1,2),'FontSize',ffs+4);
set(gca,'YLim',YT12);
set(gca,'Yticklabel',0:0.2:1);
% yLa2 = 'Velocity (a.u.)';
ylabel(yLa2,'FontSize',ffs+10);

% Image write
F6name = [cSave2 FDnameL '04STD'];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r300',F6name)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save txt values
save3All = [(eError01V_1IN-YT12(1,1))./(YT12(1,2)-YT12(1,1)); (eError01V_2ER)./(YT12(1,2)-YT12(1,1))];
save4AllTable = table(save3All(:,1),save3All(:,2),save3All(:,3),...
    'VariableNames',{'S1_F','S2_N','S3_B'});
save4AllTable.Properties.RowNames = {'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(0.1M)','Aborted(Close)(0.1M)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)',...
    'Transmitted(Open)(C) STD','Aborted(Close)(C) STD',...
    'Transmitted(Open)(0.1M) STD','Aborted(Close)(0.1M) STD',...
    'Transmitted(Open)(1M) STD','Aborted(Close)(1M) STD',...
    'Transmitted(Open)(10M) STD','Aborted(Close)(10M) STD'};
%%%%%%%%%%%%%%%%%
writetable(save4AllTable,F6name,'Delimiter','bar','WriteRowNames',true);
F6nameX = [F6name '.xlsx'];
writetable(save4AllTable,F6nameX,'WriteRowNames',true,'Sheet',1);
clear save3All save4AllTable;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
close gcf

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% color
% e_c1 = e_colors(2:end,:); 
% e_c2 = brighten(e_c1,0.8)
% Error bar
eError01V_1IN = [eeP2_1;eeP2_3;eeP2_4];
eError01V_2ER = [eeE3_1;eeE3_3;eeE3_4];
% Grouped bar + errorbars (no 3rd-party helper)
Y = eError01V_1IN';
E = eError01V_2ER';
hb = bar(Y,'grouped');
hold on;
% Apply bar colors if provided
if ~isempty(e_colorsBar)
    for ii = 1:min(numel(hb), size(e_colorsBar,1))
        hb(ii).FaceColor = 'flat';
        hb(ii).CData = repmat(e_colorsBar(ii,:), size(hb(ii).CData,1), 1);
    end
end
for ii = 1:numel(hb)
    if isprop(hb(ii),'XEndPoints')
        x = hb(ii).XEndPoints;
        y = hb(ii).YEndPoints;
    else
        x = hb(ii).XData + hb(ii).XOffset;
        y = hb(ii).YData;
    end
    ei = E(:,ii);
    he = errorbar(x, y, ei, 'LineStyle','none');
    if isprop(he,'CapSize'); he.CapSize = CS; end
end

% Figure
set(gcf,'units','centimeters','position',[1 1 27.5 26.3],'paperposition',[0 0 25 25]);
set(gca,'units','centimeters','position',[4.5 3.3 22 22]);

% Label
xLa = 'Nuclear pore complex';
% yLa1 = 'Velocity (m/s)';
xLa1 = 'Cytoplasmic ring (Filament)';
xLa2 = 'Nuclear pore (Centre)';
xLa3 = 'Nuclear ring (Basket)';

xlabel(xLa,'FontSize',ffs+10);
ylabel(yLa1,'FontSize',ffs+10);
% set(gca,'XTick',1:1:3,'FontSize',ffs+4,'XTicklabels',{'S1(F)','S2(N)','S3(B)'});
set(gca,'FontSize',ffs+4,'XTicklabels',{'S1(F)','S2(N)','S3(B)'});
% set(gca,'XTick',1:1:3,'FontSize',ffs-7,'XTicklabels',{xLa1,xLa2,xLa3})
% set(gca,'XLim',[0.8 3.2]);
set(gca,'YTick',YT11,'FontSize',ffs+4);
set(gca,'YLim',YT12);
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off');
% legend
e_legend1 = legend({'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)'},...
    'Location','northeastoutside','FontSize',ffs-8);
legend('boxoff');
% title(e_legend1,'Control');

grid off
hold on;

% Image write
F6name = [cSave2 FDnameL '05SE'];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r300',F6name)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save txt values
eError01V_1IN = [eeP2_1;eeP2_2;eeP2_3;eeP2_4];
eError01V_2ER = [eeE3_1;eeE3_2;eeE3_3;eeE3_4];
save3All = [eError01V_1IN;eError01V_2ER;];
save4AllTable = table(save3All(:,1),save3All(:,2),save3All(:,3),...
    'VariableNames',{'S1_F','S2_N','S3_B'});
save4AllTable.Properties.RowNames = {'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(0.1M)','Aborted(Close)(0.1M)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)',...
    'Transmitted(Open)(C) SE','Aborted(Close)(C) SE',...
    'Transmitted(Open)(0.1M) SE','Aborted(Close)(0.1M) SE',...
    'Transmitted(Open)(1M) SE','Aborted(Close)(1M) SE',...
    'Transmitted(Open)(10M) SE','Aborted(Close)(10M) SE'};
%%%%%%%%%%%%%%%%%
writetable(save4AllTable,F6name,'Delimiter','bar','WriteRowNames',true);
F6nameX = [F6name '.xlsx'];
writetable(save4AllTable,F6nameX,'WriteRowNames',true,'Sheet',1);
clear save3All save4AllTable;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% scale change
set(gca,'YTick',YT12(1,1):YT13:YT12(1,2),'FontSize',ffs+4);
set(gca,'YLim',YT12);
set(gca,'Yticklabel',0:0.2:1);
% yLa2 = 'Velocity (a.u.)';
ylabel(yLa2,'FontSize',ffs+10);

% Image write
F6name = [cSave2 FDnameL '06SE'];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r300',F6name)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save txt values
save3All = [(eError01V_1IN-YT12(1,1))./(YT12(1,2)-YT12(1,1)); (eError01V_2ER)./(YT12(1,2)-YT12(1,1))];
save4AllTable = table(save3All(:,1),save3All(:,2),save3All(:,3),...
    'VariableNames',{'S1_F','S2_N','S3_B'});
save4AllTable.Properties.RowNames = {'Transmitted(Open)(C)','Aborted(Close)(C)',...
    'Transmitted(Open)(0.1M)','Aborted(Close)(0.1M)',...
    'Transmitted(Open)(1M)','Aborted(Close)(1M)',...
    'Transmitted(Open)(10M)','Aborted(Close)(10M)',...
    'Transmitted(Open)(C) SE','Aborted(Close)(C) SE',...
    'Transmitted(Open)(0.1M) SE','Aborted(Close)(0.1M) SE',...
    'Transmitted(Open)(1M) SE','Aborted(Close)(1M) SE',...
    'Transmitted(Open)(10M) SE','Aborted(Close)(10M) SE'};
%%%%%%%%%%%%%%%%%
writetable(save4AllTable,F6name,'Delimiter','bar','WriteRowNames',true);
F6nameX = [F6name '.xlsx'];
writetable(save4AllTable,F6nameX,'WriteRowNames',true,'Sheet',1);
clear save3All save4AllTable;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
close gcf





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end

end