function display(q,ki,kj)
%QUEUE\DISPLAY 	command window display of a queue object.
% ���ø�ʽ
%	display(q)			��ͳ��ʾ��������
%	display(q,ki)		���±귨��ʾ�������Ԫ�ص�����
%	display(q,ki,kj)	˫�±귨��ʾ�������Ԫ�ص�����
if nargin==0;error('ȱ������������������ʾ���� ��');end
switch nargin
case 1						% ��ʾ��������
   [m,n]=size(q);
	vname=inputname(1);					% ����ʾ���� q ������
	if isempty(vname)					% ��ʾ������������
	   fprintf('ans=\n');				% ��MATLAB��������Ļ��ʾansȱʡ��
	elseif fprintf('%s=\n',vname);		% ����������ʱ������Ļ���ַ�����ʽ��ʾ����
	end;
	if isempty(q)							% ���类��ʾ����Ϊ"��"
      fprintf('   [ empty  ')													%<17>
      fprintf('%s',class(q))													%<18>
      fprintf(' ]\n\n');														%<19>
	elseif m*n==1;						% ����ʾ��������һ��"Ԫ��"ʱ
	   fprintf('   %s: ',q.name);		% ��Ļ�����ַ�����ʽ��ʾ����Ŷ��������
	   disp(q.value);					% �����ţ������У���ʾ����Ŷ��������
	   fprintf('\n');
	else 									% ����ʾ�����������"Ԫ��"ʱ
      fprintf('   [ %d*%d ',m,n)		% ����3��ָ��ֻ��ʾ����"Ԫ��"����<25>
      fprintf('%s',class(q))													%<26>
      fprintf(' ]\n\n');														%<27>
	end
case 2						% ���±귨��ʾ�������Ԫ�ص�����
   disp(['The content of ',inputname(1),'(',int2str(ki),')'])
   disp(['is a ''',class(q(ki).value),''' object'])
   fprintf('  %s=\n',q(ki).name);
   disp(q(ki).value);
   fprintf('\n');
case 3						% ˫�±귨��ʾ�������Ԫ�ص�����
   disp(['The content of ',inputname(1),'(',int2str(ki),',',int2str(kj),')'])
   disp(['is a ''',class(q(ki,kj).value),''' object'])
   fprintf('   %s=\n',q(ki,kj).name);
   disp(q(ki,kj).value);
   fprintf('\n');
end
