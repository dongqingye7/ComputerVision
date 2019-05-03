function result = pinhole_location(correspondences)

camera_matrix = perspective_calibration(correspondences);
A=camera_matrix(:,1:3);
b=camera_matrix(:,4);
x=A\b;
result=x*(-1);
end