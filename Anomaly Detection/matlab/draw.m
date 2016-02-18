%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function draw( data, name )

x = 0.1:0.1:0.4;

bv2 = data(1,2:2:8);
cv2 = data(2,2:2:8);
bv4 = data(3,2:2:8);
cv4 = data(4,2:2:8);
bv16 = data(5,2:2:8);
cv16 = data(6,2:2:8);

%hFig = figure;
%set(hFig, 'Position', [600,400,800,600])

hold;

%plot ( x,bv2,'-r+', x,cv2,'-ro', x,bv4,':b*', x,cv4,':bd', x,bv16,'-.gx', x,cv16,'-.gs','markersize',12);

%plot ( x,bv2,':ko', x,cv2,'-ko', x,bv4,':kd', x,cv4,'-kd', x,bv16,':ks', x,cv16,'-ks','markersize',12);
%hleg = legend('regular  4','random 4','regular  8','random 8','regular  12','random 12','location','Southwest');

plot (  x,cv2,'-ko', x,cv4,'-kd', x,cv16,'-ks','markersize',12);
hleg = legend('n = 4','n = 8','n = 12','location','Southwest');

set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1],'Fontsize',20);
set(get(gca,'Children'),'linewidth',1.2);

%set(hleg,'EdgeColor',[1,1,1]);

box off

xlabel('Anomaly Probability (%)','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);

set(gca,'XLim',[0.1 0.4])
set(gca,'XTick',0.1:0.1:0.4)
%set(gca,'XTickLabel',{'5','10','15','20','25','30','35','40','45','50'},'fontsize',18);
set(gca,'XTickLabel',{'10','20','30','40'},'fontsize',24);

set(gca,'YLim',[0.4 1.01])
set(gca,'YTick',0.4:0.1:1)
set(gca,'YTickLabel',{'0.4 ','0.5 ','0.6 ','0.7 ','0.8 ','0.9 ','1.0 '},'fontsize',24);

end



