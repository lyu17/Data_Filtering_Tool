hFig = figure;
%set(hFig, 'Position', [600,400,500,400])

x = .05:.05:.5;

Pone2 = [0.90725000,0.82800000,0.76075000,0.70400000,0.65625000,0.61600000,0.58175000,0.55200000,0.52525000,0.50000000];
Ptwo2 = [0.99787733,0.98560800,0.95887942,0.91750400,0.86352539,0.79987600,0.72950698,0.65491200,0.57796595,0.50000000];

Pone4 = [0.98665812,0.95256000,0.90511187,0.84992000,0.79101562,0.73108000,0.67166938,0.61344000,0.55637313,0.50000000];
Ptwo4 = [0.99999873,0.99989924,0.99875183,0.99306511,0.97570303,0.93720671,0.86946311,0.76970903,0.64267912,0.50000000];

Pone16 = [0.99999967,0.99994421,0.99907582,0.99410196,0.97778510,0.95199948,0.87291660,0.77273012,0.64444347,0.50000000];
Ptwo16 = [1.00000000,1.00000000,1.00000000,1.00000000,0.99999999,0.99999986,0.99982359,0.99193531,0.88667314,0.50000000];


%plot(x,Pone2,'-r*',x,Ptwo2,'-ro',x,Pone4,':b*',x,Ptwo4,':bo',x,Pone16,'-.g*',x,Ptwo16,'-.go');
plot ( x,Pone2,'-r+', x,Ptwo2,'-ro', x,Pone4,':b*', x,Ptwo4,':bd', x,Pone16,'-.gx', x,Ptwo16,'-.gs','markersize',12);
hleg = legend('one-phase n=2','two-phase n=2','one-phase n=4','two-phase n=4','one-phase n=16','two-phase n=16','location','SouthWest');
set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1],'Fontsize',12);
set(get(gca,'Children'),'linewidth',1.2);

%set(gca,'ygrid','on')

%box off

% Make the text of the legend italic and color it brown
%set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1],'Fontsize',12);
%set(hleg,'EdgeColor',[1,1,1]);
% set(get(gca,'Children'),'linewidth',1.5);

xlabel('Failure Probability (%)','fontsize',18);
ylabel('Detection Accuracy','fontsize',18);

set(gca,'XLim',[0.05 0.5])
set(gca,'XTick',0.05:0.05:0.5)
set(gca,'XTickLabel',{'5','10','15','20','25','30','35','40','45','50'});

set(gca,'YLim',[0.4 1])
set(gca,'YTick',0:0.1:1)
set(gca,'YTickLabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});