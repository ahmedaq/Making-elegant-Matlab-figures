function generatePDF(data,color_plot,PlotType,bins,...
    savefig,savefig_name,fig_width_cm,fig_height_cm)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generating probability density function (PDF) of input data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by: Ahmed Abdul Quadeer
% E-mail: ahmedaq@gmail.com
% Last change: May 1, 2018
% Copyright (c) Ahmed Abdul Quadeer, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inputs:
% - data: input data
%
% - color_plot: RGB code specifying the intended color of the plot
%   3-dimensional row vector
%
% - PlotType: Type of the PDF plot required
%       * 'hist'    -->     histogram plot
%       * 'curve'   -->     curve plot
%       * 'area'    -->     area plot
%
% - bins: number of bins for plotting the PDF
%   Scalar value
%
% - savefig: Option to save figure automatically (in png format)
%   * 1 - Yes, save the figure
%   * 0 - No
%
% - savefig_name: Name for the figure file
%   Text data
%
% - fig_width_cm: Width of the output figure (in cm)
%   Scalar value
%
% - fig_height_cm: Height of the output figure (in cm)
%   Scalar value
%
%
% Output: Plot of PDF

%% Processing the input data

if nargin == 1
    bins = 50;
    PlotType = 'hist';
    color_plot=[55,126,184]/255; %blue
    savefig = 0; 
elseif nargin == 0
    error('Not enough input arguments!')
elseif nargin == 2
    bins = 50;
    PlotType = 'hist';
    savefig = 0; 
elseif nargin == 3
    bins = 50;
    savefig = 0; 
elseif nargin == 4
    savefig = 0;
elseif nargin > 8
    error('Too many inputs!')
end

%% Plot of PDF

[x,y] = hist(data,bins);
binWidth = y(2)-y(1);

% figure
if strcmp(PlotType,'hist') || strcmp(PlotType,'Hist') || strcmp(PlotType,'HIST')
    bar(y,x/sum(x*binWidth),'FaceColor',color_plot,'EdgeColor',color_plot)
    alpha 0.7
elseif strcmp(PlotType,'area') || strcmp(PlotType,'Area') || strcmp(PlotType,'AREA')
    area(y,x/sum(x*binWidth),'FaceColor',color_plot,'EdgeColor',color_plot,'LineWidth',1);
    alpha 0.7
elseif strcmp(PlotType,'curve') || strcmp(PlotType,'Area') || strcmp(PlotType,'AREA')
    plot(y,x/sum(x*binWidth),'Color',color_plot,'LineWidth',1)
end

ylabel('Density')

%% Further post-processing

set(gca, ...
    'Box'         , 'off'     , ...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.01 .01] , ...
    'XMinorTick'  , 'on'     , ...
    'YMinorTick'  , 'on'      , ...
    'XColor'      , [.1 .1 .1], ...
    'YColor'      , [.1 .1 .1], ...
    'LineWidth'   , .5        );

%% Saving figure

if savefig == 1
    set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 fig_width_cm fig_height_cm])
    print(savefig_name,'-dpng','-r300')
end