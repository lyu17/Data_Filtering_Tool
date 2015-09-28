clear;
clc;

data_log = 'C:\Users\Yu\Desktop\logs\wc_cpumem_30\feature_hec-';
fault_log = 'C:\Users\Yu\Desktop\logs\wc_cpumem_30\label';

[data label] = dataload( data_log, fault_log, 'wc_cpumem ' );

tdata = [label;data];

[ GG GF FG FF rand ] = detection( data, 61, 'b', 'deviation', 6, label, 2, 'poly', 1 );

da = (2*FF) / (2*FF+GF+FG);
        
rdata = kpca( data, 2, 'poly', 1 );
mdata = [label;rdata;inf(1,size(data,2));data];

[ clustCent, point2cluster, clustMembsCell ] = MeanShiftCluster(rdata,0.25);

kdata=[label;data([1:16],:);point2cluster];

acc = cluster_acc( label, point2cluster );
            
numClust = length(clustMembsCell);



figure,hold on
set(gca,'XLim',[-1 1])
set(gca,'XTick',-10:.2:10)
set(gca,'YLim',[-1 1])
set(gca,'YTick',-10:.2:10)
%cVec = 'bgrcmykbgrcmykbgrcmykbgrcmyk';
cVec = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
sVec = 'x+*x+*x+*';

for k = 1:min(numClust,length(cVec))
    myMembers = clustMembsCell{k};
    myClustCen = clustCent(:,k);
%    plot(rdata(1,myMembers),rdata(2,myMembers),[cVec(k) sVec(k)],'MarkerSize',20);
%    plot(myClustCen(1),myClustCen(2),'o','MarkerEdgeColor','k','MarkerFaceColor',cVec(k), 'MarkerSize',10);
    plot(rdata(1,myMembers),rdata(2,myMembers),[cVec(k) sVec(k)],'MarkerSize',20);
    plot(myClustCen(1),myClustCen(2),'o','MarkerEdgeColor','k','MarkerFaceColor',cVec(k), 'MarkerSize',10);
end
        
















