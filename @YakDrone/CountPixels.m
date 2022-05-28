function is_detected = CountPixels(obj)

    nPixels = nnz(obj.aHSV_frame(:,:,1)>obj.cMin_blue_th & obj.aHSV_frame(:,:,1) < obj.cMax_blue_th);
    
    is_detected = obj.cBlue_numbers_th > nPixels;
    
    %어떻게 움직일지 생각해봐야함.
    
    if is_detected == false
        if obj.nCurrent_height_count == 1
            obj.MovetoLocation(0, 15);
            obj.nCurrent_height_count = obj.nCurrent_height_count + 1;
        elseif (obj.nCurrent_height_count == 2)
            obj.MovetoLocation(0,-30);
            obj.nCurrent_height_count = obj.nCurrent_height_count + 1;
        
        end
    end
      
end

