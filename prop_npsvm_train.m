function [model,Accuracy] = prop_npsvm_train(split, trD, para, npsvmPara)
para.verbose = 0;
C = npsvmPara.C;
npsvmPara.C = 10e-5 * C;

while(npsvmPara.C ~= C)
    npsvmPara.C = min(npsvmPara.C*1.5,C);
    [model,Accuracy]= alternating_prop_npsvm_solving(trD, split, para, npsvmPara);
end
end

