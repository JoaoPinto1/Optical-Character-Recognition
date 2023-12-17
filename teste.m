function teste()
    load filter_net.mat filter_net;
    load one_layer_net.mat one_layer_net;
    load two_layer_net.mat two_layer_net;
    load pat.mat pat;
    load Pt.mat Pt;
    load Pt2.mat Pt2;
    load Pt3.mat Pt3;
    num = 0;
    %A = sim(filter_net, Pt2);
    A = sim(two_layer_net, Pt2);
    for i = 1:size(A,2)
        number = find(A(:,i) == max(A(:,i)),1);
        if number == rem(i-1,10)+1
            num = num+1;
        end
    end
    display(num/size(A,2));
end
