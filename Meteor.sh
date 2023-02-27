#import sample
ruby /home/junwoojo/Meteor/meteor-master/data_preparation_tools/MeteorImportFastq.rb -i /home/junwoojo/Project_Darkmatter/Darkmatter/sample/ -p Darkmatter -t Illumina -m TCGA -d


#make reference
ruby /home/junwoojo/Meteor/meteor-master/data_preparation_tools/MeteorReferenceBuilder.rb -i gene_catalogue.fna -p /home/junwoojo/Project_Darkmatter/Reference/ -n gene_catalogue

#runmeteor
for i in $(ls|grep TCGA);do meteor.rb -w ../../workflow/Darkmatter.ini  -p /home/junwoojo/Project_Darkmatter/Darkmatter/ -o mapping -i ../sample/${i};done


#profiler
meteor-profiler -p /media/junwoojo/a5640f24-e33b-4688-b37f-1abbd69bdcd0/Project_Darkmatter/Darkmatter_head_neck_blood/ -w ../workflow/Darkmatter.ini  -f /media/junwoojo/a5640f24-e33b-4688-b37f-1abbd69bdcd0/Project_Darkmatter/Darkmatter_head_neck_blood/profiles/ -t smart_shared_reads -o head_neck /media/junwoojo/a5640f24-e33b-4688-b37f-1abbd69bdcd0/Project_Darkmatter/Darkmatter_head_neck_blood/mapping/TCGA-*/*profile/census.dat
