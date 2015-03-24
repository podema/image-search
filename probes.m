function out=probes(path)
imshow(imread(path))
end



queryhistG=imhist(I(:,;,2),nbins);
queryhistB=imhist(I(:,;,3),nbins);

clear I
 
for i=1:length(histR)
    ECMR(i)=algo2(queryhistR,histR(i,:));
    ECMG(i)=algo2(queryhistG,histG(i,:));
    ECMB(i)=algo2(queryhistB,histB(i,:));
end



out=ECMR;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a =

     2     2     2     9

>> locate(a,9)
Undefined function 'locate' for input arguments of type 'double'.
 
>> doc locate
>> find(a==9)

ans =

     4

>> 
