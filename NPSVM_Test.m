function  [predicted_label, decision_values,accuracy] = NPSVM_Test(X,Y, model)

data_num = size(X,1);
[model0, model1] = splitmodel(model);

[~, ~, decision_values1] = svmpredict(Y,X,model0);
[predicted_label, ~, decision_values2] = svmpredict(Y,X,model1);

%    decision_values = decision_values1;
for i=1:data_num
    if((abs(decision_values1(i)))<(abs(decision_values2(i))))
        predicted_label(i) =1;
    else
        predicted_label(i) =-1;
    end
    decision_values = abs(decision_values2) - abs(decision_values1);
end

accuracy =  length(find(Y==predicted_label))/length(predicted_label);

end