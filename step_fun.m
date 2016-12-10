function [pts] = step_fun(fn, tol, fig)
% tol = 50;
figure(1);
i=1;
figure(fig);
for t = 0:0.01:1
    pt0 = bezier(t);
%     pt = [p(1) p(2)];
%     plot(pt(1),pt(2),'--go');hold on;
    pt(i,:) = pt0;
    i = i+1;
end

t=0;
i=1;
while t<=1
    pt1 = bezier(t);
    pts(i,:) = pt1;
    i = i + 1;
    delta_t = fn(t, tol);
    t = t + delta_t;
end
if fig==1
    plot3(pts(1:i-1,1),pts(1:i-1,2),ones(size(pts,1),1),'--r*');hold on;
    plot3(pt(:,1),pt(:,2),ones(size(pt,1),1),'-g');hold off;
else
    plot3(ones(size(pts,1),1),pts(1:i-1,2),pts(1:i-1,1),'--r*');hold on;
    plot3(ones(size(pt,1),1),pt(:,2),pt(:,1),'-g');hold off;
end
end