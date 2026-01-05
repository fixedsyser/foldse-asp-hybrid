label(X,'1') :- not chest_pain(X,'4'), not ab1(X,'True').
ab1(X,'True') :- slope(X,'2'), oldpeak(X,N1), not(N1=<2.4).
