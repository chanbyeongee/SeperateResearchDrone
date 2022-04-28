classdef YakDrone
    properties
        mDrone;
        mCam;
    end

    methods 
        function obj = YakDrone(drone_id)
            obj.mDrone = ryze(drone_id);
            obj.mCam = camera(obj.drone);
        end
        nCenter_x, nCenter_y, is_forward  = DetectCircle(obj);
        output = MovetoLocation(obj,x,y);
        output = TurnAngle(obj, angle);
        output = Run(obj);
        Finish(obj);
    end
end

