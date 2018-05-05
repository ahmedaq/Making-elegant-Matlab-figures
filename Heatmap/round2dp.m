function z = round2dp(x,y)
%ROUND2DP rounds number to given decimal places.
%   Z = ROUND2DP(X,Y) rounds X to Y decimal places.
%
%Example 1: round PI to 2 decimal places
%   >> round2dp(pi,2)
%   ans =
%         3.14
%
%Example 2: round PI to 4 decimal places
%   >> round2dp(pi,4)
%   ans =
%         3.1416
%
% See also ROUND.

z = round(x/(10^-y))*(10^-y);
