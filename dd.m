%Input arguments:
%                n=4
%                x=[-1;0;0.2;0.3]
%                f=[5.3;2.0;3.19;1]
function d=dd(n,x,f)
%I was dumb and had this as a script before, it now is a function
dd = zeros(n);
dd(:, 1) = f; 
    for i = 2:n
        for j = 1 : (n - i + 1)
            dd(j,i) = (dd(j + 1, i - 1) - dd(j, i - 1)) / (x(j + i - 1) - x(j));
        end
    end
d=dd(1,:)';
end

