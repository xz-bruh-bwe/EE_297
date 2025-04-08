<project xmlns="com.autoesl.autopilot.project" name="lenet_proj" top="lenet_top">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="2" lastCsimMode="2"/>
    </Simulation>
    <files xmlns="">
        <file name="../lenet_top_tb.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="lenet_proj/lenet_top.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="lenet_proj/lenet_top.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="lenet_proj/lenet_support.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="lenet_proj/img_5.txt" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../ML_PATH_EE297/EE297_env/projects/weights/conv2_weights.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../ML_PATH_EE297/EE297_env/projects/weights/conv2_biases.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../ML_PATH_EE297/EE297_env/projects/weights/conv1_weights.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../ML_PATH_EE297/EE297_env/projects/weights/conv1_biases.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="lenet" status="active"/>
    </solutions>
</project>

