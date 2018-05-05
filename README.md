# Making Elegant Matlab Figures (in progress)
A repository comprising multiple functions for making elegant publication-quality figures in MATLAB

## Table of Contents
*  [Boxplot (`figure_boxplot.m`)](#boxplot)
    * [Example 1: A figure with only data input and no other specification](example-1)
*  [GeneratePDF (`generatePDF.m`)](#generatepdf)
*  [Heatmap (`figure_heatmap.m`)](#heatmap)
*  [Violinplot](#violinplot)

## Boxplot
Generating boxplot in MATLAB using the default function `boxplot.m` is a bit cumbersome due to the large number of required (and somewhat strict in terms of format) inputs. Here, I have written a wrapper code for making nice boxplots quickly and efficiently.


Function: `figure_boxplot.m`

### Example 1: A figure with only data input and no other specification
```
% Number of intended boxes in the figure
num_boxes = 8;          

% Generating random data
data = cell(1,num_boxes);   
for k = 1:num_boxes
    data{k} = randi(10) + randn(1,1000);
end

% Using the "figure_boxplot.m" function to plot the boxplot figure using the data

figure_boxplot(data)
```
![alt text][boxplot1]

[boxplot1]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Boxplot/boxplot1.png "Boxplot example 1"

### Example 2: A figure with data input and minimum input specifications
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

[boxplot2]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Boxplot/boxplot2.png "Boxplot example 2"

### Example 3: A figure with only data input-in a matrix form of size *num_samples x num_boxes*-and no other specification
```
% Number of intended boxes in the figure
num_boxes = 7;  
% Number of samples in each box plot
num_samples = 1000;

% Generating random data
data = zeros(num_samples,num_boxes);   
for k = 1:num_boxes
    data(:,k) = randi(10) + randn(num_samples,1);
end

% Using the "figure_boxplot.m" function to plot the boxplot figure using the data

figure_boxplot(data)
```
![alt text][boxplot3]

[boxplot3]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Boxplot/boxplot3.png "Boxplot example 3"

---

## GeneratePDF

This is a code to generate nice (properly normalized) probability density function (PDF) plots with minimum amount of input arguments. 

Function: `generatePDF.m`

### Example 1: Generating PDF with only data input
```
% Generating random data
x = randn(1,500); 

figure;
generatePDF(x)
```
![alt text][generatePDF1]

[generatePDF1]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF1.png "GeneratePDF example 1"

### Example 2: Generating PDF in a specified color
```
% Loading colors
run colors_definitions.m

% Generating random data
x = randn(1,500); 

figure;
subplot(2,1,1)
generatePDF(x,'b') %You can use any color
title('Using one of the default colors')
subplot(2,1,2)
generatePDF(x,color_scheme_set1(1,:)) %You can use any color
title('Specifying a color manually')
```
![alt text][generatePDF2]

[generatePDF2]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF2.png "GeneratePDF example 2"

### Example 3: Generating PDFs in different styles 
```
% Loading colors
run colors_definitions.m

% Generating random data
x = randn(1,5000); 

figure;
subplot(3,1,1)
generatePDF(x,color_scheme_set1(1,:),'hist') 
title('Histogram plot')
subplot(3,1,2)
generatePDF(x,color_scheme_set1(1,:),'curve') 
title('Curve plot')
subplot(3,1,3)
generatePDF(x,color_scheme_set1(1,:),'area') 
title('Area plot')
```
![alt text][generatePDF3]

[generatePDF3]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF3.png "GeneratePDF example 3"

### Example 4: Generating PDFs with specific number of bins
```
% Loading colors
run colors_definitions.m

% Generating random data
x = randn(1,5000); 

% Specifying the number of bins
no_of_bins = [20 30 50];

figure;
for k = 1:3
    subplot(3,1,k)
    generatePDF(x,color_scheme_set1(2,:),'hist',no_of_bins(k))
    title(sprintf('Bins = %d',no_of_bins(k)))
end
```
![alt text][generatePDF4]

[generatePDF4]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF4.png "GeneratePDF example 4"

### Example 5: Generating overlapping PDFs
```
% Loading colors
run colors_definitions.m

% Generating random data
x = randn(1,1e4); 
y = 2 + randn(1,1e4); 

figure;
generatePDF(x,color_scheme_set1(1,:),'area')
hold on
generatePDF(y,color_scheme_set1(2,:),'area')
legend('Data 1','Data 2'); legend boxoff
```
![alt text][generatePDF5]

[generatePDF5]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF5.png "GeneratePDF example 5"

### Example 6: Generating PDFs and saving figures
```
% Loading colors
run colors_definitions.m

% Generating random data
x = randn(1,1e4); 

% Specifying the number of bins
no_of_bins = 50;

% Data for saving figure in png format (4 inputs required)
savefig = 1; % 1 --> you want to save figure 
fig_name = 'generatePDF6';
fig_width_cm = 16; 
fig_height_cm = 10;

figure;
generatePDF(x,color_scheme_set1(3,:),'area',no_of_bins,...
    savefig,fig_name,fig_width_cm,fig_height_cm) 
```
![alt text][generatePDF6]

[generatePDF6]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF6.png "GeneratePDF example 6"

### Example 7: Generating overlapping PDFs with different color schemes
```
% Loading colors
run colors_definitions.m

% Generating random data
num_samples = 2e4;

x(1,:) = randn(1,num_samples); 
x(2,:) = 2 + 1.25 * randn(1,num_samples); 
x(3,:) = 4 + randn(1,num_samples); 
x(4,:) = 6 + 0.9 * randn(1,num_samples); 
x(5,:) = 8 + 1.5 * randn(1,num_samples); 
x(6,:) = 10 + 0.9 * randn(1,num_samples); 
x(7,:) = 13 + 1.1 * randn(1,num_samples); 
x(8,:) = 16 + 0.9 * randn(1,num_samples); 

% Color schemes to test
no_color_schemes = 5;
color_scheme{1} = color_scheme_npg;
color_scheme{2} = color_scheme_aaas;
color_scheme{3} = color_scheme_nejm;
color_scheme{4} = color_scheme_lancet;
color_scheme{5} = color_scheme_set1;

titles_schemes = {'NPG color scheme','AAAS color scheme',...
    'NEJM color scheme','LANCET color scheme','Set1 (Brewermap) color scheme'};

figure;
for m = 1:no_color_schemes
    subplot(no_color_schemes,1,m)
    for k = 1:8
        generatePDF(x(k,:),color_scheme{m}(k,:),'area')
        hold on
    end
    title(titles_schemes{m})
    legend('Data 1','Data 2','Data 3',...
        'Data 4','Data 5','Data 6',...
        'Data 7','Data 8','Location','NorthWest'); legend boxoff
end
```
![alt text][generatePDF7]

[generatePDF7]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF7.png "GeneratePDF example 7"

---
## Heatmap
Generating heatmap in MATLAB using the default function `heatmap.m` (introduced in version 2017a) is quite useful for visualizing the magnitude of elements in matrices. However, the size of the generated heatmaps requires a lot of tweaking to produce a reasonable figure. Here, I have written a wrapper code for making nice appropriate-sized heatmaps quickly and efficiently with minimum input.


Function: `figure_heatmap.m`

### Example 1: Heatmap using only the input data
```
% Generating data
x = randn(10,5);
C = corrcoef(x);

% Heatmap figure
figure;
figure_heatmap(C);
```
![alt text][heatmap1]

[heatmap1]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example1.png "Heatmap example 1"

### Example 2: Heatmap using the input data and a specific color scheme
```
%Using data of example 1

colorscheme = 'BuGn'; 
%Requires brewermap package
%Download from https://github.com/DrosteEffect/BrewerMap/blob/master/brewermap.m

% Heatmap figure
figure;
figure_heatmap(C,colorscheme);
```
![alt text][heatmap2]

[heatmap2]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example2.png "Heatmap example 2"

### Example 3: Heatmap with title and labels
```
%Using data of example 1

colorscheme = 'BuGn'; 
%Requires brewermap package
%Download from https://github.com/DrosteEffect/BrewerMap/blob/master/brewermap.m
text_title = 'Correlation Matrix';
text_labels = {'Variable','Variable'};

% Heatmap figure
figure;
figure_heatmap(C,colorscheme,text_title,text_labels);
```
![alt text][heatmap3]

[heatmap3]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example3.png "Heatmap example 3"

### Example 4: Heatmap with limits of colorscheme specified
```
%Using data of example 1

colorscheme = 'BuGn'; 
%Requires brewermap package
%Download from https://github.com/DrosteEffect/BrewerMap/blob/master/brewermap.m
text_title = 'Correlation Matrix';
text_labels = {'Variable','Variable'};
limits_data = [-1 1]; %for correlation matrix

% Heatmap figure
figure;
figure_heatmap(C,colorscheme,text_title,text_labels,limits_data);
```
![alt text][heatmap4]

[heatmap4]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example4.png "Heatmap example 4"

### Example 5: Heatmap of a rectangular matrix and automated saving of figure with approproate cell sizes
```
% Generating rectangular matrix data
X = randn(10,6);
colorscheme = 'YlOrRd';
%Requires brewermap package
%Download from https://github.com/DrosteEffect/BrewerMap/blob/master/brewermap.m
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
%Requires brewermap package
%Download from https://github.com/DrosteEffect/BrewerMap/blob/master/brewermap.m
text_title = 'Rectangular Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
savefig = 1;
savefig_name = 'heatmap_example5b';

% Heatmap figure
figure;
figure_heatmap(Y,colorscheme,text_title,text_labels,limits_data,...
    savefig,savefig_name);

```
![alt text][heatmap5a]

[heatmap5a]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example5a.png "Heatmap example 5a"

![alt text][heatmap5b]

[heatmap5b]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example5b.png "Heatmap example 5b"

### Example 6: Heatmap of a big data matrix 
```
% Generating rectangular matrix data
X = randn(15,40);
colorscheme = 'BuPu';
%Requires brewermap package
%Download from https://github.com/DrosteEffect/BrewerMap/blob/master/brewermap.m
text_title = 'Big Rectangular Matrix';
text_labels = {'Variable 1','Variable 2'};
limits_data = [floor(min(X(:))) ceil(max(X(:)))];
savefig = 1;
savefig_name = 'heatmap_example6';

% Heatmap figure
figure;
figure_heatmap(X,colorscheme,text_title,text_labels,limits_data,...
    savefig,savefig_name);
```
![alt text][heatmap6]

[heatmap6]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/Heatmap/heatmap_example6.png "Heatmap example 6"

---

## Violinplot
In progress ...
