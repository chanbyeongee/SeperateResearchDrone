function nError_code = Run(obj)
%RUN 이 함수의 요약 설명 위치
%   자세한 설명 위치
    
    takeoff(obj.mDrone);
    moveup(obj.mDrone,"Distance",0.2,"Speed",obj.cSpeed_set);
    moveback(obj.mDrone,"Distance",0.2,"Speed",obj.cSpeed_set);

    obj.nStep=0;
    obj.nCount=1;
    obj.nFailCount=0;

    nError_code=0;
    disp("Ready to Move!");
    while (obj.nCount <= obj.cTotal_Circle)
        fprintf("current: %d\n",obj.nStep);
        if(nError_code)
   
            nError_code
            nError_code=0;
        end
        
        if(~obj.ImageProcessing())
            nError_code = 1;
            continue;
        end
        
        
        if obj.nStep == 0
            code = obj.OnlyDetectCircle();
            if code == 0 
                obj.nFailCount= obj.nFailCount+1;
                nError_code=2;
                if(obj.nFailCount>3)
                    if(~obj.NewFindingCircle())
                        nError_code=3;
                    end
                    
                end
            elseif code == -1
                nError_code=4;
            else
                obj.nStep=1;
                obj.nFailCount=0;
            end
        end

        if obj.nStep == 1
            code = obj.CenterFinder();
            if (code==1)
                obj.nStep = 2;
            elseif(code == 0)
                obj.nFailCount= obj.nFailCount+1;
                if(obj.nFailCount>3)
                    obj.nStep=0;
                    obj.nFailCount=0;
                end
            else
                nError_code=5;
            end
        end

        if obj.nStep == 2
            obj.nCount = obj.nCount + 1;
            
            if obj.nCount == 4 
                obj.Finish();
            else
                if obj.TurnAngle()
                    obj.nStep=0;
                else
                    nError_code=6;
                end
            end

            if obj.nCount==3 
                
                turn(obj.mDrone,deg2rad(45));
                moveforward(obj.mDrone,"Distance",0.5,"Speed",obj.cSpeed_set);
            end
        end
        pause(1);
    end
 
    nError_code = 0;
    
end

