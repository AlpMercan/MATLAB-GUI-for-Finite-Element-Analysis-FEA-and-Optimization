function [NL, EL] = void_circle_mesh(d1, d2, p, m, R, element_type)

    d1 = 1;
    d2 = 1;
    p = 6;
    m = 5;
    R = 0.2;

    q = [0 0; d1 0; 0 d2; d1 d2];
    
    PD = 2;
    
    NoN = 2*(p+1)*(m+1) + 2*(p-1)*(m+1);
    
    NoE = 4*p*m;
    
    NPE = 4;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Nodes   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    NL = zeros(NoN, PD);
    
    a = d1/p;
    b = d2/p;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Region 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    coor11 = zeros((p+1)*(m+1), PD);
    
    for i = 1:p+1
        
        coor11(i,1) = q(1,1) + (i-1)*a;
        coor11(i,2) = q(1,2);
        
    end
    
    for i = 1:p+1
        
        coor11(m*(p+1)+i,1) = R*cos((5*pi/4) + (i-1)*(pi/2)/p) + (d1/2);
        coor11(m*(p+1)+i,2) = R*sin((5*pi/4) + (i-1)*(pi/2)/p) + (d2/2);
        
    end
    
    %%%% DEBUGGING PLOT %%%%
    % for i = 1:(p+1)*(m+1)
    %     hold on;
    %     plot(coor11(i,1),coor11(i,2),'o','MarkerSize',30, 'MarkerEdgeColor','k','MarkerFaceColor',[0,0,1])
    %     text(coor11(i,1),coor11(i,2), num2str(i), 'Color','w','FontSize',20,'HorizontalAlignment','center')
    % end
    % 
    % axis equal
    
    for i = 1:m-1
        
        for j = 1:p+1
            
            dx = (coor11(m*(p+1)+j,1) - coor11(j,1))/m;
            dy = (coor11(m*(p+1)+j,2) - coor11(j,2))/m;
            
            coor11(i*(p+1)+j,1) = coor11(((i-1)*(p+1))+j,1) + dx;
            coor11(i*(p+1)+j,2) = coor11(((i-1)*(p+1))+j,2) + dy;
            
        end
        
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Region 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    coor22 = zeros((p+1)*(m+1), PD);
    
    for i = 1:p+1
        
        coor22(i,1) = q(3,1) + (i-1)*a;
        coor22(i,2) = q(3,2);
        
    end
    
    for i = 1:p+1
        
        coor22(m*(p+1)+i,1) = R*cos((3*pi/4) - (i-1)*(pi/2)/p) + (d1/2);
        coor22(m*(p+1)+i,2) = R*sin((3*pi/4) - (i-1)*(pi/2)/p) + (d2/2);
        
    end
    
    for i = 1:m-1
        
        for j = 1:p+1
            
            dx = (coor22(m*(p+1)+j,1) - coor22(j,1))/m;
            dy = (coor22(m*(p+1)+j,2) - coor22(j,2))/m;
            
            coor22(i*(p+1)+j,1) = coor22(((i-1)*(p+1))+j,1) + dx;
            coor22(i*(p+1)+j,2) = coor22(((i-1)*(p+1))+j,2) + dy;
            
        end
        
    end
            
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Region 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    coor33 = zeros((p-1)*(m+1), PD);
    
    for i = 1:p-1
        
        coor33(i,1) = q(1,1);
        coor33(i,2) = q(1,2) + (i)*b;
        
    end
    
    for i = 1:p-1
        
        coor33(m*(p-1)+i,1) = R*cos((5*pi/4) - (i)*(pi/2)/p) + (d1/2);
        coor33(m*(p-1)+i,2) = R*sin((5*pi/4) - (i)*(pi/2)/p) + (d2/2);
        
    end
    
    for i = 1:m-1
        
        for j = 1:p-1
            
            dx = (coor33(m*(p-1)+j,1) - coor33(j,1))/m;
            dy = (coor33(m*(p-1)+j,2) - coor33(j,2))/m;
            
            coor33(i*(p-1)+j,1) = coor33(((i-1)*(p-1))+j,1) + dx;
            coor33(i*(p-1)+j,2) = coor33(((i-1)*(p-1))+j,2) + dy;
            
        end
        
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Region 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    coor44 = zeros((p-1)*(m+1), PD);
    
    for i = 1:p-1
        
        coor44(i,1) = q(2,1);
        coor44(i,2) = q(2,2) + (i)*b;
        
    end
    
    for i = 1:p-1
        
        coor44(m*(p-1)+i,1) = R*cos((7*pi/4) + (i)*(pi/2)/p) + (d1/2);
        coor44(m*(p-1)+i,2) = R*sin((7*pi/4) + (i)*(pi/2)/p) + (d2/2);
        
    end
    
    for i = 1:m-1
        
        for j = 1:p-1
            
            dx = (coor44(m*(p-1)+j,1) - coor44(j,1))/m;
            dy = (coor44(m*(p-1)+j,2) - coor44(j,2))/m;
            
            coor44(i*(p-1)+j,1) = coor44(((i-1)*(p-1))+j,1) + dx;
            coor44(i*(p-1)+j,2) = coor44(((i-1)*(p-1))+j,2) + dy;
            
        end
        
    end
    
    
    for i = 1:m+1
        
        NL((i-1)*4*p+1:(i)*4*p,:) = [coor11((i-1)*(p+1)+1:(i)*(p+1),:);
                                     coor44((i-1)*(p-1)+1:(i)*(p-1),:);
                                     flipud(coor22((i-1)*(p+1)+1:(i)*(p+1),:));
                                     flipud(coor33((i-1)*(p-1)+1:(i)*(p-1),:))];
        
    end
    
    for i = 1:NoN
        hold on;
        plot(NL(i,1),NL(i,2),'o','MarkerSize',30, 'MarkerEdgeColor','k','MarkerFaceColor',[0,0,1])
        text(NL(i,1),NL(i,2), num2str(i), 'Color','w','FontSize',20,'HorizontalAlignment','center')
    end
    
    axis equal
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%   Elements   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    EL = zeros(NoE, NPE);
    
    for i = 1:m
        
        for j = 1:4*p
            
            if j == 1
                
                EL((i-1)*(4*p)+j,1) = (i-1)*(4*p) + 1;
                EL((i-1)*(4*p)+j,2) = EL((i-1)*(4*p)+j,1) + 1;
                EL((i-1)*(4*p)+j,4) = EL((i-1)*(4*p)+j,1) + 4*p;
                EL((i-1)*(4*p)+j,3) = EL((i-1)*(4*p)+j,4) + 1;
                
            elseif j == 4*p
                
                EL((i-1)*(4*p)+j,1) = (i)*(4*p);
                EL((i-1)*(4*p)+j,2) = (i-1)*(4*p) + 1;
                EL((i-1)*(4*p)+j,3) = EL((i-1)*(4*p)+j,1) + 1;
                EL((i-1)*(4*p)+j,4) = EL((i-1)*(4*p)+j,1) + 4*p;
                
            else
                
                EL((i-1)*(4*p)+j,1) = EL((i-1)*(4*p)+j-1,2);
                EL((i-1)*(4*p)+j,4) = EL((i-1)*(4*p)+j-1,3);
                EL((i-1)*(4*p)+j,3) = EL((i-1)*(4*p)+j,4) + 1;
                EL((i-1)*(4*p)+j,2) = EL((i-1)*(4*p)+j,1) + 1;
                
            end
            
        end
           
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     if isequal(element_type,'D2TR3N')
%         
%         NPE_new = 3;
%         EL_new = zeros(2*NoE, NPE_new);
%         
%         NPE_new = 3;
%         EL_new = zeros(2*NoE, NPE_new);
%         
%         for i = 1:NoE
%             
%             EL_new(2*(i-1)+1,1) = EL(i,1);
%             EL_new(2*(i-1)+1,2) = EL(i,2);
%             EL_new(2*(i-1)+1,3) = EL(i,3);
%             
%             EL_new(2*(i-1)+2,1) = EL(i,1);
%             EL_new(2*(i-1)+2,2) = EL(i,3);
%             EL_new(2*(i-1)+2,3) = EL(i,4);
%             
%         end
%         
%         EL = EL_new;
%         
%     end

    axis equal
    
    NL
    EL = [];
    Node_Multiplier = p * 4;
    CriticalNodes = [];

    for j = 1:(m+1)
        CriticalNodes(size(CriticalNodes,1)+1,:) = [0];
        CriticalNodes(size(CriticalNodes,1),:) = [(j*Node_Multiplier)];
    end

    CriticalNodes = transpose(CriticalNodes);
    
     for i = 1:size(NL,1)
        for j = 1:(m+1)
            if i == j*Node_Multiplier
                EL(size(EL,1)+1,:) = [0 0];
                EL(size(EL,1),:) = [i-Node_Multiplier+1 i];
            end
        end
    end

    for i = 1:size(NL,1)-1
        EL(size(EL,1)+1,:) = [0 0];
        EL(size(EL,1),:) = [i i+1];
    end

    for k = 1:size(NL,1) - Node_Multiplier
        EL(size(EL,1)+1,:) = [0 0];
        EL(size(EL,1),:) = [k k+Node_Multiplier];
    end

    for a = 1:(size(NL,1)-Node_Multiplier-1)  
        if ismember(a,CriticalNodes)
        else
            EL(size(EL,1)+1,:) = [0 0];
            EL(size(EL,1),:) = [a a+Node_Multiplier+1];
        end
    end

    for c = 1:(size(NL,1)-Node_Multiplier)
        for d = 0:(m-1)
            if c == (d*Node_Multiplier)+1
                EL(size(EL,1)+1,:) = [0 0];
                EL(size(EL,1),:) = [c (c+(2*Node_Multiplier)-1)];
            else
                EL(size(EL,1)+1,:) = [0 0];
                EL(size(EL,1),:) = [c c+Node_Multiplier-1];
            end
        end
    end
    EL = unique(EL,"rows");

    for i=1 : size(EL,1)
        H = plot([NL(EL(i,1),1), NL(EL(i,2),1)] ,[NL(EL(i,1),2), NL(EL(i,2),2)], 'LineWidth',3,'Color','k');
        H.Color(4) = 0.2;
    
    end
