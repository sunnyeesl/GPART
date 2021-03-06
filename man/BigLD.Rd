% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gpart.R
\name{BigLD}
\alias{BigLD}
\title{Estimation of LD block regions}
\usage{
BigLD(geno=NULL, SNPinfo=NULL,genofile=NULL, SNPinfofile=NULL,
cutByForce=NULL, LD=c("r2", "Dprime"), CLQcut=0.5,
clstgap=40000, CLQmode=c("density", "maximal"),
leng=200, subTaskSize=1500, MAFcut=0.05, appendRare=FALSE,
hrstType=c("near-nonhrst", "fast", "nonhrst"),
hrstParam=200, chrN=NULL, startbp=-Inf, endbp=Inf)
}
\arguments{
\item{geno}{Data frame or matrix of additive genotype data, each column is additive genotype of each SNP.}

\item{SNPinfo}{Data frame or matrix of SNPs information.  1st column is rsID and 2nd column is bp position.}

\item{genofile}{Character constant; Genotype data file name (supporting format: .txt, .ped, .raw, .traw, .vcf).}

\item{SNPinfofile}{Character constant; SNPinfo data file name (supporting format: .txt, .map).}

\item{cutByForce}{Data frame; information of SNPs which are forced to be the last SNP LD block boundary.}

\item{LD}{Character constant; LD measure to use, r2 or Dprime. Default "r2".}

\item{CLQcut}{Numeric constant; a threshold for the LD measure value |r|, between 0 to 1. Default 0.5.}

\item{clstgap}{Numeric constant; a threshold of physical distance (bp) between two consecutive SNPs
which do not belong to the same clique, i.e., if a physical distance between two consecutive SNPs in a clique
greater than \code{clstgap}, then the algorithm split the cliques satisfying each
clique do not contain such consecutive SNPs. Default 40000.}

\item{CLQmode}{Character constant; the way to give priority among detected cliques.
if \code{CLQmode = "density"} then the algorithm gives priority to the clique of largest value of \eqn{(Number of SNPs)/(range of clique)},
else if \code{CLQmode = "maximal"}, then the algorithm gives priority to the largest clique. The default is "density".}

\item{leng}{Numeric constant; the number of SNPs in a preceding and a following region
of each sub-region boundary, every SNP in a preceding and every SNP in a following region need to be in weak LD. Default 200.}

\item{subTaskSize}{Numeric constant; upper bound of the number of SNPs in a one-take sub-region. Default 1500.}

\item{MAFcut}{Numeric constant; the MAF threshold. Default 0.05.}

\item{appendRare}{logical; if TRUE, the function append rare variants with MAF<MAFcut to the constructed blocks.}

\item{hrstType}{Character constant; heuristic methods.
If you want to do not use heuristic algorithm, set \code{hrstType = "nonhrst"}.
If you want to use heuristic algorithm suggested in Kim et al.,(2017), set \code{hrstType = "fast"}.
That algorithm is fastest heuristic algorithm and suitable when your memory capacity is not greater than 8GB.
If you want to obtain the results similar to the that of non-heuristic algorithm, set \code{hrstType = "near-nonhrst"}.}

\item{hrstParam}{Numeric constant; parameter for heuristic algorithm "near-nonhrst".
Default is \code{200}. It is recommended that you set the parameter to greater than 150.}

\item{chrN}{Numeric(or Character) constant (or vector); chromosome number to use.}

\item{startbp}{Numeric constant; starting bp position of the \code{chrN}. Default -Inf.}

\item{endbp}{Numeric constant; last bp position of the \code{chrN}. Default Inf.}
}
\value{
A data frame of block estimation result.
Each row of data frame shows the starting SNP and end SNP of each estimated LD block.
}
\description{
\code{BigLD} returns the estimation of LD block regions of given data.
}
\examples{

data(geno)
data(SNPinfo)
BigLD(geno=geno, SNPinfo=SNPinfo, startbp = 16058400, endbp = 16076500)

\dontrun{
BigLD(geno, SNPinfo, LD = "Dprime")
BigLD(geno, SNPinfo, CLQcut = 0.5, clstgap = 40000, leng = 200, subTaskSize = 1500)
}
}
\seealso{
\code{\link{CLQD}}, \code{\link{LDblockHeatmap}}
}
\author{
Sun-Ah Kim <sunny03@snu.ac.kr>, Yun Joo Yoo <yyoo@snu.ac.kr>
}
