function [ delta_t ] = step_size( t1,tol )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global count
count = count+1;
delta_t=0.1;
bzpt0=bezier(t1);
bzpt1=bezier(t1+delta_t/4);
bzpt2=bezier(t1+2*delta_t/4);
bzpt3=bezier(t1+3*delta_t/4);
bzpt4=bezier(t1+delta_t/4);

spt1 = (1-t1-delta_t/4)*bzpt0 + (t1+delta_t/4)*bzpt4;
spt2 = (1-t1-2*delta_t/4)*bzpt0 + (t1+2*delta_t/4)*bzpt4;
spt3 = (1-t1-3*delta_t/4)*bzpt0 + (t1+3*delta_t/4)*bzpt4;

dt1= sqrt((spt1(1) - bzpt1(1))^2 + (spt1(2) - bzpt1(2))^2);
dt2= sqrt((spt2(1) - bzpt2(1))^2 + (spt2(2) - bzpt2(2))^2);
dt3= sqrt((spt3(1) - bzpt3(1))^2 + (spt3(2) - bzpt3(2))^2);
dist = max(dt1, dt2);
dist = max(dist,dt3);
while dist > tol
    delta_t=delta_t/2;
    bzpt0=bezier(t1);
    bzpt1=bezier(t1+delta_t/4);
    bzpt2=bezier(t1+2*delta_t/4);
    bzpt3=bezier(t1+3*delta_t/4);
    bzpt4=bezier(t1+delta_t/4);

    spt1 = (1-t1-delta_t/4)*bzpt0 + (t1+delta_t/4)*bzpt4;
    spt2 = (1-t1-2*delta_t/4)*bzpt0 + (t1+2*delta_t/4)*bzpt4;
    spt3 = (1-t1-3*delta_t/4)*bzpt0 + (t1+3*delta_t/4)*bzpt4;

    dt1= sqrt((spt1(1) - bzpt1(1))^2 + (spt1(2) - bzpt1(2))^2);
    dt2= sqrt((spt2(1) - bzpt2(1))^2 + (spt2(2) - bzpt2(2))^2);
    dt3= sqrt((spt3(1) - bzpt3(1))^2 + (spt3(2) - bzpt3(2))^2);
    dist = max(dt1, dt2);
    dist = max(dist,dt3);
end
end

