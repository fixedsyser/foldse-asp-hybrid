label(X,'1') :- not cell_size_uniformity(X,'1'), not ab2(X,'True').
label(X,'1') :- not normal_nucleoli(X,'1'), bland_chromatin(X,'5').
ab1(X,'True') :- not single_epi_cell_size(X,'2'), not marginal_adhesion(X,'1'), not single_epi_cell_size(X,'3').
ab2(X,'True') :- bare_nuclei(X,'1'), not ab1(X,'True').
