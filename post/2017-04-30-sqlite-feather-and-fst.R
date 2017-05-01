## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE)
library(broman)
set.seed(1979300)

## ----simulate_data, eval=FALSE-------------------------------------------
## n_ind <- 500
## n_snps <- 1e3
## ind_names <- paste0("ind", 1:n_ind)
## snp_names <- paste0("snp", 1:n_snps)
## sigX <- matrix(rnorm(n_ind*n_snps), nrow=n_ind)
## sigY <- matrix(rnorm(n_ind*n_snps), nrow=n_ind)
## dimnames(sigX) <- list(ind_names, paste0(snp_names, ".X"))
## dimnames(sigY) <- list(ind_names, paste0(snp_names, ".Y"))
## db <- cbind(data.frame(id=ind_names, stringsAsFactors=FALSE),
##             sigX, sigY)

## ----getwd---------------------------------------------------------------
getwd()

## ----simulate_data_really, include=FALSE---------------------------------
cache_file <- "_cache/2017-04-30-sqlite-etc.RData"
if(file.exists(cache_file)) {
    load(file)
    not_cached <- FALSE
} else {
  n_ind <- 500
  n_snps <- 1e3
  ind_names <- paste0("ind", 1:n_ind)
  snp_names <- paste0("snp", 1:n_snps)
  sigX <- matrix(rnorm(n_ind*n_snps), nrow=n_ind)
  sigY <- matrix(rnorm(n_ind*n_snps), nrow=n_ind)
  dimnames(sigX) <- list(ind_names, paste0(snp_names, ".X"))
  dimnames(sigY) <- list(ind_names, paste0(snp_names, ".Y"))
  db <- cbind(data.frame(id=ind_names, stringsAsFactors=FALSE),
              sigX, sigY)
  not_cached <- TRUE
}

## ----write_rds, eval=FALSE-----------------------------------------------
## rds_file <- "db.rds"
## saveRDS(db, rds_file)
## db_copy <- readRDS(rds_file)

## ----write_rds_really, include=FALSE-------------------------------------
if(not_cached) {
    rds_file <- "db.rds"
    write_rds_time <- system.time(saveRDS(db, rds_file))
    read_rds_time <- system.time(db_copy <- readRDS(rds_file))
    rds_size <- round(file.info("db.rds")$size/10^6)
}

## ----transpose_df, eval=FALSE--------------------------------------------
## t_db <- cbind(data.frame(snp=rep(snp_names, 2),
##                          signal=rep(c("X", "Y"), each=n_snps),
##                          stringsAsFactors=FALSE),
##               rbind(t(sigX), t(sigY)))

## ----transpose_df_really, include=FALSE----------------------------------
if(not_cached) {
  t_db <- cbind(data.frame(snp=rep(snp_names, 2),
                           signal=rep(c("X", "Y"), each=n_snps),
                           stringsAsFactors=FALSE),
                rbind(t(sigX), t(sigY)))
}

## ----put_snp_rows_together, eval=FALSE-----------------------------------
## db_rows <- as.numeric(matrix(1:nrow(t_db), byrow=TRUE, nrow=2))
## t_db <- t_db[db_rows,]

## ----put_snp_rows_together_really, include=FALSE-------------------------
if(not_cached) {
  db_rows <- as.numeric(matrix(1:nrow(t_db), byrow=TRUE, nrow=2))
  t_db <- t_db[db_rows,]
}

## ----write_sqlite, eval=FALSE--------------------------------------------
## library(RSQLite)
## sqlite_file <- "t_db.sqlite"
## sqldb <- dbConnect(SQLite(), dbname=sqlite_file)
## dbWriteTable(sqldb, "snps", t_db, row.names=FALSE, overwrite=TRUE,
##              append=FALSE, field.types=NULL)
## dbDisconnect(sqldb)

## ----write_sqlite_really, include=FALSE----------------------------------
if(not_cached) {
    library(RSQLite)
    sqlite_file <- "t_db.sqlite"
    sqldb <- dbConnect(SQLite(), dbname=sqlite_file)
    write_sqlite_time <- system.time(dbWriteTable(sqldb, "snps", t_db,
                                               row.names=FALSE, overwrite=TRUE,
                                               append=FALSE, field.types=NULL))
    dbDisconnect(sqldb)
    sqlite_size <- file.info(sqlite_file)$size/10^6
}

## ----sqlite_snp_names, eval=FALSE----------------------------------------
## sqldb <- dbConnect(SQLite(), dbname=sqlite_file)
## snp_names <- dbGetQuery(sqldb, 'select snp from snps')[,1]

## ----sqlite_snp_names_really, include=FALSE------------------------------
if(not_cached) {
    sqldb <- dbConnect(SQLite(), dbname=sqlite_file)
    snp_names <- dbGetQuery(sqldb, 'select snp from snps')[,1]
}

## ----query_sqlite, eval=FALSE--------------------------------------------
## random_snp <- sample(snp_names, 1)
## query <- paste0('select * from snps where snp == "', random_snp, '"')
## system.time(z <- dbGetQuery(sqldb, query))

## ----query_sqlite_really, include=FALSE----------------------------------
if(not_cached) {
    random_snp <- sample(snp_names, 1)
    query <- paste0('select * from snps where snp == "', random_snp, '"')
    system.time(z <- dbGetQuery(sqldb, query))
    sqlite_query_time <- system.time(z <- dbGetQuery(sqldb, query))
}

## ----query_sqlite_time, echo=FALSE---------------------------------------
print(sqlite_query_time)

## ----sqlite_index, eval=FALSE--------------------------------------------
## dbGetQuery(sqldb, "CREATE INDEX snp ON snps(snp)")

## ----sqlite_index_really, include=FALSE----------------------------------
if(not_cached) {
    dbGetQuery(sqldb, "CREATE INDEX snp ON snps(snp)")
    sqlite_size_2 <- file.info(sqlite_file)$size/10^6
}

## ----query_sqlite_windex, eval=FALSE-------------------------------------
## random_snp <- sample(snp_names, 1)
## query <- paste0('select * from snps where snp == "', random_snp, '"')
## system.time(z <- dbGetQuery(sqldb, query))

## ----query_sqlite_windex_really, include=FALSE---------------------------
if(not_cached) {
    random_snp <- sample(snp_names, 1)
    query <- paste0('select * from snps where snp == "', random_snp, '"')
    system.time(z <- dbGetQuery(sqldb, query))
    sqlite_query_time_2 <- system.time(z <- dbGetQuery(sqldb, query))
}

## ----query_sqlite_time_2, echo=FALSE-------------------------------------
print(sqlite_query_time_2)

## ----feather, eval=FALSE-------------------------------------------------
## library(feather)
## feather_file <- "t_db.feather"
## write_feather(t_db, feather_file)
## t_db_clone <- read_feather(feather_file)

## ----feather_really, include=FALSE---------------------------------------
if(not_cached) {
    library(feather)
    feather_file <- "t_db.feather"
    write_feather_time <- system.time(write_feather(t_db, feather_file))
    read_feather_time <- system.time(t_db_clone <- read_feather(feather_file))
    feather_size <- file.info(feather_file)$size/10^6
}

## ----feather_query, eval=FALSE-------------------------------------------
## db_f <- feather(feather_file)
## snp_names <- unlist(db_f[,"snp"])
## random_snp <- sample(snp_names, 1)
## system.time(z <- db_f[snp_names==random_snp,])

## ----feather_query_really, include=FALSE---------------------------------
if(not_cached) {
    db_f <- feather(feather_file)
    snp_names <- unlist(db_f[,"snp"])
    random_snp <- sample(snp_names, 1)
    system.time(z <- db_f[snp_names==random_snp,])
    feather_query_time <- system.time(z <- db_f[snp_names==random_snp,])
}

## ----feather_query_time, echo=FALSE--------------------------------------
print(feather_query_time)

## ----feather2, eval=FALSE------------------------------------------------
## feather_file_2 <- "db.feather"
## write_feather(db, feather_file_2)
## db_clone <- read_feather(feather_file_2)

## ----feather2_really, include=FALSE--------------------------------------
if(not_cached) {
    feather_file_2 <- "db.feather"
    write_feather_time_2 <- system.time(write_feather(db, feather_file_2))
    read_feather_time_2 <- system.time(db_clone <- read_feather(feather_file_2))
    feather_size_2 <- file.info(feather_file_2)$size/10^6
}

## ----feather_snp_names, eval=FALSE---------------------------------------
## db_f_2 <- feather(feather_file_2)
## snp_names <- sub("\\.[XY]$", "", colnames(db_f_2))
## snp_names <- snp_names[1:(length(snp_names)/2)]

## ----feather_snp_names_really, include=FALSE-----------------------------
if(not_cached) {
    db_f_2 <- feather(feather_file_2)
    snp_names <- sub("\\.[XY]$", "", colnames(db_f_2))
    snp_names <- snp_names[1:(length(snp_names)/2)]
}

## ----feather_query_2, eval=FALSE-----------------------------------------
## random_snp <- sample(snp_names, 1)
## system.time(z <- db_f_2[,c("id", paste0(random_snp, c(".X", ".Y")))])

## ----feather_query_2_really, include=FALSE-------------------------------
    random_snp <- sample(snp_names, 1)
    system.time(z <- db_f_2[,c("id", paste0(random_snp, c(".X", ".Y")))])
    feather_query_time_2 <- system.time(z <- db_f_2[,c("id", paste0(random_snp, c(".X", ".Y")))])

## ----feather_query_time_2, echo=FALSE------------------------------------
print(feather_query_time_2)

## ----write_fst, eval=FALSE-----------------------------------------------
## library(fst)
## fst_file <- "db.fst"
## write.fst(t_db, fst_file)
## t_db_clone <- read.fst(fst_file)

## ----write_fst_really, include=FALSE-------------------------------------
if(not_cached) {
    library(fst)
    fst_file <- "db.fst"
    write_fst_time <- system.time(write.fst(t_db, fst_file))
    read_fst_time <- system.time(t_db_clone <- read.fst(fst_file))
    fst_size <- file.info(fst_file)$size/10^6
}

## ----write_fstcomp, eval=FALSE-------------------------------------------
## fstcomp_file <- "db_comp.fst"
## write.fst(t_db, fstcomp_file, 80)
## t_db_clone <- read.fst(fstcomp_file)

## ----write_fstcomp_really, include=FALSE---------------------------------
if(not_cached) {
    fstcomp_file <- "db_comp.fst"
    write_fstcomp_time <- system.time(write.fst(t_db, fstcomp_file, 80))
    read_fstcomp_time <- system.time(t_db_clone <- read.fst(fstcomp_file))
    fstcomp_size <- file.info(fstcomp_file)$size/10^6
}

## ----fst_grab_snps, eval=FALSE-------------------------------------------
## snp_names <- read.fst(fstcomp_file, "snp")[,1]

## ----fst_grab_snps_really, include=FALSE---------------------------------
if(not_cached) {
    snp_names <- read.fst(fstcomp_file, "snp")[,1]
}

## ----fst_grab_a_snp, eval=FALSE------------------------------------------
## random_snp <- sample(snp_names, 1)
## wh_rows <- which(random_snp == snp_names)
## system.time(z <- read.fst(fstcomp_file, from=wh_rows[1], to=wh_rows[2]))

## ----fst_grab_a_snp_really, include=FALSE--------------------------------
if(not_cached) {
    random_snp <- sample(snp_names, 1)
    wh_rows <- which(random_snp == snp_names)
    system.time(z <- read.fst(fstcomp_file, from=wh_rows[1], to=wh_rows[2]))
    fstcomp_query_time <- system.time(z <- read.fst(fstcomp_file, from=wh_rows[1], to=wh_rows[2]))
}

## ----fst_grab_a_snp_time, echo=FALSE-------------------------------------
print(fstcomp_query_time)

## ----setup4microbenchmark, eval=FALSE------------------------------------
## random_snp <- sample(snp_names, 1)
## library(microbenchmark)
## sqlite_file <- "t_db.sqlite"
## sqldb <- dbConnect(SQLite(), dbname=sqlite_file)
## query <- paste0('select * from snps where snp == "', random_snp, '"')
## db_f <- feather(feather_file)
## db_f_2 <- feather(feather_file_2)

## ----setup4microbenchmark_really, include=FALSE--------------------------
if(not_cached) {
    random_snp <- sample(snp_names, 1)
    library(microbenchmark)
    sqlite_file <- "t_db.sqlite"
    sqldb <- dbConnect(SQLite(), dbname=sqlite_file)
    query <- paste0('select * from snps where snp == "', random_snp, '"')
    db_f <- feather(feather_file)
    db_f_2 <- feather(feather_file_2)
}

## ----time_access, eval=FALSE---------------------------------------------
## microbenchmark(sqlite=dbGetQuery(sqldb, query),
##                feather=db_f[snp_names==random_snp,],
##                feather_t=db_f_2[,c("id", paste0(random_snp, c(".X",".Y")))],
##                fst={wh_rows <- which(random_snp == snp_names)
##                     read.fst(fst_file, from=wh_rows[1], to=wh_rows[2])},
##                fstcomp={wh_rows <- which(random_snp == snp_names)
##                         read.fst(fstcomp_file, from=wh_rows[1], to=wh_rows[2])},
##                times=100)

## ----time_access_really, include=FALSE-----------------------------------
if(not_cached) {
    mbm <- microbenchmark(sqlite=dbGetQuery(sqldb, query),
                          feather=db_f[snp_names==random_snp,],
                          feather_t=db_f_2[,c("id", paste0(random_snp, c(".X",".Y")))],
                          fst={wh_rows <- which(random_snp == snp_names)
                               read.fst(fst_file, from=wh_rows[1], to=wh_rows[2])},
                          fstcomp={wh_rows <- which(random_snp == snp_names)
                                   read.fst(fstcomp_file, from=wh_rows[1], to=wh_rows[2])},
                          times=100)
}

## ----time_access_print, echo=FALSE---------------------------------------
print(mbm, digits=1)

## ----construct_table, echo=FALSE-----------------------------------------
if(not_cached) {
    results <- data.frame(write_time= c(rds=write_rds_time[3],
                                        sqlite=write_sqlite_time[3],
                                        feather=write_feather_time[3],
                                        feather=write_feather_time_2[3],
                                        fst=write_fst_time[3],
                                        fst_comp=write_fstcomp_time[3]),
                          read_time=  c(rds=read_rds_time[3],
                                        sqlite=NA,
                                        feather=read_feather_time[3],
                                        feather_t=read_feather_time_2[3],
                                        fst=read_fst_time[3],
                                        fst_comp=read_fstcomp_time[3]),
                          file_MB=    c(rds=rds_size,
                                        sqlite=sqlite_size,
                                        feather=feather_size,
                                        feather_t=feather_size_2,
                                        fst=fst_size,
                                        fst_comp=fstcomp_size),
                          access_time=c(rds=NA,tapply(mbm$time/1e6, mbm$expr, mean)))
    rownames(results) <- c("rds", "sqlite", "feather", "feather (tr)", "fst", "fst (compr)")
}

## ----print_table---------------------------------------------------------
knitr::kable(results, digits=c(1,1,0,1),
             col.names=c("write time (s)", "read time (s)",
                         "file size (MB)", "access time (ms)"))

## ----write_cache, include=FALSE------------------------------------------
if(not_cached) {
    save(sigX, sigY, db, write_rds_time, read_rds_time, rds_size,
         write_sqlite_time, sqlite_size, sqlite_size_2, sqlite_query_time, sqlite_query_time_2,
         write_feather_time, read_feather_time, feather_size,
         write_feather_time_2, read_feather_time_2, feather_size_2,
         write_fst_time, read_fst_time, fst_size,
         write_fstcomp_time, read_fstcomp_time, fstcomp_size,
         fstcomp_query_time,
         mbm, results,
         file=cache_file)
}

## ----cleanup, include=FALSE----------------------------------------------
unlink(rds_file)
unlink(sqlite_file)
unlink(feather_file)
unlink(feather_file_2)
unlink(fst_file)
unlink(fstcomp_file)

