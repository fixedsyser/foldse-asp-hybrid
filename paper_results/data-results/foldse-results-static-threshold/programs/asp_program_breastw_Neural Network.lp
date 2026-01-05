label(X,'1') :- not cell_size_uniformity(X,'1'), not ab3(X,'True').
label(X,'1') :- not bare_nuclei(X,'1'), bland_chromatin(X,'5'), not normal_nucleoli(X,'1').
ab1(X,'True') :- not cell_shape_uniformity(X,'4'), clump_thickness(X,'8').
ab2(X,'True') :- not single_epi_cell_size(X,'2'), not cell_size_uniformity(X,'3'), not single_epi_cell_size(X,'1'), not ab1(X,'True').
ab3(X,'True') :- not bare_nuclei(X,'10'), not clump_thickness(X,'10'), bare_nuclei(X,'1'), not ab2(X,'True').
