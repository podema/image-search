function out=comparador(histim,histcomp)
acc=0;
if length(histim)==length(histcomp)

    for i=1:length(histim)
    acc=acc+((histim(i)-histcomp(i))^2);
    end
    out=acc;
   
else disp('Error, la llongitud dels histogrames no concorda'),out=-1;
end
end