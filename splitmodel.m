function [model0, model1] = splitmodel(model)

%   [model0, model1] = splitmodel(model)
%   input:
%         model:   the output model of the LLP-NPSVM.
%   output:
%         model0:  the model for the assumed positive class.
%         model1:  the model for the assumed negative class.
%
%   Author: Zhiquan Qi
%   Date: 2016.01.05
%
%1
model0.Parameters = model.Parameters01;
model0.nr_class   = model.nr_class01;
model0.totalSV    = model.totalSV01;
model0.rho        = model.rho01;
model0.Label      = model.Label01;
model0.ProbA      = model.ProbA01;
model0.ProbB      = model.ProbB01;
model0.nSV        = model.nSV01;
model0.sv_coef    = model.sv_coef01;
model0.SVs        = model.SVs01;

%2
model1.Parameters = model.Parameters02;
model1.nr_class   = model.nr_class02;
model1.totalSV    = model.totalSV02;
model1.rho        = model.rho02;
model1.Label      = model.Label02;
model1.ProbA      = model.ProbA02;
model1.ProbB      = model.ProbB02;
model1.nSV        = model.nSV02;
model1.sv_coef    = model.sv_coef02;
model1.SVs        = model.SVs02;
end