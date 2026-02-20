# Usage

This is intended for quick setup with my favorite configs on Linux machine.

Requires bash, vim, tmux...

```
chmod +x setup.sh
./setup.sh
```

## OBS Studio Configuration

OBS Studio requires a recording path for the scene and still writes an MP4
to this recording path. This recording path is configured in OBS Studio at
 * Settings -> Output -> Recording -> Recording Path

But I use an OBS plugin called Source Record to have better control of what MP4 files
are created by OBS Studio. My setup is that I have one Face Cam video source and
one Screen Capture source, both with Source Record effect filters where recordings
get written to ~/Videos.

So, after I start and stop a recording, my file layout looks like this:
 * ~/
  * **'2026-02-19_20-55-03.mp4'**               # written by OBS Studio
  * Videos
   * 'face-cam_2026-02-19_20-55-03.mp4'         # written by Source Record
   * 'screen-capture_2026-02-19_20-55-03.mp4'   # written by Source Record

The mp4 in ~/ is redundant (it is a duplicate of one of the Source Record mp4s)
and is taking of storage space on my PC. So I've designed a solution that
automatically deletes this mp4 written by OBS Studio, and leaves the Source Record
mp4s untouched.

The setup.sh script installs systemd units that do the following:
 * Monitor /tmp/obs_junk/ directory for new files
 * Remove any new mp4 files written to the directory

**Now if you set OBS Studio's recording path to /tmp/obs_junk, the mp4 files written
here will get deleted automatically.**
