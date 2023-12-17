function filter_training()
    load P_both.mat P_both;
    load T_both.mat T_both;
    filter_net = network(1,1,0,1,0,1);
    
    filter_net.inputs{1}.size = 256;
    filter_net.layers{1}.size = 256;
    filter_net.IW{1}=T_both * pinv(P_both);
    filter_net.layers{1}.transferFcn = 'purelin';
    save filter_net.mat filter_net;
end
