label(X,'1') :- not a9(X,'1'), not ab1(X,'True').
label(X,'1') :- not a5(X,'1'), not ab2(X,'True'), not ab3(X,'True').
label(X,'1') :- not a1(X,'1'), not a7(X,'1').
ab1(X,'True') :- a5(X,'1'), a8(X,'1'), a2(X,'1'), a6(X,'1').
ab2(X,'True') :- a3(X,'1'), a6(X,'1').
ab3(X,'True') :- not pdd(X,'no'), a3(X,'1').
