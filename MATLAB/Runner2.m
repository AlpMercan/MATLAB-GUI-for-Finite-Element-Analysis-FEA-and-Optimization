clc;
clear all;
clf;

d1 = 1;
d2 = 1;
p = 4;
m = 4;
element_type = 'D2TR3N';
% element_type = 'D2QU4N';
R = 0.2;
c=0.4;



% [NL, EL] = uniform(d1, d2, p, m, element_type);
[NL, EL] = void_circle_mesh(d1, d2, p, m, R, element_type);
% [NL, EL] = void_square_mesh(d1, d2, p, m, c, element_type);
% [NL, EL] = void_rhombus_mesh(d1, d2, p, m, c);



%%%%%%%


NoN = size(NL,1);
NoE = size(EL,1);
NPE = size(EL,2);

switch element_type
    case 'D2TR3N'
        
        for i = 1:NoE
            hold on;
            plot([NL(EL(i,1),1), NL(EL(i,2),1)], [NL(EL(i,1),2), NL(EL(i,2),2)],'m');
            plot([NL(EL(i,2),1), NL(EL(i,3),1)], [NL(EL(i,2),2), NL(EL(i,3),2)],'m');
            plot([NL(EL(i,3),1), NL(EL(i,1),1)], [NL(EL(i,3),2), NL(EL(i,1),2)],'m');
            x = (NL(EL(i,1),1) + NL(EL(i,2),1) + NL(EL(i,3),1))/3;
            y = (NL(EL(i,1),2) + NL(EL(i,2),2) + NL(EL(i,3),2))/3;
            text(x,y,num2str(i), 'Color', 'k', 'FontSize', 20, 'HorizontalAlignment','center')
        end
        
        for i = 1:NoN
            hold on;
            plot(NL(i,1),NL(i,2),'o','MarkerSize',30, 'MarkerEdgeColor','k','MarkerFaceColor',[0,0,1])
            text(NL(i,1),NL(i,2), num2str(i), 'Color','w','FontSize',20,'HorizontalAlignment','center')
        end
        
        axis equal
        
    case 'D2QU4N'
        
        for i = 1:NoE
            hold on;
            plot([NL(EL(i,1),1), NL(EL(i,2),1)], [NL(EL(i,1),2), NL(EL(i,2),2)],'m');
            plot([NL(EL(i,2),1), NL(EL(i,3),1)], [NL(EL(i,2),2), NL(EL(i,3),2)],'m');
            plot([NL(EL(i,3),1), NL(EL(i,4),1)], [NL(EL(i,3),2), NL(EL(i,4),2)],'m');
            plot([NL(EL(i,4),1), NL(EL(i,1),1)], [NL(EL(i,4),2), NL(EL(i,1),2)],'m');
            x = (NL(EL(i,1),1) + NL(EL(i,2),1) + NL(EL(i,3),1) + NL(EL(i,4),1))/4;
            y = (NL(EL(i,1),2) + NL(EL(i,2),2) + NL(EL(i,3),2) + NL(EL(i,4),2))/4;
            text(x,y,num2str(i), 'Color', 'k', 'FontSize', 20, 'HorizontalAlignment','center')
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        for i = 1:NoN
            hold on;
            plot(NL(i,1),NL(i,2),'o','MarkerSize',30,'MarkerEdgeColor','k','MarkerFaceColor',[0,0,1])
            text(NL(i,1),NL(i,2),num2str(i),'Color','w','FontSize',20,'HorizontalAlignment','center')
        end
        
        axis equal
        
end

