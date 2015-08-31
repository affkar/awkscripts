#!/usr/bin/awk -f
# <scriptname> <file1> <file2> <file3>
BEGIN {
    f=""    
    totallinecount=0
    totalwordcount=0
    nooffiles=0
    filelinecount = 0
    filewordcount = 0
    filebytecount = 0
}
{
    if(f != FILENAME){
        if( f != "") { 
            filewordcount=NF
            filelinecount=NR
            print f, filewordcount, filelinecount
        }
        filelinecount = 0
        filewordcount = 0
        filebytecount = 0
        f=FILENAME
        nooffiles++
    }
    totallinecount+=filelinecount
    totalwordcount+=filewordcount 
    #if($0 !~ /total/ ){
    #    if(NF == 9){
    #        print $3, "\t" , $9 
    #    }
    #}
}
END {
    if(nooffiles>0){
     print "Average", totalwordcount/nooffiles, totallinecount/nooffiles
    }
}
