function filled = myclassify(X, ind, classifierType)
    load filter_net.mat filter_net;
    load one_layer_f_net.mat one_layer_f_net;
    load one_layer_net.mat one_layer_net;
    load two_layer_net.mat two_layer_net;
    filled = [];
    
    disp("myclassify called w/ args: X[omitted] ")
    %disp(X)
    disp(ind)
    disp(classifierType)
    
    for i = 1:length(ind)
        if classifierType == 1
            P_filter = sim(filter_net, X(:, ind(i)));
            A = sim(one_layer_f_net, P_filter);
        elseif classifierType == 2
            A = sim(one_layer_net, X(:, ind(i)));
        elseif classifierType == 3
            A = sim(two_layer_net, X(:, ind(i)));
        else
            error('Invalid classifierType. Choose 1, 2, or 3.');
        end

        disp(A);
        [~, result] = max(A);
        filled(i) = result;
    end

    disp(filled);
end
