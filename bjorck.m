%Input arguments:
%                x=[-1;0;0.2;0.3]
%                f=[5.3;2.0;3.19;1]
function a = bjorck(x,f)
n=max(size(x));
c=eye(n);
Hold=eye(n,n);%Hold will be used to hold U factorization
for k=1:n
    D=eye(n,n);
    L=eye(n,n);
    L(k+1:n,k)=-ones(n-k,1);
    U=eye(n,n);
    for i=k+1:n
        D(i,i)=1/(x(i)-x(k));
        U(i-1,i)=-x(k);
    end
    f=D*L*f;
    Hold=Hold*U; %Hold=U_(k)*U_(k+1)
end
a=Hold*f;
end
