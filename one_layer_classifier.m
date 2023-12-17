%filter == true if you want to train with a filter, false otherwise
function one_layer_classifier(filter)
    load P_both.mat P_both;
    load P_f_both.mat P_f_both;
    load Tc_both.mat Tc_both;
    one_layer_net = network(1,1,1,1,0,1);
    
    one_layer_net.inputs{1}.size = 256;
    one_layer_net.layers{1}.size = 10;
    one_layer_net.IW{1}=-1 +2.*rand(10,256);
    one_layer_net.b{1}= -1 +2.*rand(10,1);
    one_layer_net.layers{1}.transferFcn = 'logsig';
    one_layer_net.outputs{1}.processFcns = {'mapminmax'};
    one_layer_net.outputs{1}.ProcessParams{1}.ymin = 0;
    one_layer_net.outputs{1}.ProcessParams{1}.ymax = 1;
    one_layer_net.trainFcn = 'trainscg';
    one_layer_net.trainParam.epochs = 1000;
    one_layer_net.trainParam.goal =  1e-6;
    one_layer_net.trainParam.lr = 0.5;
    one_layer_net.performFcn = 'sse';
    one_layer_net.trainParam.show = 35;
    if (filter == true)
        one_layer_net = train(one_layer_net,P_f_both,Tc_both);
        one_layer_f_net = one_layer_net;
        save one_layer_f_net.mat one_layer_f_net;
    else
        one_layer_net = train(one_layer_net,P_both,Tc_both);
        save one_layer_net.mat one_layer_net;
    end
    
end
