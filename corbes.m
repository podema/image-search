function out=corbes()
imprimir=['outputgris.txt','outputycbcr.txt','outputdes8.txt','outputdes16.txt'];
linespec = {'b.', 'r-', 'g--o'}; % define your ten linespecs in a cell array
hold on
for i=1:length(imprimir)
   plot(X(i:i+9,1),X(i:i+9,2),linespec{i})
end
hold off
end