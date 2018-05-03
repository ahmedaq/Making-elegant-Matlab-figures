clear all; close all; clc

%% Example 1

num = 8;
data = cell(1,num);
for kk = 1:num
    data{kk} = randi(10) + randn(randi([300 400]),1);
end

figure;figure_boxplot(data);
% set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
% print('boxplot1','-dpng','-r300')

%% Example 2

num = 6;
data = cell(1,num);
for kk = 1:num
    data{kk} = randi(10) + randn(1,500);
end

label_axes = {'Variable','Number'};
label_boxes = {'alpha','beta','gamma','delta','epsilon','zeta'};
figure;figure_boxplot(data,label_axes,label_boxes);

% set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
% print('boxplot2','-dpng','-r300')

%% Example 3: Input data in matrix form (MxN)

% N variables, M observations, and boxplot of each variable (column) is
% required to be plotted

% Number of intended boxes in the figure
num_boxes = 7;    
num_samples = 1000;

% Generating random data
data = zeros(num_samples,num_boxes);   
for k = 1:num_boxes
    data(:,k) = randi(10) + randn(num_samples,1);
end

figure;figure_boxplot(data);

% set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
% print('boxplot3','-dpng','-r300')
