function filename = make_training_file_name(label,training_num)

% function filename = make_training_file_name(label,training_num)
%
% Creates a filename given the label and the training number
    filename = sprintf('digits_training/label%d_training%d.png', label,training_num);
    
end