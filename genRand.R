
set.seed(17)
numberofsnp<-500
max<-47797
x<-runif(numberofsnp,1,max)
intx<-round(x,0)
uniqx<-unique(intx)
sortx<-sort(uniqx)
write.table(sortx,"randomNum.txt",quote=F,row.names=F,col.names=F,sep="\n")


hsnum<-5
hsseed<-runif(hsnum,1,numberofsnp)
hsseed<-round(hsseed,0)
hsseed<-unique(hsseed)
numberofsamples<-18
sd<-20
hotspotpos<-rnorm(numberofsamples*3,hsseed,sd)
hotspotpos<-round(hotspotpos,0)
hotspotpos<-unique(hotspotpos)
errorpos<-which(hotspotpos<1)
hotspotpos[errorpos]<--1*hotspotpos[errorpos]
selectedhspos<-sample(hotspotpos,numberofsamples,replace=F)
orderedhspos<-sort(selectedhspos)
write.table(orderedhspos,"hotspotPos.txt",quote=F,row.names=F,col.names=F,sep="\n")

