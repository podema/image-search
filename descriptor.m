function out=descriptor(im)
%dividim la imatge en blocs
im=im2double(im);
block=mat2cell(im,repmat(8,60,1)',repmat(8,80,1)',3);
%calculem el color dominant de cada bloc
for i=1:60
    for j=1:80
    ico(i,j,:)=mean(mean(block{i,j}));
    end
    end
%convertim la imatge de rgb al espai de color ycbcr
ico=rgb2ycbcr(ico);
%en calculem la dct i extraiem el vector de caracteristiques seguint un algoritme de zigzag
for i=1:3
ico(:,:,i)=dct2(ico(:,:,i));
out(:,:,i)=zigZag(16,ico(:,:,i));
end

end
