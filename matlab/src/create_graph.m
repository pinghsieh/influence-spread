%% Create edge weights
tic;
x = 1*rand(50,50);
edge = or(and((x > 0.3),(x < 0.33)),and((x > 0.1),(x < 0.13)));
x = edge.*x;
fileID = fopen('graph50.txt','w');
fprintf(fileID,'%.4f\n',x);
fclose(fileID);

toc;