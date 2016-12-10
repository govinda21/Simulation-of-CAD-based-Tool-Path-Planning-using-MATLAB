function [ delta_u ] = side_step_size( u1,tol )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
delta_u = 1;
global side_count
side_count = side_count+1;
global rad;
%radius of curvature 
[r_curv, curv] = radius_curvature(u1+delta_u);
% if curv>0 %concave
%     h= r_curv-(r_curv-rad)*sqrt(1-(delta_u/2/r_curv)^2)...
%         - sqrt(rad^2-(delta_u*(r_curv-rad)/2/r_curv)^2);
% else %convex
%     h= (r_curv-rad)*sqrt(1-(delta_u/2/r_curv)^2)...
%         + sqrt(rad^2-(delta_u*(r_curv-rad)/2/r_curv)^2) - r_curv;
% end

%scallop height for both concave and convex
h= abs(r_curv-(r_curv-rad)*sqrt(1-(delta_u/2/r_curv)^2)...
        - sqrt(rad^2-(delta_u*(r_curv-rad)/2/r_curv)^2));

while h>tol %scallop height
    delta_u = delta_u/2;
    [r_curv, curv] = radius_curvature(u1+delta_u);
    h= abs(r_curv-(r_curv-rad)*sqrt(1-(delta_u/2/r_curv)^2)...
        - sqrt(rad^2-(delta_u*(r_curv-rad)/2/r_curv)^2));
    
end
end