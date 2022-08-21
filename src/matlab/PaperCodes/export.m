function export(name,pname)

if (nargin < 2)
    pname = ('/Users/kgo5020/Desktop/export/');
    name2 = sprintf('%d_%d_%d_%d_%d_%2.0fT.eps',clock);
    fprintf('Automatically saved to Desktop/export as %d_%d_%d_%d_%d_%2.0f.eps\n',clock')
end
pathname = fileparts(pname);

if (nargin < 2)
    baseFileName = name2;
else
    baseFileName = sprintf(name);
end
fullFileName = fullfile(pathname,baseFileName);
% exportfig(gcf,fullFileName,'Color','rgb')
exportfig(gcf,fullFileName)

end





