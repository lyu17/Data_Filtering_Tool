function [n,v,q]=goout(p)
% @QUEUE\GOOUT 	removes the first(the front) element from a queue.
% 调用格式
%  goout(p) 			从队列 p 中的第一个元素离队.
%  v=goout(p) 		v 是从 p 队列中移出的那第一个元素的"值"
%  [n,v]=goout(p) 	n,v 分别 是从 p 队列中移出的那第一个元素的"名称"和"值"
%  [n,v,q]=goout(p)	n,v 分别 是从 p 队列中移出的那第一个元素的"名称"和"值"
%						q 是被移去第一个元素后的新队列
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
