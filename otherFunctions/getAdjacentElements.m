function adjacentElements = getAdjacentElements(e_x,xi_x,eta_x,index,elRangeXi,elRangeEta,eNeighbour,Eps)
idXi_x = index(e_x,1);
idEta_x = index(e_x,2);

Xi_e_x = elRangeXi(idXi_x,:);
Eta_e_x = elRangeEta(idEta_x,:);
pointIsInEast = false;
pointIsInNorth = false;
pointIsInWest = false;
pointIsInSouth = false;
if abs(xi_x-Xi_e_x(1)) < Eps
    pointIsInWest = true;
elseif abs(xi_x-Xi_e_x(2)) < Eps
    pointIsInEast = true;
end
if abs(eta_x-Eta_e_x(1)) < Eps
    pointIsInSouth = true;
elseif abs(eta_x-Eta_e_x(2)) < Eps
    pointIsInNorth = true;
end
adjacentElements = NaN(1,8); % assume a maximum of 8 extraordinary vertex
adjacentElements(1) = e_x;
if pointIsInEast && pointIsInNorth % top right corner
    e_prev = e_x;
    e_next = eNeighbour(e_x,1); % element to the east
    if isnan(e_next)
        e_next = eNeighbour(e_x,4); % element to the south
    end
    counter = 2;
    while e_next ~= e_x % go counter clockwise around vertex to end up back at e_x
        counter2 = 3; % index of element to the west
        e_temp = eNeighbour(e_next,counter2);
        while e_temp ~= e_prev
            counter2 = counter2 + 1;
            e_temp = eNeighbour(e_next,mod(counter2-1,4)+1);
        end

        adjacentElements(counter) = e_next;
        e_prev = e_next;
        e_next = eNeighbour(e_next,mod(counter2+3-1,4)+1);
        if isnan(e_temp)
            e_next = eNeighbour(e_next,mod(counter2+2-1,4)+1);
        end
        counter = counter + 1;
    end
elseif pointIsInWest && pointIsInNorth % top left corner
    e_prev = e_x;
    e_next = eNeighbour(e_x,2); % element to the north
    if isnan(e_next)
        e_next = eNeighbour(e_x,1); % element to the east
    end
    counter = 2;
    while e_next ~= e_x % go counter clockwise around vertex to end up back at e_x
        counter2 = 4; % index of element to the south
        e_temp = eNeighbour(e_next,counter2);
        while e_temp ~= e_prev
            counter2 = counter2 + 1;
            e_temp = eNeighbour(e_next,mod(counter2-1,4)+1);
        end

        adjacentElements(counter) = e_next;
        e_prev = e_next;
        e_next = eNeighbour(e_next,mod(counter2+3-1,4)+1);
        if isnan(e_temp)
            e_next = eNeighbour(e_next,mod(counter2+2-1,4)+1);
        end
        counter = counter + 1;
    end     
elseif pointIsInWest && pointIsInSouth % bottom left corner
    e_prev = e_x;
    e_next = eNeighbour(e_x,3); % element to the west
    if isnan(e_next)
        e_next = eNeighbour(e_x,1); % element to the north
    end
    counter = 2;
    while e_next ~= e_x % go counter clockwise around vertex to end up back at e_x
        counter2 = 1; % index of element to the east
        e_temp = eNeighbour(e_next,counter2);
        while e_temp ~= e_prev
            counter2 = counter2 + 1;
            e_temp = eNeighbour(e_next,mod(counter2-1,4)+1);
        end

        adjacentElements(counter) = e_next;
        e_prev = e_next;
        e_next = eNeighbour(e_next,mod(counter2+3-1,4)+1);
        if isnan(e_temp)
            e_next = eNeighbour(e_next,mod(counter2+2-1,4)+1);
        end
        counter = counter + 1;
    end     
elseif pointIsInEast && pointIsInSouth % bottom right corner
    e_prev = e_x;
    e_next = eNeighbour(e_x,4); % element to the south
    if isnan(e_next)
        e_next = eNeighbour(e_x,1); % element to the west
    end
    counter = 2;
    while e_next ~= e_x % go counter clockwise around vertex to end up back at e_x
        counter2 = 2; % index of element to the north
        e_temp = eNeighbour(e_next,counter2);
        while e_temp ~= e_prev
            counter2 = counter2 + 1;
            e_temp = eNeighbour(e_next,mod(counter2-1,4)+1);
        end

        adjacentElements(counter) = e_next;
        e_prev = e_next;
        e_next = eNeighbour(e_next,mod(counter2+3-1,4)+1);
        if isnan(e_temp)
            e_next = eNeighbour(e_next,mod(counter2+2-1,4)+1);
        end
        counter = counter + 1;
    end     
elseif pointIsInEast
    adjacentElements(2) = eNeighbour(e_x,1);
elseif pointIsInNorth
    adjacentElements(2) = eNeighbour(e_x,2);
elseif pointIsInWest
    adjacentElements(2) = eNeighbour(e_x,3);
elseif pointIsInSouth
    adjacentElements(2) = eNeighbour(e_x,4);
end