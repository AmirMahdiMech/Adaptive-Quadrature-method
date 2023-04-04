%Adaptive Quadrature Code, 2023
%By Amirmahdi Jafari 
global APP RL counter points
RL = true;
APP = 0;
counter = 0;
points = [];
f = @(x) x+2
fprintf('Enter your function(with "x" as variable): \n');
f = input(' ','s'); f = ['@(x)' f]; f = str2func(f)
fprintf('Enter endpoints a , b , Tolerance and \nN(maximum number of bisections allowed)on separate lines:  \n');                
a = input(' ');
b = input(' ');
Tolerance = input(' ');
N = input(' ');
AdaptiveQC(f,a,b,Tolerance,N);
if RL == true       %Making sure the bisection limit was not reached
fprintf('The approximate value of the integral within the tolerance of %d, is %d \n',Tolerance,APP);
fprintf('Number of sections is %d \n',length(points));
points = [points b];
S = plot(points,zeros(size(points)),'or'); hold on; %plotting the points with blue circles
fplot(f,[a b]);
else
fprintf('Bisection limit is reached! \nTry with higher N \n');    
end


