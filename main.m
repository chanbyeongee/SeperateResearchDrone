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

