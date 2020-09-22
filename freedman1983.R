# attempt to reproduce Freedman 1983
set.seed(1983)

n_obs <- 100
n_x <- 50
dat <- matrix(NA, n_obs, n_x + 1)
dat <- apply(dat, 2, function(x) rnorm(length(x)))

m1 <- lm(dat[, 51] ~ dat[, 1:50])
summary(m1)

# select variables with p < 0.25
p1 <- summary(m1)$coefficients[-1, 4]
pass2 <- as.numeric(which(p1 < 0.25))
m2 <- lm(dat[, 51] ~ dat[, pass2])
summary(m2)
