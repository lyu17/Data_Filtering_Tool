f1_10 = [0.9941    0.8146    0.7181    1.0000    1.0000    0.4303];
f1_20 = [0.9200    0.8383    0.9252    1.0000    1.0000    0.8156];
f1_30 = [0.7964    0.6937    0.9800    0.9959    0.9960    0.9476];
f1_40 = [0.6730    0.4522    0.8994    0.8955    0.8889    0.8830];

f2_10 = [0.9941    0.8866    0.3851    1.0000    1.0000    0.2737];
f2_20 = [0.9728    0.8600    0.6866    1.0000    1.0000    0.5058];
f2_30 = [0.9474    0.6950    0.8655    1.0000    0.9980    0.7130];
f2_40 = [0.9205    0.4983    0.9275    0.9797    0.9791    0.7963];

f3_10 = [0.8471    0.8701    0.2476    0.9768    0.9933    0.1946];
f3_20 = [0.8509    0.7278    0.4756    0.9675    0.9740    0.3765];
f3_30 = [0.7776    0.6303    0.6517    0.9329    0.9468    0.5282];
f3_40 = [0.7486    0.4802    0.7674    0.9167    0.9164    0.6417];

f4_10 = [0.8981    0.8370    0.1818    0.9735    0.9829    0.1818];
f4_20 = [0.8532    0.8405    0.3333    0.8994    0.9502    0.3333];
f4_30 = [0.7988    0.7259    0.4615    0.8630    0.9083    0.4615];
f4_40 = [0.7743    0.6456    0.5714    0.8380    0.8448    0.5714];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
colormap gray
acc_p1 = [f1_10([6 3 5]);f1_20([6 3 5]);f1_30([6 3 5]);f1_40([6 3 5])];
bar(acc_p1);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('K-means Clustering','Hierarchical Clustering','Non-parametric Clustering','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p2 = [f2_10([6 3 5]);f2_20([6 3 5]);f2_30([6 3 5]);f2_40([6 3 5])];
bar(acc_p2);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('K-means Clustering','Hierarchical Clustering','Non-parametric Clustering','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p3 = [f3_10([6 3 5]);f3_20([6 3 5]);f3_30([6 3 5]);f3_40([6 3 5])];
bar(acc_p3);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('K-means Clustering','Hierarchical Clustering','Non-parametric Clustering','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p4 = [f4_10([6 3 5]);f4_20([6 3 5]);f4_30([6 3 5]);f4_40([6 3 5])];
bar(acc_p4);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('K-means Clustering','Hierarchical Clustering','Non-parametric Clustering','location','northoutside');
set(h_legend,'FontSize',18);
