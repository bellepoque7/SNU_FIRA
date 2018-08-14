library(plotrix)

dat<-read.csv(file.choose())
attach(dat)

model_name<-lm(vote_share~mshare+rep_inc+mccain+median_age+pct_white+pct_college+med_hhinc+pct_female+cshare_nm)
model_namebi<-lm(vote_share~mshare)
model_edge<-lm(vote_share~eshare+rep_inc+mccain+median_age+pct_white+pct_college+med_hhinc+pct_female+cshare_nm)
model_edgebi<-lm(vote_share~mshare)

###2010 and 2012 Scatter Plots
m10<-lm(vote_share~mshare)
a10<-m10$coefficients[1]
b10<-m10$coefficients[2]

m12<-lm(vote_share_12~mshare_12)
a12<-m12$coefficients[1]
b12<-m12$coefficients[2]

tiff(file="Scatter_2010.tiff", width=1332,height=1507,res=300, compression="lzw")
plot(mshare,vote_share, pch=20, cex=1.0, ylim=c(0, 100), 
     xlab="Tweet Share", ylab="Vote Share")
abline(a10, b10, lwd=2, col=2)
dev.off()

tiff(file="Scatter_2012.tiff", width=1332,height=1507,res=300, compression="lzw")
plot(mshare_12,vote_share_12, pch=20, cex=1.0, ylim=c(0, 100), 
     xlab="Tweet Share", ylab="Vote Share")
abline(a12, b12, lwd=2, col=2)
dev.off()

##Blot of mshare Bs by month
aug_model<-lm(vote_share~aug_mshare+rep_inc+mccain+median_age+pct_white+pct_college+med_hhinc+pct_female+aug_cnnshare)
sep_model<-lm(vote_share~sep_mshare+rep_inc+mccain+median_age+pct_white+pct_college+med_hhinc+pct_female+sep_cnnshare)
oct_model<-lm(vote_share~oct_mshare+rep_inc+mccain+median_age+pct_white+pct_college+med_hhinc+pct_female+oct_cnnshare)

sda<-sd(aug_mshare, na.rm=TRUE)
sds<-sd(sep_mshare, na.rm=TRUE)
sdo<-sd(oct_mshare, na.rm=TRUE)

bpoints<-c(aug_model$coefficients[2]*sda, sep_model$coefficients[2]*sds, oct_model$coefficients[2]*sdo)
bse<-c((coef(summary(aug_model))[2,2]*1.965*sda), (coef(summary(sep_model))[2,2]*1.965*sds), (coef(summary(oct_model))[2,2]*1.965*sdo) )
x<-c(1,2,3)

tiff(file="time_coeff.tiff",width=979,height=981,res=350)
plotCI(x, bpoints, bse, ylim=c(0,2), ylab="X Standardized B Coefficient", xlab="",
	cex=1, lwd=1, xaxt="n", gap=TRUE, xlim=c(.5,3.5), cex.axis=1)
axis(1, at=c(1,2,3), labels=c("August", "September", "October"), cex.axis=.5, cex.lab=.5)
dev.off()