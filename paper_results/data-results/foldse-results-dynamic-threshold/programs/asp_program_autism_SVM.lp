label(X,'1') :- not a5(X,'1'), not ab1(X,'True'), not ab2(X,'True').
label(X,'1') :- not a9(X,'1'), not ab6(X,'True'), not ab7(X,'True'), not ab8(X,'True').
label(X,'1') :- not a10(X,'1'), not a1(X,'1').
label(X,'1') :- not a6(X,'1'), a9(X,'1'), not a3(X,'1'), not ab9(X,'True').
label(X,'1') :- not a2(X,'1'), not a7(X,'1'), not a1(X,'1').
label(X,'1') :- not a8(X,'1'), not a7(X,'1'), not a6(X,'1').
label(X,'1') :- not a10(X,'1'), not a2(X,'1'), ethnicity(X,'white').
label(X,'1') :- not a4(X,'1'), not ethnicity(X,'white'), not gender(X,'f'), not a1(X,'1').
ab1(X,'True') :- a3(X,'1'), a9(X,'1'), a7(X,'1').
ab2(X,'True') :- a3(X,'1'), a10(X,'1'), a8(X,'1'), a1(X,'1'), not pdd(X,'no').
ab3(X,'True') :- not a3(X,'1'), not a7(X,'1').
ab4(X,'True') :- not a2(X,'1'), not a6(X,'1'), not a3(X,'1').
ab5(X,'True') :- not a7(X,'1'), not a2(X,'1').
ab6(X,'True') :- a8(X,'1'), a4(X,'1'), a10(X,'1'), not ab3(X,'True'), not ab4(X,'True'), not ab5(X,'True').
ab7(X,'True') :- a6(X,'1'), a1(X,'1'), a2(X,'1'), jaundice(X,'no').
ab8(X,'True') :- a3(X,'1'), a7(X,'1'), a1(X,'1'), a4(X,'1'), age(X,N1), not(N1=<24.0).
ab9(X,'True') :- a4(X,'1'), a8(X,'1').
