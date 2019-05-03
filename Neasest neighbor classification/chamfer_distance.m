function distance = chamfer_distance(image1, image2)

v1=image1;
v2=image2;
v1_binary = (v1 ~= 0);
n1 = sum(v1_binary(:));
dt2 = bwdist(v2);
chamfer_v1_to_v2= (sum(sum(v1_binary .* dt2)))./ n1;

v1_binary = (v2 ~= 0);
n1 = sum(v1_binary(:));
dt2 = bwdist(v1);
chamfer_v2_to_v1= (sum(sum(v1_binary .* dt2)))./ n1;

distance=chamfer_v1_to_v2+chamfer_v2_to_v1;
end