function pat_net()
    load P_both.mat P_both;
    load Tc_both.mat Tc_both;
    pat = patternnet(20);
    pat.trainFcn = 'trainscg';
    pat = train(pat, P_both, Tc_both);
    save pat.mat pat;
end