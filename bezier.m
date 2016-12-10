function [ pt ] = bezier( t )
%table of vertices
%each row has vertex number, xcoord, ycoord, zcoord
%VertexTable is arranged randomly
% global VertexTable;
% VertexTable = [ 
%      1  7.12   700;
%      2  11.00    10.00;
%      3  18.00    14.00;
%      4  32.5  15.25;
%      ];
 global VertexTable
 pt = (1-t)^3 * VertexTable(1,2:end) + (3*(1-t)^2 *t) * VertexTable(2,2:end) ...
     + (3*(1-t)* t^2) * VertexTable(3,2:end) + t^3 * VertexTable(4,2:end);

end

