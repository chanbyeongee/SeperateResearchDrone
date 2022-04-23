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
        output = DetectCircle(obj,image);
        output = MovetoLocation(obj,x,y);
        output = TurnAngle(obj, angle);
        output = Run(obj);
    end
end

