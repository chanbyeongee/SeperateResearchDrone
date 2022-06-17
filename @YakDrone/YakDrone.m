classdef YakDrone
    properties
        cMin_blue_th=0.650;
        cMax_blue_th=0.680;
        cBlue_numbers_th=50000;
        cBlue_numbers_min_th = 10000;
        cRange_th = 200; 
        cSpeed_set = 0.5;
        cCircle_th = 0.93;
        cTotal_Circle = 3;

        mDrone;
        mCam;

        nCurrent_x;
        nCurrent_y;
        nDetected_pixels;
        nBestCenter_X;
        nBestCenter_Y;

        aConverted_HSV;
        aFiltered_blue;
        aBestCircle;
    end

    methods 
        function obj = YakDrone()
            obj.mDrone = ryze();
            obj.mCam = camera(obj.mDrone);
        end
        [nCenter_X,nCenter_Y]=BluePixelFocusMove(obj);
        is_Detected = CountPixels(obj);
        is_Center = DetectCircle(obj);
        is_Center = NewDetectCircle(obj);
        is_Complete = MovetoLocation(obj,x,y);
        is_Complete = TurnAngle(obj);
        nErr_code = Run(obj);

        nDistance = AfterBluePixel(obj);
        nDistance = NewAfterBluePixel(obj);

        Finish(obj);
    end
end

