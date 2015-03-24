function out=test(file)

results=textread(file,'%s');

for i=1:8
s=results{16*(i-1)+6};
iquery=str2num(s(8:12));
T=linspace(4*floor(iquery/4),(4*floor(iquery/4))+3,4);
%precision  = TP/P
%recall = TP/T

%parsejem el fitxer per obtenir els double del id de les imatges
for k=1:10
s=results{(6+(16*(i-1)))+k};
resultsnum(k)=str2num(s(8:12));
end
acc=0;

%comptem els true positives
for k=1:length(resultsnum)
for l=1:length(T);
if(T(l)==resultsnum(k))
acc=acc+1;
end
end

%TP=acc;
precision(i,k)=acc/k;
recall(i,k)=acc/4;
end

end
precision=mean(precision)
recall=mean(recall)
p=plot(recall,precision)
grid('on');
set(p,'linewidth',2);
t=title('Corbes de precision recall');
set(t,'fontsize',14);

end