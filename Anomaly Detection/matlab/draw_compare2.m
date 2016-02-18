f1_10 = [0.9941    0.9246    0.7181    1.0000    1.0000];
f1_20 = [0.9200    0.8983    0.9252    1.0000    1.0000];
f1_30 = [0.7964    0.7837    0.9800    0.9929    0.9960];
f1_40 = [0.6730    0.6222    0.8994    0.8955    0.8989];

f2_10 = [0.8641    0.8766    0.3851    1.0000    1.0000];
f2_20 = [0.8728    0.8600    0.6866    1.0000    1.0000];
f2_30 = [0.7274    0.6950    0.8655    0.9980    1.0000];
f2_40 = [0.6505    0.4983    0.9275    0.9797    0.9791];

f3_10 = [0.8471    0.8701    0.2476    0.9568    0.9933];
f3_20 = [0.8509    0.7278    0.4756    0.9375    0.9740];
f3_30 = [0.6776    0.6303    0.6517    0.9029    0.9468];
f3_40 = [0.6486    0.4802    0.7674    0.8967    0.9264];

f4_10 = [0.8081    0.8270    0.1818    0.9635    0.9829];
f4_20 = [0.8232    0.7805    0.3333    0.8894    0.9502];
f4_30 = [0.6988    0.6259    0.4615    0.8530    0.9083];
f4_40 = [0.6243    0.5256    0.5714    0.8080    0.8448];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
colormap gray
acc_p1 = [f1_10([1 2 5]);f1_20([1 2 5]);f1_30([1 2 5]);f1_40([1 2 5])];
bar(acc_p1);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('Deviation-based 1','Deviation-based 2','Our Method','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p2 = [f2_10([1 2 5]);f2_20([1 2 5]);f2_30([1 2 5]);f2_40([1 2 5])];
bar(acc_p2);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('Deviation-based 1','Deviation-based 2','Our Method','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p3 = [f3_10([1 2 5]);f3_20([1 2 5]);f3_30([1 2 5]);f3_40([1 2 5])];
bar(acc_p3);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('Deviation-based 1','Deviation-based 2','Our Method','location','northoutside');
set(h_legend,'FontSize',18);

figure;
colormap gray
acc_p4 = [f4_10([1 2 5]);f4_20([1 2 5]);f4_30([1 2 5]);f4_40([1 2 5])];
bar(acc_p4);
set(gca,'XLim',[0 5]);
set(gca,'YLim',[0 1.1])
xlabel('Anomaly Probability','fontsize',24);
ylabel('Detection Accuracy','fontsize',24);
set(gca,'XTickLabel',{'10%','20%','30%','40%'},'fontsize',24);
h_legend = legend('Deviation-based 1','Deviation-based 2','Our Method','location','northoutside');
set(h_legend,'FontSize',18);