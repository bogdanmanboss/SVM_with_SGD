clc; clear; close all;
n = 1000;
m = 784;

location1 = 'C:\Users\Bogdan\Desktop\SVM_with_SGD\train_5000';
ds1 = imageDatastore(location1);
y = zeros(m,n);
for i =1:n/2
    img = read(ds1);
    img = rgb2gray(img);
    c = reshape(img,[],1);
    y(:,i) = c;
end

for j = i :n
    r = randi([0 255], 28,28);
    
    c = reshape(r,[],1);
    y(:,j) = c;
    
end

label(1:n/2) = 1;
label(n/2+1:n) = -1;

cvx_begin
variables w(m)
%dual variables pi
minimize ( .5*w'*w )
subject to
label.*( w'*y ) >= 1;
cvx_end

nn = 21000;
m = 784;
location1 = 'C:\Users\Bogdan\Desktop\Tema TO\test';
ds1 = imageDatastore(location1);
y = zeros(m,nn);

for i =1:nn
    img = read(ds1);
    img = rgb2gray(img);
    c = reshape(img,[],1);
    y(:,i) = c;
    i
end

for j = i : 2*nn
    r = randi([0 255], 28,28);
    
    c = reshape(r,[],1);
    y(:,j) = c;
    j
end
h=0;
for i = 1:2*nn
   if(w'*y(:,i)>=0 && i<=nn )
       h=h+1;
   end
   if (w'*y(:,i)<0 &&i>nn)
      h = h+1; 
   end
end