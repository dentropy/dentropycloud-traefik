# audioserve

Tested and working

## Help Command

audioserve 0.15.5
Ivan <ivan.zderadicka@gmail.com>

USAGE:
    audioserve [FLAGS] [OPTIONS] [BASE_DIR]...

FLAGS:
        --allow-symlinks             Will follow symbolic/soft links in collections directories
        --cors                       Enable CORS - enabled any origin of requests
    -d, --debug                      Enable debug logging (detailed logging config can be done via RUST_LOG env.
                                     variable)
        --disable-folder-download    Disables API point for downloading whole folder
    -h, --help                       Prints help information
        --ignore-chapters-meta       Ignore chapters metadata, so files with chapters will not be presented as folders
        --no-authentication          no authentication required - mainly for testing purposes
        --no-dir-collaps             Prevents automatic collaps/skip of directory with single chapterized audio file
        --print-config               Will print current config, with all other options to stdout, usefull for creating
                                     config file
        --search-cache               Caches collections directory structure for quick search, monitors directories for
                                     changes
        --thread-pool-large          Use larger thread pool (usually will not be needed)
    -V, --version                    Prints version information

OPTIONS:
        --chapters-duration <chapters-duration>
            If long files is presented as chapters, one chapter has x mins [default: 30] [env:
            AUDIOSERVE_CHAPTERS_FROM_DURATION=]
        --chapters-from-duration <chapters-from-duration>
            forces split of audio file larger then x mins into chapters (not physically, but it'll be just visible as
            folder with chapters)[default:0 e.g. disabled] [env: AUDIOSERVE_CHAPTERS_FROM_DURATION=]
    -c, --client-dir <client-dir>
            Directory with client files - index.html and bundle.js [env: AUDIOSERVE_CLIENT_DIR=]

    -g, --config <config>
            Configuration file in YAML format [env: AUDIOSERVE_CONFIG=]

        --data-dir <data-dir>
            Base directory for data created by audioserve (caches, state, ...) [default is $HOME/.audioserve] [env:
            AUDIOSERVE_DATA_DIR=]
        --limit-rate <limit-rate>
            Limits number of http request to x req/sec. Assures that resources are not exhausted in case of DDoS (but
            will also limit you). It's bit experimental now. [env: AUDIOSERVE_LIMIT_RATE=]
    -l, --listen <listen>
            Address and port server is listening on as address:port (by default listen on port 3000 on all interfaces)
            [env: AUDIOSERVE_LISTEN=]
        --positions-file <positions-file>
            File to save last listened positions [] [env: AUDIOSERVE_POSITIONS_FILE=]

        --positions-ws-timeout <positions-ws-timeout>
            Timeout in seconds for idle websocket connection use for playback position sharing [default 600s] [env:
            AUDIOSERVE_POSITIONS_WS_TIMEOUT=]
        --secret-file <secret-file>
            Path to file where server secret is kept - it's generated if it does not exists [default: is
            $HOME/.audioserve.secret] [env: AUDIOSERVE_SECRET_FILE=]
    -s, --shared-secret <shared-secret>
            Shared secret for client authentication [env: AUDIOSERVE_SHARED_SECRET=s6nePOj47s73kDMEJtiH7DF6AYS2sp8]

        --shared-secret-file <shared-secret-file>
            File containing shared secret, it's slightly safer to read it from file, then provide as command argument
            [env: AUDIOSERVE_SHARED_SECRET_FILE=]
        --ssl-key <ssl-key>
            TLS/SSL private key and certificate in form of PKCS#12 key file, if provided, https is used [env:
            AUDIOSERVE_SSL_KEY=]
        --ssl-key-password <ssl-key-password>
            Password for TLS/SSL private key [env: AUDIOSERVE_SSL_KEY_PASSWORD=]

        --thread-pool-keep-alive-secs <thread-pool-keep-alive-secs>
            Threads in pool will shutdown after given seconds, if there is no work. Default is to keep threads forever.
            [env: AUDIOSERVE_THREAD_POOL_KEEP_ALIVE=]
        --token-validity-days <token-validity-days>
            Validity of authentication token issued by this server in days[default 365, min 10] [env:
            AUDIOSERVE_TOKEN_VALIDITY_DAYS=]
    -x, --transcoding-max-parallel-processes <transcoding-max-parallel-processes>
            Maximum number of concurrent transcoding processes [default: 2 * number of cores] [env:
            AUDIOSERVE_MAX_PARALLEL_PROCESSES=]
        --transcoding-max-runtime <transcoding-max-runtime>
            Max duration of transcoding process in hours. If takes longer process is killed. Default is 24h [env:
            AUDIOSERVE_TRANSCODING_MAX_RUNTIME=]
        --url-path-prefix <url-path-prefix>
            Base URL is a fixed path that is before audioserve path part, must start with / and not end with /
            [default: none] [env: AUDIOSERVE_URL_PATH_PREFIX=]

ARGS:
    <BASE_DIR>...    Root directories for audio books, also referred as collections [env: AUDIOSERVE_BASE_DIRS=]