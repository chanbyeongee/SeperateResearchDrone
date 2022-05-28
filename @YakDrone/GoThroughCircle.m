function is_Destination = GoThroughCircle(obj)

cMin_red_th = 0.916;
cMax_red_th = 0.05;

aFiltered_red= (obj.aHSV_frame(:,:,1) > cMin_red_th) | (obj.aHSV_frame(:,:,1) < cMax_red_th); % 빨간색 좌표찾기

[nSize_y, nSize_x] = size(aFiltered_red);

nHalf_point_x = fix(nSize_x / 2);
nHalf_point_y = fix(nSize_y / 2);

nSum_of_red_x = 0;
nSum_of_red_y = 0;

nNum_of_red_points = 0;

for i = 1: nSize_y
    for j = 1:nSize_x
        if aFiltered_red(i,j)==1  
            
            nSum_of_red_x = nSum_of_red_x + j - nHalf_point_x;
            nSum_of_red_y = nSum_of_red_y + i - nHalf_point_y; 
            nNum_of_red_points = nNum_of_red_points + 1;

        end
    end
end


nCenter_x = nSum_of_red_x / nNum_of_red_points; 
nCenter_y = nSum_of_red_y / nNum_of_red_points;


aPart_of_center=hsv_h(nCenter_y-3:nCenter_y+3 ,nCenter_x-3:nCenter_x+3); %hsv_h  행렬의 중앙범위 찾기

nNum_of_reds= nnz(aPart_of_center >0.916 | aPart_of_center < 0.05);

is_Distance_flag = 0;


%거리 측정은 어떻게 할것인지.

if nNum_of_reds > 1
    moveforward(obj.mDrone,"Distance",0.1);
    obj.MovetoLoaction(nCenter_x,nCenter_y);

else
    moveforward(obj.mDrone,"Distance",0.1);
end  

end

