%Input arguments:
%                x=[-1;0;0.2;0.3]
%                f=[5.3;2.0;3.19;1]
function [x,f] = leja(x,f)
n=max(size(x));
[maximum,index]=max(abs(x)); 
x([1 index]) = x([index 1]); 
f([1 index]) = f([index 1]);
r=ones(n,1);
r(1)=0;
for k=2:(n-1)
    for m=k:n
        r(m)=r(m)*(x(m)-x(k-1));
    end
    [maximum, index]=max(abs(r));
    x([k index]) = x([index k]);
    f([k index]) = f([index k]);
    r([k index]) = r([index k]);
    r(k)=0;
end
end