label(X,'1') :- not chest_pain(X,'4'), not ab1(X,'True'), not ab2(X,'True'), not ab3(X,'True').
label(X,'1') :- not thal(X,'7'), major_vessels(X,'0'), chest_pain(X,'4'), maximum_heart_rate_achieved(X,N1), not(N1=<117.0), not ab4(X,'True').
ab1(X,'True') :- not thal(X,'3'), maximum_heart_rate_achieved(X,N1), N1=<131.0.
ab2(X,'True') :- sex(X,'1'), slope(X,'2'), major_vessels(X,'1'), blood_pressure(X,N2), not(N2=<118.0), maximum_heart_rate_achieved(X,N1), not(N1=<132.0).
ab3(X,'True') :- not sex(X,'1'), major_vessels(X,'2'), fasting_blood_sugar(X,'1').
ab4(X,'True') :- serum_cholestoral(X,N3), N3>303.0, N3=<315.0.
