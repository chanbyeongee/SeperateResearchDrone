classdef YakDrone < handle
    properties
        cMin_blue_th=0.595;
        cMax_blue_th=0.670;
        cMin_red_th = 0.995;
        cMax_red_th = 0.027;
        cMin_blue_number = 500;
        cRange_th = 15; 
        cSpeed_set = 1;
        cCircle_th = 0.45;
        cTotal_Circle = 3;
        cCircle_size = [0.39,0.28,0.25];
        cMax_move_dist=0.5;
        cY_weight=140;

        mDrone;
        mCam;
        
        nStep=0;
        nFailCount=0;
        nSize_x=0;
        nSize_y=0;
        nDetected_pixels=0;
        nCircle_r=0;
        nCount=0;
        nEccentricity=0;

        aConverted_HSV=[];
        aFiltered_blue=[];
        aBestCircle=[];
        aCentroid=[];
        
    end

    methods 
        function obj = YakDrone()
            obj.mDrone = ryze();
            obj.mCam = camera(obj.mDrone);
        end
        [nCenter_X,nCenter_Y]=BluePixelFocusMove(obj);
        is_Complete = ImageProcessing(obj);
        is_Complete = NewFindingCircle(obj);
        is_Center = DetectCircle(obj);
        is_Center = CenterFinder(obj);
        is_Circle = OnlyDetectCircle(obj);
        is_Complete = MovetoLocation(obj,x,y);
        is_Complete = TurnAngle(obj);
        is_Complete = TrunStepFinal(obj);
        nErr_code = Run(obj);

        Finish(obj);
    end
end

