% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gpart.R
\name{CLQD}
\alias{CLQD}
\title{partitioning into cliques}
\usage{
CLQD(geno, SNPinfo, CLQcut=0.5, clstgap=40000,
hrstType=c("near-nonhrst", "fast", "nonhrst"), hrstParam=200,
CLQmode=c("density", "maximal"), LD=c("r2", "Dprime"))
}
\arguments{
\item{geno}{Data frame or matrix of additive genotype data, each column is additive genotype of each SNP. (Use data of non-monomorphic SNPs)}

\item{SNPinfo}{Data frame or matrix of SNPs information. 1st column is rsID and 2nd column is bp position.}

\item{CLQcut}{Numeric constant; a threshold for the LD measure value |r|, between 0 to 1. Default 0.5.}

\item{clstgap}{Numeric constant; a threshold of physical distance (bp) between two consecutive SNPs
which do not belong to the same clique, i.e., if a physical distance between two consecutive SNPs in a clique
greater than \code{clstgap}, then the algorithm split the cliques satisfying each
clique do not contain such consecutive SNPs. Default 40000.}

\item{hrstType}{Character constant; heuristic methods.
If you want to do not use heuristic algorithm, set \code{hrstType = "nonhrst"}.
If you want to use heuristic algorithm suggested in Kim et al.,(2017), set \code{hrstType = "fast"}.
That algorithm is fastest heuristic algorithm and suitable when your memory capacity is not greater than 8GB.
If you want to obtain the results similar to the that of non-heuristic algorithm, set \code{hrstType = "near-nonhrst"}.}

\item{hrstParam}{Numeric constant; parameter for heuristic algorithm "near-nonhrst".
Default is \code{200}. It is recommended that you set the parameter to greater than 150.}

\item{CLQmode}{Character constant; the way to give priority among detected cliques.
if \code{CLQmode = "density"} then the algorithm gives priority to the clique of largest value of \eqn{(Number of SNPs)/(range of clique)},
else if \code{CLQmode = "maximal"}, then the algorithm gives priority to the largest clique. The default is "density".}

\item{LD}{Character constant; LD measure to use, "r2" or "Dprime". Default "r2".}
}
\value{
A vector of cluster numbers of all  SNPs (\code{NA} represents singleton cluster).
}
\description{
\code{CLQD} partitioning the given data into subgroups that contain SNPs which are highly correlated.
}
\examples{

data(geno)
data(SNPinfo)
CLQD(geno=geno[,1:100],SNPinfo=SNPinfo[1:100,])
\dontrun{
CLQD(geno=geno[,1:100],SNPinfo=SNPinfo[1:100,], CLQmode = 'maximal')
CLQD(geno=geno[,1:100],SNPinfo=SNPinfo[1:100,], LD='Dprime')
}
}
\seealso{
\code{\link{BigLD}}
}
\author{
Sun-Ah Kim <sunny03@snu.ac.kr>, Yun Joo Yoo <yyoo@snu.ac.kr>
}
