function q=comein(p,varargin)
% @QUEUE\COMEIN 	a variable comes to the end of a queue.
% ���ø�ʽ
%  comein(p,a,b,...)			ʹ��������a,b������p֮���γ��¶��У�
%									��������pλ���ϵ����������.
%  q=comein(p,a,b,...)		ʹ��������a,b������p֮���γ��¶��� q . 
if nargin<2 error('comein needs at least two arguments.');end;
if ~isa(p,'queue') error([inputname(1),' is not a queue']);end;
q0=p;
qzzy=class(p);					%��ȡ��һ��������������ַ���				<10>
for i=1:length(varargin)
   temp=varargin{i};
   s=eval([qzzy,'(temp)']);		%ʹ����Ԫ�س�Ϊ���һ����������ͬ�����	<13>
   s.name=inputname(i+1);
   if isempty(s.name)					%����ĳ������������������
      s.name=['(' class(temp) ')'];	%��������������Ϊ����ʹ��
   end
   if isempty(q0)						%����ǰ������"��"����
      q0=s;								%��ֱ�ӽ������
   else									%����ǰ���з�"��"
      q0=[q0 s];							%���±������ڶ�β
   end
end
if nargout==0;							%����û���������
   assignin('caller',inputname(1),q0);%�¶������õ�һ�����������
   evalin('caller',inputname(1));
else										%����������������� 
   q=q0;									%�¶�����Ϊq
end
