# SC20 SCC Reproducibility Challenge Instructions

## All work based off of this [SC19 paper](http://impact.crhc.illinois.edu/Shared/Papers/MemXCT_SC19.pdf)

## Compile

**Make Sure Dependencies are Installed**

1. C++ Compiler
2. MPI Compiler

**Modify Makefile**

There are Makefiles for ALCF Theta (Intel KNL) and OLCF Summit (IBM POWER9) systems. You should use one of these to modify according to your system.

## Download Datasets

We provide the challenge datasets over Box. Dimensions (Theta x Rho) and corresponding application memory footprints are given below.

**Test Datasest:**

* ADS1 (360x256): 512 MB
* ADS2 (750x512): 3.6 GB
* ADS3 (1500x1024): 28 GB
* ADS3 (2400x2048): 180 GB

**Challenge Datasets:**
TBA

Each dataset requires a theta file and a sinogram file. Use the code below to directly download datasets to your cluster.

```bash
wget https://uofi.box.com/shared/static/ql76fxfrnec1jdl8dc4f2g4ihwekn9oj -O ADS1_theta.bin
wget https://uofi.box.com/shared/static/zmt3vq5k0jaqgcay4a7yscv2a0viyxlc -O ADS1_sinogram.bin

wget https://uofi.box.com/shared/static/yrsr9brzl6q03bmnunfk65k33ykvfr8o -O ADS2_theta.bin
wget https://uofi.box.com/shared/static/wssrib7ud9na1k5zxxjm3kabd2bcrjwu -O ADS2_sinogram.bin

wget https://uofi.box.com/shared/static/vi1uiecpqqiz7rjtty6fbxxwn1feoib0 -O ADS3_theta.bin
wget https://uofi.box.com/shared/static/icxtknbrndv8i2d83mc87ppjxepty8jz -O ADS3_sinogram.bin

wget https://uofi.box.com/shared/static/tbjk9dksog7qqick66nbcnq4ngais1yd -O ADS4_theta.bin
wget https://uofi.box.com/shared/static/ki7smuurh34cleayvwfxhjfn9mgsnega -O ADS4_sinogram.bin
```


## Run 

Edit input parameters and run the application using run.sh

```bash
#DOMAIN INFORMATION
export NUMTHE= Number of Rotations (according to the input dataset)
export NUMRHO= Number of Channels (according to the input dataset)
export PIXSIZE= Pixel Size (should be 1)
#SOLVER DATA
export NUMITER= Number of Iterations (should be 24)
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE= Spatial Tile Size (tuning parameter, must be a power of two)
export SPECSIZE= Spectral Tile Size (tuning parameter, must be a power of two)
#BLOCK SIZE
export PROJBLOCK= Projection Block Size (tuning parameter)
export BACKBLOCK= Backprojection Block Size (tuning parameter)
#BUFFER SIZE
export PROJBUFF= Projection Buffer Size (tuning parameter)
export BACKBUFF= Backprojection Buffer Size (tuning parameter)
#I/O FILES
export THEFILE= input theta file path
export SINFILE= input sinogram file path
export OUTFILE= output image file path
```

You should see residual error drops in each iteration.

## Verify

Download [Fiji](https://fiji.sc) open source, lightweight, standalone scientific visualization tool. Import the raw image file and inspect the image to verify the code. Sinogram (input) and tomogram (output) test data should look as below.

<table>
  <tr>
    <th>ADS3 Sinogram (1500x1024)</th>
    <th>ADS3 Tomogram (1024x1024)</th>
  </tr>
  <tr valign="top">
    <td style="text-align:center"><img src="https://user-images.githubusercontent.com/15988772/91255215-e59a6e00-e729-11ea-9483-50d80b489984.png" alt="ADS3 Sinogram" width="256" title="ADS3 Sinogram (Input)"></td>
    <td style="text-align:center"><img src="https://user-images.githubusercontent.com/15988772/91255231-ee8b3f80-e729-11ea-8f99-0668a58a3737.png" alt="ADS3 Tomogram" width="256"></td>
  </tr>
</table>
