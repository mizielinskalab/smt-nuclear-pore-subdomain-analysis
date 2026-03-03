function opt = HistLee2DualDPRSM2(mYS1,mYS2,mYS3,tSCY,tSCY2,VW,ffs,yLa,F4name,eHistsizeD1,eHistsizeD2,eHistsizeP1,eHistsizeP2,eHistsizeC1,eHistsizeC2)
% Only Hist 
% 2019/05/21
% eSCY11,eSCY12,eSCY21,eSCY22,eSCY31,eSCY32

% Colour spot
CoM = [0.52 0.52 0.51];  % middle: Battleship grey
CoL = [0.93 0.57 0.13];  % left: carrot orange 
CoR = [0.63 0.79 0.95];  % right: baby blue eyes
CoB = [0.4 0.6 0.8];     % Both: blue Gray
CoG = [0.7 0.75 0.71];   % asg grey


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hist plot of y

% % Hist data
% zz=[]
zz = tSCY;
zz2 = tSCY2;

% Label
hXla0 = yLa;
hXla0n = '_';

% Label -> fixed value
hYla1 = 'Density f(x)';
hYla2 = 'Percentage (%)';
hYla3 = 'Count';

hYla1n = 'Density';
hYla2n = 'Percentage';
hYla3n = 'Count';
 
% x value <- y value  -> cell length
mHS1 = mYS1;
mHS2 = mYS2;
mHS3 = mYS3;

% if mYS3 > 30; 
%     VW = 5;
% else
%     VW = 0.2; 
% end
% 
% if mYS3 < 2; 
%     VW = 0.1;
% end
      
% Value of distance (nm)
vWidth = VW;
vWidthnm = vWidth*1000;

vGap = max(zz)-min(zz);
vDistance = round(vGap/vWidth);
% pFep = vDistance
pFep = mHS1:VW:mHS3*2;
pFep = pFep + (VW./2);

% set(gca, 'Position', [0.11 0.10 0.86 0.86],'FontSize',24)

% Histogram based on the raw data ->Denssity ->Percentage -> number
sizeLH=length(zz);
[pPDFa pXa] = hist(zz,pFep);
pPDF = pPDFa;
pX = pXa;
% % remove 0 values in hist
% pR1 = (pPDF==0);
% pPDF(pR1)=[]; 
% pX(pR1)=[]; 
% Density
pResol=pX(2)-pX(1);
pArea = sizeLH*pResol;
pDEN = pPDF/pArea;
% Percentage
pPP1 = numel(tSCY);
pPER = (pPDF/pPP1).*100;
% Number
pNUM = pPDF;

% zz2
% Value of distance (nm)
vWidth2 = VW;
vWidthnm2 = vWidth2*1000;

vGap2 = max(zz2)-min(zz2);
vDistance2 = round(vGap2/vWidth2);
% pFep = vDistance
pFep2 = mHS1:VW:mHS3*2;
pFep2 = pFep2 + (VW./2);

% set(gca, 'Position', [0.11 0.10 0.86 0.86],'FontSize',24)

% Histogram based on the raw data ->Denssity ->Percentage -> number
sizeLH2=length(zz2);
[pPDF2a pX2a] = hist(zz2,pFep2);
pPDF2 = pPDF2a;
pX2 = pX2a;
% % remove 0 values in hist
% pR2 = (pPDF2==0);
% pPDF2(pR2)=[]; 
% pX2(pR2)=[]; 
% Density
pResol2=pX2(2)-pX2(1);
pArea2 = sizeLH2*pResol2;
pDEN2 = pPDF2/pArea2;
% Percentage
pPP12 = numel(tSCY2);
pPER2 = (pPDF2/pPP12).*100;
% Number
pNUM2 = pPDF2;

% Save three hist
for hh = 1:3
    % Raw Density+PDF
    figure('outerposition',[20 50 950 980])
   
    if hh == 1
        hNAME1 = hXla0n;  
        hNAME2 = hYla1n;
        hLAVELY = hYla1;
        hLAVELX = hXla0;
        ppp = pDEN;
        ppp2 = pDEN2;
    end
    
    if hh == 2
        hNAME1 = hXla0n;  
        hNAME2 = hYla2n;
        hLAVELY = hYla2;
        hLAVELX = hXla0;
        ppp = pPER;
        ppp2 = pPER2;
    end
    
    if hh == 3
        hNAME1 = hXla0n;  
        hNAME2 = hYla3n;
        hLAVELY = hYla3;
        hLAVELX = hXla0;
        ppp = pNUM;
        ppp2 = pNUM2;
    end
    
% Set of y hist
bar(pX,ppp,1,'FaceColor',[.6 .6 .6],'EdgeColor','black','Linewidth',3);
hold on;
bar(pX2,ppp2,1,'FaceColor','none','EdgeColor','blue','Linewidth',3);
hold on;

% h=bar(pX,ppp,1,'FaceColor','none','EdgeColor','black');
% % z2
% h2=bar(pX2,ppp,1,'FaceColor','none','EdgeColor','blue');


% bar(1:10,'FaceColor',[.6 .6 .6],'EdgeColor','black','Linewidth',3);
% hold on;
% bar(10:-1:1,'FaceColor','none','EdgeColor','blue','Linewidth',3);
% hold on;

% legend
e_legend1 = legend({'Control','GR20 10M'},...
    'Location','northeast','FontSize',ffs);
legend('boxoff');



% interface
% set(h,'FaceColor',[.6 .6 .6],'EdgeColor','black')

grid off
hold on;

% legend(Experimental,'Centre position',Theoretical,'Location','NE')
% title('PDF of new-born cells','fontsize',16)
% title('')
set(gca, 'Position', [0.12 0.09 0.84 0.87],'FontSize',ffs+6)
xlabel(hLAVELX,'FontSize',ffs+10)
ylabel(hLAVELY,'FontSize',ffs+10)
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mYS1:mYS2:mYS3,'FontSize',ffs+4)
set(gca,'XLim',[mYS1 mYS3])

if hh == 1 
    set(gca,'YTick',0:eHistsizeD1:eHistsizeD2)
    set(gca,'YLim',[0 eHistsizeD2])
end

if hh == 2 
    set(gca,'YTick',0:eHistsizeP1:eHistsizeP2)
    set(gca,'YLim',[0 eHistsizeP2])
end

if hh == 3 
    set(gca,'YTick',0:eHistsizeC1:eHistsizeC2)
    set(gca,'YLim',[0 eHistsizeC2])
end


% set(gca,'YTick',0:5:30)
% set(gca,'YLim',[0 30])
% set(gca,'XTick',0:0.5:6)
% set(gca,'XLim',[0 6])

grid off
hold on;

% Figure
%set(gcf,'units','centimeters','position',[1 1 27.2 26.5],'paperposition',[0 0 25 25]);
%set(gca,'units','centimeters','position',[3.8 3.0 22 22]);

set(gcf,'units','centimeters','position',[1 1 27.5 26.3],'paperposition',[0 0 25 25]);
set(gca,'units','centimeters','position',[4.0 3.3 22 22]);

% Image write
F7name = [F4name hNAME1 '_' hNAME2];
set(gcf, 'paperpositionmode', 'auto');
print(gcf,'-djpeg','-r150',F7name);
close gcf

% Save data
hAll = [pX(1,:)',ppp(1,:)',pX2(1,:)',ppp2(1,:)'] ;
Fhname = [F7name '_Data.csv'];
csvwrite(Fhname,hAll);



end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(['saved data:  ' F4name]);

end

