import os
import collections
os.listdir()
my_dict=collections.defaultdict(str)
with open('blast_out') as file:
    for line in file:
        if line.startswith('#'):
            continue
        gene_id=line.split('\t')[0].strip()
        per_ident=line.split('\t')[2].strip()
        qcover=float(line.split('\t')[3])/float(line.split('\t')[12])
        sci_name=line.split('\t')[14]
        if gene_id in  my_dict.keys():
            continue
        if (qcover*100)<90 or float(per_ident)<95:
            my_dict[gene_id]='ambiguous'
            continue
        my_dict[gene_id]=sci_name

with open('species_assign.tsv','w') as file:
    for i in range(1,806883):
        if my_dict[str(i)]=='':
            my_dict[str(i)]='ambiguous'
        file.writelines([str(i),'\t',my_dict[str(i)].strip(),'\n'])    

        
        
msp_dict=collections.defaultdict(list)
n=0
with open('/home/junwoojo/MSPminer/out_put_decontam/all_msps.tsv') as file:
    for line in file:
        n+=1
        if n==1:
            continue
        msp_name=line.split('\t')[0].strip()
        gene_name=line.split('\t')[3].strip()
        msp_dict[msp_name]+=[my_dict[gene_name].strip()]
        
        
        
def species_annotation(counter_dict):
    sorted_list=sorted(counter_dict.items(),key= lambda x: x[1],reverse=True)
    value_sum=sum(counter_dict.values())    
    if sorted_list[0][1]/value_sum >= 0.5:
        return sorted_list[0][0]
    else:
        sorted_list=sorted(counter_dict.items(),key= lambda x: x[1],reverse=True)


annotation_dict=collections.defaultdict(str)
for i,l in msp_dict.items():
    if species_annotation(collections.Counter(l))!=None:
        annotation_dict[i]=species_annotation(collections.Counter(l))
    else:
        genus_list=[i.split()[0] for i in l]
        annotation_dict[i]=species_annotation(collections.Counter(genus_list))
    
with open('/home/junwoojo/msp_annotation.tsv','w') as file:
    for i,l in annotation_dict.items():
        if l==None:
            l='ambiguous'
        file.writelines([i,'\t',l.strip(),'\n'])
