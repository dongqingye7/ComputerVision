function class_label = nnc_chamfer(test_image)

dis_matrix=zeros(10,15);
for label=1:10
    for training_num=1:15
        label_num=label;
        if label==10
            label_num=0;
        end
        training_file=make_training_file_name(label_num,training_num);
        training=double(imread(training_file));
        distance = chamfer_distance(test_image, training);
        dis_matrix(label,training_num)=distance;
    end
end
min_distance=min(min(dis_matrix));
[row col]=find(dis_matrix==min_distance);
class_label=row;
if class_label==10
    class_label=0;
end

end