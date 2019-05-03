function distance = euclidean_distance(image1, image2)

v1=image1(:);
v2=image2(:);
distance=sqrt(sum((v1-v2).^2));

end