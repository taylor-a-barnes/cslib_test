module load intel/2017u4
module load intel-mpi/2017u4

cd ../lib
rm -rf cslib_build
mkdir cslib_build
cd cslib_build
cmake ../
make
cd ../

cd ../
rm -rf build
mkdir build
cd build
cmake ../cslib_test
make
