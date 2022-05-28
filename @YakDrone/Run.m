function nError_code = Run(obj)
%RUN 이 함수의 요약 설명 위치
%   자세한 설명 위치
    
    obj.mDorne.takeoff();
    while 1 

        [obj.aRaw_frame, void] = snapshot(obj.mCam);
        obj.aHSV_frame = rgb2hsv(obj.aRaw_frame);
        
        %픽셀 수 찾기
        if nStep == 0
            if CountPixels() == 1
                nStep = 1;
            end
        end
        
        if nStep == 1
            if obj.DetectCircle() == 1
                nStep = 3;
            end
        end
        
%         
%         if nStep == 2
%             if obj.DetectRatio() == 0
%                 nStep = 3;
%             end
%         end

        if nStep == 3
            if obj.GoThroughCircle() == 1
                obj.Finish();
                break;
            end
        end

    end
           
       

end

