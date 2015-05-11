# Mantel and partial Mantel tests, internal

# Leandro Roser leandroroser@ege.fcen.uba.ar
# May 11, 2015 

int.mantel <- function(d1, d2, dc, nsim, 
                       test, alternative = "auto", 
                       plotit = FALSE, method = "pearson", ...) {
  
  m1 <- as.vector(d1)
  m2 <- as.vector(d2)
  m3 <- as.vector(dc)
  
  
  repsim <- vector()
  
  
  if(is.null(m3)) {
    
    obs <- cor(m1, m2, method = method, ...)
    
    m1m <- as.matrix(d1)
    N <- nrow(m1m)
    for(i in 1:nsim){
      samp <- sample(N)
      temp <- (m1m[samp, samp])[row(m1m)>col(m1m)]
      repsim[i] <- cor(temp, m2, method = method, ...)
    }
    
    
  } else {
    
    
    x23 <- cor(m2, m3, method = method, ...)
    
    
    corpartial <- function(x1, ...) {
      x12 <- cor(x1, m2, method = method, ...)
      x13 <- cor(x1, m3, method = method, ...)
      num <- (x12 - x13 * x23) 
      denom <- sqrt(1 - (x13 ^ 2)) * sqrt(1 - (x23 ^ 2))
      num / denom
    }
    
    obs <- corpartial(m1)
    
    m1m <- as.matrix(d1)
    N <- nrow(m1m)
    for(i in 1:nsim){
      samp <- sample(N)
      temp <- (m1m[samp, samp])[row(m1m)>col(m1m)]
      repsim[i] <- corpartial(temp)
    }
    
  }
  
  res <- int.random.test(repsim = repsim, 
                         obs = obs,
                         nsim = nsim,
                         test = test,
                         alternative = alternative)
  
  
  if(is.null(dc)) { 
    xlab <- "Mantel statistic"
  } else {
    xlab <- "Partial Mantel statistic"
  }
  
  
  if(plotit == TRUE) {
    
    hist(c(repsim, obs), xlab = xlab,
         main = "Monte Carlo test")
    abline(v = obs, col = "red")
    points(obs, 0, col = "green", pch = 15, cex = 3.6)
    text(obs, 0, "obs")
  }
  
  res
}