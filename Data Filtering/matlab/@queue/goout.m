function [n,v,q]=goout(p)
% @QUEUE\GOOUT 	removes the first(the front) element from a queue.
% ���ø�ʽ
%  goout(p) 			�Ӷ��� p �еĵ�һ��Ԫ�����.
%  v=goout(p) 		v �Ǵ� p �������Ƴ����ǵ�һ��Ԫ�ص�"ֵ"
%  [n,v]=goout(p) 	n,v �ֱ� �Ǵ� p �������Ƴ����ǵ�һ��Ԫ�ص�"����"��"ֵ"
%  [n,v,q]=goout(p)	n,v �ֱ� �Ǵ� p �������Ƴ����ǵ�һ��Ԫ�ص�"����"��"ֵ"
%						q �Ǳ���ȥ��һ��Ԫ�غ���¶���
if nargin==0 ;error('No queue specifide.');end;
if nargout>3;error('Too many output arguments.');end;
if nargin>1 error('Too many input arguments.');end;
if ~isa(p,'queue');error([inputname(1),' is not a queue.']);end;
if isempty(p)
   q1=p;
else 
   [m,n]=size(p);
   v1=p(1).value;n1=p(1).name;
   if m*n==1
      q1=queue;
   else
      q1=p(2:end);
   end
end
if nargout<3;
   assignin('caller',inputname(1),q1);
end;
if nargout==0,
   evalin('caller',inputname(1));
end
if nargout>=1;v=v1;end;
if nargout>=2;n=n1;end;
if nargout==3;q=q1;end;
