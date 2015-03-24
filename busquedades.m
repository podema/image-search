function out=busquedades(path,imname,nresults)

oldpath=cd;
addpath(oldpath)
cd(path)
load resultats.mat


querydes=descriptor(imread(imname));

for i=1:length(D)
    ECMY(i)=comparador(querydes(1,1:16,1),D(i,1:16,1));
    ECMCB(i)=comparador(querydes(1,1:16,2),D(i,1:16,2));
    ECMCR(i)=comparador(querydes(1,1:16,3),D(i,1:16,3));
end

ECM=sqrt(ECMY)+sqrt(ECMCB)+sqrt(ECMCR);

ascECM=sort(ECM,'ascend');

for i=1:nresults
index(i)=find(ECM==ascECM(i));
end

cd(path)
imagefiles=dir('*.jpg');

figure();
for i=1:nresults
subplot(round(nresults/2),2,i),imshow(imread(imagefiles(index(i)).name));
subplot(round(nresults/2),2,i),title(imagefiles(index(i)).name);
out(i)=imagefiles(index(i));

end

cd(oldpath)
end