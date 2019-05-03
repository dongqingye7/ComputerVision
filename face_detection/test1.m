ground_truth_file='ground_truth.txt';
template=read_gray('average_face_cropped.png');
scales=make_scales_array(1, 5, 1.1);
detection_thr=0.4;
iou_thr=0.6;
[tp, fp, fn] = detection_accuracy(ground_truth_file, template, scales, ...
                                           detection_thr, iou_thr);


