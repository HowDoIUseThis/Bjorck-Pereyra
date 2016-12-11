M1 = NaN(26,3);
M2 = NaN(26,4);
M3 = NaN(26,4);
for i=5:30
    f=-1+(1+1)*rand(i,1);
    x = linspace(-1,1,i);
    x=x';
    [Lx,Lf]=leja(x,f); %gets values for Leja
    V=fliplr(vander(x)); 
    aBPd=bjorck(x,f);
    aGE=dd(i,x,f);
    aBPs=bjorckSingle(x,f); %single persision bjorck
    aBPLd=bjorck(Lx,Lf);  %bjorck with leja ordering double
    aBPLs=bjorckSingle(Lx,Lf); %leja single 
    
    %                    Table 1
    %To see error for just forward and backward
    ferror=norm(aBPd-aBPs)/norm(aBPd);
    berror=norm(f-V*aBPd)/(norm(V)*norm(aBPd));
    
    %                    Table 2
    %Below is three forward error for Guassian elimination,
    %Bjorck-Pereyra without Leja order and with it, labled
    %e1,e2,e3 respectively
    e1=norm(aBPLd-aGE)/norm(aBPLd); 
    e2=norm(aBPLd-aBPs)/norm(aBPLd); 
    e3=norm(aBPLd-aBPLs)/norm(aBPLd);
    
    %                    Table 3
    b_e1=norm(f-V*aGE)/(norm(V)*norm(aGE));
    b_e2=norm(f-V*aBPs)/(norm(V)*norm(aBPs));
    b_e3=norm(f-V*aBPLs)/(norm(V)*norm(aBPLs));
    
    
    %Construct array of values to make table
    temp1 =[i ferror berror];
    temp2 =[i e1 e2 e3];
    temp3 =[i b_e1 b_e2 b_e3];   
    M1(i-4,:)=temp1;
    M2(i-4,:)=temp2;
    M3(i-4,:)=temp3;
    
end
%General Forward and Backward error of just BP
ForVSBackError = array2table(M1,'VariableNames',{'N','FError','BError'})
%Forward and backward error for GE, BPs and BPLs
ForwardError = array2table(M2,'VariableNames',{'N','Ge','BPs', 'BPLs'})
BackwardError = array2table(M3,'VariableNames',{'N','B_Ge','B_BPs', 'B_BPLs'})

