1. These batch scripts take a video in the format .mkv and they split the video into individual frames as .png files for photo-editing using the ffmpeg utility.

2. What you can then do is achieve a higher level of control over the quality of a frame before stitching them all back together into another .mkv file

3. Deep learning AI programs like REAL-ESRGAN, REAL-CUGAN and other photo editing engines can then process these files with AI and give you back a higher quality version of the frame as well as an upscaled one if you wish to go from say, 1080p to 4k resolutions or even 8k.

4. Once you stitch the frames back together with the frame recompiler, you will get a generic named "1.mkv" file in your chosen directory which will be higher quality than the original input file & if you choose so, higher resolution as well, and it will encoded with the svtav1 codec saving roughly 75% of the space of the original file from the H.264 codec for example. If the original file is hevc or H.265 then the space savings may vary but the quality should be better in my unprofessional opinion.

5. In the frame recompiler script it is very important to note that yuv420p is a color standard that is most common in video standards today, it is a complex topic, just know it is required in some instances to reformat the color space as yuv420p to give information to displays on how pixels should display color for the video, -r refers to refresh rate and if you would like your videos to be the same FPS when recompiled as they were originally then you may need software to gather that information or use the built in tools in windows 10/11 with a right click > properties under the details tab to find it.
