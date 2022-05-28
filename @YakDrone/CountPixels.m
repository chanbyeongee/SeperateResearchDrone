function is_detected = CountPixels(obj)

    nPixels = nnz(obj.aHSV_frame(:,:,1)>obj.cMin_blue_th & obj.aHSV_frame(:,:,1) < obj.cMax_blue_th);
    
    is_detected = obj.cBlue_numbers_th > nPixels;
    
    %어떻게 움직일지 생각해봐야함.
    
    if is_detected == 0
        obj.MovetoLocation(nCenter_x,nCenter_y);
    end

end

