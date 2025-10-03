<project xmlns="com.autoesl.autopilot.project" name="lane_seg_hls" top="lane_seg_top" projectType="C/C++">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../lane_seg_tb.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="lane_seg_hls/lane_seg_decv1.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="lane_seg_hls/lane_seg_support.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="lane_seg_hls/lane_seg_top.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="lane_seg_hls/lane_seg_top.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="lane_seg" status="active"/>
    </solutions>
</project>

