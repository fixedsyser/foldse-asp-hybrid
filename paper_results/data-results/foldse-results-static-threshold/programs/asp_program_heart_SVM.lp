label(X,'1') :- not chest_pain(X,'4').
label(X,'1') :- major_vessels(X,'0'), chest_pain(X,'4'), oldpeak(X,N1), N1=<1.5, blood_pressure(X,N2), N2=<142.0, not ab1(X,'True'), not ab2(X,'True'), not ab3(X,'True').
ab1(X,'True') :- blood_pressure(X,N2), N2=<130.0, age(X,N3), N3=<41.0.
ab2(X,'True') :- blood_pressure(X,N2), N2>115.0, N2=<130.0, oldpeak(X,N1), not(N1=<0.6).
ab3(X,'True') :- serum_cholestoral(X,N4), not(N4=<271.0), blood_pressure(X,N2), not(N2=<120.0), age(X,N3), N3=<61.0.
