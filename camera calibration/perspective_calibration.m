function camera_matrix = perspective_calibration(correspondences)
number=size(correspondences,1);
A=zeros(number*2,11);
b=zeros(number*2,1);

for n=1:number
    three_point=correspondences(n,1:3);
    two_point=correspondences(n,4:5);
    x=three_point(1);
    y=three_point(2);
    z=three_point(3);
    u=two_point(1);
    v=two_point(2);
    odd=2*n-1;
    even=2*n;
    A(odd,:)=[x y z 1 0 0 0 0 -x*u -y*u -z*u];
    A(even,:)=[0 0 0 0 x y z 1 -x*v -y*v -z*v];
    b(odd)=u;
    b(even)=v;
end
x=A\b;
camera_matrix=ones(3,4);
camera_matrix(1,:)=x(1:4);
camera_matrix(2,:)=x(5:8);
camera_matrix(3,1:3)=x(9:11);
end