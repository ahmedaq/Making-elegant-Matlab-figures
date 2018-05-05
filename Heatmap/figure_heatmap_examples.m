clear all;close all;clc

%% Example 1: Heatmap using only the input data

% Generating data
x = randn(10,5);
C = corrcoef(x);

% Heatmap figure
figure;
figure_heatmap(C);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example1','-dpng','-r300')

%% Example 2: Heatmap using the input data and a specific color scheme

colorscheme = 'BuGn';

% Heatmap figure
figure;
figure_heatmap(C,colorscheme);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example2','-dpng','-r300')

%% Example 3: Heatmap with title and labels

colorscheme = 'BuGn';
text_title = 'Correlation Matrix';
text_labels = {'Variable','Variable'};

% Heatmap figure
figure;
figure_heatmap(C,colorscheme,text_title,text_labels);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example3','-dpng','-r300')

%% Example 4: Heatmap with limits of colorscheme specified

colorscheme = 'BuGn';
text_title = 'Correlation Matrix';
text_labels = {'Variable','Variable'};
limits_data = [-1 1]; %for correlation matrix

% Heatmap figure
figure;
figure_heatmap(C,colorscheme,text_title,text_labels,limits_data);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 12])
print('heatmap_example4','-dpng','-r300')

%% Example 5: Heatmap of a rectangular matrix and automated saving of figure with approproate cell sizes

% Generating rectangular matrix data
X = randn(10,3);
colorscheme = 'YlOrRd';
text_title = 'Rectangular Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
savefig = 1;
savefig_name = 'heatmap_example5a';

% Heatmap figure
figure;
figure_heatmap(X,colorscheme,text_title,text_labels,limits_data,...
    savefig,savefig_name);

%
Y = randn(11,20);
colorscheme = 'BuPu';
text_title = 'Rectangular Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
savefig = 1;
savefig_name = 'heatmap_example5b';

% Heatmap figure
figure;
figure_heatmap(Y,colorscheme,text_title,text_labels,limits_data,...
    savefig,savefig_name);

%% Example 6: Heatmap of a big data matrix 

% Generating rectangular matrix data
X = randn(15,40);
colorscheme = 'BuPu';
text_title = 'Big Rectangular Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
savefig = 1;
savefig_name = 'heatmap_example6';

% Heatmap figure
figure;
figure_heatmap(X,colorscheme,text_title,text_labels,limits_data,...
    savefig,savefig_name);

