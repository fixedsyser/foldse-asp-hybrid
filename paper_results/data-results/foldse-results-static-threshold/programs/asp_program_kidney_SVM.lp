label(X,'1') :- sc(X,N1), N1>1.2.
label(X,'1') :- sg(X,N2), N2=<1.015.
label(X,'1') :- not rbc(X,'normal'), hemo(X,N3), not(N3>12.7).
label(X,'1') :- not al(X,'0'), not al(X,'?').
