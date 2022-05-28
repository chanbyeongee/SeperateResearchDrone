function nError_code = Run(obj)
%RUN 이 함수의 요약 설명 위치
%   자세한 설명 위치

nCount = 0;
nStep = 0;

while nCount ~= 3 
    
    [obj.aRaw_frame, _] = snapshot(obj.mCam);
    obj.aHSV_frame = rgb2hsv(obj.aRaw_frame);
    

    if nStep == 0
        if CountPixels() == 1
            nStep = 1;
        end
    end

    if nStep == 1
        if obj.DetectCircle() == 1
            nStep = 2;
        end
    end

    if nStep == 2
        if obj.DetectRatio() == 0
            nStep = 3;
        end
    end

    if nStep == 3
        if 
       





    count +=1
   


end

