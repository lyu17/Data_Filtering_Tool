function display(q,ki,kj)
%QUEUE\DISPLAY 	command window display of a queue object.
% 调用格式
%	display(q)			笼统显示整个队列
%	display(q,ki)		单下标法显示具体队列元素的内容
%	display(q,ki,kj)	双下标法显示具体队列元素的内容
if nargin==0;error('缺少输入宗量，即被显示对象 ！');end
switch nargin
case 1						% 显示整个队列
   [m,n]=size(q);
	vname=inputname(1);					% 被显示对象 q 的名称
	if isempty(vname)					% 显示对象若无名称
	   fprintf('ans=\n');				% 按MATLAB惯例，屏幕显示ans缺省名
	elseif fprintf('%s=\n',vname);		% 对象有名称时，则屏幕以字符串形式显示名称
	end;
	if isempty(q)							% 假如被显示对象为"空"
      fprintf('   [ empty  ')													%<17>
      fprintf('%s',class(q))													%<18>
      fprintf(' ]\n\n');														%<19>
	elseif m*n==1;						% 被显示对象今包含一个"元素"时
	   fprintf('   %s: ',q.name);		% 屏幕先以字符串形式显示所存放对象的名称
	   disp(q.value);					% 紧接着，不换行，显示所存放对象的内容
	   fprintf('\n');
	else 									% 被显示对象今包含多个"元素"时
      fprintf('   [ %d*%d ',m,n)		% 以下3条指令只显示队列"元素"排列<25>
      fprintf('%s',class(q))													%<26>
      fprintf(' ]\n\n');														%<27>
	end
case 2						% 单下标法显示具体队列元素的内容
   disp(['The content of ',inputname(1),'(',int2str(ki),')'])
   disp(['is a ''',class(q(ki).value),''' object'])
   fprintf('  %s=\n',q(ki).name);
   disp(q(ki).value);
   fprintf('\n');
case 3						% 双下标法显示具体队列元素的内容
   disp(['The content of ',inputname(1),'(',int2str(ki),',',int2str(kj),')'])
   disp(['is a ''',class(q(ki,kj).value),''' object'])
   fprintf('   %s=\n',q(ki,kj).name);
   disp(q(ki,kj).value);
   fprintf('\n');
end
