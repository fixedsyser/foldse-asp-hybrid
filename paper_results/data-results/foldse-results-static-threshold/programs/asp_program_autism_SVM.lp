label(X,'1') :- not a9(X,'1'), not ab2(X,'True'), not ab3(X,'True'), not ab4(X,'True').
label(X,'1') :- not a1(X,'1'), not ab5(X,'True'), not ab6(X,'True').
label(X,'1') :- not a6(X,'1'), not a3(X,'1'), not ab7(X,'True').
label(X,'1') :- not a10(X,'1'), ethnicity(X,'?').
label(X,'1') :- not a7(X,'1'), not a8(X,'1'), not a6(X,'1').
label(X,'1') :- not a7(X,'1'), not a2(X,'1'), age(X,N1), N1>22.0, N1=<34.0.
ab1(X,'True') :- not a3(X,'1'), not a7(X,'1').
ab2(X,'True') :- a5(X,'1'), a8(X,'1'), a2(X,'1'), a10(X,'1'), not ab1(X,'True').
ab3(X,'True') :- a4(X,'1'), a8(X,'1'), a7(X,'1'), a6(X,'1').
ab4(X,'True') :- a3(X,'1'), a5(X,'1'), a4(X,'1'), a8(X,'1'), a7(X,'1').
ab5(X,'True') :- a3(X,'1'), a7(X,'1'), a6(X,'1').
ab6(X,'True') :- a4(X,'1'), not a9(X,'1').
ab7(X,'True') :- a4(X,'1'), a8(X,'1').
