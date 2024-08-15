1. These batch scripts take a video in the format .mkv and they split the video into individual frames as .png files for photo-editing using the ffmpeg utility.

2. What you can then do is achieve a higher level of control over the quality of a frame before stitching them all back together into another .mkv file

3. Deep learning AI programs like REAL-ESRGAN, REAL-CUGAN and other photo editing engines can then process these files with AI and give you back a higher quality version of the frame as well as an upscaled one if you wish to go from say, 1080p to 4k resolutions or even 8k.

4. Once you stitch the frames back together with the frame recompiler, you will get a generic named "1.mkv" file in your chosen directory which will be higher quality than the original input file & if you choose so, higher resolution as well, and it will encoded with the svtav1 codec saving roughly 75% of the space of the original file from the H.264 codec for example. If the original file is hevc or H.265 then the space savings may vary but the quality should be better in my unprofessional opinion.
