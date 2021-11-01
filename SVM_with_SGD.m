clc; clear; close all;
n = 5000;
m = 784;

location = 'C:\Users\Bogdan\Desktop\SVM_with_SGD\train_5000';
ds = imageDatastore(location);
y = zeros(m,n);
for i =1:n/2
    img = read(ds);
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

w_initial = randn(1,784);

for i = 1:100
   for j = 1 : n
      randomset = randi([1 n],1,1);
      y_i = y(:,randomset);
      label_i = label(randomset);
      
      if(1-label_i*(w_initial*y_i)<=0)
          grad = w_initial;
      else
          grad = w_initial - 100*((label_i*y_i))';
      end
      w_initial = w_initial - 0.0001*grad;
   end
end