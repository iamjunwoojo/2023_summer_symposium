import os
import collections
my_dict=collections.defaultdict(list)
os.listdir()


my_dict=collections.defaultdict(list)

k=0
with open('all_msps.tsv') as file:
    for line in file:
        k+=1
        if k==1:
            continue
        msp_name=line.split('\t')[0].strip()
        gene=line.split('\t')[3].strip()
        my_dict[msp_name]+=[gene]
        #         print(line.split('\t')[1])
print(my_dict)



import pandas as pd
df = pd.DataFrame.from_dict(my_dict, orient='index')
df.to_csv('~/msp_gene_bag',sep='\t')
