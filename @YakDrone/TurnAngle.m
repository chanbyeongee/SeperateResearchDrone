function is_Complete= TurnAngle(obj)
    try
        turn(obj.mDrone,deg2rad(-90));
        moveforward(obj.mDrone,"Distance",1,"Speed",obj.cSpeed_set);
        is_Complete=true;
    catch e
        disp(e);
        is_Complete=false;
    end
end

