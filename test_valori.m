
n = 1000;
m = 784;
location1 = 'C:\Users\Bogdan\Desktop\SVM_with_SGD\test';
ds1 = imageDatastore(location1);
yy = zeros(m,n);

for i =1:n
    img = read(ds1);
    img = rgb2gray(img);
    c = reshape(img,[],1);
    yy(:,i) = c;
    i
end

for j = i : 2*n
    r = randi([0 255], 28,28);
    
    c = reshape(r,[],1);
    yy(:,j) = c;
    j
end

label(1:n) = 1;

h=0;
for i = 1:2*n
   if(w_initial*yy(:,i)>=0 && i<=n )
       h=h+1;
   end
   if (w_initial*yy(:,i)<0 &&i>n)
      h = h+1; 
   end
end