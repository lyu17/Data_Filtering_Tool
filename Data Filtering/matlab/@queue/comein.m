function q=comein(p,varargin)
% @QUEUE\COMEIN 	a variable comes to the end of a queue.
% 调用格式
%  comein(p,a,b,...)			使输入宗量a,b等排在p之后形成新队列，
%									其名沿用p位置上的输入队列名.
%  q=comein(p,a,b,...)		使输入宗量a,b等排在p之后形成新队列 q . 
if nargin<2 error('comein needs at least two arguments.');end;
if ~isa(p,'queue') error([inputname(1),' is not a queue']);end;
q0=p;
qzzy=class(p);					%获取第一输入宗量的类别字符串				<10>
for i=1:length(varargin)
   temp=varargin{i};
   s=eval([qzzy,'(temp)']);		%使后来元素成为与第一输入宗量相同的类别	<13>
   s.name=inputname(i+1);
   if isempty(s.name)					%假如某输入宗量本身无名称
      s.name=['(' class(temp) ')'];	%则把它的类别名作为名称使用
   end
   if isempty(q0)						%假如前队列是"空"队列
      q0=s;								%则直接进入队列
   else									%假如前队列非"空"
      q0=[q0 s];							%则新变量排在队尾
   end
end
if nargout==0;							%假如没有输出宗量
   assignin('caller',inputname(1),q0);%新队列沿用第一个输入队列名
   evalin('caller',inputname(1));
else										%假如有输入输出宗量 
   q=q0;									%新队列名为q
end
