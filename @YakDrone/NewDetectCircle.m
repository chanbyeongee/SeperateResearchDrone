function is_Center = NewDetectCircle(obj)
    
    is_Center = false;
    bw = imcomplement(obj.aFiltered_blue);
    bw = bwareaopen(bw,30);
    [B,L] = bwboundaries(bw,'noholes');

    stats = regionprops(L,'Area','Centroid');
    nMax_metric=0;

    threshold = 95;
    
    for k = 1:length(B)
        boundary = B{k};

        delta_sq = diff(boundary).^2;    
        perimeter = sum(sqrt(sum(delta_sq,2)));
        area = stats(k).Area;
        metric = 4*pi*area/perimeter^2;

        if metric > threshold
            if metric > nMax_metric 
                centroid = stats(k).Centroid;
                nMax_metric = metric;
                obj.aBestCircle = boundary;
            end
        end
    end

    [nX_size , nY_size] = size(obj.aBestCircle);

    obj.nBestCenter_Y = centroid(1);
    obj.nBestCenter_X = centroid(2);
    
    nTarget_X = centroid(2) - (nX_size/2);
    nTarget_Y = centroid(1) - (nY_size/2);


    if(nTarget_X<=obj.cRange_th && nTarget_X>=-obj.cRange_th && nTarget_Y <=obj.cRange_th && nTarget_Y >= -obj.cRange_th)
        is_Center = true;
    end

    if ~is_Center 
        obj.MovetoLocation(nTarget_X,nTarget_Y);
    end

end