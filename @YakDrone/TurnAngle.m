function is_Complete= TurnAngle(obj)
    try
        turn(obj.mDrone,deg2rad(targetAngle));
        is_Complete = true;
    catch
        is_Complete= false;
    end
end

