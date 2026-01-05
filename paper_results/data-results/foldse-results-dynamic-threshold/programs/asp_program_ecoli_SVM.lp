label(X,'1') :- not sn(X,'AAS'), alm1(X,N1), N1=<0.55, not ab1(X,'True'), not ab2(X,'True'), not ab3(X,'True').
ab1(X,'True') :- not sn(X,'PTKB'), gvh(X,N2), not(N2=<0.56), mcg(X,N3), not(N3=<0.41).
ab2(X,'True') :- not sn(X,'PTWX'), alm1(X,N1), not(N1=<0.36), alm2(X,N4), N4=<0.35.
ab3(X,'True') :- alm2(X,N4), not(N4=<0.47), alm1(X,N1), N1=<0.4.
