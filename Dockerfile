# multi4channels-arm64
ARM64 version of Multi4Channels, a Flask-based app for streaming multiple channels using VLC and FFmpeg.

## Setup
1. Clone the repository: `git clone https://github.com/rice9797/multi4channels-arm64.git`
2. Build the Docker image: `docker buildx build --platform linux/arm64 -t ghcr.io/rice9797/multi4channels-arm64:latest --push .`
3. Or pull from GitHub Container Registry: `docker pull ghcr.io/rice9797/multi4channels-arm64:latest`
4. Run: `docker run --platform linux/arm64 -p 9799:9799 -e VLC_THREADS=4 -e FFMPEG_THREADS=4 ghcr.io/rice9797/multi4channels-arm64:latest`
   - Use `VLC_THREADS` to set CPU cores for VLC mosaic processing (default: auto-detected core count).
   - Use `FFMPEG_THREADS` to set CPU cores for FFmpeg encoding (default: auto-detected core count).

## Notes
- VLC creates the mosaic and outputs raw video; FFmpeg handles encoding (MP4v) and RTP streaming.
- Logs show VLC and FFmpeg thread counts and process status.
- Optimized for ARM64 (e.g., Apple M1/M2) with software encoding due to lack of GPU access in Docker on macOS.
