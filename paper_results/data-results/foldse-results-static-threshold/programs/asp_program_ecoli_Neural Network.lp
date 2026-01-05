label(X,'1') :- alm1(X,N1), N1=<0.55, mcg(X,N2), N2=<0.53.
label(X,'1') :- alm1(X,N1), N1=<0.45, gvh(X,N3), N3=<0.55, mcg(X,N2), not(N2=<0.32), not ab1(X,'True').
label(X,'1') :- sn(X,'PTKB').
ab1(X,'True') :- not sn(X,'PTWX'), alm2(X,N4), N4=<0.3.
