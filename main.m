%%
fprintf("Starting...\n")
myDrone = YakDrone();
err_code = myDrone.Run();

if err_code == 1 
    myDrone.Finish();
end

%% 
clear myDrone;
fprintf("Cleared\n");

%%
myDrone.Finish();

%%
myDrone = YakDrone();
frame = snapshot(myDrone.mCam);
imshow(frame)

%%
myDrone = YakDrone();
while 1
    [myDrone.aRaw_frame, void] = snapshot(myDrone.mCam);
    imshow(myDrone.aRaw_frame);
    myDrone.aHSV_frame = rgb2hsv(myDrone.aRaw_frame);
    pause(3);
    test_x=myDrone.GoThroughCircle();
    test_x
end

%% 
clear drone;
drone = ryze();
cam = camera(drone);
while 1 
    pause(5);
    frame = snapshot(cam);
    imshow(frame);
    img = rgb2hsv(frame);
    img
end

%%
clear drone;