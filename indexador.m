function out=indexador(path,nbins)

oldpath=cd;
addpath(oldpath);
cd(path)

existfile=exist('resultats.mat');
if existfile==2
execute=input('Ja hi ha un index de imatges, vol actualitzar-lo de totes maneres? premi 1 per actualitzar')
else execute=1;
end

if execute==1
imagefiles=dir('*.jpg');
nfiles=length(imagefiles);

    for i=1:nfiles

    I=imread(imagefiles(i).name);
    Iyq = rgb2ycbcr(I);
    R=I(:,:,1);
    G=I(:,:,2);
    B=I(:,:,3);   
    Y=Iyq(:,:,1);
    CB=Iyq(:,:,2);
    CR=Iyq(:,:,3);
    
    histR(i,:)=imhist(R,nbins);
    histG(i,:)=imhist(G,nbins);
    histB(i,:)=imhist(B,nbins);  
    histY(i,:)=imhist(Y,nbins);
    histCB(i,:)=imhist(CB,nbins);
    histCR(i,:)=imhist(CR,nbins);
    
    D(i,:,:)=descriptor(I);
    
    
    
    end


save('resultats','histR','histG','histB','histY','histCB','histCR','D' );

end

cd(oldpath)

end