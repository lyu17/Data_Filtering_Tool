function clusterplot( data, h )

rdata = kpca( data, 2, 'poly', 1 );

[clustCent,point2cluster,clustMembsCell] = MeanShiftCluster(rdata,h);

[label;rdata;point2cluster];
numClust = length(clustMembsCell);

figure,clf,hold on
title('','fontsize',18);
xlabel('','fontsize',18);
ylabel('','fontsize',18);
set(gca,'XLim',[-1 1])
set(gca,'XTick',-1:0.2:1)
set(gca,'YLim',[-0.2 0.4])
set(gca,'YTick',-0.2:0.1:0.4)
cVec = 'bgrcmykbgrcmykbgrcmykbgrcmyk';
sVec = 'x+*.o-';

for k = 1:min(numClust,length(cVec))
    myMembers = clustMembsCell{k};
    myClustCen = clustCent(:,k);
    plot(rdata(1,myMembers),rdata(2,myMembers),[cVec(k) sVec(k)],'MarkerSize',20)
    plot(myClustCen(1),myClustCen(2),'o','MarkerEdgeColor','k','MarkerFaceColor',cVec(k), 'MarkerSize',10)
end

end