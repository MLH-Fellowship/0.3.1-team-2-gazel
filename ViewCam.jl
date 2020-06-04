module ViewWriteCam
export View, write_to_png

using VideoIO, ImageView, Cairo

function View() 
        camera = VideoIO.opencamera();
        buf = VideoIO.read(camera);
        guidict = ImageView.imshow(buf);
        while !eof(camera)
            VideoIO.read!(camera, buf);
            ImageView.imshow(guidict["gui"]["canvas"], buf);
            sleep(0.00001);
        end
    end

function write_to_png(guidict, filename)
      canvas = guidict["gui"]["canvas"]
      ctx = getgc(canvas)
      Cairo.write_to_png(ctx.surface, filename)
  end
end
#= Instead of using VideoIO which is creating lags as of now which
ranges from 0.5 seconds to 4 seconds, we can use Video4Linux.jl
package.

For running this module use
```
include("ViewCam.jl");
ViewCam.View();
```=#

#= The getgc() function works fine with REPL. I am not sure why it doesn't 
work with the script. =#