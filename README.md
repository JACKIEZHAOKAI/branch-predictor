## Working with Docker

docker pull prodromou87/ucsd_cse240a


Mount 本机和docker互通
docker run --rm -it -v /path/to/project/directory:/path/to/mount/point prodromou87/ucsd_cse240a

EX
docker run --rm -it -v /Users/xuzhaokai/Desktop/CSE240A-master:/path/to/mount/point prodromou87/ucsd_cse240a

cd /path/to/mount/point/src

## Running your predictor
`bunzip2 -kc trace.bz2 | ./predictor <options>`

In either case the `<options>` that can be used to change the type of predictor
being run are as follows:

```
  --help       Print usage message
  --verbose    Outputs all predictions made by your
               mechanism. Will be used for correctness
               grading.
  --<type>     Branch prediction scheme. Available
               types are:
        static
        gshare:<# ghistory>
        tournament:<# ghistory>:<# lhistory>:<# index>
        custom
```
root@6830eeda3ec5:/path/to/mount/point/src# bunzip2 -kc ../traces/int_1.bz2 | ./predictor --gshare:1
Branches:           3771697
Incorrect:          1360802
Misprediction Rate:  36.079
 
root@6830eeda3ec5:/path/to/mount/point/src# bunzip2 -kc ../traces/int_1.bz2 | ./predictor --tournament:5:5:5
Branches:           3771697
Incorrect:          1116719
Misprediction Rate:  29.608

root@6830eeda3ec5:/path/to/mount/point/src# bunzip2 -kc ../traces/int_1.bz2 | ./predictor --custom   
Branches:           3771697
Incorrect:           341265
Misprediction Rate:   9.048



## Traces

These predictors will make predictions based on traces of real programs.  Each line in the trace file contains the address of a branch in hex as well as its outcome (Not Taken = 0, Taken = 1):

```
<Address> <Outcome>
Sample Trace from int_1:

0x40d7f9 0
0x40d81e 1
0x40d7f9 1
0x40d81e 0
```

We provide test traces to you to aid in testing your project but we strongly suggest that you create your own custom traces to use for debugging.


