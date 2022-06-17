function is_detected = CountPixels(obj)

    is_detected = obj.cBlue_numbers_th < obj.detected_pixel;
    
% //어떻게 움직일까 ? 
% //위아래로 움직이거나, 아니면 좌우로 움직여야 함.
% //위아래 로 움직일때 readheight 를 사용 ??
% 
% //1.픽셀의 최소 픽셀수 를 지정함.
% //2.그 픽셀수를 넘으면, 파란색이 많은 쪽으로 이동함.
% 
% 
% //3. 만약에 최소 픽셀수도 못넘으면, 상, 하 ,좌, 우, 이동함.  //일단 상하 만 하는거로 , 좌우는 어차피 탐지 될거니 깐 ?  ?
% // 두번째에서 세번째 
% // 통과한다음 턴하고 조금 직진//
% //첫번째 원+ 세번째 원
% //커신 ? ? 등장...
% //[height,time] = readHeight(droneObj)
        

    if ~is_detected
        if obj.nDetected_pixel > obj.cBlue_numbers_min_th
            nTarget_X, nTarget_y = BluePixelFocusMove(obj);
            obj.MovetoLocation(nTarget_X,nTarget_y);
        else
            [heigth, void] = readheight(obj.mDrone);
%             //파란천이 최소높이 1m이고, 최대 높이가 3m니까 현재 드론이 1.5m이하면은 상승, 2.5m이상이면 하강 
%             //아니면 한계값을 낮추던가?
%             //최소 값을 정해서... ㅇ
%             //턴했을때 무조건 파란색은 보일수밖에 -> 고도가 같다면 호루
%             //안보인다는 경우는 => 고도가 다르다 
% 
%             //전자는 그냥 넣지말자
%             //용석이가 걱정하는거는 한계점 8만개인데, 너무 멀면은 8만개보다 적어서 안된다...
%             //한계점을 낮추면 되기는한대,
%             //근데 문제는 3m돌진했을때, 보니까 위로 솟구치던데..... 이거는 운빨에 맡기던가...
%             //ㅇㅈ 그것도 ㅇㅈ  방법이 있어 => move함수를 이용하면 전진+아래로도 이동가능 그러면 좀 보정이 되지 아늘까?//? 아래로도 20cm를 꼭?   cexㅂ.20cm보다는 좀 올라가는것 같은데 이거 실험으로 ㅇㅋㅇㅋ
%             ////move 함수 이용은 실험을 해봐야할듯 ? ?오늘은 끝?
%             끝?
%             //직전할 필요가 있을까? 옶어
%             //또는 파랑이 보이기는 하는데 일정수치보다 낮다 싶으면 조금만직진하도록 하거나   0.2 m 정도
%             //조금 넣도
            if( height < 1.5)
                obj.MovetoLocation(0,15);
            elseif (height > 2.5)
                obj.MovetoLocation(0,-15);
            end
        end
    end
end
