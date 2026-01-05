label(X,'1') :- major_vessels(X,'0').
label(X,'1') :- thal(X,'3'), not major_vessels(X,'0'), not chest_pain(X,'4'), not ab1(X,'True').
ab1(X,'True') :- not major_vessels(X,'1'), maximum_heart_rate_achieved(X,N1), N1=<152.0.
