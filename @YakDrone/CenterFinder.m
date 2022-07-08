function is_Center = CenterFinder(obj)
    is_Center = 0;
    obj.nMoveWeight=0;
    try
        is_Circle = obj.OnlyDetectCircle();
        if is_Circle == 1 
            if obj.nStep ~= 0
      
                nBestCenter_X = obj.aCentroid(1);
                nBestCenter_Y = obj.aCentroid(2);

             

                if(obj.nCircle_r<50 || obj.nEccentricity > 0.85)
                    obj.NewFindingCircle();
                else
                    nTarget_X = nBestCenter_X - (obj.nSize_x/2);
                    nTarget_X = round(nTarget_X,2);
                
                    nTarget_Y = -nBestCenter_Y + (obj.nSize_y/2);
                    
                    if obj.nEccentricity < 0.6
                        nTarget_Y = round(nTarget_Y,2)-obj.cY_weight;
                    else
                        nTarget_Y = round(nTarget_Y,2);
                    end
                
                    if(nTarget_X<=obj.cRange_th && nTarget_X>=-obj.cRange_th && nTarget_Y <=obj.cRange_th && nTarget_Y >= -obj.cRange_th)
                        is_Center = 1;
                    else
                        coeff = (obj.cCircle_size(1,obj.nCount)/(obj.nCircle_r/2.3));
                  
                        nTarget_X = round(coeff * nTarget_X,2);
                        nTarget_Y = round(coeff * nTarget_Y,2);
                        

                        if((abs(nTarget_X) <= 0.20))
                            if(abs(nTarget_X)>=0.17)
                                nTarget_X = ((nTarget_X)/abs(nTarget_X)) * 0.2;
                            else
                                nTarget_X=0;
                                obj.nMoveWeight = nTarget_X;
                            end
                        end
                        if((abs(nTarget_Y) <= 0.20))
                            if(abs(nTarget_Y)>=0.17)
                                nTarget_Y = ((nTarget_Y)/abs(nTarget_Y)) * 0.2;
                            else
                                nTarget_Y=0;
                                obj.nMoveWeight = nTarget_Y;
                            end
                        end
                      
                        if(nTarget_X >= obj.cMax_move_dist)
                            nTarget_X=obj.cMax_move_dist;
                        end
                        if(nTarget_X <= -obj.cMax_move_dist)
                            nTarget_X= -obj.cMax_move_dist;
                        end
                        if(nTarget_Y >= obj.cMax_move_dist)
                            nTarget_Y=obj.cMax_move_dist;
                        end
                        if(nTarget_Y <= -obj.cMax_move_dist)
                            nTarget_Y=-obj.cMax_move_dist;
                        end
                       
       
                        if((nTarget_X ~= 0) || (nTarget_Y ~= 0))
                            obj.MovetoLocation(nTarget_X,nTarget_Y);
                            obj.is_last_we_had_positioned=1;
                        else
                            is_Center = 1;
                        end
                    end

                    if is_Center 
                        Circle_r = obj.nCircle_r*(0.39/obj.cCircle_size(1,obj.nCount));
                    
                        nDistance = (515)*(Circle_r^(-0.954));
                    
                        dist = round(nDistance,2)+0.3;
                        
                        try 
                            moveforward(obj.mDrone,"Distance",dist,"Speed",obj.cSpeed_set);
                        catch e
                            disp(e);
                            disp("Error!");
                        end
                    end
                end
                
            end
        else 
            is_Center = 0;
        end
    catch e
        disp(e);
        is_Center = -1;
    end
end