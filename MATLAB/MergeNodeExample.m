
app.NL = [0 0
          1.04 0
          2 0
          3 0
          3.08 0];

app.EL = [1 5
          5 2
          2 3
          3 4];



breaker = 0;


for k = 1:size(app.NL,1)

    for l = k+1:size(app.NL,1)

        Distance = sqrt(((app.NL(k,1) - app.NL(l,1))^2) + ((app.NL(k,2) - app.NL(l,2))^2)) ;

        if Distance < 0.1
            if breaker == 0
            
                FirstNode = app.NL(k,:);
                SecondNode = app.NL(l,:);
                
                
                app.NL(k,:) = [];
                app.NL(l-1,:) = [];
                app.NL((size(app.NL,1)+1),:) = [0 0] ;
                app.NL(size(app.NL,1),:) = [((FirstNode(:,1) + SecondNode(:,1))/2) ((FirstNode(:,2) + SecondNode(:,2))/2)] ;
    
                
                app.EL(app.EL==k) = size(app.NL,1)*(-1);
                app.EL(app.EL==l) = size(app.NL,1)*(-1);
                breaker = 1;
    
                for a = 1:numel(app.EL)
                    if a > k                     
                        if a > l
                            app.EL(app.EL==a) = a-2;
                        else
                            app.EL(app.EL==a) = a-1;
                        
    
                        end
    
                    end
                    
                    
    
    
                end
                break
               
            end
        end

    end

end

for i = 1:size(app.EL,1)
    if app.EL(i,1) < 0
        if app.EL(i,1) == app.EL(i,2)
            app.EL(i,:) = [];
            break
        end
    end
end

app.EL = abs(app.EL);

app.NL
app.EL