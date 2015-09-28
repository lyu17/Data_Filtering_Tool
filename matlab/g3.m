hFig = figure;
%set(hFig, 'Position', [600,400,500,400])

x = .05:.05:.5;

w4 = [0.99999873,0.99989924,0.99875183,0.99306511,0.97570303,0.93720671,0.86946311,0.76970903,0.64267912,0.50000000];
o4 = [0.99999979,0.99997798,0.99967493,0.99795943,0.99221316,0.97867739,0.95408645,0.91776103,0.87283015,0.82578006];

w8 = [1.00000000,1.00000000,0.99999956,0.99998059,0.99962041,0.99602780,0.97542415,0.90317864,0.74096666,0.50000000];
o8 = [1.00000000,1.00000000,0.99999999,0.99999942,0.99998634,0.99982298,0.99860291,0.99283472,0.97477585,0.93595723];

w12 = [1.00000000,1.00000000,1.00000000,0.99999998,0.99999807,0.99989847,0.99739043,0.96876703,0.82412290,0.50000000];
o12 = [1.00000000,1.00000000,1.00000000,1.00000000,0.99999999,0.99999919,0.99997460,0.99955503,0.99571678,0.97683313];


%plot(x,Pone2,'-r*',x,Ptwo2,'-ro',x,Pone4,':b*',x,Ptwo4,':bo',x,Pone16,'-.g*',x,Ptwo16,'-.go');
plot ( x,w4,':ko', x,o4,'-ko', x,w8,':kd', x,o8,'-kd', x,w12,':ks', x,o12,'-ks','markersize',12);
hleg = legend('worst-case n=4','best-case   n=4','worst-case n=8','best-case   n=8','worst-case n=12','best-case   n=12','location','SouthWest');
set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1],'Fontsize',18);
set(get(gca,'Children'),'linewidth',1.2);

%set(gca,'ygrid','on')

%box off

% Make the text of the legend italic and color it brown
%set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1],'Fontsize',12);
%set(hleg,'EdgeColor',[1,1,1]);
% set(get(gca,'Children'),'linewidth',1.5);

xlabel('Anomaly Probability (%)','fontsize',18);
ylabel('Diagnosis Accuracy','fontsize',18);

set(gca,'XLim',[0.05 0.5])
set(gca,'XTick',0.05:0.05:0.5)
set(gca,'XTickLabel',{'5','10','15','20','25','30','35','40','45','50'},'fontsize',18);

set(gca,'YLim',[0.4 1])
set(gca,'YTick',0:0.1:1)
set(gca,'YTickLabel',{'0 ','0.1 ','0.2 ','0.3 ','0.4 ','0.5 ','0.6 ','0.7 ','0.8 ','0.9 ','1.0 '},'fontsize',18);