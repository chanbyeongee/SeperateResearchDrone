function is_Circle = OnlyDetectCircle(obj)
    
    is_Circle=0;
    try
        aBw = imcomplement(obj.aFiltered_blue); %반전 안시키면 바깥이 검은색이라서 구멍으로 인식 불가능함.
        aBw = bwareaopen(aBw,30);
        [B,L] = bwboundaries(aBw,'noholes');
    
        stats = regionprops(L,'Area','Centroid');
        
     
        nMax_sizeB = 0;
        
        for k = 1:length(B)
            aBoundary = B{k};
            [nSizeB,void] = size(aBoundary);
    
            delta_sq = diff(aBoundary).^2;    
            perimeter = sum(sqrt(sum(delta_sq,2)));
    
            area = stats(k).Area;
            metric = 4*pi*area/perimeter^2;
    
            if metric > obj.cCircle_th
                if(nSizeB>100)
                    if(nSizeB<3000 && nSizeB>nMax_sizeB)
                        obj.aCentroid = stats(k).Centroid;
                        is_Circle = 1;
                        obj.aBestCircle = aBoundary;
                        nMax_sizeB = nSizeB;
                    end
                end
            end
        end
    catch e
        disp(e)
        is_Circle=-1;
        
    end
end

