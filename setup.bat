REM ABOUT: This script builds release and debug godot editors from source

git clone --branch 4.2.2-stable https://github.com/godotengine/godot
cd godot/modules

git clone --branch v1.2.0 https://github.com/Zylann/godot_voxel
ren godot_voxel voxel

cd ../..

xcopy "godot" "godot_editor_release\" /E /Y

ren godot godot_editor_debug

cd godot_editor_release
scons target=editor -j3
cd ..

cd godot_editor_debug
scons target=editor vsproj=yes dev_build=yes -j3
cd ..