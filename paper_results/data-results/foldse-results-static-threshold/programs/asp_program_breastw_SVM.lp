label(X,'1') :- not cell_size_uniformity(X,'1'), not ab2(X,'True').
ab1(X,'True') :- not marginal_adhesion(X,'1'), not single_epi_cell_size(X,'2'), not single_epi_cell_size(X,'3').
ab2(X,'True') :- bare_nuclei(X,'1'), not clump_thickness(X,'10'), not ab1(X,'True').
