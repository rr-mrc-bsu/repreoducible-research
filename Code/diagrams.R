# ---- workflow-diagram ----
openplotmat()
par(mar=c(1, 1, 1, 1))
openplotmat()
elpos <- coordinates(c(2, 1, 2, 2, 2, 1))
fromto <- matrix(c(1, 3, 2, 3, 3, 4, 3, 5, 4, 6, 5, 7, 6, 8, 6, 9, 7, 8, 7, 9,
                   10, 8, 10, 9), ncol=2, byrow=TRUE)
nr <- nrow(fromto)
arrpos <- matrix(ncol=2, nrow=nr)
for(i in 1:nr) {
    arrpos[i, ] <- straightarrow(to=elpos[fromto[i, 2], ],
                                 from=elpos[fromto[i, 1], ], lwd=2, arr.pos=0.6,
                                 arr.length=0.5)
}
textrect(elpos[1, ], 0.15, 0.05, lab="functions.R", box.col="gray",
         shadow.col="grey", shadow.size=0, cex=1.5)
textrect(elpos[2, ], 0.15, 0.05, lab="DESCRIPTION", box.col="gray",
         shadow.col="grey", shadow.size=0, cex=1.5)
textellipse(elpos[3, ], 0.2, 0.1, lab="r-package.tar.gz", box.col="orange",
            shadow.col="darkgreen", shadow.size=0, cex=1.5)
textrect(elpos[4, ], 0.15, 0.05, lab="analysis.R", box.col="gray",
         shadow.col="darkblue", shadow.size=0, cex=1.5)
textrect(elpos[5, ], 0.15, 0.05, lab="simulation.R", box.col="gray",
         shadow.col="darkblue", shadow.size=0, cex=1.5)
textrect(elpos[6, ], 0.15, 0.05, lab="results1.csv", box.col="gray",
         shadow.col="darkblue", shadow.size=0, cex=1.5)
textrect(elpos[7, ], 0.15, 0.05, lab="results2.csv", box.col="gray",
         shadow.col="darkblue", shadow.size=0, cex=1.5)
textellipse(elpos[8, ], 0.2, 0.1, lab="manuscript.Rnw", box.col="orange",
            shadow.col="red", shadow.size=0, cex=1.5)
textellipse(elpos[9, ], 0.2, 0.1, lab="presentation.Rnw", box.col="orange",
            shadow.col="red", shadow.size=0, cex=1.5)
textrect(elpos[10, ], 0.15, 0.05, lab="refs.bib", box.col="gray",
         shadow.col="darkblue", shadow.size=0, cex=1.5)

