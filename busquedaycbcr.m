function out=busquedaycbcr(path,imname,nresults)

oldpath=cd;

cd(path)
load resultats.mat


Iyq=rgb2ycbcr(imread(imname));

nbins=length(histY(1,:));

queryhistY=imhist(Iyq(:,:,1),nbins);
queryhistCB=imhist(Iyq(:,:,2),nbins);
queryhistCR=imhist(Iyq(:,:,3),nbins);

clear I
cd(oldpath) 

for i=1:length(histY)
    ECMY(i)=comparador(queryhistY,histY(i,:));
    ECMCB(i)=comparador(queryhistCB,histCB(i,:));
    ECMCR(i)=comparador(queryhistCR,histCR(i,:));
end

ECM=(0.5*ECMY)+(0.25*ECMCB)+(0.25*ECMCR);

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