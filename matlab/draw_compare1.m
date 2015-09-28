f1_10 = [0.9941    0.8146    1.0000    1.0000    1.0000];
f1_20 = [0.9200    0.8383    1.0000    1.0000    1.0000];
f1_30 = [0.7964    0.6937    0.9980    0.9729    0.9960];
f1_40 = [0.6730    0.4522    0.9162    0.8755    0.8989];

f2_10 = [0.9941    0.8866    1.0000    1.0000    1.0000];
f2_20 = [0.9728    0.8600    1.0000    1.0000    1.0000];
f2_30 = [0.9474    0.6950    1.0000    0.9980    0.9990];
f2_40 = [0.9205    0.4983    0.9791    0.9742    0.9745];

f3_10 = [0.8471    0.8701    0.9945    0.9963    0.9971];
f3_20 = [0.8509    0.7278    0.9400    0.9722    0.9761];
f3_30 = [0.7776    0.6303    0.9190    0.9400    0.9423];
f3_40 = [0.7486    0.4802    0.8894    0.9005    0.9283];

f4_10 = [0.8981    0.8370    0.9100    0.9295    0.9422];
f4_20 = [0.8532    0.8405    0.8600    0.8888    0.9197];
f4_30 = [0.7988    0.7259    0.8269    0.8481    0.8685];
f4_40 = [0.7743    0.6456    0.7742    0.8043    0.8224];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
colormap gray
acc_p1 = [f1_10([3 4 5]);f1_20([3 4 5]);f1_30([3 4 5]);f1_40([3 4 5])];
bar(acc_p1);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('None','PCA','KPCA','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p2 = [f2_10([3 4 5]);f2_20([3 4 5]);f2_30([3 4 5]);f2_40([3 4 5])];
bar(acc_p2);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('None','PCA','KPCA','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p3 = [f3_10([3 4 5]);f3_20([3 4 5]);f3_30([3 4 5]);f3_40([3 4 5])];
bar(acc_p3);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('None','PCA','KPCA','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p4 = [f4_10([3 4 5]);f4_20([3 4 5]);f4_30([3 4 5]);f4_40([3 4 5])];
bar(acc_p4);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('None','PCA','KPCA','location','northoutside');
set(h_legend,'FontSize',18);