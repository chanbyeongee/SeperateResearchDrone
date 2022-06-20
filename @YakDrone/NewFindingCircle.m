function is_Complete = NewFindingCircle(obj)
    try
      
      nSum_of_blue_x=0;
      nSum_of_blue_y=0;
    
      nHalf_point_x = obj.nSize_x/2;
      nHalf_point_y = obj.nSize_y/2;
    % 오른쪽 붙어잇는거
    % 왼쪽 붙어잇는거
    % 중앙 쪽으로 이동시키다가 대충 중앙에 파랑색 밀집하면 고도를 변경하라 위 or 아래
    % 720 960 이니까 450 ~510 이정도에서 파랑색 밀집한거 보이면 고도를 변경. 
         for i = 1: obj.nSize_y
            for j = 1:obj.nSize_x
                if obj.aFiltered_blue(i,j)==1  
                    nSum_of_blue_x = nSum_of_blue_x + j - nHalf_point_x; %x축 픽셀위치 중심구하
                    nSum_of_blue_y = nSum_of_blue_y - i + nHalf_point_y;  %y축 픽셀위치 중심구하기
                
                end
            end
         end
        nSum_of_blue_x = nSum_of_blue_x / obj.nDetected_pixels;
        nSum_of_blue_y = nSum_of_blue_y / obj.nDetected_pixels;
      
    
        if nSum_of_blue_x<=720 && nSum_of_blue_x>=480
            obj.MovetoLocation(-0.5,0);
        elseif nSum_of_blue_x>=720 && nSum_of_blue_x<=960
            obj.MovetoLocation(-0.8,0);
        elseif nSum_of_blue_x<=480 && nSum_of_blue_x>=240
            obj.MovetoLocation(0.5,0);
        elseif nSum_of_blue_x>=0 && nSum_of_blue_x<=240
            obj.MovetoLocation(0.8,0);
        elseif  nSum_of_blue_y>= 480
              % y파랑색평균값이 아래에 치우쳐 잇으면 드론이 아래로 가야함.
            obj.MovetoLocation(0, -0.3);
        else
    
            %이제 상하이동
            % y파랑색평균값이 카메라의 중앙값하고 비슷하면 드론이 위로올라가야함 
            obj.MovetoLocation(0, 0.2);
        end
        is_Complete = 1;
    catch e
        disp(e)
        is_Complete =0;
    end
end