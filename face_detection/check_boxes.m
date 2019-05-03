function [current_tp, current_fp, current_fn] = check_boxes(boxes, current_gt, iou_thr)
number=size(boxes,1);
gt_boxes=current_gt;
num_gt_boxes=size(gt_boxes,1);

iou=zeros(number,num_gt_boxes);
for m=1:num_gt_boxes
    gt_box=gt_boxes(m,:);
    gt_box_area=(gt_box(2)-gt_box(1)+1)*(gt_box(4)-gt_box(3)+1);

for n=1:number
   detection_box=boxes(n,:);
   detection_box_area=(detection_box(2)-detection_box(1)+1)*(detection_box(4)-detection_box(3)+1);
   
   inter_top=max(detection_box(1),gt_box(1));
   inter_bottom=min(detection_box(2),gt_box(2)); 
   inter_left=max(detection_box(3),gt_box(3)); 
   inter_right=min(detection_box(4),gt_box(4)); 
   inter_area=max(0, inter_bottom-inter_top+1)*max(0,inter_right-inter_left+1);
   
   union_area=gt_box_area+detection_box_area-inter_area;
   iou(n,m)=inter_area/union_area;
end

end
current_tp=sum(sum(iou>=iou_thr,2)>0);
current_fp=number-current_tp;
current_fn=sum(sum(iou>=iou_thr,1)==0);
end