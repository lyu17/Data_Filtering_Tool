function q=queue(v)
%@QUEUE\QUEUE 		queue class constructor function
% ���ø�ʽ
%		q=queue 			����һ��"��"���ж���.
%  		q=queue(v) 		������������v�Ķ��ж���
superiorto('double','struct','cell','char','inline','sym');
											% ʹqueue�������������ȼ�			<6>
if nargin>1;error('Too many arguments.');end;
if nargin==0							% û�������������
   q.value=[];							% value �򱻸�"����"
   q.name='';								% name �򲻸��κ��ַ�
   q=class(q,'queue');					% ������ q ����queue��ǩ 
elseif isa(v,'queue');				% ����������ͬ��������
   q=v;									% ֱ�Ӱ����������� q
else									% ��ͬ�������������
   q.value=v;								% �� value ���з���������� v ������
   q.name=inputname(1);					% �� name ���з������������ v �ַ�
   if isempty(q.name)					% ��������������
      q.name=['(' class(v) ')'];		% �Ͳ��� v ���������
   end
   q=class(q,'queue');					% ������ q ����queue��ǩ			<20>
end
