n = 20;
m = 784;
location = 'C:\Users\Bogdan\Desktop\SVM_with_SGD\New_train_test';
ds = imageDatastore(location);
y = zeros(m,n);

for i =1:n
    img = read(ds);
    img = rgb2gray(img);
    c = reshape(img,[],1);
    y(:,i) = c;
    i
end

h=0;
for i = 1:n
   if (w'*y(:,i)<0)
      h = h+1; 
   end
end