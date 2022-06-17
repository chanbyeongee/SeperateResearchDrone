function nError_code = Run(obj)
%RUN 이 함수의 요약 설명 위치
%   자세한 설명 위치
    
    takeoff(obj.mDrone)
    pause(1);
    nStep=0;
    nCount=1;

    while (nCount < obj.cTotal_Circle)
        nError_code = 0;
        pause(1);
        [aRaw_frame, void] = snapshot(obj.mCam);
        aHSV_frame = rgb2hsv(aRaw_frame);

        obj.aConverted_HSV = aHSV_frame(:,:,1);
        obj.aFiltered_blue = ( obj.aConverted_HSV > obj.cMin_blue_tDdㅇㅇh) & ( obj.aConverted_HSV < obj.cMax_blue_th);
        obj.nDetected_pixel = nnz(obj.aFiltered_blue);

        if nStep == 0
            if obj.CountPixels() == 1
                nStep = 1;
            end
        end
        
%         //동환이가 엣지디텍션으로 짜고있고.....????? g o o d i v a l o w a g o n z //독일어야? 
%         //흰색선으로 그냥 우리 평균내서 X랑 Y좌표를 찾고....
%         //그다음에 세로나 가로 길이 재서 반지름 계산한다음에...
%         //반지름 크기 비례에 따라서 거리 측정하면 되잖슴
%         //Version1 
        if nStep == 1
            if obj.DetectCircle() == 1
                nStep = 2;
                moveforward(obj.mDrone,obj.AfterBluePixel());
            end
        end

%         //Version2
        if nStep == 1
            if obj.NewDetectCircle() == 1
                nStep = 2;
                moveforward(obj.mDrone,obj.NewAfterBluePixel());
            end
        end

         if nStep == 2
            if obj.TurnAngle() == 1
                nCount = nCount + 1;
                moveforward(obj.mDrone,"Distance",1);
%                 //break;
            end
        end

    end
    obj.Finish();
    nError_code = 0;

end

