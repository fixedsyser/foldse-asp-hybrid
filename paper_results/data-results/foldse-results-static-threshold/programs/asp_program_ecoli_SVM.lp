label(X,'1') :- not sn(X,'FECR'), alm1(X,N1), N1=<0.53, not ab3(X,'True'), not ab4(X,'True').
ab1(X,'True') :- alm1(X,N1), N1=<0.37, gvh(X,N2), N2=<0.51.
ab2(X,'True') :- not sn(X,'TBPA'), alm1(X,N1), N1=<0.37, aac(X,N3), N3=<0.45.
ab3(X,'True') :- mcg(X,N4), not(N4=<0.53), not ab1(X,'True'), not ab2(X,'True').
ab4(X,'True') :- sn(X,'TORA'), aac(X,N3), N3>0.51, N3=<0.53.
