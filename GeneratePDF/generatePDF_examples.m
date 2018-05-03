clear all; close all; clc

%% Setting font and size
set(0,'DefaultAxesFontName','Arial')
set(0,'DefaultTextFontName','Arial')
set(0,'DefaultAxesFontSize',8)
set(0,'DefaultTextFontSize',8)

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
for k = 1:3
    subplot(3,1,k)
    generatePDF(x,color_scheme_set1(2,:),'hist',no_of_bins(k))
    title(sprintf('Bins = %d',no_of_bins(k)))
end

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

%% Example 7: Generating PDFs with different color schemes

% Loading colors
run colors_definitions.m

% Selecting a color scheme
color_scheme = color_scheme_aaas;

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

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 24 30])
print('generatePDF7','-dpng','-r300')
