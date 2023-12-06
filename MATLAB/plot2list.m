
app.NL = [0 0];
app.EL = [1     2
     2     3
     3     4
     4     5
     5     6
     6     7
     7     8
     8     9
     9    10
    10    11
    11    12
    12     1
    12     2
    11    13
    10    14
     9    15
     8     6
    13     3
    14     4
    15     5
    12    13
     2    11
    11    14
    10    13
    10    15
     9    14
     9     6
     8    15
    14     5
    15     4
    14     3
    13     4
     2    13
    13    14
    14    15
    15     6];

app.NL_RecordedX = [0   0.788568452192588
   0.788568452192588   2.009160731351430
   2.009160731351430   2.998451044085600
   2.998451044085600   3.987556910319993
   3.987556910319993   5.212815673938681
   5.212815673938681   6.000000000000000
   6.000000000000000   5.070707559954216
   5.070707559954216   4.056496313359601
   4.056496313359601   3.001066772436113
   3.001066772436113   1.945490673708268
   1.945490673708268   0.930199068350466
   0.930199068350466                   0
   0.930199068350466   0.788568452192588
   1.945490673708268   1.844842305243600
   3.001066772436113   3.000754760691116
   4.056496313359601   4.156525881590337
   5.070707559954216   5.212815673938681
   1.844842305243600   2.009160731351430
   3.000754760691116   2.998451044085600
   4.156525881590337   3.987556910319993
   0.930199068350466   1.844842305243600
   0.788568452192588   1.945490673708268
   1.945490673708268   3.000754760691116
   3.001066772436113   1.844842305243600
   3.001066772436113   4.156525881590337
   4.056496313359601   3.000754760691116
   4.056496313359601   5.212815673938681
   5.070707559954216   4.156525881590337
   3.000754760691116   3.987556910319993
   4.156525881590337   2.998451044085600
   3.000754760691116   2.009160731351430
   1.844842305243600   2.998451044085600
   0.788568452192588   1.844842305243600
   1.844842305243600   3.000754760691116
   3.000754760691116   4.156525881590337
   4.156525881590337   5.212815673938681];

app.NL_RecordedY = [ 0   2.366277725839717
   2.366277725839717   4.975331152025425
   4.975331152025425   5.187595066187202
   5.187595066187202   4.972383860868937
   4.972383860868937   2.360517456475099
   2.360517456475099                   0
                   0                   0
                   0                   0
                   0                   0
                   0                   0
                   0                   0
                   0                   0
                   0   2.366277725839717
                   0   2.433003361262368
                   0   2.540645822609690
                   0   2.431801399210290
                   0   2.360517456475099
   2.433003361262368   4.975331152025425
   2.540645822609690   5.187595066187202
   2.431801399210290   4.972383860868937
                   0   2.433003361262368
   2.366277725839717                   0
                   0   2.540645822609690
                   0   2.433003361262368
                   0   2.431801399210290
                   0   2.540645822609690
                   0   2.360517456475099
                   0   2.431801399210290
   2.540645822609690   4.972383860868937
   2.431801399210290   5.187595066187202
   2.540645822609690   4.975331152025425
   2.433003361262368   5.187595066187202
   2.366277725839717   2.433003361262368
   2.433003361262368   2.540645822609690
   2.540645822609690   2.431801399210290
   2.431801399210290   2.360517456475099];



for i = 1:size(app.EL,1)
    
    if sum(ismember([app.NL_RecordedX(i,1) app.NL_RecordedY(i,1)],app.NL,"rows")) == 0
        app.NL(size(app.NL,1)+1,1:2) = zeros(1,2);
        app.NL(size(app.NL,1),1) = app.NL_RecordedX(i,1);
        app.NL(size(app.NL,1),2) = app.NL_RecordedY(i,1);
%         app.EL(i,1) = [(2*i)-1];
    else
%         app.EL(i,1) = find(ismember([app.NL_RecordedX(i,1) app.NL_RecordedY(i,1)],app.NL,"rows") == 1);
    end




    if sum(ismember([app.NL_RecordedX(i,2) app.NL_RecordedY(i,2)],app.NL,"rows")) == 0
        app.NL(size(app.NL,1)+1,1:2) = zeros(1,2);
        app.NL(size(app.NL,1),1) = app.NL_RecordedX(i,2);
        app.NL(size(app.NL,1),2) = app.NL_RecordedY(i,2);
%         app.EL(i,2) = [2*i];
    else
%         app.EL(i,2) = find(ismember([app.NL_RecordedX(i,2) app.NL_RecordedY(i,2)],app.NL,"rows") == 1);
    end
end