label(X,'1') :- sc(X,N1), N1>1.2.
label(X,'1') :- sg(X,N2), N2=<1.015.
label(X,'1') :- hemo(X,N3), not(N3>12.7), not ab1(X,'True').
label(X,'1') :- al(X,'1').
ab1(X,'True') :- al(X,'0'), hemo(X,N3), not(N3=<12.7).
