label(X,'1') :- not have_you_ever_had_suicidal_thoughts(X,'No'), not ab1(X,'True'), not ab2(X,'True'), not ab3(X,'True').
label(X,'1') :- have_you_ever_had_suicidal_thoughts(X,'No'), academic_pressure(X,N1), not(N1=<3.0), financial_stress(X,N2), not(N2=<4.0).
ab1(X,'True') :- academic_pressure(X,N1), N1=<2.0, financial_stress(X,N2), N2=<2.0.
ab2(X,'True') :- academic_pressure(X,N1), N1=<3.0, age(X,N3), not(N3=<29.0), financial_stress(X,N2), N2=<3.0, work_study_hours(X,N4), N4=<4.0.
ab3(X,'True') :- not dietary_habits(X,'Unhealthy'), academic_pressure(X,N1), N1=<1.0, financial_stress(X,N2), N2>2.0, N2=<4.0, age(X,N3), N3=<33.0, study_satisfaction(X,N5), not(N5=<2.0).
