function out=resultats(path)
query=textread('input.txt','%s');
fid=fopen('output.txt','w');
for i=1:length(query)
if(i>1)
fprintf(fid,'%s \r\n','');
end
fprintf(fid,'%s','Retrieved list for query image ');
fprintf(fid,'%s \r\n',query{i});
query{i}
noms=busquedades(path,query{i},10);

fprintf(fid,'%s \r\n',noms.name);

end