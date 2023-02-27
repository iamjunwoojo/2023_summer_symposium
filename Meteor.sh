#import sample
ruby /home/junwoojo/Meteor/meteor-master/data_preparation_tools/MeteorImportFastq.rb -i /home/junwoojo/Project_Darkmatter/Darkmatter/sample/ -p Darkmatter -t Illumina -m TCGA -d


#make reference
ruby /home/junwoojo/Meteor/meteor-master/data_preparation_tools/MeteorReferenceBuilder.rb -i gene_catalogue.fna -p /home/junwoojo/Project_Darkmatter/Reference/ -n gene_catalogue

#runmeteor
for i in $(ls|grep TCGA);do meteor.rb -w ../../workflow/Darkmatter.ini  -p /home/junwoojo/Project_Darkmatter/Darkmatter/ -o mapping -i ../sample/${i};done


#profiler
meteor-profiler -p /media/user/10T/Project_Darkmatter/Darkmatter_esophagus_blood/
-w ../workflow/Darkmatter.ini
-f /media/user/10T/Project_Darkmatter/Darkmatter_esophagus_blood/profiles/
-t smart_shared_reads 
-o head_neck /media/user/10T/Project_Darkmatter/Darkmatter_esophagus_blood/mapping/*TCGA*/*profile/census.dat
