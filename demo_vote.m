clear;
close all
clc

%% load the data set
load demo_vote.mat

%% solving
npsvmPara = NPSVM_Parameters();
npsvmPara.KernelType = 'linear';      
npsvmPara.C = 0.1;
npsvmPara.KernelParas = 0.1; 
npsvmPara.Epsilon = 0.05;
npsvmPara.C_p = 1;
N_random = 2;
result = cell(1,N_random);
Accuracy = zeros(1,N_random);
obj = zeros(N_random,1);
for pp = 1:N_random
%     para.init_y = ones(length(trD),1);
%     r = randperm(length(trD));
%     para.init_y(r(1:floor(length(trD)/2))) = -1;
    [result{pp},Accuracy(pp)] = prop_npsvm_train(split, trD, para, npsvmPara);
    obj(pp) = result{pp}.obj;
end
[~,id] = min(obj);
train_best_acc = Accuracy(id);
[predicted_label, decision_values,test_best_acc] = NPSVM_Test(teD,split.test_label, result{id});
