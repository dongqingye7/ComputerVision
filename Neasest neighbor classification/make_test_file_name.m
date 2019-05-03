function filename = make_test_file_name(label,test_num)

% function filename = make_test_file_name(label,training_num)
%
% Creates a filename given the label and the training number
    filename = sprintf('digits_test/label%d_test%d.png', label,test_num);
    
end