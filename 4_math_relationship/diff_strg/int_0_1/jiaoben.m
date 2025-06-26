ord_List = 1:51;

for i = 1:length(ord_List)
    ord_num = ord_List(i);
    if i == 1
        command = ['nohup srun -p brain --mem=16G -c 4 matlab -r "main(', num2str(ord_num), ')" 1>log', num2str(ord_num), ' 2>err', num2str(ord_num), ' &'];
    end
    if i > 1
        command = ['nohup srun -p brain --mem=16G -c 4 matlab -r "main(', num2str(ord_num), ')" 1>log', num2str(ord_num), ' &'];
    end
    system(command);
    
    disp(num2str(ord_num));
    pause(1)
end

quit