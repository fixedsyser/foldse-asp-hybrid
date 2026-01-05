label(X,'1') :- pcv(X,N1), not(N1>39.0), not ab1(X,'True').
label(X,'1') :- sg(X,N2), N2=<1.015.
label(X,'1') :- not rbc(X,'normal'), pot(X,N3), not(N3>3.4).
ab1(X,'True') :- rbc(X,'normal'), sc(X,N4), N4=<1.1, sg(X,N2), not(N2=<1.01).
