# ExpanderGraphs

This research project investigates the eigenvalues of the zig-zag product (http://en.wikipedia.org/wiki/Zig-zag_product) between two graphs.

Experiments are carried out on varying, size, degrees, and constructions for X and Y.
Results record the eigenvalues of X, Y, their zigzag product, and a random graph G of equal size and degree with the zigzag product for comparisons.

Two different construction schemes for G and Y are used in the experiments:
one produces nonbipartite graphs with loops (which causes expansion properties of resulting graphs to suffer somewhat)
the other produces bipartite graphs with no loop (which has better expansion properties, but cannot be used for construction of zigzag product, so an odd length cycle of random length when using this contruction to generate Y)
The construction scheme used in each set of tests is specified accrodingly. 