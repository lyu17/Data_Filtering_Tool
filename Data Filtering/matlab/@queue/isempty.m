function f=isempty(q)
%@QUEUE\ISEMPTY 	True for an empty queue object.
f=0;
[m,n]=size(q);
if m*n==1;
   if isempty(q.value) & isempty(q.name) 								%<6>
      f=1;
   end;
end;
