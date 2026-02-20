# Usage

This is intended for quick setup with my favorite configs on Linux machine.

Requires bash, vim, tmux...

```
chmod +x setup.sh
./setup.sh
```

## OBS Studio Configuration

I use Source Record OBS Studio plugin to have better control of what MP4 files
are created by OBS Studio. My setup is that I have one Face Cam video source and
one Screen Capture source, both with Source Record effect filters where recordings
get written to ~/Videos.

But OBS Studio requires a recording path for the scene and still writes an MP4
to this recording path. This recording path is configured in OBS Studio at
 * Settings -> Output -> Recording -> Recording Path

Because of this, recording a scene causes OBS Studio to write an MP4 into this
recording path (eg. ~/), while Source Record writes the Face Cam & Screen Capture MP4s
into ~/Videos. The MP4 at ~/ is useless and is taking up space on my storage that
I would like to free up.

The setup.sh script attempts to solve this problem by installing systemd units that:
 * Monitor /tmp/obs_junk/ directory for new files
 * Remove any new mp4 files written to the directory

Now if you set OBS Studio's recording path to /tmp/obs_junk, the mp4 files written
here will get deleted automatically.
