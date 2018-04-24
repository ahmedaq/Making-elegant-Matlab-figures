# Making Elegant Matlab Figures (in progress)
A repository comprising multiple functions for making elegant publication-quality figures in MATLAB

## Table of Contents
*  [Box plot](#boxplot)
*  [Violin plot](#violinplot)

## Box plot (`figure_boxplot.m`)

#### Example 1: A figure with only data input and no other specification
```
% Number of intended boxes in the figure
num_boxes = 8;          

% Generating random data
data = cell(1,num_boxes);   
for k = 1:num_boxes
    data{k} = randi(10) + randn(1,1000);
end

% Using the "figure_boxplot" function to plot the boxplot figure using the data

figure_boxplot(data)
```
![alt text][boxplot1]

[boxplot1]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/boxplot1.png "Boxplot example 1"

#### Example 2: A figure with data input and minimum input specifications
```
% Number of intended boxes in the figure
num_boxes = 6;          

% Generating random data
data = cell(1,num_boxes);   
for k = 1:num_boxes
    data{k} = randi(10) + randn(1,1000);
end

% Using the "figure_boxplot.m" function to plot the boxplot figure using the data, 
% x- and y-axis labels, and label of each box.
% For more information related to function inputs, check the function "figure_boxplot.m"

label_axes = {'Variable','Number'}; 
label_boxes = {'alpha','beta','gamma','delta','epsilon','zeta'};
figure_boxplot(data,label_axes,label_boxes);
```
![alt text][boxplot2]

[boxplot2]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/boxplot2.png "Boxplot example 2"

## 2. Violin plot (`figure_violinplot.m`) (In progress)
