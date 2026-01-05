label(X,'1') :- not have_you_ever_had_suicidal_thoughts(X,'No'), not ab1(X,'True').
label(X,'1') :- have_you_ever_had_suicidal_thoughts(X,'No'), academic_pressure(X,N1), not(N1=<3.0), financial_stress(X,N2), not(N2=<4.0).
ab1(X,'True') :- academic_pressure(X,N1), N1=<2.0, financial_stress(X,N2), N2=<2.0.
