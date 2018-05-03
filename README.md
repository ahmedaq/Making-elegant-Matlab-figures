# Making Elegant Matlab Figures (in progress)
A repository comprising multiple functions for making elegant publication-quality figures in MATLAB

## Table of Contents
*  [Boxplot (`figure_boxplot.m`)](#boxplot)
*  [GeneratePDF (`generatePDF.m`)](#generatepdf)
*  [Violinplot](#violinplot)

## Boxplot
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

figure;
subplot(5,1,1)
for k = 1:8
    generatePDF(x(k,:),color_scheme_npg(k,:),'area')
    hold on
end
title('NPG color scheme')
legend('Data 1','Data 2','Data 3',...
    'Data 4','Data 5','Data 6',...
    'Data 7','Data 8','Location','NorthWest'); legend boxoff
subplot(5,1,2)
for k = 1:8
    generatePDF(x(k,:),color_scheme_aaas(k,:),'area')
    hold on
end
title('AAAS color scheme')
legend('Data 1','Data 2','Data 3',...
    'Data 4','Data 5','Data 6',...
    'Data 7','Data 8','Location','NorthWest'); legend boxoff
subplot(5,1,3)
for k = 1:8
    generatePDF(x(k,:),color_scheme_nejm(k,:),'area')
    hold on
end
title('NEJM color scheme')
legend('Data 1','Data 2','Data 3',...
    'Data 4','Data 5','Data 6',...
    'Data 7','Data 8','Location','NorthWest'); legend boxoff
subplot(5,1,4)
for k = 1:8
    generatePDF(x(k,:),color_scheme_lancet(k,:),'area')
    hold on
end
title('Lancet color scheme')
legend('Data 1','Data 2','Data 3',...
    'Data 4','Data 5','Data 6',...
    'Data 7','Data 8','Location','NorthWest'); legend boxoff
subplot(5,1,5)
for k = 1:8
    generatePDF(x(k,:),color_scheme_set1(k,:),'area')
    hold on
end
title('Set1 color scheme (Brewermap)')
legend('Data 1','Data 2','Data 3',...
    'Data 4','Data 5','Data 6',...
    'Data 7','Data 8','Location','NorthWest'); legend boxoff
```
![alt text][generatePDF7]

[generatePDF7]: https://github.com/ahmedaq/Making-elegant-Matlab-figures/blob/master/GeneratePDF/generatePDF7.png "GeneratePDF example 7"

---

## Violinplot
In progress ...
