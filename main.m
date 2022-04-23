myDrone = YakDrone("Tello");

err_code = myDrone.Run();

if err_code == 1 
    myDrone.End();
end