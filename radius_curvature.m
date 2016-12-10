function [ r, r_double_dot ] = radius_curvature( t )
% VertexTable = [ 
%      1  7.12   700;
%      2  11.00    10.00;
%      3  18.00    14.00;
%      4  32.5  15.25;
%      ];
global VertexTable;
pt_dot = (-3*(1-t)^2) * VertexTable(1,2:end) + (9*t^2-12*t+3) * VertexTable(2,2:end) ...
     + (6*t-9*t^2) * VertexTable(3,2:end) + 3*t^2 * VertexTable(4,2:end);
pt_double_dot = 6*(1-t)^2 * VertexTable(1,2:end) + (18*t-12) * VertexTable(2,2:end) ...
     + (6-18*t) * VertexTable(3,2:end) + 6*t * VertexTable(4,2:end);
r = (pt_dot(1,1)^2 + pt_dot(1,2)^2)^1.5...
     /abs(pt_dot(1,1)*pt_double_dot(1,2)-pt_dot(1,2)*pt_double_dot(1,1));
r_double_dot = pt_double_dot(2)/pt_double_dot(1);
end

