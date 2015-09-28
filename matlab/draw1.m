function draw1( data )   

%x = [1 2 3 4 5 6 7 8 9 10];

s_data = data([2 4 6 8],:);

bar(s_data);
set(gca,'XLim',[0 5]);

colormap gray

legend('Deviation 1','Deviation 2','K-means','NF','PCA','KPCA','location','northoutside');

%set(gca,'XLim',[0 1.1])
%set(gca,'XTick',0:0.1:1.1)
%set(gca,'XTickLabel',{'5','10','15','20','25','30','35','40','45','50'});
set(gca,'XTickLabel',{'10','20','30','40'});

set(gca,'YLim',[0 1])
set(gca,'YTick',0:0.1:1)
set(gca,'YTickLabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});

set(gca,'ygrid','on')

xlabel('Failure Probability (%)','fontsize',18);
ylabel('Detection Accuracy','fontsize',18);

ylabel('Clustering Accuracy','fontsize',24);
