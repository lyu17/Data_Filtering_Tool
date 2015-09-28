hFig = figure;
%set(hFig, 'Position', [600,400,500,400])

x = .05:.05:.5;

o2 = [0.99811583,0.98744159,0.96487833,0.93141453,0.89033127,0.84590131,0.80248935,0.76397210,0.73340723,0.71289062];
w2 = [0.99787733,0.98560800,0.95887942,0.91750400,0.86352539,0.79987600,0.72950698,0.65491200,0.57796595,0.50000000];

o4 = [0.99999979,0.99997798,0.99967493,0.99795943,0.99221316,0.97867739,0.95408645,0.91776103,0.87283015,0.82578006];
w4 = [0.99999873,0.99989924,0.99875183,0.99306511,0.97570303,0.93720671,0.86946311,0.76970903,0.64267912,0.50000000];

o16 = [1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,1.00000000,0.99999967,0.99997863,0.99935937,0.99173229];
w16 = [1.00000000,1.00000000,1.00000000,1.00000000,0.99999999,0.99999986,0.99982359,0.99193531,0.88667314,0.50000000];

plot(x,o2,'-ro',x,w2,'-r*',x,o4,':bo',x,w4,':b*',x,o16,'-.go',x,w16,'-.g*');
hleg = legend('optimal n=2','worst n=2','optimal n=4','worst n=4','optimal n=16','worst n=16','location','SouthWest');


% Make the text of the legend italic and color it brown
set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1],'Fontsize',12);

xlabel('Failure Probability (%)','fontsize',18);
ylabel('Detection Accuracy','fontsize',18);

set(gca,'XLim',[0.05 0.5])
set(gca,'XTick',0.05:0.05:0.5)
set(gca,'XTickLabel',{'5','10','15','20','25','30','35','40','45','50'});

set(gca,'YLim',[0.4 1])
set(gca,'YTick',0:0.1:1)
set(gca,'YTickLabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});