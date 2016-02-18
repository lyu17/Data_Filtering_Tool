function q=queue(v)
%@QUEUE\QUEUE 		queue class constructor function
% 调用格式
%		q=queue 			创建一个"空"队列对象.
%  		q=queue(v) 		创建包含变量v的队列对象。
superiorto('double','struct','cell','char','inline','sym');
											% 使queue对象具有最高优先级			<6>
if nargin>1;error('Too many arguments.');end;
if nargin==0							% 没有输入宗量情况
   q.value=[];							% value 域被赋"空阵"
   q.name='';								% name 域不给任何字符
   q=class(q,'queue');					% 给变量 q 挂上queue标签 
elseif isa(v,'queue');				% 输入宗量是同类对象情况
   q=v;									% 直接把输入量赋给 q
else									% 非同类输入宗量情况
   q.value=v;								% 在 value 域中放置输入对象 v 的内容
   q.name=inputname(1);					% 在 name 域中放置输入对象名 v 字符
   if isempty(q.name)					% 假如输入量无名
      q.name=['(' class(v) ')'];		% 就采用 v 本身的类名
   end
   q=class(q,'queue');					% 给变量 q 挂上queue标签			<20>
end
