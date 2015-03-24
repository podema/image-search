function out=algo1(path,nbins)

oldpath=cd;
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
    R=I(:,:,1);
    G=I(:,:,2);
    B=I(:,:,3);   
    
    histR(i,:)=imhist(R,nbins);
    histG(i,:)=imhist(G,nbins);
    histB(i,:)=imhist(B,nbins);    
    
    D(i,:,:)=descriptor(I);    
    
    end


save('resultats','histR','histG','histB','D');

end

cd(oldpath)

end