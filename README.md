# Docker image for libfaketime

This image only contains a single file, `/faketime.so`, built for debian x86-64. It is
meant to let other projects use a pre-compiled `faketime` library.

### Example Dockerfile

```
...


COPY --from=forlabs/libfaketime /faketime.so /faketime.so

# Define LD_PRELOAD here to always use faketime, or set it with '-e' in 
# 'docker run', or with the 'environment' key in a compose file. 
# ENV LD_PRELOAD=/faketime.so


...
```

### Setting up a fake time

To set a fake time, set the `FAKETIME` environment variable
(see https://github.com/wolfcw/libfaketime). For instance, if `LD_PRELOAD` is already
set in the Dockerfile of a given image, one could run something like
`docker run -it -e 'FAKETIME=+15d' <image> <command>` to run `<command>` in `<image>`
at a date 15 days in the future.
