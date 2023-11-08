# Generated by Neurodocker and Reproenv.

FROM ubuntu:jammy-20221130
RUN apt-get update -qq \
           && apt-get install -y -q --no-install-recommends \
                  ca-certificates curl apt-utils gnupg \
           && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_MAJOR 18 
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update -qq \
	&& apt-get install nodejs -y -q --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*
RUN node --version && npm --version && npm install -g bids-validator@1.9.9

# Save specification to JSON.
RUN printf '{ \
  "pkg_manager": "apt", \
  "existing_users": [ \
    "root" \
  ], \
  "instructions": [ \
    { \
      "name": "from_", \
      "kwds": { \
        "base_image": "ubuntu:jammy-20221130" \
      } \
    }, \
    { \
      "name": "install", \
      "kwds": { \
        "pkgs": [ \
          "ca-certificates curl apt-utils" \
        ], \
        "opts": null \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq \\\\\\n    && apt-get install -y -q --no-install-recommends \\\\\\n           ca-certificates curl apt-utils \\\\\\n    && rm -rf /var/lib/apt/lists/*" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "curl -sL https://deb.nodesource.com/setup_18.x | bash -" \
      } \
    }, \
    { \
      "name": "install", \
      "kwds": { \
        "pkgs": [ \
          "nodejs" \
        ], \
        "opts": null \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq \\\\\\n    && apt-get install -y -q --no-install-recommends \\\\\\n           nodejs \\\\\\n    && rm -rf /var/lib/apt/lists/*" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "node --version && npm --version && npm install -g bids-validator@1.9.9" \
      } \
    } \
  ] \
}' > /.reproenv.json
# End saving to specification to JSON.
