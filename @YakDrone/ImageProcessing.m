function is_Complete = ImageProcessing(obj)
    try
        [aRaw_frame, void] = snapshot(obj.mCam);
        aHSV_frame = rgb2hsv(aRaw_frame);

        obj.aConverted_HSV = aHSV_frame(:,:,1);
        sfilter = aHSV_frame(:,:,2) > 0.35;
        vfilter = aHSV_frame(:,:,3) > 0.13;
        obj.aFiltered_blue = ( obj.aConverted_HSV > obj.cMin_blue_th) & ( obj.aConverted_HSV < obj.cMax_blue_th);
        obj.aFiltered_blue = obj.aFiltered_blue .* sfilter;
        obj.aFiltered_blue = obj.aFiltered_blue .* vfilter;
        obj.aFiltered_blue = imgaussfilt(obj.aFiltered_blue,2);
        
        
        [obj.nSize_y, obj.nSize_x] = size(obj.aFiltered_blue);
        


        %Mopology
        se = strel('disk',7);
        obj.aFiltered_blue = imdilate(obj.aFiltered_blue,se);
        obj.aFiltered_blue = round(obj.aFiltered_blue);

     

        
        obj.nDetected_pixels = nnz(obj.aFiltered_blue);
        is_Complete=true;
    catch e
        disp(e);
        is_Complete=false;
    end
end

