function draw_cluster_acc( means, vars )   

% len = length(means);

bar(means,0.3,'k');
hold on
errorbar(means,vars,'k','linestyle','none','linewidth',2);

set(gca,'XLim',[0 6]);

colormap gray

%legend('Our Method','Deviation based Method','location','northoutside');

%set(gca,'XLim',[0 1.1])
%set(gca,'XTick',0:0.1:1.1)
set(gca,'XTickLabel',{'K2','KN','H2','HN','MS'},'fontsize',24);

set(gca,'YLim',[0 1.1])
set(gca,'YTick',0:0.2:1.1)
set(gca,'YTickLabel',{'0','0.2','0.4','0.6','0.8','1.0',''});

%set(gca,'ygrid','on')

%xlabel('Clustering Methods','fontsize',18);
ylabel('Clustering Accuracy','fontsize',24);

%end
