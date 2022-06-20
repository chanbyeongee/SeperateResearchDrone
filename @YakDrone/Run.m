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
    disp("Ready to Move!\n");
    while (obj.nCount < obj.cTotal_Circle)
        if(nError_code)
            disp("Error: ",nError_code);
            nError_code=0;
        end
        
        if(~obj.ImageProcssing())
            nError_code = 1;
            continue;
        end
        
        
        if obj.nStep == 0
            code = obj.OnlyDetectCircle();
            if code == 0 
                obj.nFailCount= obj.nFailCount+1;
                if(obj.nFailCount>3)
                    if(~obj.NewFindingCircle())
                        nError_code=2;
                    end
                end
            elseif code == -1
                nError_code=3;
            else
                obj.nStep=1;
                obj.nFailCount=0;
            end
        end

        if obj.nStep == 1
            code = obj.CenterFinder();
            if (code==1)
                obj.nStep = 2;
            elseif(code==0)
                obj.nFailCount= obj.nFailCount+1;
                if(obj.nFailCount>3)
                    obj.nStep=1;
                    obj.nFailCount=0;
                end
            else
                nError_code=4;
            end
        end

        if obj.nStep == 2
            if obj.TurnAngle()
                obj.nCount = obj.nCount + 1;
                obj.nStep=0;
                break;
            else
                nError_code=5;
            end
        end
        pause(1);
    end
    obj.Finish();
    nError_code = 0;
    
end

