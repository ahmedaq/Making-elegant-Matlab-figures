clear all; close all; clc

%% Example 1

num = 8;
data = cell(1,num);
for kk = 1:num
    data{kk} = randi(10) + randn(1,500);
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