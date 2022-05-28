classdef YakDrone
    properties
        cMin_blue_th;
        cMax_blue_th;
        cBlue_numbers_th; %CountPixels
        cRange_th; %DetectCircle;
        mDrone;
        mCam;
        nCurrent_x;
        nCurrent_y;
        aHSV_frame;
        aRaw_frame;
        is_Last_turn_direction; %0 - Left, 1 - Right
    end

    methods 
        function obj = YakDrone()
            obj.mDrone = ryze();
            obj.mCam = camera(obj.drone);
            Setup(obj);

        end
        void = Setup(obj);
        is_Detected = CountPixels(obj);
        is_Center = DetectCircle(obj);
        is_Complete = MovetoLocation(obj,x,y);
        is_Destination = GoThroughCircle(obj);
        nAngle = DetectRatio(obj);
        nErr_code = Run(obj);
        Finish(obj);
    end
end

