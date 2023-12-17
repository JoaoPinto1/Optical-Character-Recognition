%neurons = number of neurons in the hidden layer
function two_layer_classifier(neurons)
    load P_both.mat P_both;
    load Tc_both.mat Tc_both;
    two_layer_net = network(1,2,[1;1],[1;0],[0 0;1 0],[0 1]);
    two_layer_net.inputs{1}.size = 256;
    two_layer_net.layers{1}.size = neurons;
    two_layer_net.layers{2}.size = 10;
    two_layer_net.layers{1}.transferFcn = 'logsig';
    two_layer_net.layers{2}.transferFcn = 'softmax';
    two_layer_net.IW{1}=-1 +2.*rand(neurons,256);
    two_layer_net.b{1}= rand(neurons,1);
    two_layer_net.LW{2}=-1 +2.*rand(10,neurons);
    two_layer_net.b{2}= rand(10,1);
    two_layer_net.trainFcn = 'trainscg';
    two_layer_net.trainParam.epochs = 1000;
    two_layer_net.trainParam.goal =  1e-6;
    two_layer_net.trainParam.lr = 0.5;
    two_layer_net.performFcn = 'sse';
    two_layer_net.trainParam.show = 35;
    two_layer_net = train(two_layer_net,P_both,Tc_both);
    save two_layer_net.mat two_layer_net;
end
