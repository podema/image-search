function out=algo2(histim,histcomp)
acc=0;
if length(histim)==length(histcomp)

    for i=1:length(histim)
    acc=acc+(abs(histim(i)-histcomp(i)));
    end
    out=acc;
   
else disp('Error, la llongitud dels histogrames no concorda'),out=-1;
end
end
