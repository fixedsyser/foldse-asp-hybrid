label(X,'1') :- not a5(X,'1'), not ab2(X,'True').
label(X,'1') :- not a9(X,'1'), not ab4(X,'True'), not ab6(X,'True'), not ab7(X,'True').
label(X,'1') :- not a4(X,'1'), not a1(X,'1').
label(X,'1') :- not a6(X,'1'), not a4(X,'1'), not a3(X,'1').
label(X,'1') :- not a10(X,'1'), not a1(X,'1').
ab1(X,'True') :- age(X,N1), N1>20.0, N1=<23.0.
ab2(X,'True') :- a3(X,'1'), a9(X,'1'), a8(X,'1'), not ethnicity(X,'Asian'), not ab1(X,'True').
ab3(X,'True') :- not gender(X,'f'), not a7(X,'1'), not a3(X,'1').
ab4(X,'True') :- a4(X,'1'), a8(X,'1'), a2(X,'1'), not ab3(X,'True').
ab5(X,'True') :- not a4(X,'1'), not a2(X,'1').
ab6(X,'True') :- a7(X,'1'), a10(X,'1'), a6(X,'1'), not ab5(X,'True').
ab7(X,'True') :- a3(X,'1'), a7(X,'1'), a8(X,'1'), age(X,N1), N1=<20.0.
