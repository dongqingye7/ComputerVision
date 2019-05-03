function [accuracy, confusion_matrix] = nnc_chamfer_stats()
    
confusion_matrix=zeros(10,10);
correct=0;
for label=1:10
    
    for test=1:10
        label_num=label;
        if label==10
            label_num=0;
        end
        test_file=make_test_file_name(label_num,test);
        test_image=double(imread(test_file));
        class_label = nnc_chamfer(test_image);
        if class_label==0
            class_label=10;
        end
        if class_label==label
            correct=correct+1;
        end
        confusion_matrix(label,class_label)=confusion_matrix(label,class_label)+1;
    end

end
confusion_matrix=confusion_matrix./10;
accuracy=correct/100;









end