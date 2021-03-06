% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eco.convert.R
\name{eco.convert}
\alias{eco.convert}
\title{Conversion utility for genetic data}
\usage{
eco.convert(X, input = c("matrix", "alleles.matrix", "list", "alleles.list"),
  output = c("matrix", "alleles.matrix", "list", "alleles.list"),
  ncod = NULL, ploidy = 2, sep.in, sep.out, chk.names = TRUE,
  chk.plocod = TRUE)
}
\arguments{
\item{X}{Input data.}

\item{input}{Input data format.}

\item{output}{Output data format.}

\item{ncod}{Number of digits coding each allele.}

\item{ploidy}{Ploidy of the data.}

\item{sep.in}{Character separating alleles in the input data if present.}

\item{sep.out}{Character separating alleles in the output data. Default 
option do not separate alleles.}

\item{chk.names}{Defalult TRUE. The function makes checks of individuals 
and loci names during conversion.}

\item{chk.plocod}{Defalult TRUE. The function checks coherence 
in/between ploidy and number of digits coding alleles for loci data during conversion.}
}
\description{
This function interconverts genetic data among matrix format 
(one locus or one allele per column) and list format 
(one locus or one allele per column).
}
\examples{

\dontrun{

data(eco3)

# One allele per column
loc2al <- eco.convert(eco3[["G"]], "matrix", "alleles.matrix", ploidy = 2)
loc2al     

# Inverse operation (collapse alleles into locus)
al2loc <- eco.convert(loc2al, "alleles.matrix", "matrix", ploidy = 2)
al2loc

# Separating alleles with a character string
loc2loc <- eco.convert(eco3[["G"]], "matrix", "matrix", ploidy = 2, sep.out = "/")
loc2loc

# Inverse operation (removing separator)
loc2loc.nosep <- eco.convert(loc2loc, "matrix", "matrix", ploidy = 2, sep.in = "/", sep.out = "")
loc2loc.nosep

# Locus to list
loc2list <- eco.convert(eco3[["G"]], "matrix", "list", ploidy = 2)
loc2list

# Locus to allele list
al2list <- eco.convert(eco3[["G"]], "matrix",  "alleles.list", ploidy = 2)
al2list

# The inverse operations are also defined. All the formats are interconvertible.
# Locus operations have defined a within operation (matrix to matrix, list to list), 
# with the purpose of put/remove separators between alleles. The program accepts any ploidy level. 


}

}
\author{
Leandro Roser \email{leandroroser@ege.fcen.uba.ar}
}

