function out=busquedargb(path,imname,nresults)

oldpath=cd;

cd(path)
load resultats.mat


I=imread(imname);

nbins=length(histR(1,:));

queryhistR=imhist(I(:,:,1),nbins);
queryhistG=imhist(I(:,:,2),nbins);
queryhistB=imhist(I(:,:,3),nbins);

clear I
cd(oldpath) 

for i=1:length(histR)
    ECMR(i)=comparador(queryhistR,histR(i,:));
    ECMG(i)=comparador(queryhistG,histG(i,:));
    ECMB(i)=comparador(queryhistB,histB(i,:));
end

ECM=(0.3*ECMR)+(0.4*ECMG)+(0.3*ECMB);

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
