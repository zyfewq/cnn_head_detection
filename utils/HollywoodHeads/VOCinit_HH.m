% Generating VOCopts varible of VOC evalution toolkit for HollywoodHeads dataset
%
% This code is based on VOCinit.m from VOC2012 devkit.
% Copyright Tuan-Hung VU - tuanhungvu@gmail.com

clear VOCopts

VOCopts.dataset='HollywoodHeads';

% change this path to a writable directory for your results
curPath = pwd;

% change this path to point to your copy of the HollywoodHeads dataset
VOCopts.datadir= fullfile(curPath, 'data');

VOCopts.resdir=fullfile(curPath, 'results', VOCopts.dataset, 'VOCEval');
if ~exist(VOCopts.resdir, 'dir')
    mkdir(VOCopts.resdir);
end

% change this path to a writable local directory for the annotation cache
VOCopts.localdir=fullfile(curPath, 'results', VOCopts.dataset, 'VOCEval', 'anns');
if ~exist(VOCopts.localdir, 'dir')
    mkdir(VOCopts.localdir);
end

% initialize the training set
VOCopts.trainset='train'; % use train for development

% initialize the test set
VOCopts.testset='test'; % use validation data for development test set

% initialize main paths
VOCopts.annopath=fullfile(VOCopts.datadir, VOCopts.dataset, 'Annotations', '%s.xml');
VOCopts.imgpath=fullfile(VOCopts.datadir, VOCopts.dataset, 'JPEGImages', '%s.jpeg');
VOCopts.imgsetpath=fullfile(VOCopts.datadir, VOCopts.dataset, 'Splits', '%s.txt');

VOCopts.detrespath=fullfile(VOCopts.resdir, ['%s_det_' VOCopts.testset '_%s.txt']);

VOCopts.classes={'head'};
VOCopts.nclasses=length(VOCopts.classes);	

% overlap threshold
VOCopts.minoverlap=0.5;

% annotation cache for evaluation
VOCopts.annocachepath=fullfile(VOCopts.localdir, '%s_anno.mat');