f1_avg = [0.9565    0.9565    1.0000    1.0000    1.0000];
f1_var = [0.0193    0.0193         0         0         0];

f2_avg = [0.7891    0.8950    0.8190    1.0000    1.0000];
f2_var = [0.0108    0.0342    0.0046         0         0];

f3_avg = [0.7489    0.6869    0.7509    0.8818    0.8856];
f3_var = [0.0125    0.0139    0.0123    0.0025    0.0023];

f4_avg = [0.6905    0.5795    0.6919    0.7970    0.8068];
f4_var = [0.0171    0.0150    0.0169    0.0047    0.0060];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

means = [f1_avg([1 3 5]);f2_avg([1 3 5]);f3_avg([1 3 5]);f4_avg([1 3 5]);]

vars = [f1_var([1 3 5]);f2_var([1 3 5]);f3_var([1 3 5]);f4_var([1 3 5]);]

%bar([1:4];means,'k');
%hold on
%errorbar([1:4],zeros(4,1),means(:,1),vars(:,1),'k','linestyle','none');%'linewidth',2);


bar(means);
%barweb(means,vars);%'linewidth',2);
set(gca,'XLim',[0 5]);

colormap gray

%legend('Our Method','Deviation based Method','location','northoutside');

%set(gca,'XLim',[0 1.1])
%set(gca,'XTick',0:0.1:1.1)
set(gca,'XTickLabel',{'1','2','3','4'},'fontsize',18);

set(gca,'YLim',[0 1.1])
%set(gca,'YTick',0:0.2:1.1)
%set(gca,'YTickLabel',{'0','0.2','0.4','0.6','0.8','1.0',''});

xlabel('Number of Anomaly Types','fontsize',18);
ylabel('Clustering Accuracy','fontsize',18);
h_legend = legend('K-means Clustering k=2','Hierarchical Clustering k=2','Non-parametric Clustering','location','northoutside');
set(h_legend,'FontSize',12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure,hold on

%means1 = [f1_avg([2 4 5]);f2_avg([2 4 5]);f3_avg([2 4 5]);f4_avg([2 4 5]);]

%vars1 = [f1_var([2 4 5]);f2_var([2 4 5]);f3_var([2 4 5]);f4_var([2 4 5]);]

%bar([1:4];means,'k');
%hold on
%errorbar([1:4],zeros(4,1),means(:,1),vars(:,1),'k','linestyle','none');%'linewidth',2);

%barweb(means1,vars1);%'linewidth',2);
%colormap gray
%set(gca,'XLim',[0 5]);

%colormap gray

%legend('Our Method','Deviation based Method','location','northoutside');

%set(gca,'XLim',[0 1.1])
%set(gca,'XTick',0:0.1:1.1)
%set(gca,'XTickLabel',{'1','2','3','4'},'fontsize',18);

%set(gca,'YLim',[0 1.1])
%set(gca,'YTick',0:0.2:1.1)
%set(gca,'YTickLabel',{'0','0.2','0.4','0.6','0.8','1.0',''});

%xlabel('Number of Anomaly Patterns','fontsize',18);
%ylabel('Clustering Accuracy','fontsize',18);
%h_legend = legend('K-means Clustering k=n','Hierarchical Clustering k=n','Mean Shift Clustering','location','northoutside');
%set(h_legend,'FontSize',12);