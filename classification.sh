mkdir Blood Normal Tumor
for i in $(ls|grep TCGA)
do 
if [ $(echo $i|cut -d "-" -f 4|cut -c 1-2) -eq 01 ]
then
mv ${i} Tumor
elif [ $(echo $i|cut -d "-" -f 4|cut -c 1-2) -eq 10 ]
then
mv ${i} Blood
elif [ $(echo $i|cut -d "-" -f 4|cut -c 1-2) -eq 11 ]
then
mv ${i} Normal
fi
done
