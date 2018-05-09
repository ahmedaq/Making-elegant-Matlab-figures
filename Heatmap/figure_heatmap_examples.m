clear all;close all;clc

%% Example 1: Heatmap using only the input data

% Generating data
x = randn(10,5);
C = corrcoef(x);

% Heatmap figure
figure_heatmap(C);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example1','-dpng','-r300')

%% Example 2: Heatmap using the input data and a specific color scheme

colorscheme = 'BuGn';

% Heatmap figure
figure_heatmap(C,colorscheme);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example2','-dpng','-r300')

%% Example 3: Heatmap with title and labels

colorscheme = 'BuGn';
text_title = 'Correlation Matrix';
text_labels = {'Variable','Variable'};

% Heatmap figure
figure_heatmap(C,colorscheme,text_title,text_labels);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example3','-dpng','-r300')

%% Example 4: Heatmap with cell labels and limits of colorscheme specified

colorscheme = 'BuGn';
text_title = 'Correlation Matrix';
text_labels = {'Variable','Variable'};
limits_data = [-1 1]; %for correlation matrix
text_labels_cells{1} = {'A','B','C','D','E'}; %x-axis cell labels
text_labels_cells{2} = {'A','B','C','D','E'}; %y-axis cell labels

% Heatmap figure
figure_heatmap(C,colorscheme,text_title,text_labels,limits_data,text_labels_cells);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example4','-dpng','-r300')

%% Example 5: Heatmap of a rectangular matrix and automated saving of figure with approproate cell sizes

% Generating rectangular matrix data
X = randn(10,6);
colorscheme = 'YlGnBu';
text_title = 'Tall Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
text_labels_cells{1} = 1:size(X,2); %x-axis cell labels
text_labels_cells{2} = 1:size(X,1); %y-axis cell labels
savefig = 1;
savefig_name = 'heatmap_example5a';

% Heatmap figure
figure_heatmap(X,colorscheme,text_title,text_labels,limits_data,text_labels_cells,...
    savefig,savefig_name);

%
Y = randn(11,20);
colorscheme = 'BuPu';
text_title = 'Fat Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
text_labels_cells{1} = 1:size(Y,2); %x-axis cell labels
text_labels_cells{2} = 1:size(Y,1); %y-axis cell labels
savefig = 1;
savefig_name = 'heatmap_example5b';

% Heatmap figure
figure;
figure_heatmap(Y,colorscheme,text_title,text_labels,limits_data,text_labels_cells,...
    savefig,savefig_name);

%% Example 6: Heatmap of a big data matrix 

% Generating rectangular matrix data
X = randn(15,50);
colorscheme = 'BuPu';
text_title = 'Big Rectangular Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
text_labels_cells{1} = 1:size(X,2); %x-axis cell labels
text_labels_cells{2} = 1:size(X,1); %y-axis cell labels
savefig = 1;
savefig_name = 'heatmap_example6';

% Heatmap figure
figure_heatmap(X,colorscheme,text_title,text_labels,limits_data,text_labels_cells,...
    savefig,savefig_name);

