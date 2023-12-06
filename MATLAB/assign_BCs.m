function [ENL, DOFs, DOCs] = assign_BCs(NL)
NoN = size(NL,1);
PD = size(NL,2);

ENL = zeros(NoN, PD*6);
ENL(:,1:2) = NL;

for i = 1: NoN
    
    if ((ENL(i,1) == 0) && ENL(i,2) == 0)
        ENL(i,3) = -1;
        ENL(i,4) = -1;

        ENL(i,9) = 0;
        ENL(i,10) = 0;

   elseif ((ENL(i,1) == 1) && ENL(i,2) == 0)
        ENL(i,3) = 1;
        ENL(i,4) = -1;

        ENL(i,9) = 0;
        ENL(i,10) = 0;

    elseif ((ENL(i,1) == 0.5) && ENL(i,2) == 1)
         ENL(i,3) = 1;
         ENL(i,4) = 1;

         ENL(i,11) = 0;
         ENL(i,12) = -20;
   end
end

DOFs = 0;
DOCs = 0;

for i = 1:NoN
    for j = 1:PD
        if (ENL(i,(PD+j)) == -1)

            DOCs = DOCs - 1;
            ENL(i, 2*PD+j) = DOCs;
        else
            DOFs = DOFs + 1;
            ENL(i, 2*PD+j) = DOFs;
        end
    end
end


for i = 1:NoN
    for j= 1:PD
        if (ENL(i,(2*PD+j)) < 0 )

            ENL(i, 3*PD+j) = DOFs + abs(ENL(i,(2*PD+j)));
        else
           
            ENL(i, 3*PD+j) = ENL(i,2*PD+j);
        end
    end
end

DOCs = abs(DOCs);

end






