function is_Center  = DetectCircle(obj)
%DETECTCIRCLE 이 함수의 요약 설명 위치
%   자세한 설명 위치

    [nTarget_x,nTarget_y] = BluePixelFocusMove(obj.aHSV_frame); 
    
    if (nTarget_x >= -cRange_th && nTarget_x <= cRange_th) && (nTarget_y >= -cRange_th && nTarget_y <= cRange_th)
        is_Center = 1;
        return
    end
    
    obj.MovetoLocation(nTarget_x,nTarget_y);
    is_Center = 0;

end

