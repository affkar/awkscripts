#!/usr/bin/awk -f
# ls -l output to be piped to this script
#$3 and $9
{
    if($0 !~ /total/ ){
        if(NF == 9){
            print $3, "\t" , $9 
        }
    }
}
