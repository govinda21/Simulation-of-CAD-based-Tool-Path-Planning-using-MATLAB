clear all;
clc;
global VertexTable;
VertexTable = [ 
     1  7.12   700;
     2  11.00    10.00;
     3  18.00    14.00;
     4  32.5  15.25;
     ];
global rad;
rad=2;
global side_count count;
side_count = 0;
count =0;
pt = step_fun(@step_size,50, 1);
pt_side = step_fun(@side_step_size,0.001, 2);

% animation of tool path
figure(3); hold on
h = animatedline;
for i = 1:length(pt_side)
x = pt(:,1);
y = pt(:,2)+pt_side(i,2)-pt_side(1,2);
z = pt_side(i,1);
if mod(i,2)==0
    for k = 1:length(x)
    addpoints(h,x(k),y(k),z);
    drawnow
    pause(0.1);
    end
else
    for k = length(x):-1:1
    addpoints(h,x(k),y(k),z);
    drawnow
    pause(0.1);
    end
    
end

end

