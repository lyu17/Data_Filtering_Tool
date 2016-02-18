p1 = [ 1 1 ] + 1;
p2 = [ 1 2 ] + 1;

p3 = [ 2 ] + 1;
p4 = [ 0.5 ] + 1;

p5 = [ 2 ] + 1;
p6 = [ 2.5 ] + 1;

figure,hold on,box on
%axis off

set(gca,'XLim',[1 4])
set(gca,'xtick',[]);

set(gca,'YLim',[1 4])
set(gca,'ytick',[]);

plot(p1,p2,'o','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot(p3,p4,'s','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot(p5,p6,'^','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot([2.7,3.3,3.3,2.7,2.7]-1,[2.7,2.7,4.3,4.3,2.7]-1,'--k','LineWidth',4);

plot([2.7,3.3,3.3,2.7,2.7],[2.2,2.2,4.8,4.8,2.2]-1,'--k','LineWidth',4);

th1 = text(1.2,3,'P1')
set(th1,'fontsize',30,'FontWeight','bold')
th2 = text(1.2,2,'P2')
set(th2,'fontsize',30,'FontWeight','bold')
th3 = text(3.5,3.5,'P3')
set(th3,'fontsize',30,'FontWeight','bold')
th4 = text(3.5,1.5,'P4')
set(th4,'fontsize',30,'FontWeight','bold')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure,hold on,box on
%axis off

set(gca,'XLim',[1 4])
set(gca,'xtick',[]);

set(gca,'YLim',[1 4])
set(gca,'ytick',[]);

plot(p1,p2,'o','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot(p3,p4,'s','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot(p5,p6,'^','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot([2.7,3.3,3.3,2.7,2.7]-1,[2.7,2.7,4.3,4.3,2.7]-1,'--k','LineWidth',4);

plot([2.7,3.3,3.3,2.7,2.7],[4.2,4.2,4.8,4.8,4.2]-1,'--k','LineWidth',4);

plot([2.7,3.3,3.3,2.7,2.7],[2.2,2.2,2.8,2.8,2.2]-1,'--k','LineWidth',4);

th1 = text(1.2,3,'P1')
set(th1,'fontsize',30,'FontWeight','bold')
th2 = text(1.2,2,'P2')
set(th2,'fontsize',30,'FontWeight','bold')
th3 = text(3.5,3.5,'P3')
set(th3,'fontsize',30,'FontWeight','bold')
th4 = text(3.5,1.5,'P4')
set(th4,'fontsize',30,'FontWeight','bold')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1 = 2;
p2 = 2;

p3 = 2;
p4 = 3;

p5 = 2;
p6 = 4;

figure,hold on,box on
%axis off

set(gca,'XLim',[1.5 5])
set(gca,'xtick',[]);

set(gca,'YLim',[1.2 4.8])
set(gca,'ytick',[]);

plot(p1,p2,'s','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot(p3,p4,'^','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

plot(p5,p6,'o','MarkerEdgeColor','k','MarkerFaceColor','k', 'MarkerSize',30)

th1 = text(2.5,4,'Normal Node')
set(th1,'fontsize',24,'FontWeight','bold')
th2 = text(2.5,3,'Abnormal Node 1')
set(th2,'fontsize',24,'FontWeight','bold')
th3 = text(2.5,2,'Abnormal Node 2')
set(th3,'fontsize',24,'FontWeight','bold')
