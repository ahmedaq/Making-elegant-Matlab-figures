clear all; close all; clc

%% Example 1: Generating PDF with only data input

% Generating random data
x = randn(1,500); 

figure;
generatePDF(x)

% Saving figure
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
print('generatePDF1','-dpng','-r300')

%% Example 2: Generating PDF in a specified color

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

% Saving figure
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
print('generatePDF2','-dpng','-r300')

%% Example 3: Generating PDFs in different styles 

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

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
print('generatePDF3','-dpng','-r300')

%% Example 4: Generating PDFs with specific number of bins

% Loading colors
run colors_definitions.m

% Generating random data
x = randn(1,5000); 

% Specifying the number of bins
no_of_bins = [20 30 50];

figure;
subplot(3,1,1)
generatePDF(x,color_scheme_set1(2,:),'hist',no_of_bins(1)) 
title('Bins = 25')
subplot(3,1,2)
generatePDF(x,color_scheme_set1(2,:),'hist',no_of_bins(2)) 
title('Bins = 50')
subplot(3,1,3)
generatePDF(x,color_scheme_set1(2,:),'hist',no_of_bins(3)) 
title('Bins = 100')

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
print('generatePDF4','-dpng','-r300')

%% Example 5: Generating overlapping PDFs

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

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 16 10])
print('generatePDF5','-dpng','-r300')


%% Example 6: Generating PDFs and saving figures

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