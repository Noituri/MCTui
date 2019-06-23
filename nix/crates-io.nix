{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
# aho-corasick-0.7.3

  crates.aho_corasick."0.7.3" = deps: { features?(features_.aho_corasick."0.7.3" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0dn42fbdms4brigqphxrvzbjd1s4knyjlzky30kgvpnrcl4sqqdv";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.3" or {});
  };
  features_.aho_corasick."0.7.3" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.3".default = (f.aho_corasick."0.7.3".default or true); }
      { "0.7.3".std =
        (f.aho_corasick."0.7.3".std or false) ||
        (f.aho_corasick."0.7.3".default or false) ||
        (aho_corasick."0.7.3"."default" or false); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.3".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.3".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.3"."std" or false) ||
        (f."aho_corasick"."0.7.3"."std" or false); }
      { "${deps.aho_corasick."0.7.3".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.3".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
      { "0.4.10".serde =
        (f.arrayvec."0.4.10".serde or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10".std =
        (f.arrayvec."0.4.10".std or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# autocfg-0.1.4

  crates.autocfg."0.1.4" = deps: { features?(features_.autocfg."0.1.4" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.4";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1xhpq1h2rqhqx95rc20x3wxi5yhv4a62jr269b8dqyhp8r84ss9i";
  };
  features_.autocfg."0.1.4" = deps: f: updateFeatures f (rec {
    autocfg."0.1.4".default = (f.autocfg."0.1.4".default or true);
  }) [];


# end
# backtrace-0.3.31

  crates.backtrace."0.3.31" = deps: { features?(features_.backtrace."0.3.31" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.31";
    authors = [ "The Rust Project Developers" ];
    sha256 = "02yzw7j0016agv6r7az2ax0r5nxdf2fhpdd7iqn4awhj3vg7fvmx";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.31"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.31"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.31"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.31".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.31".backtrace_sys}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.31"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.31" or {});
  };
  features_.backtrace."0.3.31" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.31".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.31".addr2line =
        (f.backtrace."0.3.31".addr2line or false) ||
        (f.backtrace."0.3.31".gimli-symbolize or false) ||
        (backtrace."0.3.31"."gimli-symbolize" or false); }
      { "0.3.31".backtrace-sys =
        (f.backtrace."0.3.31".backtrace-sys or false) ||
        (f.backtrace."0.3.31".libbacktrace or false) ||
        (backtrace."0.3.31"."libbacktrace" or false); }
      { "0.3.31".compiler_builtins =
        (f.backtrace."0.3.31".compiler_builtins or false) ||
        (f.backtrace."0.3.31".rustc-dep-of-std or false) ||
        (backtrace."0.3.31"."rustc-dep-of-std" or false); }
      { "0.3.31".core =
        (f.backtrace."0.3.31".core or false) ||
        (f.backtrace."0.3.31".rustc-dep-of-std or false) ||
        (backtrace."0.3.31"."rustc-dep-of-std" or false); }
      { "0.3.31".dbghelp =
        (f.backtrace."0.3.31".dbghelp or false) ||
        (f.backtrace."0.3.31".default or false) ||
        (backtrace."0.3.31"."default" or false); }
      { "0.3.31".default = (f.backtrace."0.3.31".default or true); }
      { "0.3.31".dladdr =
        (f.backtrace."0.3.31".dladdr or false) ||
        (f.backtrace."0.3.31".default or false) ||
        (backtrace."0.3.31"."default" or false); }
      { "0.3.31".findshlibs =
        (f.backtrace."0.3.31".findshlibs or false) ||
        (f.backtrace."0.3.31".gimli-symbolize or false) ||
        (backtrace."0.3.31"."gimli-symbolize" or false); }
      { "0.3.31".libbacktrace =
        (f.backtrace."0.3.31".libbacktrace or false) ||
        (f.backtrace."0.3.31".default or false) ||
        (backtrace."0.3.31"."default" or false); }
      { "0.3.31".libunwind =
        (f.backtrace."0.3.31".libunwind or false) ||
        (f.backtrace."0.3.31".default or false) ||
        (backtrace."0.3.31"."default" or false); }
      { "0.3.31".memmap =
        (f.backtrace."0.3.31".memmap or false) ||
        (f.backtrace."0.3.31".gimli-symbolize or false) ||
        (backtrace."0.3.31"."gimli-symbolize" or false); }
      { "0.3.31".rustc-serialize =
        (f.backtrace."0.3.31".rustc-serialize or false) ||
        (f.backtrace."0.3.31".serialize-rustc or false) ||
        (backtrace."0.3.31"."serialize-rustc" or false); }
      { "0.3.31".serde =
        (f.backtrace."0.3.31".serde or false) ||
        (f.backtrace."0.3.31".serialize-serde or false) ||
        (backtrace."0.3.31"."serialize-serde" or false); }
      { "0.3.31".serde_derive =
        (f.backtrace."0.3.31".serde_derive or false) ||
        (f.backtrace."0.3.31".serialize-serde or false) ||
        (backtrace."0.3.31"."serialize-serde" or false); }
      { "0.3.31".std =
        (f.backtrace."0.3.31".std or false) ||
        (f.backtrace."0.3.31".default or false) ||
        (backtrace."0.3.31"."default" or false); }
    ];
    backtrace_sys = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.31".backtrace_sys}"."rustc-dep-of-std" =
        (f.backtrace_sys."${deps.backtrace."0.3.31".backtrace_sys}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.31"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.31"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.31".backtrace_sys}".default = true; }
    ];
    cfg_if = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.31".cfg_if}"."rustc-dep-of-std" =
        (f.cfg_if."${deps.backtrace."0.3.31".cfg_if}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.31"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.31"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.31".cfg_if}".default = true; }
    ];
    libc = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.31".libc}"."rustc-dep-of-std" =
        (f.libc."${deps.backtrace."0.3.31".libc}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.31"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.31"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.31".libc}".default = (f.libc."${deps.backtrace."0.3.31".libc}".default or false); }
    ];
    rustc_demangle = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.31".rustc_demangle}"."rustc-dep-of-std" =
        (f.rustc_demangle."${deps.backtrace."0.3.31".rustc_demangle}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.31"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.31"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.31".rustc_demangle}".default = true; }
    ];
  }) [
    (features_.backtrace_sys."${deps."backtrace"."0.3.31"."backtrace_sys"}" deps)
    (features_.cfg_if."${deps."backtrace"."0.3.31"."cfg_if"}" deps)
    (features_.libc."${deps."backtrace"."0.3.31"."libc"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.31"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.31"."autocfg"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bitflags-1.1.0

  crates.bitflags."1.1.0" = deps: { features?(features_.bitflags."1.1.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.1.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1iwa4jrqcf4lnbwl562a3lx3r0jkh1j88b219bsqvbm4sni67dyv";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.1.0" or {});
  };
  features_.bitflags."1.1.0" = deps: f: updateFeatures f (rec {
    bitflags."1.1.0".default = (f.bitflags."1.1.0".default or true);
  }) [];


# end
# block-buffer-0.7.3

  crates.block_buffer."0.7.3" = deps: { features?(features_.block_buffer."0.7.3" deps {}) }: buildRustCrate {
    crateName = "block-buffer";
    version = "0.7.3";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0kryp6l1ia1f5vxmmzggx0pnc5zqxm6m9m9wvh5y0b3wdcj5xm1v";
    dependencies = mapFeatures features ([
      (crates."block_padding"."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
      (crates."byte_tools"."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
      (crates."byteorder"."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
      (crates."generic_array"."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
    ]);
  };
  features_.block_buffer."0.7.3" = deps: f: updateFeatures f (rec {
    block_buffer."0.7.3".default = (f.block_buffer."0.7.3".default or true);
    block_padding."${deps.block_buffer."0.7.3".block_padding}".default = true;
    byte_tools."${deps.block_buffer."0.7.3".byte_tools}".default = true;
    byteorder."${deps.block_buffer."0.7.3".byteorder}".default = (f.byteorder."${deps.block_buffer."0.7.3".byteorder}".default or false);
    generic_array."${deps.block_buffer."0.7.3".generic_array}".default = true;
  }) [
    (features_.block_padding."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
    (features_.byte_tools."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
    (features_.byteorder."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
    (features_.generic_array."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
  ];


# end
# block-padding-0.1.4

  crates.block_padding."0.1.4" = deps: { features?(features_.block_padding."0.1.4" deps {}) }: buildRustCrate {
    crateName = "block-padding";
    version = "0.1.4";
    authors = [ "RustCrypto Developers" ];
    sha256 = "08xvr2spxn614x5scn1wsv8a8daslmj1b3n94n644ygb13gsq8zq";
    dependencies = mapFeatures features ([
      (crates."byte_tools"."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
    ]);
  };
  features_.block_padding."0.1.4" = deps: f: updateFeatures f (rec {
    block_padding."0.1.4".default = (f.block_padding."0.1.4".default or true);
    byte_tools."${deps.block_padding."0.1.4".byte_tools}".default = true;
  }) [
    (features_.byte_tools."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
  ];


# end
# build_const-0.2.1

  crates.build_const."0.2.1" = deps: { features?(features_.build_const."0.2.1" deps {}) }: buildRustCrate {
    crateName = "build_const";
    version = "0.2.1";
    authors = [ "Garrett Berg <vitiral@gmail.com>" ];
    sha256 = "15249xzi3qlm72p4glxgavwyq70fx2sp4df6ii0sdlrixrrp77pl";
    features = mkFeatures (features."build_const"."0.2.1" or {});
  };
  features_.build_const."0.2.1" = deps: f: updateFeatures f (rec {
    build_const = fold recursiveUpdate {} [
      { "0.2.1".default = (f.build_const."0.2.1".default or true); }
      { "0.2.1".std =
        (f.build_const."0.2.1".std or false) ||
        (f.build_const."0.2.1".default or false) ||
        (build_const."0.2.1"."default" or false); }
    ];
  }) [];


# end
# byte-tools-0.3.1

  crates.byte_tools."0.3.1" = deps: { features?(features_.byte_tools."0.3.1" deps {}) }: buildRustCrate {
    crateName = "byte-tools";
    version = "0.3.1";
    authors = [ "RustCrypto Developers" ];
    sha256 = "01hfp59bxq74glhfmhvm9wma2migq2kfmvcvqq5pssk5k52g8ja0";
  };
  features_.byte_tools."0.3.1" = deps: f: updateFeatures f (rec {
    byte_tools."0.3.1".default = (f.byte_tools."0.3.1".default or true);
  }) [];


# end
# byteorder-1.3.2

  crates.byteorder."1.3.2" = deps: { features?(features_.byteorder."1.3.2" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "099fxwc79ncpcl8dgg9hql8gznz11a3sjs7pai0mg6w8r05khvdx";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.2" or {});
  };
  features_.byteorder."1.3.2" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.2".default = (f.byteorder."1.3.2".default or true); }
      { "1.3.2".std =
        (f.byteorder."1.3.2".std or false) ||
        (f.byteorder."1.3.2".default or false) ||
        (byteorder."1.3.2"."default" or false); }
    ];
  }) [];


# end
# bytes-0.4.12

  crates.bytes."0.4.12" = deps: { features?(features_.bytes."0.4.12" deps {}) }: buildRustCrate {
    crateName = "bytes";
    version = "0.4.12";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0cw577vll9qp0h3l1sy24anr5mcnd5j26q9q7nw4f0mddssvfphf";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."bytes"."0.4.12"."byteorder"}" deps)
      (crates."iovec"."${deps."bytes"."0.4.12"."iovec"}" deps)
    ]
      ++ (if features.bytes."0.4.12".either or false then [ (crates.either."${deps."bytes"."0.4.12".either}" deps) ] else []));
    features = mkFeatures (features."bytes"."0.4.12" or {});
  };
  features_.bytes."0.4.12" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "${deps.bytes."0.4.12".byteorder}"."i128" =
        (f.byteorder."${deps.bytes."0.4.12".byteorder}"."i128" or false) ||
        (bytes."0.4.12"."i128" or false) ||
        (f."bytes"."0.4.12"."i128" or false); }
      { "${deps.bytes."0.4.12".byteorder}".default = true; }
    ];
    bytes."0.4.12".default = (f.bytes."0.4.12".default or true);
    either."${deps.bytes."0.4.12".either}".default = (f.either."${deps.bytes."0.4.12".either}".default or false);
    iovec."${deps.bytes."0.4.12".iovec}".default = true;
  }) [
    (features_.byteorder."${deps."bytes"."0.4.12"."byteorder"}" deps)
    (features_.either."${deps."bytes"."0.4.12"."either"}" deps)
    (features_.iovec."${deps."bytes"."0.4.12"."iovec"}" deps)
  ];


# end
# cassowary-0.3.0

  crates.cassowary."0.3.0" = deps: { features?(features_.cassowary."0.3.0" deps {}) }: buildRustCrate {
    crateName = "cassowary";
    version = "0.3.0";
    authors = [ "Dylan Ede <dylanede@googlemail.com>" ];
    sha256 = "1wjm77il8nq51m6r9yynfcgmq651gbv5dpqx5smiqfnf2diij4p8";
  };
  features_.cassowary."0.3.0" = deps: f: updateFeatures f (rec {
    cassowary."0.3.0".default = (f.cassowary."0.3.0".default or true);
  }) [];


# end
# cc-1.0.37

  crates.cc."1.0.37" = deps: { features?(features_.cc."1.0.37" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.37";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1m5s357yi2amgd0kd8chxdcbnscyxwxifmf5hgv92x5xj56b3shj";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.37" or {});
  };
  features_.cc."1.0.37" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.37".default = (f.cc."1.0.37".default or true); }
      { "1.0.37".rayon =
        (f.cc."1.0.37".rayon or false) ||
        (f.cc."1.0.37".parallel or false) ||
        (cc."1.0.37"."parallel" or false); }
    ];
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3".bitflags =
        (f.cloudabi."0.0.3".bitflags or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# cookie-0.12.0

  crates.cookie."0.12.0" = deps: { features?(features_.cookie."0.12.0" deps {}) }: buildRustCrate {
    crateName = "cookie";
    version = "0.12.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0gqz78qlza819xakvakjzlk95bizj48x0aba6819z92777vb5y7g";
    dependencies = mapFeatures features ([
      (crates."time"."${deps."cookie"."0.12.0"."time"}" deps)
    ]
      ++ (if features.cookie."0.12.0".url or false then [ (crates.url."${deps."cookie"."0.12.0".url}" deps) ] else []));
    features = mkFeatures (features."cookie"."0.12.0" or {});
  };
  features_.cookie."0.12.0" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "0.12.0".base64 =
        (f.cookie."0.12.0".base64 or false) ||
        (f.cookie."0.12.0".secure or false) ||
        (cookie."0.12.0"."secure" or false); }
      { "0.12.0".default = (f.cookie."0.12.0".default or true); }
      { "0.12.0".ring =
        (f.cookie."0.12.0".ring or false) ||
        (f.cookie."0.12.0".secure or false) ||
        (cookie."0.12.0"."secure" or false); }
      { "0.12.0".url =
        (f.cookie."0.12.0".url or false) ||
        (f.cookie."0.12.0".percent-encode or false) ||
        (cookie."0.12.0"."percent-encode" or false); }
    ];
    time."${deps.cookie."0.12.0".time}".default = true;
    url."${deps.cookie."0.12.0".url}".default = true;
  }) [
    (features_.time."${deps."cookie"."0.12.0"."time"}" deps)
    (features_.url."${deps."cookie"."0.12.0"."url"}" deps)
  ];


# end
# cookie_store-0.7.0

  crates.cookie_store."0.7.0" = deps: { features?(features_.cookie_store."0.7.0" deps {}) }: buildRustCrate {
    crateName = "cookie_store";
    version = "0.7.0";
    authors = [ "patrick.fernie@gmail.com" ];
    edition = "2018";
    sha256 = "07wycaaplf613hcz4p54xn1s4l2fwhm0yy5xfr6fsfm17p3pkxln";
    dependencies = mapFeatures features ([
      (crates."cookie"."${deps."cookie_store"."0.7.0"."cookie"}" deps)
      (crates."failure"."${deps."cookie_store"."0.7.0"."failure"}" deps)
      (crates."idna"."${deps."cookie_store"."0.7.0"."idna"}" deps)
      (crates."log"."${deps."cookie_store"."0.7.0"."log"}" deps)
      (crates."publicsuffix"."${deps."cookie_store"."0.7.0"."publicsuffix"}" deps)
      (crates."serde"."${deps."cookie_store"."0.7.0"."serde"}" deps)
      (crates."serde_json"."${deps."cookie_store"."0.7.0"."serde_json"}" deps)
      (crates."time"."${deps."cookie_store"."0.7.0"."time"}" deps)
      (crates."try_from"."${deps."cookie_store"."0.7.0"."try_from"}" deps)
      (crates."url"."${deps."cookie_store"."0.7.0"."url"}" deps)
    ]);
  };
  features_.cookie_store."0.7.0" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "${deps.cookie_store."0.7.0".cookie}"."percent-encode" = true; }
      { "${deps.cookie_store."0.7.0".cookie}".default = true; }
    ];
    cookie_store."0.7.0".default = (f.cookie_store."0.7.0".default or true);
    failure."${deps.cookie_store."0.7.0".failure}".default = true;
    idna."${deps.cookie_store."0.7.0".idna}".default = true;
    log."${deps.cookie_store."0.7.0".log}".default = true;
    publicsuffix."${deps.cookie_store."0.7.0".publicsuffix}".default = (f.publicsuffix."${deps.cookie_store."0.7.0".publicsuffix}".default or false);
    serde = fold recursiveUpdate {} [
      { "${deps.cookie_store."0.7.0".serde}"."derive" = true; }
      { "${deps.cookie_store."0.7.0".serde}".default = true; }
    ];
    serde_json."${deps.cookie_store."0.7.0".serde_json}".default = true;
    time."${deps.cookie_store."0.7.0".time}".default = true;
    try_from."${deps.cookie_store."0.7.0".try_from}".default = true;
    url."${deps.cookie_store."0.7.0".url}".default = true;
  }) [
    (features_.cookie."${deps."cookie_store"."0.7.0"."cookie"}" deps)
    (features_.failure."${deps."cookie_store"."0.7.0"."failure"}" deps)
    (features_.idna."${deps."cookie_store"."0.7.0"."idna"}" deps)
    (features_.log."${deps."cookie_store"."0.7.0"."log"}" deps)
    (features_.publicsuffix."${deps."cookie_store"."0.7.0"."publicsuffix"}" deps)
    (features_.serde."${deps."cookie_store"."0.7.0"."serde"}" deps)
    (features_.serde_json."${deps."cookie_store"."0.7.0"."serde_json"}" deps)
    (features_.time."${deps."cookie_store"."0.7.0"."time"}" deps)
    (features_.try_from."${deps."cookie_store"."0.7.0"."try_from"}" deps)
    (features_.url."${deps."cookie_store"."0.7.0"."url"}" deps)
  ];


# end
# core-foundation-0.6.4

  crates.core_foundation."0.6.4" = deps: { features?(features_.core_foundation."0.6.4" deps {}) }: buildRustCrate {
    crateName = "core-foundation";
    version = "0.6.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1kabsqxh01m6l2b1gz8wgn0d1k6fyczww9kaks0sbmsz5g78ngzx";
    dependencies = mapFeatures features ([
      (crates."core_foundation_sys"."${deps."core_foundation"."0.6.4"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."core_foundation"."0.6.4"."libc"}" deps)
    ]);
    features = mkFeatures (features."core_foundation"."0.6.4" or {});
  };
  features_.core_foundation."0.6.4" = deps: f: updateFeatures f (rec {
    core_foundation = fold recursiveUpdate {} [
      { "0.6.4".chrono =
        (f.core_foundation."0.6.4".chrono or false) ||
        (f.core_foundation."0.6.4".with-chrono or false) ||
        (core_foundation."0.6.4"."with-chrono" or false); }
      { "0.6.4".default = (f.core_foundation."0.6.4".default or true); }
      { "0.6.4".uuid =
        (f.core_foundation."0.6.4".uuid or false) ||
        (f.core_foundation."0.6.4".with-uuid or false) ||
        (core_foundation."0.6.4"."with-uuid" or false); }
    ];
    core_foundation_sys = fold recursiveUpdate {} [
      { "${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_7_support" =
        (f.core_foundation_sys."${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_7_support" or false) ||
        (core_foundation."0.6.4"."mac_os_10_7_support" or false) ||
        (f."core_foundation"."0.6.4"."mac_os_10_7_support" or false); }
      { "${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_8_features" =
        (f.core_foundation_sys."${deps.core_foundation."0.6.4".core_foundation_sys}"."mac_os_10_8_features" or false) ||
        (core_foundation."0.6.4"."mac_os_10_8_features" or false) ||
        (f."core_foundation"."0.6.4"."mac_os_10_8_features" or false); }
      { "${deps.core_foundation."0.6.4".core_foundation_sys}".default = true; }
    ];
    libc."${deps.core_foundation."0.6.4".libc}".default = true;
  }) [
    (features_.core_foundation_sys."${deps."core_foundation"."0.6.4"."core_foundation_sys"}" deps)
    (features_.libc."${deps."core_foundation"."0.6.4"."libc"}" deps)
  ];


# end
# core-foundation-sys-0.6.2

  crates.core_foundation_sys."0.6.2" = deps: { features?(features_.core_foundation_sys."0.6.2" deps {}) }: buildRustCrate {
    crateName = "core-foundation-sys";
    version = "0.6.2";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1n2v6wlqkmqwhl7k6y50irx51p37xb0fcm3njbman82gnyq8di2c";
    build = "build.rs";
    features = mkFeatures (features."core_foundation_sys"."0.6.2" or {});
  };
  features_.core_foundation_sys."0.6.2" = deps: f: updateFeatures f (rec {
    core_foundation_sys."0.6.2".default = (f.core_foundation_sys."0.6.2".default or true);
  }) [];


# end
# crc-1.8.1

  crates.crc."1.8.1" = deps: { features?(features_.crc."1.8.1" deps {}) }: buildRustCrate {
    crateName = "crc";
    version = "1.8.1";
    authors = [ "Rui Hu <code@mrhooray.com>" ];
    sha256 = "00m9jjqrddp3bqyanvyxv0hf6s56bx1wy51vcdcxg4n2jdhg109s";

    buildDependencies = mapFeatures features ([
      (crates."build_const"."${deps."crc"."1.8.1"."build_const"}" deps)
    ]);
    features = mkFeatures (features."crc"."1.8.1" or {});
  };
  features_.crc."1.8.1" = deps: f: updateFeatures f (rec {
    build_const."${deps.crc."1.8.1".build_const}".default = true;
    crc = fold recursiveUpdate {} [
      { "1.8.1".default = (f.crc."1.8.1".default or true); }
      { "1.8.1".std =
        (f.crc."1.8.1".std or false) ||
        (f.crc."1.8.1".default or false) ||
        (crc."1.8.1"."default" or false); }
    ];
  }) [
    (features_.build_const."${deps."crc"."1.8.1"."build_const"}" deps)
  ];


# end
# crc32fast-1.2.0

  crates.crc32fast."1.2.0" = deps: { features?(features_.crc32fast."1.2.0" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.2.0";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1mx88ndqln6vzg7hjhjp8b7g0qggpqggsjrlsdqrfsrbpdzffcn8";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crc32fast"."1.2.0" or {});
  };
  features_.crc32fast."1.2.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.2.0".cfg_if}".default = true;
    crc32fast = fold recursiveUpdate {} [
      { "1.2.0".default = (f.crc32fast."1.2.0".default or true); }
      { "1.2.0".std =
        (f.crc32fast."1.2.0".std or false) ||
        (f.crc32fast."1.2.0".default or false) ||
        (crc32fast."1.2.0"."default" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
  ];


# end
# crossbeam-channel-0.3.8

  crates.crossbeam_channel."0.3.8" = deps: { features?(features_.crossbeam_channel."0.3.8" deps {}) }: buildRustCrate {
    crateName = "crossbeam-channel";
    version = "0.3.8";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "0apm8why2qsgr8ykh9x677kc9ml7qp71mvirfkdzdn4c1jyqyyzm";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_channel"."0.3.8"."crossbeam_utils"}" deps)
      (crates."smallvec"."${deps."crossbeam_channel"."0.3.8"."smallvec"}" deps)
    ]);
  };
  features_.crossbeam_channel."0.3.8" = deps: f: updateFeatures f (rec {
    crossbeam_channel."0.3.8".default = (f.crossbeam_channel."0.3.8".default or true);
    crossbeam_utils."${deps.crossbeam_channel."0.3.8".crossbeam_utils}".default = true;
    smallvec."${deps.crossbeam_channel."0.3.8".smallvec}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."crossbeam_channel"."0.3.8"."crossbeam_utils"}" deps)
    (features_.smallvec."${deps."crossbeam_channel"."0.3.8"."smallvec"}" deps)
  ];


# end
# crossbeam-deque-0.7.1

  crates.crossbeam_deque."0.7.1" = deps: { features?(features_.crossbeam_deque."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.7.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "11l7idrx3diksrxbaa13f9h9i6f3456qq3647f3kglxfjmz9bm8s";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.7.1" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.7.1".default = (f.crossbeam_deque."0.7.1".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.7.1".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.7.1".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-epoch-0.7.1

  crates.crossbeam_epoch."0.7.1" = deps: { features?(features_.crossbeam_epoch."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.7.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1n2p8rqsg0g8dws6kvjgi5jsbnd42l45dklnzc8vihjcxa6712bg";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.7.1".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.7.1".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.7.1" or {});
  };
  features_.crossbeam_epoch."0.7.1" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.7.1".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.7.1".default = (f.crossbeam_epoch."0.7.1".default or true); }
      { "0.7.1".lazy_static =
        (f.crossbeam_epoch."0.7.1".lazy_static or false) ||
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (crossbeam_epoch."0.7.1"."std" or false); }
      { "0.7.1".std =
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (f.crossbeam_epoch."0.7.1".default or false) ||
        (crossbeam_epoch."0.7.1"."default" or false); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" or false) ||
        (crossbeam_epoch."0.7.1"."std" or false) ||
        (f."crossbeam_epoch"."0.7.1"."std" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default or false); }
    ];
    lazy_static."${deps.crossbeam_epoch."0.7.1".lazy_static}".default = true;
    memoffset."${deps.crossbeam_epoch."0.7.1".memoffset}".default = true;
    scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default or false);
  }) [
    (features_.arrayvec."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
    (features_.cfg_if."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam_epoch"."0.7.1"."lazy_static"}" deps)
    (features_.memoffset."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
    (features_.scopeguard."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
  ];


# end
# crossbeam-queue-0.1.2

  crates.crossbeam_queue."0.1.2" = deps: { features?(features_.crossbeam_queue."0.1.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-queue";
    version = "0.1.2";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1hannzr5w6j5061kg5iba4fzi6f2xpqv7bkcspfq17y1i8g0mzjj";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_queue."0.1.2" = deps: f: updateFeatures f (rec {
    crossbeam_queue."0.1.2".default = (f.crossbeam_queue."0.1.2".default or true);
    crossbeam_utils."${deps.crossbeam_queue."0.1.2".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-utils-0.6.5

  crates.crossbeam_utils."0.6.5" = deps: { features?(features_.crossbeam_utils."0.6.5" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.6.5";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1z7wgcl9d22r2x6769r5945rnwf3jqfrrmb16q7kzk292r1d4rdg";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    ]
      ++ (if features.crossbeam_utils."0.6.5".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_utils"."0.6.5".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_utils"."0.6.5" or {});
  };
  features_.crossbeam_utils."0.6.5" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.6.5".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.6.5".default = (f.crossbeam_utils."0.6.5".default or true); }
      { "0.6.5".lazy_static =
        (f.crossbeam_utils."0.6.5".lazy_static or false) ||
        (f.crossbeam_utils."0.6.5".std or false) ||
        (crossbeam_utils."0.6.5"."std" or false); }
      { "0.6.5".std =
        (f.crossbeam_utils."0.6.5".std or false) ||
        (f.crossbeam_utils."0.6.5".default or false) ||
        (crossbeam_utils."0.6.5"."default" or false); }
    ];
    lazy_static."${deps.crossbeam_utils."0.6.5".lazy_static}".default = true;
  }) [
    (features_.cfg_if."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    (features_.lazy_static."${deps."crossbeam_utils"."0.6.5"."lazy_static"}" deps)
  ];


# end
# digest-0.8.0

  crates.digest."0.8.0" = deps: { features?(features_.digest."0.8.0" deps {}) }: buildRustCrate {
    crateName = "digest";
    version = "0.8.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "1bsddd8vdmncmprks8b392yccf132wjwzrcy5wdy1kh05qm23il8";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."digest"."0.8.0"."generic_array"}" deps)
    ]);
    features = mkFeatures (features."digest"."0.8.0" or {});
  };
  features_.digest."0.8.0" = deps: f: updateFeatures f (rec {
    digest = fold recursiveUpdate {} [
      { "0.8.0".blobby =
        (f.digest."0.8.0".blobby or false) ||
        (f.digest."0.8.0".dev or false) ||
        (digest."0.8.0"."dev" or false); }
      { "0.8.0".default = (f.digest."0.8.0".default or true); }
    ];
    generic_array."${deps.digest."0.8.0".generic_array}".default = true;
  }) [
    (features_.generic_array."${deps."digest"."0.8.0"."generic_array"}" deps)
  ];


# end
# dtoa-0.4.4

  crates.dtoa."0.4.4" = deps: { features?(features_.dtoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "dtoa";
    version = "0.4.4";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1nbq72nc2kp8lbx6i1ml5ird5c0cy4i6dvm7wfydybmanw4m07xz";
  };
  features_.dtoa."0.4.4" = deps: f: updateFeatures f (rec {
    dtoa."0.4.4".default = (f.dtoa."0.4.4".default or true);
  }) [];


# end
# either-1.5.2

  crates.either."1.5.2" = deps: { features?(features_.either."1.5.2" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.2";
    authors = [ "bluss" ];
    sha256 = "1zqq1057c51f53ga4p9l4dd8ax6md27h1xjrjp2plkvml5iymks5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.2" or {});
  };
  features_.either."1.5.2" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.2".default = (f.either."1.5.2".default or true); }
      { "1.5.2".use_std =
        (f.either."1.5.2".use_std or false) ||
        (f.either."1.5.2".default or false) ||
        (either."1.5.2"."default" or false); }
    ];
  }) [];


# end
# encoding_rs-0.8.17

  crates.encoding_rs."0.8.17" = deps: { features?(features_.encoding_rs."0.8.17" deps {}) }: buildRustCrate {
    crateName = "encoding_rs";
    version = "0.8.17";
    authors = [ "Henri Sivonen <hsivonen@hsivonen.fi>" ];
    sha256 = "0p8afcx1flzr1sz2ja2gvn9c000mb8k7ysy5vv0ia3khac3i30li";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."encoding_rs"."0.8.17"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."encoding_rs"."0.8.17" or {});
  };
  features_.encoding_rs."0.8.17" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.encoding_rs."0.8.17".cfg_if}".default = true;
    encoding_rs = fold recursiveUpdate {} [
      { "0.8.17".default = (f.encoding_rs."0.8.17".default or true); }
      { "0.8.17".fast-big5-hanzi-encode =
        (f.encoding_rs."0.8.17".fast-big5-hanzi-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-gb-hanzi-encode =
        (f.encoding_rs."0.8.17".fast-gb-hanzi-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-hangul-encode =
        (f.encoding_rs."0.8.17".fast-hangul-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-hanja-encode =
        (f.encoding_rs."0.8.17".fast-hanja-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-kanji-encode =
        (f.encoding_rs."0.8.17".fast-kanji-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".packed_simd =
        (f.encoding_rs."0.8.17".packed_simd or false) ||
        (f.encoding_rs."0.8.17".simd-accel or false) ||
        (encoding_rs."0.8.17"."simd-accel" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."encoding_rs"."0.8.17"."cfg_if"}" deps)
  ];


# end
# error-chain-0.12.1

  crates.error_chain."0.12.1" = deps: { features?(features_.error_chain."0.12.1" deps {}) }: buildRustCrate {
    crateName = "error-chain";
    version = "0.12.1";
    authors = [ "Brian Anderson <banderson@mozilla.com>" "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" "Yamakaky <yamakaky@yamaworld.fr>" ];
    sha256 = "1lgs40xn50p0n4yqyryv9gzpvjw7sg355vjqcqmn5ai84rmh14m7";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.error_chain."0.12.1".backtrace or false then [ (crates.backtrace."${deps."error_chain"."0.12.1".backtrace}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."error_chain"."0.12.1"."version_check"}" deps)
    ]);
    features = mkFeatures (features."error_chain"."0.12.1" or {});
  };
  features_.error_chain."0.12.1" = deps: f: updateFeatures f (rec {
    backtrace."${deps.error_chain."0.12.1".backtrace}".default = true;
    error_chain = fold recursiveUpdate {} [
      { "0.12.1".backtrace =
        (f.error_chain."0.12.1".backtrace or false) ||
        (f.error_chain."0.12.1".default or false) ||
        (error_chain."0.12.1"."default" or false); }
      { "0.12.1".default = (f.error_chain."0.12.1".default or true); }
      { "0.12.1".example_generated =
        (f.error_chain."0.12.1".example_generated or false) ||
        (f.error_chain."0.12.1".default or false) ||
        (error_chain."0.12.1"."default" or false); }
    ];
    version_check."${deps.error_chain."0.12.1".version_check}".default = true;
  }) [
    (features_.backtrace."${deps."error_chain"."0.12.1"."backtrace"}" deps)
    (features_.version_check."${deps."error_chain"."0.12.1"."version_check"}" deps)
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5".backtrace =
        (f.failure."0.1.5".backtrace or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
      { "0.1.5".derive =
        (f.failure."0.1.5".derive or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".failure_derive =
        (f.failure."0.1.5".failure_derive or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5".std =
        (f.failure."0.1.5".std or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# fake-simd-0.1.2

  crates.fake_simd."0.1.2" = deps: { features?(features_.fake_simd."0.1.2" deps {}) }: buildRustCrate {
    crateName = "fake-simd";
    version = "0.1.2";
    authors = [ "The Rust-Crypto Project Developers" ];
    sha256 = "1a0f1j66nkwfy17s06vm2bn9vh8vy8llcijfhh9m10p58v08661a";
  };
  features_.fake_simd."0.1.2" = deps: f: updateFeatures f (rec {
    fake_simd."0.1.2".default = (f.fake_simd."0.1.2".default or true);
  }) [];


# end
# flate2-1.0.9

  crates.flate2."1.0.9" = deps: { features?(features_.flate2."1.0.9" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "1.0.9";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1zvi7gxw201p9acgz0bcxlpiagqf26nd7qa57rqim7hgxbi4dpy4";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."flate2"."1.0.9"."crc32fast"}" deps)
      (crates."libc"."${deps."flate2"."1.0.9"."libc"}" deps)
    ]
      ++ (if features.flate2."1.0.9".miniz_oxide_c_api or false then [ (crates.miniz_oxide_c_api."${deps."flate2"."1.0.9".miniz_oxide_c_api}" deps) ] else []))
      ++ (if cpu == "wasm32" && !(kernel == "emscripten") then mapFeatures features ([
      (crates."miniz_oxide_c_api"."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
    ]) else []);
    features = mkFeatures (features."flate2"."1.0.9" or {});
  };
  features_.flate2."1.0.9" = deps: f: updateFeatures f (rec {
    crc32fast."${deps.flate2."1.0.9".crc32fast}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "1.0.9".default = (f.flate2."1.0.9".default or true); }
      { "1.0.9".futures =
        (f.flate2."1.0.9".futures or false) ||
        (f.flate2."1.0.9".tokio or false) ||
        (flate2."1.0.9"."tokio" or false); }
      { "1.0.9".libz-sys =
        (f.flate2."1.0.9".libz-sys or false) ||
        (f.flate2."1.0.9".zlib or false) ||
        (flate2."1.0.9"."zlib" or false); }
      { "1.0.9".miniz-sys =
        (f.flate2."1.0.9".miniz-sys or false) ||
        (f.flate2."1.0.9".default or false) ||
        (flate2."1.0.9"."default" or false); }
      { "1.0.9".miniz_oxide_c_api =
        (f.flate2."1.0.9".miniz_oxide_c_api or false) ||
        (f.flate2."1.0.9".rust_backend or false) ||
        (flate2."1.0.9"."rust_backend" or false); }
      { "1.0.9".tokio-io =
        (f.flate2."1.0.9".tokio-io or false) ||
        (f.flate2."1.0.9".tokio or false) ||
        (flate2."1.0.9"."tokio" or false); }
    ];
    libc."${deps.flate2."1.0.9".libc}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "${deps.flate2."1.0.9".miniz_oxide_c_api}"."no_c_export" =
        (f.miniz_oxide_c_api."${deps.flate2."1.0.9".miniz_oxide_c_api}"."no_c_export" or false) ||
        true ||
        true; }
      { "${deps.flate2."1.0.9".miniz_oxide_c_api}".default = true; }
    ];
  }) [
    (features_.crc32fast."${deps."flate2"."1.0.9"."crc32fast"}" deps)
    (features_.libc."${deps."flate2"."1.0.9"."libc"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
  ];


# end
# fnv-1.0.6

  crates.fnv."1.0.6" = deps: { features?(features_.fnv."1.0.6" deps {}) }: buildRustCrate {
    crateName = "fnv";
    version = "1.0.6";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "128mlh23y3gg6ag5h8iiqlcbl59smisdzraqy88ldrf75kbw27ip";
    libPath = "lib.rs";
  };
  features_.fnv."1.0.6" = deps: f: updateFeatures f (rec {
    fnv."1.0.6".default = (f.fnv."1.0.6".default or true);
  }) [];


# end
# foreign-types-0.3.2

  crates.foreign_types."0.3.2" = deps: { features?(features_.foreign_types."0.3.2" deps {}) }: buildRustCrate {
    crateName = "foreign-types";
    version = "0.3.2";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "105n8sp2djb1s5lzrw04p7ss3dchr5qa3canmynx396nh3vwm2p8";
    dependencies = mapFeatures features ([
      (crates."foreign_types_shared"."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
    ]);
  };
  features_.foreign_types."0.3.2" = deps: f: updateFeatures f (rec {
    foreign_types."0.3.2".default = (f.foreign_types."0.3.2".default or true);
    foreign_types_shared."${deps.foreign_types."0.3.2".foreign_types_shared}".default = true;
  }) [
    (features_.foreign_types_shared."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
  ];


# end
# foreign-types-shared-0.1.1

  crates.foreign_types_shared."0.1.1" = deps: { features?(features_.foreign_types_shared."0.1.1" deps {}) }: buildRustCrate {
    crateName = "foreign-types-shared";
    version = "0.1.1";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0b6cnvqbflws8dxywk4589vgbz80049lz4x1g9dfy4s1ppd3g4z5";
  };
  features_.foreign_types_shared."0.1.1" = deps: f: updateFeatures f (rec {
    foreign_types_shared."0.1.1".default = (f.foreign_types_shared."0.1.1".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0jrf4shb1699r4la8z358vri8318w4mdi6qzfqy30p2ymjlca4gk";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
    ]);
  };
  features_.fuchsia_zircon."0.3.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fuchsia_zircon."0.3.3".bitflags}".default = true;
    fuchsia_zircon."0.3.3".default = (f.fuchsia_zircon."0.3.3".default or true);
    fuchsia_zircon_sys."${deps.fuchsia_zircon."0.3.3".fuchsia_zircon_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
    (features_.fuchsia_zircon_sys."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
  ];


# end
# fuchsia-zircon-sys-0.3.3

  crates.fuchsia_zircon_sys."0.3.3" = deps: { features?(features_.fuchsia_zircon_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon-sys";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# futures-0.1.27

  crates.futures."0.1.27" = deps: { features?(features_.futures."0.1.27" deps {}) }: buildRustCrate {
    crateName = "futures";
    version = "0.1.27";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1rq2znb567a75rgms1b1mws19saf8107clns1vgrk6j94cr7mc45";
    features = mkFeatures (features."futures"."0.1.27" or {});
  };
  features_.futures."0.1.27" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "0.1.27".default = (f.futures."0.1.27".default or true); }
      { "0.1.27".use_std =
        (f.futures."0.1.27".use_std or false) ||
        (f.futures."0.1.27".default or false) ||
        (futures."0.1.27"."default" or false); }
      { "0.1.27".with-deprecated =
        (f.futures."0.1.27".with-deprecated or false) ||
        (f.futures."0.1.27".default or false) ||
        (futures."0.1.27"."default" or false); }
    ];
  }) [];


# end
# futures-cpupool-0.1.8

  crates.futures_cpupool."0.1.8" = deps: { features?(features_.futures_cpupool."0.1.8" deps {}) }: buildRustCrate {
    crateName = "futures-cpupool";
    version = "0.1.8";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0ficd31n5ljiixy6x0vjglhq4fp0v1p4qzxm3v6ymsrb3z080l5c";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
      (crates."num_cpus"."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
    ]);
    features = mkFeatures (features."futures_cpupool"."0.1.8" or {});
  };
  features_.futures_cpupool."0.1.8" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "${deps.futures_cpupool."0.1.8".futures}"."use_std" = true; }
      { "${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" =
        (f.futures."${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" or false) ||
        (futures_cpupool."0.1.8"."with-deprecated" or false) ||
        (f."futures_cpupool"."0.1.8"."with-deprecated" or false); }
      { "${deps.futures_cpupool."0.1.8".futures}".default = (f.futures."${deps.futures_cpupool."0.1.8".futures}".default or false); }
    ];
    futures_cpupool = fold recursiveUpdate {} [
      { "0.1.8".default = (f.futures_cpupool."0.1.8".default or true); }
      { "0.1.8".with-deprecated =
        (f.futures_cpupool."0.1.8".with-deprecated or false) ||
        (f.futures_cpupool."0.1.8".default or false) ||
        (futures_cpupool."0.1.8"."default" or false); }
    ];
    num_cpus."${deps.futures_cpupool."0.1.8".num_cpus}".default = true;
  }) [
    (features_.futures."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
    (features_.num_cpus."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
  ];


# end
# generic-array-0.12.0

  crates.generic_array."0.12.0" = deps: { features?(features_.generic_array."0.12.0" deps {}) }: buildRustCrate {
    crateName = "generic-array";
    version = "0.12.0";
    authors = [ "Bartłomiej Kamiński <fizyk20@gmail.com>" "Aaron Trent <novacrazy@gmail.com>" ];
    sha256 = "12fjpkx1ilqlmynis45g0gh69zkad6jnsc589j64z3idk18lvv91";
    libName = "generic_array";
    dependencies = mapFeatures features ([
      (crates."typenum"."${deps."generic_array"."0.12.0"."typenum"}" deps)
    ]);
  };
  features_.generic_array."0.12.0" = deps: f: updateFeatures f (rec {
    generic_array."0.12.0".default = (f.generic_array."0.12.0".default or true);
    typenum."${deps.generic_array."0.12.0".typenum}".default = true;
  }) [
    (features_.typenum."${deps."generic_array"."0.12.0"."typenum"}" deps)
  ];


# end
# h2-0.1.24

  crates.h2."0.1.24" = deps: { features?(features_.h2."0.1.24" deps {}) }: buildRustCrate {
    crateName = "h2";
    version = "0.1.24";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0q37cw3wizdaziv5jg0pfd3y541ddfd90abg4fhl1r51bxmcxmwf";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."h2"."0.1.24"."byteorder"}" deps)
      (crates."bytes"."${deps."h2"."0.1.24"."bytes"}" deps)
      (crates."fnv"."${deps."h2"."0.1.24"."fnv"}" deps)
      (crates."futures"."${deps."h2"."0.1.24"."futures"}" deps)
      (crates."http"."${deps."h2"."0.1.24"."http"}" deps)
      (crates."indexmap"."${deps."h2"."0.1.24"."indexmap"}" deps)
      (crates."log"."${deps."h2"."0.1.24"."log"}" deps)
      (crates."slab"."${deps."h2"."0.1.24"."slab"}" deps)
      (crates."string"."${deps."h2"."0.1.24"."string"}" deps)
      (crates."tokio_io"."${deps."h2"."0.1.24"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."h2"."0.1.24" or {});
  };
  features_.h2."0.1.24" = deps: f: updateFeatures f (rec {
    byteorder."${deps.h2."0.1.24".byteorder}".default = true;
    bytes."${deps.h2."0.1.24".bytes}".default = true;
    fnv."${deps.h2."0.1.24".fnv}".default = true;
    futures."${deps.h2."0.1.24".futures}".default = true;
    h2."0.1.24".default = (f.h2."0.1.24".default or true);
    http."${deps.h2."0.1.24".http}".default = true;
    indexmap."${deps.h2."0.1.24".indexmap}".default = true;
    log."${deps.h2."0.1.24".log}".default = true;
    slab."${deps.h2."0.1.24".slab}".default = true;
    string."${deps.h2."0.1.24".string}".default = true;
    tokio_io."${deps.h2."0.1.24".tokio_io}".default = true;
  }) [
    (features_.byteorder."${deps."h2"."0.1.24"."byteorder"}" deps)
    (features_.bytes."${deps."h2"."0.1.24"."bytes"}" deps)
    (features_.fnv."${deps."h2"."0.1.24"."fnv"}" deps)
    (features_.futures."${deps."h2"."0.1.24"."futures"}" deps)
    (features_.http."${deps."h2"."0.1.24"."http"}" deps)
    (features_.indexmap."${deps."h2"."0.1.24"."indexmap"}" deps)
    (features_.log."${deps."h2"."0.1.24"."log"}" deps)
    (features_.slab."${deps."h2"."0.1.24"."slab"}" deps)
    (features_.string."${deps."h2"."0.1.24"."string"}" deps)
    (features_.tokio_io."${deps."h2"."0.1.24"."tokio_io"}" deps)
  ];


# end
# http-0.1.17

  crates.http."0.1.17" = deps: { features?(features_.http."0.1.17" deps {}) }: buildRustCrate {
    crateName = "http";
    version = "0.1.17";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Carl Lerche <me@carllerche.com>" "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0q71wgggg1h5kjyg1gb4m70g3ian9qwrkx2b9wwvfyafrkmjpg9c";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."http"."0.1.17"."bytes"}" deps)
      (crates."fnv"."${deps."http"."0.1.17"."fnv"}" deps)
      (crates."itoa"."${deps."http"."0.1.17"."itoa"}" deps)
    ]);
  };
  features_.http."0.1.17" = deps: f: updateFeatures f (rec {
    bytes."${deps.http."0.1.17".bytes}".default = true;
    fnv."${deps.http."0.1.17".fnv}".default = true;
    http."0.1.17".default = (f.http."0.1.17".default or true);
    itoa."${deps.http."0.1.17".itoa}".default = true;
  }) [
    (features_.bytes."${deps."http"."0.1.17"."bytes"}" deps)
    (features_.fnv."${deps."http"."0.1.17"."fnv"}" deps)
    (features_.itoa."${deps."http"."0.1.17"."itoa"}" deps)
  ];


# end
# http-body-0.1.0

  crates.http_body."0.1.0" = deps: { features?(features_.http_body."0.1.0" deps {}) }: buildRustCrate {
    crateName = "http-body";
    version = "0.1.0";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0rbk76455i6l9wrhcgq5p7hbvf9h9fc8ylbfphy4m5qswghly70m";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."http_body"."0.1.0"."bytes"}" deps)
      (crates."futures"."${deps."http_body"."0.1.0"."futures"}" deps)
      (crates."http"."${deps."http_body"."0.1.0"."http"}" deps)
      (crates."tokio_buf"."${deps."http_body"."0.1.0"."tokio_buf"}" deps)
    ]);
  };
  features_.http_body."0.1.0" = deps: f: updateFeatures f (rec {
    bytes."${deps.http_body."0.1.0".bytes}".default = true;
    futures."${deps.http_body."0.1.0".futures}".default = true;
    http."${deps.http_body."0.1.0".http}".default = true;
    http_body."0.1.0".default = (f.http_body."0.1.0".default or true);
    tokio_buf."${deps.http_body."0.1.0".tokio_buf}".default = (f.tokio_buf."${deps.http_body."0.1.0".tokio_buf}".default or false);
  }) [
    (features_.bytes."${deps."http_body"."0.1.0"."bytes"}" deps)
    (features_.futures."${deps."http_body"."0.1.0"."futures"}" deps)
    (features_.http."${deps."http_body"."0.1.0"."http"}" deps)
    (features_.tokio_buf."${deps."http_body"."0.1.0"."tokio_buf"}" deps)
  ];


# end
# httparse-1.3.3

  crates.httparse."1.3.3" = deps: { features?(features_.httparse."1.3.3" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.3";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1jymxy4bl0mzgp2dx0pzqzbr72sw5jmr5sjqiry4xr88z4z9qlyx";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.3" or {});
  };
  features_.httparse."1.3.3" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.3".default = (f.httparse."1.3.3".default or true); }
      { "1.3.3".std =
        (f.httparse."1.3.3".std or false) ||
        (f.httparse."1.3.3".default or false) ||
        (httparse."1.3.3"."default" or false); }
    ];
  }) [];


# end
# hyper-0.12.30

  crates.hyper."0.12.30" = deps: { features?(features_.hyper."0.12.30" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.12.30";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1ip5waagq4x6lqrx8dm53cnxxrr8vmzzjifcj8n7m25rx2h5r260";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper"."0.12.30"."bytes"}" deps)
      (crates."futures"."${deps."hyper"."0.12.30"."futures"}" deps)
      (crates."h2"."${deps."hyper"."0.12.30"."h2"}" deps)
      (crates."http"."${deps."hyper"."0.12.30"."http"}" deps)
      (crates."http_body"."${deps."hyper"."0.12.30"."http_body"}" deps)
      (crates."httparse"."${deps."hyper"."0.12.30"."httparse"}" deps)
      (crates."iovec"."${deps."hyper"."0.12.30"."iovec"}" deps)
      (crates."itoa"."${deps."hyper"."0.12.30"."itoa"}" deps)
      (crates."log"."${deps."hyper"."0.12.30"."log"}" deps)
      (crates."time"."${deps."hyper"."0.12.30"."time"}" deps)
      (crates."tokio_buf"."${deps."hyper"."0.12.30"."tokio_buf"}" deps)
      (crates."tokio_io"."${deps."hyper"."0.12.30"."tokio_io"}" deps)
      (crates."want"."${deps."hyper"."0.12.30"."want"}" deps)
    ]
      ++ (if features.hyper."0.12.30".futures-cpupool or false then [ (crates.futures_cpupool."${deps."hyper"."0.12.30".futures_cpupool}" deps) ] else [])
      ++ (if features.hyper."0.12.30".net2 or false then [ (crates.net2."${deps."hyper"."0.12.30".net2}" deps) ] else [])
      ++ (if features.hyper."0.12.30".tokio or false then [ (crates.tokio."${deps."hyper"."0.12.30".tokio}" deps) ] else [])
      ++ (if features.hyper."0.12.30".tokio-executor or false then [ (crates.tokio_executor."${deps."hyper"."0.12.30".tokio_executor}" deps) ] else [])
      ++ (if features.hyper."0.12.30".tokio-reactor or false then [ (crates.tokio_reactor."${deps."hyper"."0.12.30".tokio_reactor}" deps) ] else [])
      ++ (if features.hyper."0.12.30".tokio-tcp or false then [ (crates.tokio_tcp."${deps."hyper"."0.12.30".tokio_tcp}" deps) ] else [])
      ++ (if features.hyper."0.12.30".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."hyper"."0.12.30".tokio_threadpool}" deps) ] else [])
      ++ (if features.hyper."0.12.30".tokio-timer or false then [ (crates.tokio_timer."${deps."hyper"."0.12.30".tokio_timer}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."hyper"."0.12.30"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."hyper"."0.12.30" or {});
  };
  features_.hyper."0.12.30" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper."0.12.30".bytes}".default = true;
    futures."${deps.hyper."0.12.30".futures}".default = true;
    futures_cpupool."${deps.hyper."0.12.30".futures_cpupool}".default = true;
    h2."${deps.hyper."0.12.30".h2}".default = true;
    http."${deps.hyper."0.12.30".http}".default = true;
    http_body."${deps.hyper."0.12.30".http_body}".default = true;
    httparse."${deps.hyper."0.12.30".httparse}".default = true;
    hyper = fold recursiveUpdate {} [
      { "0.12.30".__internal_flaky_tests =
        (f.hyper."0.12.30".__internal_flaky_tests or false) ||
        (f.hyper."0.12.30".default or false) ||
        (hyper."0.12.30"."default" or false); }
      { "0.12.30".default = (f.hyper."0.12.30".default or true); }
      { "0.12.30".futures-cpupool =
        (f.hyper."0.12.30".futures-cpupool or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".net2 =
        (f.hyper."0.12.30".net2 or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".runtime =
        (f.hyper."0.12.30".runtime or false) ||
        (f.hyper."0.12.30".default or false) ||
        (hyper."0.12.30"."default" or false); }
      { "0.12.30".tokio =
        (f.hyper."0.12.30".tokio or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".tokio-executor =
        (f.hyper."0.12.30".tokio-executor or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".tokio-reactor =
        (f.hyper."0.12.30".tokio-reactor or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".tokio-tcp =
        (f.hyper."0.12.30".tokio-tcp or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".tokio-threadpool =
        (f.hyper."0.12.30".tokio-threadpool or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
      { "0.12.30".tokio-timer =
        (f.hyper."0.12.30".tokio-timer or false) ||
        (f.hyper."0.12.30".runtime or false) ||
        (hyper."0.12.30"."runtime" or false); }
    ];
    iovec."${deps.hyper."0.12.30".iovec}".default = true;
    itoa."${deps.hyper."0.12.30".itoa}".default = true;
    log."${deps.hyper."0.12.30".log}".default = true;
    net2."${deps.hyper."0.12.30".net2}".default = true;
    rustc_version."${deps.hyper."0.12.30".rustc_version}".default = true;
    time."${deps.hyper."0.12.30".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.hyper."0.12.30".tokio}"."rt-full" = true; }
      { "${deps.hyper."0.12.30".tokio}".default = (f.tokio."${deps.hyper."0.12.30".tokio}".default or false); }
    ];
    tokio_buf."${deps.hyper."0.12.30".tokio_buf}".default = true;
    tokio_executor."${deps.hyper."0.12.30".tokio_executor}".default = true;
    tokio_io."${deps.hyper."0.12.30".tokio_io}".default = true;
    tokio_reactor."${deps.hyper."0.12.30".tokio_reactor}".default = true;
    tokio_tcp."${deps.hyper."0.12.30".tokio_tcp}".default = true;
    tokio_threadpool."${deps.hyper."0.12.30".tokio_threadpool}".default = true;
    tokio_timer."${deps.hyper."0.12.30".tokio_timer}".default = true;
    want."${deps.hyper."0.12.30".want}".default = true;
  }) [
    (features_.bytes."${deps."hyper"."0.12.30"."bytes"}" deps)
    (features_.futures."${deps."hyper"."0.12.30"."futures"}" deps)
    (features_.futures_cpupool."${deps."hyper"."0.12.30"."futures_cpupool"}" deps)
    (features_.h2."${deps."hyper"."0.12.30"."h2"}" deps)
    (features_.http."${deps."hyper"."0.12.30"."http"}" deps)
    (features_.http_body."${deps."hyper"."0.12.30"."http_body"}" deps)
    (features_.httparse."${deps."hyper"."0.12.30"."httparse"}" deps)
    (features_.iovec."${deps."hyper"."0.12.30"."iovec"}" deps)
    (features_.itoa."${deps."hyper"."0.12.30"."itoa"}" deps)
    (features_.log."${deps."hyper"."0.12.30"."log"}" deps)
    (features_.net2."${deps."hyper"."0.12.30"."net2"}" deps)
    (features_.time."${deps."hyper"."0.12.30"."time"}" deps)
    (features_.tokio."${deps."hyper"."0.12.30"."tokio"}" deps)
    (features_.tokio_buf."${deps."hyper"."0.12.30"."tokio_buf"}" deps)
    (features_.tokio_executor."${deps."hyper"."0.12.30"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."hyper"."0.12.30"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."hyper"."0.12.30"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."hyper"."0.12.30"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."hyper"."0.12.30"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."hyper"."0.12.30"."tokio_timer"}" deps)
    (features_.want."${deps."hyper"."0.12.30"."want"}" deps)
    (features_.rustc_version."${deps."hyper"."0.12.30"."rustc_version"}" deps)
  ];


# end
# hyper-tls-0.3.2

  crates.hyper_tls."0.3.2" = deps: { features?(features_.hyper_tls."0.3.2" deps {}) }: buildRustCrate {
    crateName = "hyper-tls";
    version = "0.3.2";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "01naqv4zxfj3vzwa5m56vh6l8kg8y8wp8qgc1pm883vsrawa7anx";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper_tls"."0.3.2"."bytes"}" deps)
      (crates."futures"."${deps."hyper_tls"."0.3.2"."futures"}" deps)
      (crates."hyper"."${deps."hyper_tls"."0.3.2"."hyper"}" deps)
      (crates."native_tls"."${deps."hyper_tls"."0.3.2"."native_tls"}" deps)
      (crates."tokio_io"."${deps."hyper_tls"."0.3.2"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."hyper_tls"."0.3.2" or {});
  };
  features_.hyper_tls."0.3.2" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper_tls."0.3.2".bytes}".default = true;
    futures."${deps.hyper_tls."0.3.2".futures}".default = true;
    hyper."${deps.hyper_tls."0.3.2".hyper}".default = true;
    hyper_tls."0.3.2".default = (f.hyper_tls."0.3.2".default or true);
    native_tls = fold recursiveUpdate {} [
      { "${deps.hyper_tls."0.3.2".native_tls}"."vendored" =
        (f.native_tls."${deps.hyper_tls."0.3.2".native_tls}"."vendored" or false) ||
        (hyper_tls."0.3.2"."vendored" or false) ||
        (f."hyper_tls"."0.3.2"."vendored" or false); }
      { "${deps.hyper_tls."0.3.2".native_tls}".default = true; }
    ];
    tokio_io."${deps.hyper_tls."0.3.2".tokio_io}".default = true;
  }) [
    (features_.bytes."${deps."hyper_tls"."0.3.2"."bytes"}" deps)
    (features_.futures."${deps."hyper_tls"."0.3.2"."futures"}" deps)
    (features_.hyper."${deps."hyper_tls"."0.3.2"."hyper"}" deps)
    (features_.native_tls."${deps."hyper_tls"."0.3.2"."native_tls"}" deps)
    (features_.tokio_io."${deps."hyper_tls"."0.3.2"."tokio_io"}" deps)
  ];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    authors = [ "The rust-url developers" ];
    sha256 = "1gwgl19rz5vzi67rrhamczhxy050f5ynx4ybabfapyalv7z1qmjy";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.1.5"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.1.5" = deps: f: updateFeatures f (rec {
    idna."0.1.5".default = (f.idna."0.1.5".default or true);
    matches."${deps.idna."0.1.5".matches}".default = true;
    unicode_bidi."${deps.idna."0.1.5".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.1.5".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.1.5"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
  ];


# end
# indexmap-1.0.2

  crates.indexmap."1.0.2" = deps: { features?(features_.indexmap."1.0.2" deps {}) }: buildRustCrate {
    crateName = "indexmap";
    version = "1.0.2";
    authors = [ "bluss" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "18a0cn5xy3a7wswxg5lwfg3j4sh5blk28ykw0ysgr486djd353gf";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."indexmap"."1.0.2" or {});
  };
  features_.indexmap."1.0.2" = deps: f: updateFeatures f (rec {
    indexmap = fold recursiveUpdate {} [
      { "1.0.2".default = (f.indexmap."1.0.2".default or true); }
      { "1.0.2".serde =
        (f.indexmap."1.0.2".serde or false) ||
        (f.indexmap."1.0.2".serde-1 or false) ||
        (indexmap."1.0.2"."serde-1" or false); }
    ];
  }) [];


# end
# iovec-0.1.2

  crates.iovec."0.1.2" = deps: { features?(features_.iovec."0.1.2" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0vjymmb7wj4v4kza5jjn48fcdb85j3k37y7msjl3ifz0p9yiyp2r";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."iovec"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.2" = deps: f: updateFeatures f (rec {
    iovec."0.1.2".default = (f.iovec."0.1.2".default or true);
    libc."${deps.iovec."0.1.2".libc}".default = true;
    winapi."${deps.iovec."0.1.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."iovec"."0.1.2"."winapi"}" deps)
  ];


# end
# itertools-0.8.0

  crates.itertools."0.8.0" = deps: { features?(features_.itertools."0.8.0" deps {}) }: buildRustCrate {
    crateName = "itertools";
    version = "0.8.0";
    authors = [ "bluss" ];
    sha256 = "0xpz59yf03vyj540i7sqypn2aqfid08c4vzyg0l6rqm08da77n7n";
    dependencies = mapFeatures features ([
      (crates."either"."${deps."itertools"."0.8.0"."either"}" deps)
    ]);
    features = mkFeatures (features."itertools"."0.8.0" or {});
  };
  features_.itertools."0.8.0" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.8.0".either}".default = (f.either."${deps.itertools."0.8.0".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.8.0".default = (f.itertools."0.8.0".default or true); }
      { "0.8.0".use_std =
        (f.itertools."0.8.0".use_std or false) ||
        (f.itertools."0.8.0".default or false) ||
        (itertools."0.8.0"."default" or false); }
    ];
  }) [
    (features_.either."${deps."itertools"."0.8.0"."either"}" deps)
  ];


# end
# itoa-0.4.4

  crates.itoa."0.4.4" = deps: { features?(features_.itoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.4";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1fqc34xzzl2spfdawxd9awhzl0fwf1y6y4i94l8bq8rfrzd90awl";
    features = mkFeatures (features."itoa"."0.4.4" or {});
  };
  features_.itoa."0.4.4" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.4".default = (f.itoa."0.4.4".default or true); }
      { "0.4.4".std =
        (f.itoa."0.4.4".std or false) ||
        (f.itoa."0.4.4".default or false) ||
        (itoa."0.4.4"."default" or false); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
      { "1.3.0".spin =
        (f.lazy_static."1.3.0".spin or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
    ];
  }) [];


# end
# libc-0.2.58

  crates.libc."0.2.58" = deps: { features?(features_.libc."0.2.58" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.58";
    authors = [ "The Rust Project Developers" ];
    sha256 = "06yk3c0qlcn925ap1rrhikpzgwf504ydkcadj41kib7a06f66k7c";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.58" or {});
  };
  features_.libc."0.2.58" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.58".align =
        (f.libc."0.2.58".align or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58".default = (f.libc."0.2.58".default or true); }
      { "0.2.58".rustc-std-workspace-core =
        (f.libc."0.2.58".rustc-std-workspace-core or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58".std =
        (f.libc."0.2.58".std or false) ||
        (f.libc."0.2.58".default or false) ||
        (libc."0.2.58"."default" or false) ||
        (f.libc."0.2.58".use_std or false) ||
        (libc."0.2.58"."use_std" or false); }
    ];
  }) [];


# end
# lock_api-0.1.5

  crates.lock_api."0.1.5" = deps: { features?(features_.lock_api."0.1.5" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.1.5";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "132sidr5hvjfkaqm3l95zpcpi8yk5ddd0g79zf1ad4v65sxirqqm";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
    ]
      ++ (if features.lock_api."0.1.5".owning_ref or false then [ (crates.owning_ref."${deps."lock_api"."0.1.5".owning_ref}" deps) ] else []));
    features = mkFeatures (features."lock_api"."0.1.5" or {});
  };
  features_.lock_api."0.1.5" = deps: f: updateFeatures f (rec {
    lock_api."0.1.5".default = (f.lock_api."0.1.5".default or true);
    owning_ref."${deps.lock_api."0.1.5".owning_ref}".default = true;
    scopeguard."${deps.lock_api."0.1.5".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.1.5".scopeguard}".default or false);
  }) [
    (features_.owning_ref."${deps."lock_api"."0.1.5"."owning_ref"}" deps)
    (features_.scopeguard."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
      { "2.2.0".use_std =
        (f.memchr."2.2.0".use_std or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
    ];
  }) [];


# end
# memoffset-0.2.1

  crates.memoffset."0.2.1" = deps: { features?(features_.memoffset."0.2.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.2.1";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "00vym01jk9slibq2nsiilgffp7n6k52a4q3n4dqp0xf5kzxvffcf";
  };
  features_.memoffset."0.2.1" = deps: f: updateFeatures f (rec {
    memoffset."0.2.1".default = (f.memoffset."0.2.1".default or true);
  }) [];


# end
# mime-0.3.13

  crates.mime."0.3.13" = deps: { features?(features_.mime."0.3.13" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.3.13";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "191b240rj0l8hq2bmn74z1c9rqnrfx0dbfxgyq7vnf3jkrbc5v86";
    dependencies = mapFeatures features ([
      (crates."unicase"."${deps."mime"."0.3.13"."unicase"}" deps)
    ]);
  };
  features_.mime."0.3.13" = deps: f: updateFeatures f (rec {
    mime."0.3.13".default = (f.mime."0.3.13".default or true);
    unicase."${deps.mime."0.3.13".unicase}".default = true;
  }) [
    (features_.unicase."${deps."mime"."0.3.13"."unicase"}" deps)
  ];


# end
# mime_guess-2.0.0-alpha.6

  crates.mime_guess."2.0.0-alpha.6" = deps: { features?(features_.mime_guess."2.0.0-alpha.6" deps {}) }: buildRustCrate {
    crateName = "mime_guess";
    version = "2.0.0-alpha.6";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "1k2mdq43gi2qr63b7m5zs624rfi40ysk33cay49jlhq97jwnk9db";
    dependencies = mapFeatures features ([
      (crates."mime"."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
      (crates."phf"."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."phf_codegen"."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);
    features = mkFeatures (features."mime_guess"."2.0.0-alpha.6" or {});
  };
  features_.mime_guess."2.0.0-alpha.6" = deps: f: updateFeatures f (rec {
    mime."${deps.mime_guess."2.0.0-alpha.6".mime}".default = true;
    mime_guess."2.0.0-alpha.6".default = (f.mime_guess."2.0.0-alpha.6".default or true);
    phf = fold recursiveUpdate {} [
      { "${deps.mime_guess."2.0.0-alpha.6".phf}"."unicase" = true; }
      { "${deps.mime_guess."2.0.0-alpha.6".phf}".default = true; }
    ];
    phf_codegen."${deps.mime_guess."2.0.0-alpha.6".phf_codegen}".default = true;
    unicase."${deps.mime_guess."2.0.0-alpha.6".unicase}".default = true;
  }) [
    (features_.mime."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
    (features_.phf."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    (features_.phf_codegen."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
  ];


# end
# miniz_oxide-0.2.1

  crates.miniz_oxide."0.2.1" = deps: { features?(features_.miniz_oxide."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide";
    version = "0.2.1";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1ly14vlk0gq7czi1323l2dsy5y8dpvdwld4h9083i0y3hx9iyfdz";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
    ]);
  };
  features_.miniz_oxide."0.2.1" = deps: f: updateFeatures f (rec {
    adler32."${deps.miniz_oxide."0.2.1".adler32}".default = true;
    miniz_oxide."0.2.1".default = (f.miniz_oxide."0.2.1".default or true);
  }) [
    (features_.adler32."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
  ];


# end
# miniz_oxide_c_api-0.2.1

  crates.miniz_oxide_c_api."0.2.1" = deps: { features?(features_.miniz_oxide_c_api."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide_c_api";
    version = "0.2.1";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1zsk334nhy2rvyhbr0815l0gp6w40al6rxxafkycaafx3m9j8cj2";
    build = "src/build.rs";
    dependencies = mapFeatures features ([
      (crates."crc"."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
      (crates."libc"."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
      (crates."miniz_oxide"."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
    ]);
    features = mkFeatures (features."miniz_oxide_c_api"."0.2.1" or {});
  };
  features_.miniz_oxide_c_api."0.2.1" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_oxide_c_api."0.2.1".cc}".default = true;
    crc."${deps.miniz_oxide_c_api."0.2.1".crc}".default = true;
    libc."${deps.miniz_oxide_c_api."0.2.1".libc}".default = true;
    miniz_oxide."${deps.miniz_oxide_c_api."0.2.1".miniz_oxide}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "0.2.1".build_orig_miniz =
        (f.miniz_oxide_c_api."0.2.1".build_orig_miniz or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1".build_stub_miniz =
        (f.miniz_oxide_c_api."0.2.1".build_stub_miniz or false) ||
        (f.miniz_oxide_c_api."0.2.1".miniz_zip or false) ||
        (miniz_oxide_c_api."0.2.1"."miniz_zip" or false); }
      { "0.2.1".default = (f.miniz_oxide_c_api."0.2.1".default or true); }
      { "0.2.1".no_c_export =
        (f.miniz_oxide_c_api."0.2.1".no_c_export or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
    ];
  }) [
    (features_.crc."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
    (features_.libc."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
    (features_.miniz_oxide."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    (features_.cc."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
  ];


# end
# mio-0.6.19

  crates.mio."0.6.19" = deps: { features?(features_.mio."0.6.19" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.19";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0pjazzvqwkb4fgmm4b3m8i05c2gq60lvqqia0faawswgqy7rvgac";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.19"."iovec"}" deps)
      (crates."log"."${deps."mio"."0.6.19"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.19"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.19"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.19"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.19"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.19"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.19" or {});
  };
  features_.mio."0.6.19" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.19".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.19".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.19".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.19".kernel32_sys}".default = true;
    libc."${deps.mio."0.6.19".libc}".default = true;
    log."${deps.mio."0.6.19".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.19".default = (f.mio."0.6.19".default or true); }
      { "0.6.19".with-deprecated =
        (f.mio."0.6.19".with-deprecated or false) ||
        (f.mio."0.6.19".default or false) ||
        (mio."0.6.19"."default" or false); }
    ];
    miow."${deps.mio."0.6.19".miow}".default = true;
    net2."${deps.mio."0.6.19".net2}".default = true;
    slab."${deps.mio."0.6.19".slab}".default = true;
    winapi."${deps.mio."0.6.19".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.19"."iovec"}" deps)
    (features_.log."${deps."mio"."0.6.19"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.19"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.19"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.19"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.19"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.19"."winapi"}" deps)
  ];


# end
# miow-0.2.1

  crates.miow."0.2.1" = deps: { features?(features_.miow."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miow";
    version = "0.2.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14f8zkc6ix7mkyis1vsqnim8m29b6l55abkba3p2yz7j1ibcvrl0";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
      (crates."net2"."${deps."miow"."0.2.1"."net2"}" deps)
      (crates."winapi"."${deps."miow"."0.2.1"."winapi"}" deps)
      (crates."ws2_32_sys"."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
    ]);
  };
  features_.miow."0.2.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.miow."0.2.1".kernel32_sys}".default = true;
    miow."0.2.1".default = (f.miow."0.2.1".default or true);
    net2."${deps.miow."0.2.1".net2}".default = (f.net2."${deps.miow."0.2.1".net2}".default or false);
    winapi."${deps.miow."0.2.1".winapi}".default = true;
    ws2_32_sys."${deps.miow."0.2.1".ws2_32_sys}".default = true;
  }) [
    (features_.kernel32_sys."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
    (features_.net2."${deps."miow"."0.2.1"."net2"}" deps)
    (features_.winapi."${deps."miow"."0.2.1"."winapi"}" deps)
    (features_.ws2_32_sys."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
  ];


# end
# native-tls-0.2.3

  crates.native_tls."0.2.3" = deps: { features?(features_.native_tls."0.2.3" deps {}) }: buildRustCrate {
    crateName = "native-tls";
    version = "0.2.3";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19bmkzcj2qvyxchlqa1yg2g5awjmk6sigm20mfwajfcczbq3dc6j";
    dependencies = (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."lazy_static"."${deps."native_tls"."0.2.3"."lazy_static"}" deps)
      (crates."libc"."${deps."native_tls"."0.2.3"."libc"}" deps)
      (crates."security_framework"."${deps."native_tls"."0.2.3"."security_framework"}" deps)
      (crates."security_framework_sys"."${deps."native_tls"."0.2.3"."security_framework_sys"}" deps)
      (crates."tempfile"."${deps."native_tls"."0.2.3"."tempfile"}" deps)
    ]) else [])
      ++ (if !(kernel == "windows" || kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."log"."${deps."native_tls"."0.2.3"."log"}" deps)
      (crates."openssl"."${deps."native_tls"."0.2.3"."openssl"}" deps)
      (crates."openssl_probe"."${deps."native_tls"."0.2.3"."openssl_probe"}" deps)
      (crates."openssl_sys"."${deps."native_tls"."0.2.3"."openssl_sys"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."schannel"."${deps."native_tls"."0.2.3"."schannel"}" deps)
    ]) else []);
    features = mkFeatures (features."native_tls"."0.2.3" or {});
  };
  features_.native_tls."0.2.3" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.native_tls."0.2.3".lazy_static}".default = true;
    libc."${deps.native_tls."0.2.3".libc}".default = true;
    log."${deps.native_tls."0.2.3".log}".default = true;
    native_tls."0.2.3".default = (f.native_tls."0.2.3".default or true);
    openssl."${deps.native_tls."0.2.3".openssl}".default = true;
    openssl_probe."${deps.native_tls."0.2.3".openssl_probe}".default = true;
    openssl_sys."${deps.native_tls."0.2.3".openssl_sys}".default = true;
    schannel."${deps.native_tls."0.2.3".schannel}".default = true;
    security_framework."${deps.native_tls."0.2.3".security_framework}".default = true;
    security_framework_sys."${deps.native_tls."0.2.3".security_framework_sys}".default = true;
    tempfile."${deps.native_tls."0.2.3".tempfile}".default = true;
  }) [
    (features_.lazy_static."${deps."native_tls"."0.2.3"."lazy_static"}" deps)
    (features_.libc."${deps."native_tls"."0.2.3"."libc"}" deps)
    (features_.security_framework."${deps."native_tls"."0.2.3"."security_framework"}" deps)
    (features_.security_framework_sys."${deps."native_tls"."0.2.3"."security_framework_sys"}" deps)
    (features_.tempfile."${deps."native_tls"."0.2.3"."tempfile"}" deps)
    (features_.log."${deps."native_tls"."0.2.3"."log"}" deps)
    (features_.openssl."${deps."native_tls"."0.2.3"."openssl"}" deps)
    (features_.openssl_probe."${deps."native_tls"."0.2.3"."openssl_probe"}" deps)
    (features_.openssl_sys."${deps."native_tls"."0.2.3"."openssl_sys"}" deps)
    (features_.schannel."${deps."native_tls"."0.2.3"."schannel"}" deps)
  ];


# end
# net2-0.2.33

  crates.net2."0.2.33" = deps: { features?(features_.net2."0.2.33" deps {}) }: buildRustCrate {
    crateName = "net2";
    version = "0.2.33";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1qnmajafgybj5wyxz9iffa8x5wgbwd2znfklmhqj7vl6lw1m65mq";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."net2"."0.2.33"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."net2"."0.2.33"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."net2"."0.2.33"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."net2"."0.2.33" or {});
  };
  features_.net2."0.2.33" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.net2."0.2.33".cfg_if}".default = true;
    libc."${deps.net2."0.2.33".libc}".default = true;
    net2 = fold recursiveUpdate {} [
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
      { "0.2.33".duration =
        (f.net2."0.2.33".duration or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.net2."0.2.33".winapi}"."handleapi" = true; }
      { "${deps.net2."0.2.33".winapi}"."winsock2" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2def" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2ipdef" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2tcpip" = true; }
      { "${deps.net2."0.2.33".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."net2"."0.2.33"."cfg_if"}" deps)
    (features_.libc."${deps."net2"."0.2.33"."libc"}" deps)
    (features_.winapi."${deps."net2"."0.2.33"."winapi"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
      { "0.1.13".nodrop-union =
        (f.nodrop."0.1.13".nodrop-union or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13".std =
        (f.nodrop."0.1.13".std or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
    ];
  }) [];


# end
# num_cpus-1.10.1

  crates.num_cpus."1.10.1" = deps: { features?(features_.num_cpus."1.10.1" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.1";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1zi5s2cbnqqb0k0kdd6gqn2x97f9bssv44430h6w28awwzppyh8i";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.1"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.1" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.1".libc}".default = true;
    num_cpus."1.10.1".default = (f.num_cpus."1.10.1".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.1"."libc"}" deps)
  ];


# end
# numtoa-0.1.0

  crates.numtoa."0.1.0" = deps: { features?(features_.numtoa."0.1.0" deps {}) }: buildRustCrate {
    crateName = "numtoa";
    version = "0.1.0";
    authors = [ "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "1i2wxr96bb1rvax15z843126z3bnl2frpx69vxsp95r96wr24j08";
    features = mkFeatures (features."numtoa"."0.1.0" or {});
  };
  features_.numtoa."0.1.0" = deps: f: updateFeatures f (rec {
    numtoa."0.1.0".default = (f.numtoa."0.1.0".default or true);
  }) [];


# end
# opaque-debug-0.2.2

  crates.opaque_debug."0.2.2" = deps: { features?(features_.opaque_debug."0.2.2" deps {}) }: buildRustCrate {
    crateName = "opaque-debug";
    version = "0.2.2";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0dkzsnxpg50gz3gjcdzc4j6g4s0jphllg6q7jqmsy9nd9glidy74";
  };
  features_.opaque_debug."0.2.2" = deps: f: updateFeatures f (rec {
    opaque_debug."0.2.2".default = (f.opaque_debug."0.2.2".default or true);
  }) [];


# end
# openssl-0.10.23

  crates.openssl."0.10.23" = deps: { features?(features_.openssl."0.10.23" deps {}) }: buildRustCrate {
    crateName = "openssl";
    version = "0.10.23";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0hq5snmdf4nk13bx0rldflx3bdksq4x479p648dvin356rgwirwz";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."openssl"."0.10.23"."bitflags"}" deps)
      (crates."cfg_if"."${deps."openssl"."0.10.23"."cfg_if"}" deps)
      (crates."foreign_types"."${deps."openssl"."0.10.23"."foreign_types"}" deps)
      (crates."lazy_static"."${deps."openssl"."0.10.23"."lazy_static"}" deps)
      (crates."libc"."${deps."openssl"."0.10.23"."libc"}" deps)
      (crates."openssl_sys"."${deps."openssl"."0.10.23"."openssl_sys"}" deps)
    ]);
    features = mkFeatures (features."openssl"."0.10.23" or {});
  };
  features_.openssl."0.10.23" = deps: f: updateFeatures f (rec {
    bitflags."${deps.openssl."0.10.23".bitflags}".default = true;
    cfg_if."${deps.openssl."0.10.23".cfg_if}".default = true;
    foreign_types."${deps.openssl."0.10.23".foreign_types}".default = true;
    lazy_static."${deps.openssl."0.10.23".lazy_static}".default = true;
    libc."${deps.openssl."0.10.23".libc}".default = true;
    openssl."0.10.23".default = (f.openssl."0.10.23".default or true);
    openssl_sys = fold recursiveUpdate {} [
      { "${deps.openssl."0.10.23".openssl_sys}"."vendored" =
        (f.openssl_sys."${deps.openssl."0.10.23".openssl_sys}"."vendored" or false) ||
        (openssl."0.10.23"."vendored" or false) ||
        (f."openssl"."0.10.23"."vendored" or false); }
      { "${deps.openssl."0.10.23".openssl_sys}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."openssl"."0.10.23"."bitflags"}" deps)
    (features_.cfg_if."${deps."openssl"."0.10.23"."cfg_if"}" deps)
    (features_.foreign_types."${deps."openssl"."0.10.23"."foreign_types"}" deps)
    (features_.lazy_static."${deps."openssl"."0.10.23"."lazy_static"}" deps)
    (features_.libc."${deps."openssl"."0.10.23"."libc"}" deps)
    (features_.openssl_sys."${deps."openssl"."0.10.23"."openssl_sys"}" deps)
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_.openssl_probe."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_.openssl_probe."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.47

  crates.openssl_sys."0.9.47" = deps: { features?(features_.openssl_sys."0.9.47" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.47";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "018jbl49wm2lmh6lj837cpz1qh1vhfh6bsdzsgbaf2ln1jf71xvc";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.47"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."openssl_sys"."0.9.47"."autocfg"}" deps)
      (crates."cc"."${deps."openssl_sys"."0.9.47"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.47"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.47" or {});
  };
  features_.openssl_sys."0.9.47" = deps: f: updateFeatures f (rec {
    autocfg."${deps.openssl_sys."0.9.47".autocfg}".default = true;
    cc."${deps.openssl_sys."0.9.47".cc}".default = true;
    libc."${deps.openssl_sys."0.9.47".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.47".default = (f.openssl_sys."0.9.47".default or true); }
      { "0.9.47".openssl-src =
        (f.openssl_sys."0.9.47".openssl-src or false) ||
        (f.openssl_sys."0.9.47".vendored or false) ||
        (openssl_sys."0.9.47"."vendored" or false); }
    ];
    pkg_config."${deps.openssl_sys."0.9.47".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.47"."libc"}" deps)
    (features_.autocfg."${deps."openssl_sys"."0.9.47"."autocfg"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.47"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.47"."pkg_config"}" deps)
  ];


# end
# owning_ref-0.4.0

  crates.owning_ref."0.4.0" = deps: { features?(features_.owning_ref."0.4.0" deps {}) }: buildRustCrate {
    crateName = "owning_ref";
    version = "0.4.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1m95qpc3hamkw9wlbfzqkzk7h6skyj40zr6sa3ps151slcfnnchm";
    dependencies = mapFeatures features ([
      (crates."stable_deref_trait"."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
    ]);
  };
  features_.owning_ref."0.4.0" = deps: f: updateFeatures f (rec {
    owning_ref."0.4.0".default = (f.owning_ref."0.4.0".default or true);
    stable_deref_trait."${deps.owning_ref."0.4.0".stable_deref_trait}".default = true;
  }) [
    (features_.stable_deref_trait."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
  ];


# end
# parking_lot-0.7.1

  crates.parking_lot."0.7.1" = deps: { features?(features_.parking_lot."0.7.1" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.7.1";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1qpb49xd176hqqabxdb48f1hvylfbf68rpz8yfrhw0x68ys0lkq1";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.7.1" or {});
  };
  features_.parking_lot."0.7.1" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.7.1"."owning_ref" or false) ||
        (f."parking_lot"."0.7.1"."owning_ref" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}".default = true; }
    ];
    parking_lot = fold recursiveUpdate {} [
      { "0.7.1".default = (f.parking_lot."0.7.1".default or true); }
      { "0.7.1".owning_ref =
        (f.parking_lot."0.7.1".owning_ref or false) ||
        (f.parking_lot."0.7.1".default or false) ||
        (parking_lot."0.7.1"."default" or false); }
    ];
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.7.1"."deadlock_detection" or false) ||
        (f."parking_lot"."0.7.1"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}".default = true; }
    ];
  }) [
    (features_.lock_api."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
    (features_.parking_lot_core."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
  ];


# end
# parking_lot_core-0.4.0

  crates.parking_lot_core."0.4.0" = deps: { features?(features_.parking_lot_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.4.0";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1mzk5i240ddvhwnz65hhjk4cq61z235g1n8bd7al4mg6vx437c16";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.4.0" or {});
  };
  features_.parking_lot_core."0.4.0" = deps: f: updateFeatures f (rec {
    libc."${deps.parking_lot_core."0.4.0".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.4.0".backtrace =
        (f.parking_lot_core."0.4.0".backtrace or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".default = (f.parking_lot_core."0.4.0".default or true); }
      { "0.4.0".petgraph =
        (f.parking_lot_core."0.4.0".petgraph or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".thread-id =
        (f.parking_lot_core."0.4.0".thread-id or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
    ];
    rand."${deps.parking_lot_core."0.4.0".rand}".default = true;
    rustc_version."${deps.parking_lot_core."0.4.0".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.4.0".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.4.0".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}".default = true; }
    ];
  }) [
    (features_.rand."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
    (features_.smallvec."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    (features_.rustc_version."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    (features_.libc."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    (features_.winapi."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
  ];


# end
# percent-encoding-1.0.1

  crates.percent_encoding."1.0.1" = deps: { features?(features_.percent_encoding."1.0.1" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "1.0.1";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# phf-0.7.24

  crates.phf."0.7.24" = deps: { features?(features_.phf."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19mmhmafd1dhywc7pzkmd1nq0kjfvg57viny20jqa91hhprf2dv5";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf"."0.7.24"."phf_shared"}" deps)
    ]);
    features = mkFeatures (features."phf"."0.7.24" or {});
  };
  features_.phf."0.7.24" = deps: f: updateFeatures f (rec {
    phf = fold recursiveUpdate {} [
      { "0.7.24".default = (f.phf."0.7.24".default or true); }
      { "0.7.24".phf_macros =
        (f.phf."0.7.24".phf_macros or false) ||
        (f.phf."0.7.24".macros or false) ||
        (phf."0.7.24"."macros" or false); }
    ];
    phf_shared = fold recursiveUpdate {} [
      { "${deps.phf."0.7.24".phf_shared}"."core" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."core" or false) ||
        (phf."0.7.24"."core" or false) ||
        (f."phf"."0.7.24"."core" or false); }
      { "${deps.phf."0.7.24".phf_shared}"."unicase" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."unicase" or false) ||
        (phf."0.7.24"."unicase" or false) ||
        (f."phf"."0.7.24"."unicase" or false); }
      { "${deps.phf."0.7.24".phf_shared}".default = true; }
    ];
  }) [
    (features_.phf_shared."${deps."phf"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_codegen-0.7.24

  crates.phf_codegen."0.7.24" = deps: { features?(features_.phf_codegen."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_codegen";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0avkx97r4ph8rv70wwgniarlcfiq27yd74gmnxfdv3rx840cyf8g";
    dependencies = mapFeatures features ([
      (crates."phf_generator"."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
      (crates."phf_shared"."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
    ]);
  };
  features_.phf_codegen."0.7.24" = deps: f: updateFeatures f (rec {
    phf_codegen."0.7.24".default = (f.phf_codegen."0.7.24".default or true);
    phf_generator."${deps.phf_codegen."0.7.24".phf_generator}".default = true;
    phf_shared."${deps.phf_codegen."0.7.24".phf_shared}".default = true;
  }) [
    (features_.phf_generator."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
    (features_.phf_shared."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_generator-0.7.24

  crates.phf_generator."0.7.24" = deps: { features?(features_.phf_generator."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_generator";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1frn2jfydinifxb1fki0xnnsxf0f1ciaa79jz415r5qhw1ash72j";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
      (crates."rand"."${deps."phf_generator"."0.7.24"."rand"}" deps)
    ]);
  };
  features_.phf_generator."0.7.24" = deps: f: updateFeatures f (rec {
    phf_generator."0.7.24".default = (f.phf_generator."0.7.24".default or true);
    phf_shared."${deps.phf_generator."0.7.24".phf_shared}".default = true;
    rand."${deps.phf_generator."0.7.24".rand}".default = true;
  }) [
    (features_.phf_shared."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
    (features_.rand."${deps."phf_generator"."0.7.24"."rand"}" deps)
  ];


# end
# phf_shared-0.7.24

  crates.phf_shared."0.7.24" = deps: { features?(features_.phf_shared."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_shared";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1hndqn461jvm2r269ym4qh7fnjc6n8yy53avc2pb43p70vxhm9rl";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."siphasher"."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    ]
      ++ (if features.phf_shared."0.7.24".unicase or false then [ (crates.unicase."${deps."phf_shared"."0.7.24".unicase}" deps) ] else []));
    features = mkFeatures (features."phf_shared"."0.7.24" or {});
  };
  features_.phf_shared."0.7.24" = deps: f: updateFeatures f (rec {
    phf_shared."0.7.24".default = (f.phf_shared."0.7.24".default or true);
    siphasher."${deps.phf_shared."0.7.24".siphasher}".default = true;
    unicase."${deps.phf_shared."0.7.24".unicase}".default = true;
  }) [
    (features_.siphasher."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    (features_.unicase."${deps."phf_shared"."0.7.24"."unicase"}" deps)
  ];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_.proc_macro2."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_.proc_macro2."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
      { "0.4.30".proc-macro =
        (f.proc_macro2."0.4.30".proc-macro or false) ||
        (f.proc_macro2."0.4.30".default or false) ||
        (proc_macro2."0.4.30"."default" or false); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
  ];


# end
# publicsuffix-1.5.2

  crates.publicsuffix."1.5.2" = deps: { features?(features_.publicsuffix."1.5.2" deps {}) }: buildRustCrate {
    crateName = "publicsuffix";
    version = "1.5.2";
    authors = [ "rushmorem <rushmore@webenchanter.com>" ];
    sha256 = "0iind4s270k5fvw0qjsvwndrp2rr6nypz83xy3ljsajidydxjh3r";
    dependencies = mapFeatures features ([
      (crates."error_chain"."${deps."publicsuffix"."1.5.2"."error_chain"}" deps)
      (crates."idna"."${deps."publicsuffix"."1.5.2"."idna"}" deps)
      (crates."lazy_static"."${deps."publicsuffix"."1.5.2"."lazy_static"}" deps)
      (crates."regex"."${deps."publicsuffix"."1.5.2"."regex"}" deps)
      (crates."url"."${deps."publicsuffix"."1.5.2"."url"}" deps)
    ]);
    features = mkFeatures (features."publicsuffix"."1.5.2" or {});
  };
  features_.publicsuffix."1.5.2" = deps: f: updateFeatures f (rec {
    error_chain."${deps.publicsuffix."1.5.2".error_chain}".default = true;
    idna."${deps.publicsuffix."1.5.2".idna}".default = true;
    lazy_static."${deps.publicsuffix."1.5.2".lazy_static}".default = true;
    publicsuffix = fold recursiveUpdate {} [
      { "1.5.2".default = (f.publicsuffix."1.5.2".default or true); }
      { "1.5.2".native-tls =
        (f.publicsuffix."1.5.2".native-tls or false) ||
        (f.publicsuffix."1.5.2".remote_list or false) ||
        (publicsuffix."1.5.2"."remote_list" or false); }
      { "1.5.2".remote_list =
        (f.publicsuffix."1.5.2".remote_list or false) ||
        (f.publicsuffix."1.5.2".default or false) ||
        (publicsuffix."1.5.2"."default" or false); }
    ];
    regex."${deps.publicsuffix."1.5.2".regex}".default = true;
    url."${deps.publicsuffix."1.5.2".url}".default = true;
  }) [
    (features_.error_chain."${deps."publicsuffix"."1.5.2"."error_chain"}" deps)
    (features_.idna."${deps."publicsuffix"."1.5.2"."idna"}" deps)
    (features_.lazy_static."${deps."publicsuffix"."1.5.2"."lazy_static"}" deps)
    (features_.regex."${deps."publicsuffix"."1.5.2"."regex"}" deps)
    (features_.url."${deps."publicsuffix"."1.5.2"."url"}" deps)
  ];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
      { "0.6.12".proc-macro =
        (f.quote."0.6.12".proc-macro or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5".alloc =
        (f.rand."0.6.5".alloc or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
      { "0.6.5".packed_simd =
        (f.rand."0.6.5".packed_simd or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5".rand_os =
        (f.rand."0.6.5".rand_os or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".simd_support =
        (f.rand."0.6.5".simd_support or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5".std =
        (f.rand."0.6.5".std or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
      { "0.3.1".std =
        (f.rand_core."0.3.1".std or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0".alloc =
        (f.rand_core."0.4.0".alloc or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
      { "0.4.0".serde =
        (f.rand_core."0.4.0".serde or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".serde_derive =
        (f.rand_core."0.4.0".serde_derive or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_isaac."0.1.1".serde or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_isaac."0.1.1".serde_derive or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
      { "0.1.2".serde =
        (f.rand_pcg."0.1.2".serde or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".serde_derive =
        (f.rand_pcg."0.1.2".serde_derive or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_xorshift."0.1.1".serde or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_xorshift."0.1.1".serde_derive or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
      { "0.4.0".std =
        (f.rdrand."0.4.0".std or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.54

  crates.redox_syscall."0.1.54" = deps: { features?(features_.redox_syscall."0.1.54" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.54";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1ndcp7brnvii87ndcd34fk846498r07iznphkslcy0shic9cp4rr";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.54" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.54".default = (f.redox_syscall."0.1.54".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
  ];


# end
# regex-1.1.7

  crates.regex."1.1.7" = deps: { features?(features_.regex."1.1.7" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.7";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0pli9vvh1h3880648z5213mfw2dk87xbcvga01xwi3qgjcg89lni";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.7"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.7"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.7"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.7"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.7"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.7" or {});
  };
  features_.regex."1.1.7" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.7".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.7".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.7".default = (f.regex."1.1.7".default or true); }
      { "1.1.7".pattern =
        (f.regex."1.1.7".pattern or false) ||
        (f.regex."1.1.7".unstable or false) ||
        (regex."1.1.7"."unstable" or false); }
      { "1.1.7".use_std =
        (f.regex."1.1.7".use_std or false) ||
        (f.regex."1.1.7".default or false) ||
        (regex."1.1.7"."default" or false); }
    ];
    regex_syntax."${deps.regex."1.1.7".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.7".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.7".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.7"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.7"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.7"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.7"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.7"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.7

  crates.regex_syntax."0.6.7" = deps: { features?(features_.regex_syntax."0.6.7" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.7";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1vv0d9p9djkz0kfg1ajd1p3j3dsiq78nnqsvl3ivygasj3llqb9x";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.7"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.7" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.7".default = (f.regex_syntax."0.6.7".default or true);
    ucd_util."${deps.regex_syntax."0.6.7".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.7"."ucd_util"}" deps)
  ];


# end
# remove_dir_all-0.5.2

  crates.remove_dir_all."0.5.2" = deps: { features?(features_.remove_dir_all."0.5.2" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.2";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "04sxg2ppvxiljc2i13bwvpbi540rf9d2a89cq0wmqf9pjvr3a1wm";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.2" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.2".default = (f.remove_dir_all."0.5.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.2".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
  ];


# end
# reqwest-0.9.18

  crates.reqwest."0.9.18" = deps: { features?(features_.reqwest."0.9.18" deps {}) }: buildRustCrate {
    crateName = "reqwest";
    version = "0.9.18";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1hkpzy309cl96ydph9aanq7kmy182s1l8h8hsvfzwpis8l2714m0";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."reqwest"."0.9.18"."base64"}" deps)
      (crates."bytes"."${deps."reqwest"."0.9.18"."bytes"}" deps)
      (crates."cookie"."${deps."reqwest"."0.9.18"."cookie"}" deps)
      (crates."cookie_store"."${deps."reqwest"."0.9.18"."cookie_store"}" deps)
      (crates."encoding_rs"."${deps."reqwest"."0.9.18"."encoding_rs"}" deps)
      (crates."flate2"."${deps."reqwest"."0.9.18"."flate2"}" deps)
      (crates."futures"."${deps."reqwest"."0.9.18"."futures"}" deps)
      (crates."http"."${deps."reqwest"."0.9.18"."http"}" deps)
      (crates."hyper"."${deps."reqwest"."0.9.18"."hyper"}" deps)
      (crates."log"."${deps."reqwest"."0.9.18"."log"}" deps)
      (crates."mime"."${deps."reqwest"."0.9.18"."mime"}" deps)
      (crates."mime_guess"."${deps."reqwest"."0.9.18"."mime_guess"}" deps)
      (crates."serde"."${deps."reqwest"."0.9.18"."serde"}" deps)
      (crates."serde_json"."${deps."reqwest"."0.9.18"."serde_json"}" deps)
      (crates."serde_urlencoded"."${deps."reqwest"."0.9.18"."serde_urlencoded"}" deps)
      (crates."time"."${deps."reqwest"."0.9.18"."time"}" deps)
      (crates."tokio"."${deps."reqwest"."0.9.18"."tokio"}" deps)
      (crates."tokio_executor"."${deps."reqwest"."0.9.18"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."reqwest"."0.9.18"."tokio_io"}" deps)
      (crates."tokio_threadpool"."${deps."reqwest"."0.9.18"."tokio_threadpool"}" deps)
      (crates."tokio_timer"."${deps."reqwest"."0.9.18"."tokio_timer"}" deps)
      (crates."url"."${deps."reqwest"."0.9.18"."url"}" deps)
      (crates."uuid"."${deps."reqwest"."0.9.18"."uuid"}" deps)
    ]
      ++ (if features.reqwest."0.9.18".hyper-tls or false then [ (crates.hyper_tls."${deps."reqwest"."0.9.18".hyper_tls}" deps) ] else [])
      ++ (if features.reqwest."0.9.18".native-tls or false then [ (crates.native_tls."${deps."reqwest"."0.9.18".native_tls}" deps) ] else []));
    features = mkFeatures (features."reqwest"."0.9.18" or {});
  };
  features_.reqwest."0.9.18" = deps: f: updateFeatures f (rec {
    base64."${deps.reqwest."0.9.18".base64}".default = true;
    bytes."${deps.reqwest."0.9.18".bytes}".default = true;
    cookie."${deps.reqwest."0.9.18".cookie}".default = true;
    cookie_store."${deps.reqwest."0.9.18".cookie_store}".default = true;
    encoding_rs."${deps.reqwest."0.9.18".encoding_rs}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".flate2}"."rust_backend" = true; }
      { "${deps.reqwest."0.9.18".flate2}".default = (f.flate2."${deps.reqwest."0.9.18".flate2}".default or false); }
    ];
    futures."${deps.reqwest."0.9.18".futures}".default = true;
    http."${deps.reqwest."0.9.18".http}".default = true;
    hyper."${deps.reqwest."0.9.18".hyper}".default = true;
    hyper_tls."${deps.reqwest."0.9.18".hyper_tls}".default = true;
    log."${deps.reqwest."0.9.18".log}".default = true;
    mime."${deps.reqwest."0.9.18".mime}".default = true;
    mime_guess."${deps.reqwest."0.9.18".mime_guess}".default = true;
    native_tls = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".native_tls}"."vendored" =
        (f.native_tls."${deps.reqwest."0.9.18".native_tls}"."vendored" or false) ||
        (reqwest."0.9.18"."default-tls-vendored" or false) ||
        (f."reqwest"."0.9.18"."default-tls-vendored" or false); }
      { "${deps.reqwest."0.9.18".native_tls}".default = true; }
    ];
    reqwest = fold recursiveUpdate {} [
      { "0.9.18".default = (f.reqwest."0.9.18".default or true); }
      { "0.9.18".default-tls =
        (f.reqwest."0.9.18".default-tls or false) ||
        (f.reqwest."0.9.18".default or false) ||
        (reqwest."0.9.18"."default" or false) ||
        (f.reqwest."0.9.18".default-tls-vendored or false) ||
        (reqwest."0.9.18"."default-tls-vendored" or false); }
      { "0.9.18".hyper-old-types =
        (f.reqwest."0.9.18".hyper-old-types or false) ||
        (f.reqwest."0.9.18".hyper-011 or false) ||
        (reqwest."0.9.18"."hyper-011" or false); }
      { "0.9.18".hyper-rustls =
        (f.reqwest."0.9.18".hyper-rustls or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".hyper-tls =
        (f.reqwest."0.9.18".hyper-tls or false) ||
        (f.reqwest."0.9.18".default-tls or false) ||
        (reqwest."0.9.18"."default-tls" or false); }
      { "0.9.18".native-tls =
        (f.reqwest."0.9.18".native-tls or false) ||
        (f.reqwest."0.9.18".default-tls or false) ||
        (reqwest."0.9.18"."default-tls" or false); }
      { "0.9.18".rustls =
        (f.reqwest."0.9.18".rustls or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".tls =
        (f.reqwest."0.9.18".tls or false) ||
        (f.reqwest."0.9.18".default-tls or false) ||
        (reqwest."0.9.18"."default-tls" or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".tokio-rustls =
        (f.reqwest."0.9.18".tokio-rustls or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".trust-dns-resolver =
        (f.reqwest."0.9.18".trust-dns-resolver or false) ||
        (f.reqwest."0.9.18".trust-dns or false) ||
        (reqwest."0.9.18"."trust-dns" or false); }
      { "0.9.18".webpki-roots =
        (f.reqwest."0.9.18".webpki-roots or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
    ];
    serde."${deps.reqwest."0.9.18".serde}".default = true;
    serde_json."${deps.reqwest."0.9.18".serde_json}".default = true;
    serde_urlencoded."${deps.reqwest."0.9.18".serde_urlencoded}".default = true;
    time."${deps.reqwest."0.9.18".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".tokio}"."rt-full" = true; }
      { "${deps.reqwest."0.9.18".tokio}"."tcp" = true; }
      { "${deps.reqwest."0.9.18".tokio}".default = (f.tokio."${deps.reqwest."0.9.18".tokio}".default or false); }
    ];
    tokio_executor."${deps.reqwest."0.9.18".tokio_executor}".default = true;
    tokio_io."${deps.reqwest."0.9.18".tokio_io}".default = true;
    tokio_threadpool."${deps.reqwest."0.9.18".tokio_threadpool}".default = true;
    tokio_timer."${deps.reqwest."0.9.18".tokio_timer}".default = true;
    url."${deps.reqwest."0.9.18".url}".default = true;
    uuid = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".uuid}"."v4" = true; }
      { "${deps.reqwest."0.9.18".uuid}".default = true; }
    ];
  }) [
    (features_.base64."${deps."reqwest"."0.9.18"."base64"}" deps)
    (features_.bytes."${deps."reqwest"."0.9.18"."bytes"}" deps)
    (features_.cookie."${deps."reqwest"."0.9.18"."cookie"}" deps)
    (features_.cookie_store."${deps."reqwest"."0.9.18"."cookie_store"}" deps)
    (features_.encoding_rs."${deps."reqwest"."0.9.18"."encoding_rs"}" deps)
    (features_.flate2."${deps."reqwest"."0.9.18"."flate2"}" deps)
    (features_.futures."${deps."reqwest"."0.9.18"."futures"}" deps)
    (features_.http."${deps."reqwest"."0.9.18"."http"}" deps)
    (features_.hyper."${deps."reqwest"."0.9.18"."hyper"}" deps)
    (features_.hyper_tls."${deps."reqwest"."0.9.18"."hyper_tls"}" deps)
    (features_.log."${deps."reqwest"."0.9.18"."log"}" deps)
    (features_.mime."${deps."reqwest"."0.9.18"."mime"}" deps)
    (features_.mime_guess."${deps."reqwest"."0.9.18"."mime_guess"}" deps)
    (features_.native_tls."${deps."reqwest"."0.9.18"."native_tls"}" deps)
    (features_.serde."${deps."reqwest"."0.9.18"."serde"}" deps)
    (features_.serde_json."${deps."reqwest"."0.9.18"."serde_json"}" deps)
    (features_.serde_urlencoded."${deps."reqwest"."0.9.18"."serde_urlencoded"}" deps)
    (features_.time."${deps."reqwest"."0.9.18"."time"}" deps)
    (features_.tokio."${deps."reqwest"."0.9.18"."tokio"}" deps)
    (features_.tokio_executor."${deps."reqwest"."0.9.18"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."reqwest"."0.9.18"."tokio_io"}" deps)
    (features_.tokio_threadpool."${deps."reqwest"."0.9.18"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."reqwest"."0.9.18"."tokio_timer"}" deps)
    (features_.url."${deps."reqwest"."0.9.18"."url"}" deps)
    (features_.uuid."${deps."reqwest"."0.9.18"."uuid"}" deps)
  ];


# end
# rustc-demangle-0.1.15

  crates.rustc_demangle."0.1.15" = deps: { features?(features_.rustc_demangle."0.1.15" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.15";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "04rgsfzhz4k9s56vkczsdbvmvg9409xp0nw4cy99lb2i0aa0255s";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.15" or {});
  };
  features_.rustc_demangle."0.1.15" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.15".compiler_builtins =
        (f.rustc_demangle."0.1.15".compiler_builtins or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".core =
        (f.rustc_demangle."0.1.15".core or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".default = (f.rustc_demangle."0.1.15".default or true); }
    ];
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# ryu-0.2.8

  crates.ryu."0.2.8" = deps: { features?(features_.ryu."0.2.8" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "0.2.8";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1qd0ni13w19a97y51vm31biyh2pvz8j9gi78rn5in912mi04xcnk";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."0.2.8" or {});
  };
  features_.ryu."0.2.8" = deps: f: updateFeatures f (rec {
    ryu."0.2.8".default = (f.ryu."0.2.8".default or true);
  }) [];


# end
# schannel-0.1.15

  crates.schannel."0.1.15" = deps: { features?(features_.schannel."0.1.15" deps {}) }: buildRustCrate {
    crateName = "schannel";
    version = "0.1.15";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Steffen Butzer <steffen.butzer@outlook.com>" ];
    sha256 = "1x9i0z9y8n5cg23ppyglgqdlz6rwcv2a489m5qpfk6l2ib8a1jdv";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."schannel"."0.1.15"."lazy_static"}" deps)
      (crates."winapi"."${deps."schannel"."0.1.15"."winapi"}" deps)
    ]);
  };
  features_.schannel."0.1.15" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.schannel."0.1.15".lazy_static}".default = true;
    schannel."0.1.15".default = (f.schannel."0.1.15".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.schannel."0.1.15".winapi}"."lmcons" = true; }
      { "${deps.schannel."0.1.15".winapi}"."minschannel" = true; }
      { "${deps.schannel."0.1.15".winapi}"."schannel" = true; }
      { "${deps.schannel."0.1.15".winapi}"."securitybaseapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."sspi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."sysinfoapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."timezoneapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."winbase" = true; }
      { "${deps.schannel."0.1.15".winapi}"."wincrypt" = true; }
      { "${deps.schannel."0.1.15".winapi}"."winerror" = true; }
      { "${deps.schannel."0.1.15".winapi}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."schannel"."0.1.15"."lazy_static"}" deps)
    (features_.winapi."${deps."schannel"."0.1.15"."winapi"}" deps)
  ];


# end
# scopeguard-0.3.3

  crates.scopeguard."0.3.3" = deps: { features?(features_.scopeguard."0.3.3" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "0.3.3";
    authors = [ "bluss" ];
    sha256 = "0i1l013csrqzfz6c68pr5pi01hg5v5yahq8fsdmaxy6p8ygsjf3r";
    features = mkFeatures (features."scopeguard"."0.3.3" or {});
  };
  features_.scopeguard."0.3.3" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "0.3.3".default = (f.scopeguard."0.3.3".default or true); }
      { "0.3.3".use_std =
        (f.scopeguard."0.3.3".use_std or false) ||
        (f.scopeguard."0.3.3".default or false) ||
        (scopeguard."0.3.3"."default" or false); }
    ];
  }) [];


# end
# security-framework-0.3.1

  crates.security_framework."0.3.1" = deps: { features?(features_.security_framework."0.3.1" deps {}) }: buildRustCrate {
    crateName = "security-framework";
    version = "0.3.1";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Kornel <kornel@geekhood.net>" ];
    sha256 = "1vycb3xhdd91sy2j6a19iykn6wzdjj0r7cd9p3bx4522fl0l5m84";
    dependencies = mapFeatures features ([
      (crates."core_foundation"."${deps."security_framework"."0.3.1"."core_foundation"}" deps)
      (crates."core_foundation_sys"."${deps."security_framework"."0.3.1"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."security_framework"."0.3.1"."libc"}" deps)
      (crates."security_framework_sys"."${deps."security_framework"."0.3.1"."security_framework_sys"}" deps)
    ]);
    features = mkFeatures (features."security_framework"."0.3.1" or {});
  };
  features_.security_framework."0.3.1" = deps: f: updateFeatures f (rec {
    core_foundation."${deps.security_framework."0.3.1".core_foundation}".default = true;
    core_foundation_sys."${deps.security_framework."0.3.1".core_foundation_sys}".default = true;
    libc."${deps.security_framework."0.3.1".libc}".default = true;
    security_framework = fold recursiveUpdate {} [
      { "0.3.1".OSX_10_10 =
        (f.security_framework."0.3.1".OSX_10_10 or false) ||
        (f.security_framework."0.3.1".OSX_10_11 or false) ||
        (security_framework."0.3.1"."OSX_10_11" or false); }
      { "0.3.1".OSX_10_11 =
        (f.security_framework."0.3.1".OSX_10_11 or false) ||
        (f.security_framework."0.3.1".OSX_10_12 or false) ||
        (security_framework."0.3.1"."OSX_10_12" or false); }
      { "0.3.1".OSX_10_12 =
        (f.security_framework."0.3.1".OSX_10_12 or false) ||
        (f.security_framework."0.3.1".OSX_10_13 or false) ||
        (security_framework."0.3.1"."OSX_10_13" or false); }
      { "0.3.1".OSX_10_9 =
        (f.security_framework."0.3.1".OSX_10_9 or false) ||
        (f.security_framework."0.3.1".OSX_10_10 or false) ||
        (security_framework."0.3.1"."OSX_10_10" or false); }
      { "0.3.1".alpn =
        (f.security_framework."0.3.1".alpn or false) ||
        (f.security_framework."0.3.1".OSX_10_13 or false) ||
        (security_framework."0.3.1"."OSX_10_13" or false); }
      { "0.3.1".default = (f.security_framework."0.3.1".default or true); }
    ];
    security_framework_sys = fold recursiveUpdate {} [
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_10" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_10" or false) ||
        (security_framework."0.3.1"."OSX_10_10" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_10" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_11" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_11" or false) ||
        (security_framework."0.3.1"."OSX_10_11" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_11" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_12" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_12" or false) ||
        (security_framework."0.3.1"."OSX_10_12" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_12" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_13" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_13" or false) ||
        (security_framework."0.3.1"."OSX_10_13" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_13" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_9" =
        (f.security_framework_sys."${deps.security_framework."0.3.1".security_framework_sys}"."OSX_10_9" or false) ||
        (security_framework."0.3.1"."OSX_10_9" or false) ||
        (f."security_framework"."0.3.1"."OSX_10_9" or false); }
      { "${deps.security_framework."0.3.1".security_framework_sys}".default = true; }
    ];
  }) [
    (features_.core_foundation."${deps."security_framework"."0.3.1"."core_foundation"}" deps)
    (features_.core_foundation_sys."${deps."security_framework"."0.3.1"."core_foundation_sys"}" deps)
    (features_.libc."${deps."security_framework"."0.3.1"."libc"}" deps)
    (features_.security_framework_sys."${deps."security_framework"."0.3.1"."security_framework_sys"}" deps)
  ];


# end
# security-framework-sys-0.3.1

  crates.security_framework_sys."0.3.1" = deps: { features?(features_.security_framework_sys."0.3.1" deps {}) }: buildRustCrate {
    crateName = "security-framework-sys";
    version = "0.3.1";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Kornel <kornel@geekhood.net>" ];
    sha256 = "11anqpw72d7xjiaz3pbd2r5d3dx0vddya4f6vjnpfjpnldiyd917";
    dependencies = mapFeatures features ([
      (crates."core_foundation_sys"."${deps."security_framework_sys"."0.3.1"."core_foundation_sys"}" deps)
    ]);
    features = mkFeatures (features."security_framework_sys"."0.3.1" or {});
  };
  features_.security_framework_sys."0.3.1" = deps: f: updateFeatures f (rec {
    core_foundation_sys."${deps.security_framework_sys."0.3.1".core_foundation_sys}".default = true;
    security_framework_sys = fold recursiveUpdate {} [
      { "0.3.1".OSX_10_10 =
        (f.security_framework_sys."0.3.1".OSX_10_10 or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_11 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_11" or false); }
      { "0.3.1".OSX_10_11 =
        (f.security_framework_sys."0.3.1".OSX_10_11 or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_12 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_12" or false); }
      { "0.3.1".OSX_10_12 =
        (f.security_framework_sys."0.3.1".OSX_10_12 or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_13 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_13" or false); }
      { "0.3.1".OSX_10_9 =
        (f.security_framework_sys."0.3.1".OSX_10_9 or false) ||
        (f.security_framework_sys."0.3.1".OSX_10_10 or false) ||
        (security_framework_sys."0.3.1"."OSX_10_10" or false); }
      { "0.3.1".default = (f.security_framework_sys."0.3.1".default or true); }
    ];
  }) [
    (features_.core_foundation_sys."${deps."security_framework_sys"."0.3.1"."core_foundation_sys"}" deps)
  ];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
      { "0.9.0".serde =
        (f.semver."0.9.0".serde or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.93

  crates.serde."1.0.93" = deps: { features?(features_.serde."1.0.93" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.93";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0ipi9cqi0h9bqmq7dh7k2gfdi7q6qfpx8xf6pk4vsg0sdjh4xgmd";
    build = "build.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.serde."1.0.93".serde_derive or false then [ (crates.serde_derive."${deps."serde"."1.0.93".serde_derive}" deps) ] else []));
    features = mkFeatures (features."serde"."1.0.93" or {});
  };
  features_.serde."1.0.93" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.93".default = (f.serde."1.0.93".default or true); }
      { "1.0.93".serde_derive =
        (f.serde."1.0.93".serde_derive or false) ||
        (f.serde."1.0.93".derive or false) ||
        (serde."1.0.93"."derive" or false); }
      { "1.0.93".std =
        (f.serde."1.0.93".std or false) ||
        (f.serde."1.0.93".default or false) ||
        (serde."1.0.93"."default" or false); }
      { "1.0.93".unstable =
        (f.serde."1.0.93".unstable or false) ||
        (f.serde."1.0.93".alloc or false) ||
        (serde."1.0.93"."alloc" or false); }
    ];
    serde_derive."${deps.serde."1.0.93".serde_derive}".default = true;
  }) [
    (features_.serde_derive."${deps."serde"."1.0.93"."serde_derive"}" deps)
  ];


# end
# serde_derive-1.0.93

  crates.serde_derive."1.0.93" = deps: { features?(features_.serde_derive."1.0.93" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.93";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "09ygrvvs6n95jc64gvsm96zg7lis6qrxd8xk4bmh2zkq5wssm5dn";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.93"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.93"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.93"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.93" or {});
  };
  features_.serde_derive."1.0.93" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.93".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.93".quote}".default = true;
    serde_derive."1.0.93".default = (f.serde_derive."1.0.93".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.93".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.93".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.93"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.93"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.93"."syn"}" deps)
  ];


# end
# serde_json-1.0.39

  crates.serde_json."1.0.39" = deps: { features?(features_.serde_json."1.0.39" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.39";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "07ydv06hn8x0yl0rc94l2wl9r2xz1fqd97n1s6j3bgdc6gw406a8";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.39"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.39"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.39"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.39" or {});
  };
  features_.serde_json."1.0.39" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.39".itoa}".default = true;
    ryu."${deps.serde_json."1.0.39".ryu}".default = true;
    serde."${deps.serde_json."1.0.39".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.39".default = (f.serde_json."1.0.39".default or true); }
      { "1.0.39".indexmap =
        (f.serde_json."1.0.39".indexmap or false) ||
        (f.serde_json."1.0.39".preserve_order or false) ||
        (serde_json."1.0.39"."preserve_order" or false); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.39"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.39"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.39"."serde"}" deps)
  ];


# end
# serde_urlencoded-0.5.5

  crates.serde_urlencoded."0.5.5" = deps: { features?(features_.serde_urlencoded."0.5.5" deps {}) }: buildRustCrate {
    crateName = "serde_urlencoded";
    version = "0.5.5";
    authors = [ "Anthony Ramine <n.oxyde@gmail.com>" ];
    sha256 = "1rf49i9w1p1yhr9fr5xsq6mi23i9ggj7132qwrfsaiimfvs6y7i0";
    dependencies = mapFeatures features ([
      (crates."dtoa"."${deps."serde_urlencoded"."0.5.5"."dtoa"}" deps)
      (crates."itoa"."${deps."serde_urlencoded"."0.5.5"."itoa"}" deps)
      (crates."serde"."${deps."serde_urlencoded"."0.5.5"."serde"}" deps)
      (crates."url"."${deps."serde_urlencoded"."0.5.5"."url"}" deps)
    ]);
  };
  features_.serde_urlencoded."0.5.5" = deps: f: updateFeatures f (rec {
    dtoa."${deps.serde_urlencoded."0.5.5".dtoa}".default = true;
    itoa."${deps.serde_urlencoded."0.5.5".itoa}".default = true;
    serde."${deps.serde_urlencoded."0.5.5".serde}".default = true;
    serde_urlencoded."0.5.5".default = (f.serde_urlencoded."0.5.5".default or true);
    url."${deps.serde_urlencoded."0.5.5".url}".default = true;
  }) [
    (features_.dtoa."${deps."serde_urlencoded"."0.5.5"."dtoa"}" deps)
    (features_.itoa."${deps."serde_urlencoded"."0.5.5"."itoa"}" deps)
    (features_.serde."${deps."serde_urlencoded"."0.5.5"."serde"}" deps)
    (features_.url."${deps."serde_urlencoded"."0.5.5"."url"}" deps)
  ];


# end
# sha-1-0.8.1

  crates.sha_1."0.8.1" = deps: { features?(features_.sha_1."0.8.1" deps {}) }: buildRustCrate {
    crateName = "sha-1";
    version = "0.8.1";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0pls9la06vkz4kjm79vcls00bp3p56wgvcj5x8d9bnjxhjj17kkp";
    libName = "sha1";
    dependencies = mapFeatures features ([
      (crates."block_buffer"."${deps."sha_1"."0.8.1"."block_buffer"}" deps)
      (crates."digest"."${deps."sha_1"."0.8.1"."digest"}" deps)
      (crates."fake_simd"."${deps."sha_1"."0.8.1"."fake_simd"}" deps)
      (crates."opaque_debug"."${deps."sha_1"."0.8.1"."opaque_debug"}" deps)
    ]);
    features = mkFeatures (features."sha_1"."0.8.1" or {});
  };
  features_.sha_1."0.8.1" = deps: f: updateFeatures f (rec {
    block_buffer."${deps.sha_1."0.8.1".block_buffer}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.sha_1."0.8.1".digest}"."std" =
        (f.digest."${deps.sha_1."0.8.1".digest}"."std" or false) ||
        (sha_1."0.8.1"."std" or false) ||
        (f."sha_1"."0.8.1"."std" or false); }
      { "${deps.sha_1."0.8.1".digest}".default = true; }
    ];
    fake_simd."${deps.sha_1."0.8.1".fake_simd}".default = true;
    opaque_debug."${deps.sha_1."0.8.1".opaque_debug}".default = true;
    sha_1 = fold recursiveUpdate {} [
      { "0.8.1".default = (f.sha_1."0.8.1".default or true); }
      { "0.8.1".sha1-asm =
        (f.sha_1."0.8.1".sha1-asm or false) ||
        (f.sha_1."0.8.1".asm or false) ||
        (sha_1."0.8.1"."asm" or false); }
      { "0.8.1".std =
        (f.sha_1."0.8.1".std or false) ||
        (f.sha_1."0.8.1".default or false) ||
        (sha_1."0.8.1"."default" or false); }
    ];
  }) [
    (features_.block_buffer."${deps."sha_1"."0.8.1"."block_buffer"}" deps)
    (features_.digest."${deps."sha_1"."0.8.1"."digest"}" deps)
    (features_.fake_simd."${deps."sha_1"."0.8.1"."fake_simd"}" deps)
    (features_.opaque_debug."${deps."sha_1"."0.8.1"."opaque_debug"}" deps)
  ];


# end
# siphasher-0.2.3

  crates.siphasher."0.2.3" = deps: { features?(features_.siphasher."0.2.3" deps {}) }: buildRustCrate {
    crateName = "siphasher";
    version = "0.2.3";
    authors = [ "Frank Denis <github@pureftpd.org>" ];
    sha256 = "1ganj1grxqnkvv4ds3vby039bm999jrr58nfq2x3kjhzkw2bnqkw";
  };
  features_.siphasher."0.2.3" = deps: f: updateFeatures f (rec {
    siphasher."0.2.3".default = (f.siphasher."0.2.3".default or true);
  }) [];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.10

  crates.smallvec."0.6.10" = deps: { features?(features_.smallvec."0.6.10" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.10";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "01w7xd79q0bwn683gk4ryw50ad1zzxkny10f7gkbaaj1ax6f4q4h";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.10" or {});
  };
  features_.smallvec."0.6.10" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.10".default = (f.smallvec."0.6.10".default or true); }
      { "0.6.10".std =
        (f.smallvec."0.6.10".std or false) ||
        (f.smallvec."0.6.10".default or false) ||
        (smallvec."0.6.10"."default" or false); }
    ];
  }) [];


# end
# stable_deref_trait-1.1.1

  crates.stable_deref_trait."1.1.1" = deps: { features?(features_.stable_deref_trait."1.1.1" deps {}) }: buildRustCrate {
    crateName = "stable_deref_trait";
    version = "1.1.1";
    authors = [ "Robert Grosse <n210241048576@gmail.com>" ];
    sha256 = "1xy9slzslrzr31nlnw52sl1d820b09y61b7f13lqgsn8n7y0l4g8";
    features = mkFeatures (features."stable_deref_trait"."1.1.1" or {});
  };
  features_.stable_deref_trait."1.1.1" = deps: f: updateFeatures f (rec {
    stable_deref_trait = fold recursiveUpdate {} [
      { "1.1.1".default = (f.stable_deref_trait."1.1.1".default or true); }
      { "1.1.1".std =
        (f.stable_deref_trait."1.1.1".std or false) ||
        (f.stable_deref_trait."1.1.1".default or false) ||
        (stable_deref_trait."1.1.1"."default" or false); }
    ];
  }) [];


# end
# string-0.2.0

  crates.string."0.2.0" = deps: { features?(features_.string."0.2.0" deps {}) }: buildRustCrate {
    crateName = "string";
    version = "0.2.0";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1qwgh49dnr0j1j2dwxb8cbpdki2vlsphcwb2fc9qhfv5iiy4nqiz";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.string."0.2.0".bytes or false then [ (crates.bytes."${deps."string"."0.2.0".bytes}" deps) ] else []));
    features = mkFeatures (features."string"."0.2.0" or {});
  };
  features_.string."0.2.0" = deps: f: updateFeatures f (rec {
    bytes."${deps.string."0.2.0".bytes}".default = true;
    string = fold recursiveUpdate {} [
      { "0.2.0".bytes =
        (f.string."0.2.0".bytes or false) ||
        (f.string."0.2.0".default or false) ||
        (string."0.2.0"."default" or false); }
      { "0.2.0".default = (f.string."0.2.0".default or true); }
    ];
  }) [
    (features_.bytes."${deps."string"."0.2.0"."bytes"}" deps)
  ];


# end
# syn-0.15.37

  crates.syn."0.15.37" = deps: { features?(features_.syn."0.15.37" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.37";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1d8j861qh55bjwlz2k6c6jdfbapy2dcz17jm6x45p7s1rdkbdxsm";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.37"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.37"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.37".quote or false then [ (crates.quote."${deps."syn"."0.15.37".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.37" or {});
  };
  features_.syn."0.15.37" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.37".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.37".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.37"."proc-macro" or false) ||
        (f."syn"."0.15.37"."proc-macro" or false); }
      { "${deps.syn."0.15.37".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.37".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.37".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.37".quote}"."proc-macro" or false) ||
        (syn."0.15.37"."proc-macro" or false) ||
        (f."syn"."0.15.37"."proc-macro" or false); }
      { "${deps.syn."0.15.37".quote}".default = (f.quote."${deps.syn."0.15.37".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.37".clone-impls =
        (f.syn."0.15.37".clone-impls or false) ||
        (f.syn."0.15.37".default or false) ||
        (syn."0.15.37"."default" or false); }
      { "0.15.37".default = (f.syn."0.15.37".default or true); }
      { "0.15.37".derive =
        (f.syn."0.15.37".derive or false) ||
        (f.syn."0.15.37".default or false) ||
        (syn."0.15.37"."default" or false); }
      { "0.15.37".parsing =
        (f.syn."0.15.37".parsing or false) ||
        (f.syn."0.15.37".default or false) ||
        (syn."0.15.37"."default" or false); }
      { "0.15.37".printing =
        (f.syn."0.15.37".printing or false) ||
        (f.syn."0.15.37".default or false) ||
        (syn."0.15.37"."default" or false); }
      { "0.15.37".proc-macro =
        (f.syn."0.15.37".proc-macro or false) ||
        (f.syn."0.15.37".default or false) ||
        (syn."0.15.37"."default" or false); }
      { "0.15.37".quote =
        (f.syn."0.15.37".quote or false) ||
        (f.syn."0.15.37".printing or false) ||
        (syn."0.15.37"."printing" or false); }
    ];
    unicode_xid."${deps.syn."0.15.37".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.37"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.37"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.37"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.2

  crates.synstructure."0.10.2" = deps: { features?(features_.synstructure."0.10.2" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.2";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0bp29grjsim99xm1l6h38mbl98gnk47lf82rawlmws5zn4asdpj4";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.2"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.2"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.2" or {});
  };
  features_.synstructure."0.10.2" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.2".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.2".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.2".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.2".syn}".default = true; }
    ];
    synstructure."0.10.2".default = (f.synstructure."0.10.2".default or true);
    unicode_xid."${deps.synstructure."0.10.2".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.2"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.2"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
  ];


# end
# tempfile-3.0.8

  crates.tempfile."3.0.8" = deps: { features?(features_.tempfile."3.0.8" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.8";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "0v16b7ksfrbll0kxx8m761rp39qfq44f36z1jpiw036znx9cis8s";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.8"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.8"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.8"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.8"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.8"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.8"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.8" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.8".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.8".libc}".default = true;
    rand."${deps.tempfile."3.0.8".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.8".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.8".remove_dir_all}".default = true;
    tempfile."3.0.8".default = (f.tempfile."3.0.8".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.8".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.8".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.8".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.8".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.8"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.8"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.8"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.8"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.8"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.8"."winapi"}" deps)
  ];


# end
# termion-1.5.3

  crates.termion."1.5.3" = deps: { features?(features_.termion."1.5.3" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.3";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "0l47ppblj8d97ch100100w9fbv47c3fhnqxbvsajcz2pj7ci414k";
    dependencies = mapFeatures features ([
      (crates."numtoa"."${deps."termion"."1.5.3"."numtoa"}" deps)
    ])
      ++ (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.3"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.3"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.3" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.3".libc}".default = true;
    numtoa = fold recursiveUpdate {} [
      { "${deps.termion."1.5.3".numtoa}"."std" = true; }
      { "${deps.termion."1.5.3".numtoa}".default = true; }
    ];
    redox_syscall."${deps.termion."1.5.3".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.3".redox_termios}".default = true;
    termion."1.5.3".default = (f.termion."1.5.3".default or true);
  }) [
    (features_.numtoa."${deps."termion"."1.5.3"."numtoa"}" deps)
    (features_.libc."${deps."termion"."1.5.3"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.3"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.3"."redox_termios"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# tokio-0.1.21

  crates.tokio."0.1.21" = deps: { features?(features_.tokio."0.1.21" deps {}) }: buildRustCrate {
    crateName = "tokio";
    version = "0.1.21";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0kx5cp71jammg1vskq7f5gqimsh9yc2mhwrhiadapax1fx58zi1f";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio"."0.1.21"."futures"}" deps)
    ]
      ++ (if features.tokio."0.1.21".bytes or false then [ (crates.bytes."${deps."tokio"."0.1.21".bytes}" deps) ] else [])
      ++ (if features.tokio."0.1.21".mio or false then [ (crates.mio."${deps."tokio"."0.1.21".mio}" deps) ] else [])
      ++ (if features.tokio."0.1.21".num_cpus or false then [ (crates.num_cpus."${deps."tokio"."0.1.21".num_cpus}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-current-thread or false then [ (crates.tokio_current_thread."${deps."tokio"."0.1.21".tokio_current_thread}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-executor or false then [ (crates.tokio_executor."${deps."tokio"."0.1.21".tokio_executor}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-io or false then [ (crates.tokio_io."${deps."tokio"."0.1.21".tokio_io}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-reactor or false then [ (crates.tokio_reactor."${deps."tokio"."0.1.21".tokio_reactor}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-tcp or false then [ (crates.tokio_tcp."${deps."tokio"."0.1.21".tokio_tcp}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."tokio"."0.1.21".tokio_threadpool}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-timer or false then [ (crates.tokio_timer."${deps."tokio"."0.1.21".tokio_timer}" deps) ] else [])
      ++ (if features.tokio."0.1.21".tokio-trace-core or false then [ (crates.tokio_trace_core."${deps."tokio"."0.1.21".tokio_trace_core}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
]) else []);
    features = mkFeatures (features."tokio"."0.1.21" or {});
  };
  features_.tokio."0.1.21" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio."0.1.21".bytes}".default = true;
    futures."${deps.tokio."0.1.21".futures}".default = true;
    mio."${deps.tokio."0.1.21".mio}".default = true;
    num_cpus."${deps.tokio."0.1.21".num_cpus}".default = true;
    tokio = fold recursiveUpdate {} [
      { "0.1.21".bytes =
        (f.tokio."0.1.21".bytes or false) ||
        (f.tokio."0.1.21".io or false) ||
        (tokio."0.1.21"."io" or false); }
      { "0.1.21".codec =
        (f.tokio."0.1.21".codec or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
      { "0.1.21".default = (f.tokio."0.1.21".default or true); }
      { "0.1.21".fs =
        (f.tokio."0.1.21".fs or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
      { "0.1.21".io =
        (f.tokio."0.1.21".io or false) ||
        (f.tokio."0.1.21".codec or false) ||
        (tokio."0.1.21"."codec" or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false) ||
        (f.tokio."0.1.21".reactor or false) ||
        (tokio."0.1.21"."reactor" or false); }
      { "0.1.21".mio =
        (f.tokio."0.1.21".mio or false) ||
        (f.tokio."0.1.21".reactor or false) ||
        (tokio."0.1.21"."reactor" or false); }
      { "0.1.21".num_cpus =
        (f.tokio."0.1.21".num_cpus or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".reactor =
        (f.tokio."0.1.21".reactor or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".rt-full =
        (f.tokio."0.1.21".rt-full or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
      { "0.1.21".sync =
        (f.tokio."0.1.21".sync or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
      { "0.1.21".tcp =
        (f.tokio."0.1.21".tcp or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
      { "0.1.21".timer =
        (f.tokio."0.1.21".timer or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".tokio-codec =
        (f.tokio."0.1.21".tokio-codec or false) ||
        (f.tokio."0.1.21".codec or false) ||
        (tokio."0.1.21"."codec" or false); }
      { "0.1.21".tokio-current-thread =
        (f.tokio."0.1.21".tokio-current-thread or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".tokio-executor =
        (f.tokio."0.1.21".tokio-executor or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".tokio-fs =
        (f.tokio."0.1.21".tokio-fs or false) ||
        (f.tokio."0.1.21".fs or false) ||
        (tokio."0.1.21"."fs" or false); }
      { "0.1.21".tokio-io =
        (f.tokio."0.1.21".tokio-io or false) ||
        (f.tokio."0.1.21".io or false) ||
        (tokio."0.1.21"."io" or false); }
      { "0.1.21".tokio-reactor =
        (f.tokio."0.1.21".tokio-reactor or false) ||
        (f.tokio."0.1.21".reactor or false) ||
        (tokio."0.1.21"."reactor" or false); }
      { "0.1.21".tokio-sync =
        (f.tokio."0.1.21".tokio-sync or false) ||
        (f.tokio."0.1.21".sync or false) ||
        (tokio."0.1.21"."sync" or false); }
      { "0.1.21".tokio-tcp =
        (f.tokio."0.1.21".tokio-tcp or false) ||
        (f.tokio."0.1.21".tcp or false) ||
        (tokio."0.1.21"."tcp" or false); }
      { "0.1.21".tokio-threadpool =
        (f.tokio."0.1.21".tokio-threadpool or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".tokio-timer =
        (f.tokio."0.1.21".tokio-timer or false) ||
        (f.tokio."0.1.21".timer or false) ||
        (tokio."0.1.21"."timer" or false); }
      { "0.1.21".tokio-trace-core =
        (f.tokio."0.1.21".tokio-trace-core or false) ||
        (f.tokio."0.1.21".rt-full or false) ||
        (tokio."0.1.21"."rt-full" or false); }
      { "0.1.21".tokio-udp =
        (f.tokio."0.1.21".tokio-udp or false) ||
        (f.tokio."0.1.21".udp or false) ||
        (tokio."0.1.21"."udp" or false); }
      { "0.1.21".tokio-uds =
        (f.tokio."0.1.21".tokio-uds or false) ||
        (f.tokio."0.1.21".uds or false) ||
        (tokio."0.1.21"."uds" or false); }
      { "0.1.21".udp =
        (f.tokio."0.1.21".udp or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
      { "0.1.21".uds =
        (f.tokio."0.1.21".uds or false) ||
        (f.tokio."0.1.21".default or false) ||
        (tokio."0.1.21"."default" or false); }
    ];
    tokio_current_thread."${deps.tokio."0.1.21".tokio_current_thread}".default = true;
    tokio_executor."${deps.tokio."0.1.21".tokio_executor}".default = true;
    tokio_io."${deps.tokio."0.1.21".tokio_io}".default = true;
    tokio_reactor."${deps.tokio."0.1.21".tokio_reactor}".default = true;
    tokio_tcp."${deps.tokio."0.1.21".tokio_tcp}".default = true;
    tokio_threadpool."${deps.tokio."0.1.21".tokio_threadpool}".default = true;
    tokio_timer."${deps.tokio."0.1.21".tokio_timer}".default = true;
    tokio_trace_core."${deps.tokio."0.1.21".tokio_trace_core}".default = true;
  }) [
    (features_.bytes."${deps."tokio"."0.1.21"."bytes"}" deps)
    (features_.futures."${deps."tokio"."0.1.21"."futures"}" deps)
    (features_.mio."${deps."tokio"."0.1.21"."mio"}" deps)
    (features_.num_cpus."${deps."tokio"."0.1.21"."num_cpus"}" deps)
    (features_.tokio_current_thread."${deps."tokio"."0.1.21"."tokio_current_thread"}" deps)
    (features_.tokio_executor."${deps."tokio"."0.1.21"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio"."0.1.21"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio"."0.1.21"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."tokio"."0.1.21"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."tokio"."0.1.21"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."tokio"."0.1.21"."tokio_timer"}" deps)
    (features_.tokio_trace_core."${deps."tokio"."0.1.21"."tokio_trace_core"}" deps)
  ];


# end
# tokio-buf-0.1.1

  crates.tokio_buf."0.1.1" = deps: { features?(features_.tokio_buf."0.1.1" deps {}) }: buildRustCrate {
    crateName = "tokio-buf";
    version = "0.1.1";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "11qjcqvhsjwwy66njn2c3nzl0i89a9k06l08s0vz9cswwkjc2427";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_buf"."0.1.1"."bytes"}" deps)
      (crates."futures"."${deps."tokio_buf"."0.1.1"."futures"}" deps)
    ]
      ++ (if features.tokio_buf."0.1.1".either or false then [ (crates.either."${deps."tokio_buf"."0.1.1".either}" deps) ] else []));
    features = mkFeatures (features."tokio_buf"."0.1.1" or {});
  };
  features_.tokio_buf."0.1.1" = deps: f: updateFeatures f (rec {
    bytes = fold recursiveUpdate {} [
      { "${deps.tokio_buf."0.1.1".bytes}"."either" =
        (f.bytes."${deps.tokio_buf."0.1.1".bytes}"."either" or false) ||
        (tokio_buf."0.1.1"."util" or false) ||
        (f."tokio_buf"."0.1.1"."util" or false); }
      { "${deps.tokio_buf."0.1.1".bytes}".default = true; }
    ];
    either."${deps.tokio_buf."0.1.1".either}".default = true;
    futures."${deps.tokio_buf."0.1.1".futures}".default = true;
    tokio_buf = fold recursiveUpdate {} [
      { "0.1.1".default = (f.tokio_buf."0.1.1".default or true); }
      { "0.1.1".either =
        (f.tokio_buf."0.1.1".either or false) ||
        (f.tokio_buf."0.1.1".util or false) ||
        (tokio_buf."0.1.1"."util" or false); }
      { "0.1.1".util =
        (f.tokio_buf."0.1.1".util or false) ||
        (f.tokio_buf."0.1.1".default or false) ||
        (tokio_buf."0.1.1"."default" or false); }
    ];
  }) [
    (features_.bytes."${deps."tokio_buf"."0.1.1"."bytes"}" deps)
    (features_.either."${deps."tokio_buf"."0.1.1"."either"}" deps)
    (features_.futures."${deps."tokio_buf"."0.1.1"."futures"}" deps)
  ];


# end
# tokio-current-thread-0.1.6

  crates.tokio_current_thread."0.1.6" = deps: { features?(features_.tokio_current_thread."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-current-thread";
    version = "0.1.6";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07dm43svkrpifkcnv8f5w477cd9260pnkvnps39qkhkf5ixi8fzg";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_current_thread"."0.1.6"."futures"}" deps)
      (crates."tokio_executor"."${deps."tokio_current_thread"."0.1.6"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_current_thread."0.1.6" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_current_thread."0.1.6".futures}".default = true;
    tokio_current_thread."0.1.6".default = (f.tokio_current_thread."0.1.6".default or true);
    tokio_executor."${deps.tokio_current_thread."0.1.6".tokio_executor}".default = true;
  }) [
    (features_.futures."${deps."tokio_current_thread"."0.1.6"."futures"}" deps)
    (features_.tokio_executor."${deps."tokio_current_thread"."0.1.6"."tokio_executor"}" deps)
  ];


# end
# tokio-executor-0.1.7

  crates.tokio_executor."0.1.7" = deps: { features?(features_.tokio_executor."0.1.7" deps {}) }: buildRustCrate {
    crateName = "tokio-executor";
    version = "0.1.7";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0fhaijjh1cybikx0b53292xfi6yzjrmp10ibgikhd6i33svnggq7";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_executor"."0.1.7"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_executor"."0.1.7"."futures"}" deps)
    ]);
  };
  features_.tokio_executor."0.1.7" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_executor."0.1.7".crossbeam_utils}".default = true;
    futures."${deps.tokio_executor."0.1.7".futures}".default = true;
    tokio_executor."0.1.7".default = (f.tokio_executor."0.1.7".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_executor"."0.1.7"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_executor"."0.1.7"."futures"}" deps)
  ];


# end
# tokio-io-0.1.12

  crates.tokio_io."0.1.12" = deps: { features?(features_.tokio_io."0.1.12" deps {}) }: buildRustCrate {
    crateName = "tokio-io";
    version = "0.1.12";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0z64yfcm9i5ci2h9h7npa292plia9kb04xbm7cp0bzp1wsddv91r";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_io"."0.1.12"."bytes"}" deps)
      (crates."futures"."${deps."tokio_io"."0.1.12"."futures"}" deps)
      (crates."log"."${deps."tokio_io"."0.1.12"."log"}" deps)
    ]);
  };
  features_.tokio_io."0.1.12" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_io."0.1.12".bytes}".default = true;
    futures."${deps.tokio_io."0.1.12".futures}".default = true;
    log."${deps.tokio_io."0.1.12".log}".default = true;
    tokio_io."0.1.12".default = (f.tokio_io."0.1.12".default or true);
  }) [
    (features_.bytes."${deps."tokio_io"."0.1.12"."bytes"}" deps)
    (features_.futures."${deps."tokio_io"."0.1.12"."futures"}" deps)
    (features_.log."${deps."tokio_io"."0.1.12"."log"}" deps)
  ];


# end
# tokio-reactor-0.1.9

  crates.tokio_reactor."0.1.9" = deps: { features?(features_.tokio_reactor."0.1.9" deps {}) }: buildRustCrate {
    crateName = "tokio-reactor";
    version = "0.1.9";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "11gpxrykd6lbpj9b26dh4fymzawfxgqdx1pbhc771gxbf8qyj1gc";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_reactor"."0.1.9"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_reactor"."0.1.9"."futures"}" deps)
      (crates."lazy_static"."${deps."tokio_reactor"."0.1.9"."lazy_static"}" deps)
      (crates."log"."${deps."tokio_reactor"."0.1.9"."log"}" deps)
      (crates."mio"."${deps."tokio_reactor"."0.1.9"."mio"}" deps)
      (crates."num_cpus"."${deps."tokio_reactor"."0.1.9"."num_cpus"}" deps)
      (crates."parking_lot"."${deps."tokio_reactor"."0.1.9"."parking_lot"}" deps)
      (crates."slab"."${deps."tokio_reactor"."0.1.9"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_reactor"."0.1.9"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."tokio_reactor"."0.1.9"."tokio_io"}" deps)
      (crates."tokio_sync"."${deps."tokio_reactor"."0.1.9"."tokio_sync"}" deps)
    ]);
  };
  features_.tokio_reactor."0.1.9" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_reactor."0.1.9".crossbeam_utils}".default = true;
    futures."${deps.tokio_reactor."0.1.9".futures}".default = true;
    lazy_static."${deps.tokio_reactor."0.1.9".lazy_static}".default = true;
    log."${deps.tokio_reactor."0.1.9".log}".default = true;
    mio."${deps.tokio_reactor."0.1.9".mio}".default = true;
    num_cpus."${deps.tokio_reactor."0.1.9".num_cpus}".default = true;
    parking_lot."${deps.tokio_reactor."0.1.9".parking_lot}".default = true;
    slab."${deps.tokio_reactor."0.1.9".slab}".default = true;
    tokio_executor."${deps.tokio_reactor."0.1.9".tokio_executor}".default = true;
    tokio_io."${deps.tokio_reactor."0.1.9".tokio_io}".default = true;
    tokio_reactor."0.1.9".default = (f.tokio_reactor."0.1.9".default or true);
    tokio_sync."${deps.tokio_reactor."0.1.9".tokio_sync}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."tokio_reactor"."0.1.9"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_reactor"."0.1.9"."futures"}" deps)
    (features_.lazy_static."${deps."tokio_reactor"."0.1.9"."lazy_static"}" deps)
    (features_.log."${deps."tokio_reactor"."0.1.9"."log"}" deps)
    (features_.mio."${deps."tokio_reactor"."0.1.9"."mio"}" deps)
    (features_.num_cpus."${deps."tokio_reactor"."0.1.9"."num_cpus"}" deps)
    (features_.parking_lot."${deps."tokio_reactor"."0.1.9"."parking_lot"}" deps)
    (features_.slab."${deps."tokio_reactor"."0.1.9"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_reactor"."0.1.9"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio_reactor"."0.1.9"."tokio_io"}" deps)
    (features_.tokio_sync."${deps."tokio_reactor"."0.1.9"."tokio_sync"}" deps)
  ];


# end
# tokio-sync-0.1.6

  crates.tokio_sync."0.1.6" = deps: { features?(features_.tokio_sync."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-sync";
    version = "0.1.6";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0csjpxf7m088lh3nfkhj5q1zi5hycdk5xqcginw328rnl1srzyl7";
    dependencies = mapFeatures features ([
      (crates."fnv"."${deps."tokio_sync"."0.1.6"."fnv"}" deps)
      (crates."futures"."${deps."tokio_sync"."0.1.6"."futures"}" deps)
    ]);
  };
  features_.tokio_sync."0.1.6" = deps: f: updateFeatures f (rec {
    fnv."${deps.tokio_sync."0.1.6".fnv}".default = true;
    futures."${deps.tokio_sync."0.1.6".futures}".default = true;
    tokio_sync."0.1.6".default = (f.tokio_sync."0.1.6".default or true);
  }) [
    (features_.fnv."${deps."tokio_sync"."0.1.6"."fnv"}" deps)
    (features_.futures."${deps."tokio_sync"."0.1.6"."futures"}" deps)
  ];


# end
# tokio-tcp-0.1.3

  crates.tokio_tcp."0.1.3" = deps: { features?(features_.tokio_tcp."0.1.3" deps {}) }: buildRustCrate {
    crateName = "tokio-tcp";
    version = "0.1.3";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07v5p339660zjy1w73wddagj3n5wa4v7v5gj7hnvw95ka407zvcz";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
      (crates."futures"."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
      (crates."iovec"."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
      (crates."mio"."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
      (crates."tokio_io"."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_tcp."0.1.3" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_tcp."0.1.3".bytes}".default = true;
    futures."${deps.tokio_tcp."0.1.3".futures}".default = true;
    iovec."${deps.tokio_tcp."0.1.3".iovec}".default = true;
    mio."${deps.tokio_tcp."0.1.3".mio}".default = true;
    tokio_io."${deps.tokio_tcp."0.1.3".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_tcp."0.1.3".tokio_reactor}".default = true;
    tokio_tcp."0.1.3".default = (f.tokio_tcp."0.1.3".default or true);
  }) [
    (features_.bytes."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
    (features_.futures."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
    (features_.iovec."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
    (features_.mio."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
    (features_.tokio_io."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
  ];


# end
# tokio-threadpool-0.1.14

  crates.tokio_threadpool."0.1.14" = deps: { features?(features_.tokio_threadpool."0.1.14" deps {}) }: buildRustCrate {
    crateName = "tokio-threadpool";
    version = "0.1.14";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0b6m9xvl5m93y1nmdjr161j39f4ialc39qlm4dy8ad376v7ck1kp";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."tokio_threadpool"."0.1.14"."crossbeam_deque"}" deps)
      (crates."crossbeam_queue"."${deps."tokio_threadpool"."0.1.14"."crossbeam_queue"}" deps)
      (crates."crossbeam_utils"."${deps."tokio_threadpool"."0.1.14"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_threadpool"."0.1.14"."futures"}" deps)
      (crates."log"."${deps."tokio_threadpool"."0.1.14"."log"}" deps)
      (crates."num_cpus"."${deps."tokio_threadpool"."0.1.14"."num_cpus"}" deps)
      (crates."rand"."${deps."tokio_threadpool"."0.1.14"."rand"}" deps)
      (crates."slab"."${deps."tokio_threadpool"."0.1.14"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_threadpool"."0.1.14"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_threadpool."0.1.14" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.tokio_threadpool."0.1.14".crossbeam_deque}".default = true;
    crossbeam_queue."${deps.tokio_threadpool."0.1.14".crossbeam_queue}".default = true;
    crossbeam_utils."${deps.tokio_threadpool."0.1.14".crossbeam_utils}".default = true;
    futures."${deps.tokio_threadpool."0.1.14".futures}".default = true;
    log."${deps.tokio_threadpool."0.1.14".log}".default = true;
    num_cpus."${deps.tokio_threadpool."0.1.14".num_cpus}".default = true;
    rand."${deps.tokio_threadpool."0.1.14".rand}".default = true;
    slab."${deps.tokio_threadpool."0.1.14".slab}".default = true;
    tokio_executor."${deps.tokio_threadpool."0.1.14".tokio_executor}".default = true;
    tokio_threadpool."0.1.14".default = (f.tokio_threadpool."0.1.14".default or true);
  }) [
    (features_.crossbeam_deque."${deps."tokio_threadpool"."0.1.14"."crossbeam_deque"}" deps)
    (features_.crossbeam_queue."${deps."tokio_threadpool"."0.1.14"."crossbeam_queue"}" deps)
    (features_.crossbeam_utils."${deps."tokio_threadpool"."0.1.14"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_threadpool"."0.1.14"."futures"}" deps)
    (features_.log."${deps."tokio_threadpool"."0.1.14"."log"}" deps)
    (features_.num_cpus."${deps."tokio_threadpool"."0.1.14"."num_cpus"}" deps)
    (features_.rand."${deps."tokio_threadpool"."0.1.14"."rand"}" deps)
    (features_.slab."${deps."tokio_threadpool"."0.1.14"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_threadpool"."0.1.14"."tokio_executor"}" deps)
  ];


# end
# tokio-timer-0.2.11

  crates.tokio_timer."0.2.11" = deps: { features?(features_.tokio_timer."0.2.11" deps {}) }: buildRustCrate {
    crateName = "tokio-timer";
    version = "0.2.11";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1g1np0mdhiwl52kxp543q9jdidf9vws403jh2nay3srlpnqhrkx9";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_timer"."0.2.11"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_timer"."0.2.11"."futures"}" deps)
      (crates."slab"."${deps."tokio_timer"."0.2.11"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_timer"."0.2.11"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_timer."0.2.11" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_timer."0.2.11".crossbeam_utils}".default = true;
    futures."${deps.tokio_timer."0.2.11".futures}".default = true;
    slab."${deps.tokio_timer."0.2.11".slab}".default = true;
    tokio_executor."${deps.tokio_timer."0.2.11".tokio_executor}".default = true;
    tokio_timer."0.2.11".default = (f.tokio_timer."0.2.11".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_timer"."0.2.11"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_timer"."0.2.11"."futures"}" deps)
    (features_.slab."${deps."tokio_timer"."0.2.11"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_timer"."0.2.11"."tokio_executor"}" deps)
  ];


# end
# tokio-trace-core-0.2.0

  crates.tokio_trace_core."0.2.0" = deps: { features?(features_.tokio_trace_core."0.2.0" deps {}) }: buildRustCrate {
    crateName = "tokio-trace-core";
    version = "0.2.0";
    authors = [ "Tokio Contributors <team@tokio.rs>" ];
    sha256 = "1r8nvc07b5gwb1k1fg7ydhrjkgjmpn3nb11xsj013qfpf83zrdfr";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."tokio_trace_core"."0.2.0"."lazy_static"}" deps)
    ]);
  };
  features_.tokio_trace_core."0.2.0" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.tokio_trace_core."0.2.0".lazy_static}".default = true;
    tokio_trace_core."0.2.0".default = (f.tokio_trace_core."0.2.0".default or true);
  }) [
    (features_.lazy_static."${deps."tokio_trace_core"."0.2.0"."lazy_static"}" deps)
  ];


# end
# try-lock-0.2.2

  crates.try_lock."0.2.2" = deps: { features?(features_.try_lock."0.2.2" deps {}) }: buildRustCrate {
    crateName = "try-lock";
    version = "0.2.2";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1k8xc0jpbrmzp0fwghdh6pwzjb9xx2p8yy0xxnnb8065smc5fsrv";
  };
  features_.try_lock."0.2.2" = deps: f: updateFeatures f (rec {
    try_lock."0.2.2".default = (f.try_lock."0.2.2".default or true);
  }) [];


# end
# try_from-0.3.2

  crates.try_from."0.3.2" = deps: { features?(features_.try_from."0.3.2" deps {}) }: buildRustCrate {
    crateName = "try_from";
    version = "0.3.2";
    authors = [ "Derek Williams <derek@fyrie.net>" ];
    sha256 = "05jnndmiqz2sf8xsnf7ysaj3fpl3rhgzbfn1jx6casaahakrzald";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."try_from"."0.3.2"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."try_from"."0.3.2" or {});
  };
  features_.try_from."0.3.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.try_from."0.3.2".cfg_if}".default = true;
    try_from."0.3.2".default = (f.try_from."0.3.2".default or true);
  }) [
    (features_.cfg_if."${deps."try_from"."0.3.2"."cfg_if"}" deps)
  ];


# end
# tui-0.6.1

  crates.tui."0.6.1" = deps: { features?(features_.tui."0.6.1" deps {}) }: buildRustCrate {
    crateName = "tui";
    version = "0.6.1";
    authors = [ "Florian Dehau <work@fdehau.com>" ];
    edition = "2018";
    sha256 = "1x8szgqn7b1id0jf489lwnrrnaax76ah2sin6pdbbsv6g53qxjmb";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."tui"."0.6.1"."bitflags"}" deps)
      (crates."cassowary"."${deps."tui"."0.6.1"."cassowary"}" deps)
      (crates."either"."${deps."tui"."0.6.1"."either"}" deps)
      (crates."itertools"."${deps."tui"."0.6.1"."itertools"}" deps)
      (crates."log"."${deps."tui"."0.6.1"."log"}" deps)
      (crates."unicode_segmentation"."${deps."tui"."0.6.1"."unicode_segmentation"}" deps)
      (crates."unicode_width"."${deps."tui"."0.6.1"."unicode_width"}" deps)
    ]
      ++ (if features.tui."0.6.1".termion or false then [ (crates.termion."${deps."tui"."0.6.1".termion}" deps) ] else []));
    features = mkFeatures (features."tui"."0.6.1" or {});
  };
  features_.tui."0.6.1" = deps: f: updateFeatures f (rec {
    bitflags."${deps.tui."0.6.1".bitflags}".default = true;
    cassowary."${deps.tui."0.6.1".cassowary}".default = true;
    either."${deps.tui."0.6.1".either}".default = true;
    itertools."${deps.tui."0.6.1".itertools}".default = true;
    log."${deps.tui."0.6.1".log}".default = true;
    termion."${deps.tui."0.6.1".termion}".default = true;
    tui = fold recursiveUpdate {} [
      { "0.6.1".default = (f.tui."0.6.1".default or true); }
      { "0.6.1".easycurses =
        (f.tui."0.6.1".easycurses or false) ||
        (f.tui."0.6.1".curses or false) ||
        (tui."0.6.1"."curses" or false); }
      { "0.6.1".pancurses =
        (f.tui."0.6.1".pancurses or false) ||
        (f.tui."0.6.1".curses or false) ||
        (tui."0.6.1"."curses" or false); }
      { "0.6.1".termion =
        (f.tui."0.6.1".termion or false) ||
        (f.tui."0.6.1".default or false) ||
        (tui."0.6.1"."default" or false); }
    ];
    unicode_segmentation."${deps.tui."0.6.1".unicode_segmentation}".default = true;
    unicode_width."${deps.tui."0.6.1".unicode_width}".default = true;
  }) [
    (features_.bitflags."${deps."tui"."0.6.1"."bitflags"}" deps)
    (features_.cassowary."${deps."tui"."0.6.1"."cassowary"}" deps)
    (features_.either."${deps."tui"."0.6.1"."either"}" deps)
    (features_.itertools."${deps."tui"."0.6.1"."itertools"}" deps)
    (features_.log."${deps."tui"."0.6.1"."log"}" deps)
    (features_.termion."${deps."tui"."0.6.1"."termion"}" deps)
    (features_.unicode_segmentation."${deps."tui"."0.6.1"."unicode_segmentation"}" deps)
    (features_.unicode_width."${deps."tui"."0.6.1"."unicode_width"}" deps)
  ];


# end
# typenum-1.10.0

  crates.typenum."1.10.0" = deps: { features?(features_.typenum."1.10.0" deps {}) }: buildRustCrate {
    crateName = "typenum";
    version = "1.10.0";
    authors = [ "Paho Lurie-Gregg <paho@paholg.com>" "Andre Bogus <bogusandre@gmail.com>" ];
    sha256 = "1v2cgg0mlzkg5prs7swysckgk2ay6bpda8m83c2sn3z77dcsx3bc";
    build = "build/main.rs";
    features = mkFeatures (features."typenum"."1.10.0" or {});
  };
  features_.typenum."1.10.0" = deps: f: updateFeatures f (rec {
    typenum."1.10.0".default = (f.typenum."1.10.0".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "0rbnhw2mnhcwrij3vczp0sl8zdfmvf2dlh8hly81kj7132kfj0mf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."1.4.2"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."1.4.2" or {});
  };
  features_.unicase."1.4.2" = deps: f: updateFeatures f (rec {
    unicase = fold recursiveUpdate {} [
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
      { "1.4.2".heapsize =
        (f.unicase."1.4.2".heapsize or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".heapsize_plugin =
        (f.unicase."1.4.2".heapsize_plugin or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
    ];
    version_check."${deps.unicase."1.4.2".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."1.4.2"."version_check"}" deps)
  ];


# end
# unicase-2.4.0

  crates.unicase."2.4.0" = deps: { features?(features_.unicase."2.4.0" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "2.4.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0f4ay81kfrvs0l2frpci367j3dmnd3jx1x3q5fismmr6a4546piz";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."2.4.0"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."2.4.0" or {});
  };
  features_.unicase."2.4.0" = deps: f: updateFeatures f (rec {
    unicase."2.4.0".default = (f.unicase."2.4.0".default or true);
    version_check."${deps.unicase."2.4.0".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."2.4.0"."version_check"}" deps)
  ];


# end
# unicode-bidi-0.3.4

  crates.unicode_bidi."0.3.4" = deps: { features?(features_.unicode_bidi."0.3.4" deps {}) }: buildRustCrate {
    crateName = "unicode-bidi";
    version = "0.3.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0lcd6jasrf8p9p0q20qyf10c6xhvw40m2c4rr105hbk6zy26nj1q";
    libName = "unicode_bidi";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
    ]);
    features = mkFeatures (features."unicode_bidi"."0.3.4" or {});
  };
  features_.unicode_bidi."0.3.4" = deps: f: updateFeatures f (rec {
    matches."${deps.unicode_bidi."0.3.4".matches}".default = true;
    unicode_bidi = fold recursiveUpdate {} [
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
      { "0.3.4".flame =
        (f.unicode_bidi."0.3.4".flame or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".flamer =
        (f.unicode_bidi."0.3.4".flamer or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".serde =
        (f.unicode_bidi."0.3.4".serde or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


# end
# unicode-segmentation-1.3.0

  crates.unicode_segmentation."1.3.0" = deps: { features?(features_.unicode_segmentation."1.3.0" deps {}) }: buildRustCrate {
    crateName = "unicode-segmentation";
    version = "1.3.0";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0jnns99wpjjpqzdn9jiplsr003rr41i95c008jb4inccb3avypp0";
    features = mkFeatures (features."unicode_segmentation"."1.3.0" or {});
  };
  features_.unicode_segmentation."1.3.0" = deps: f: updateFeatures f (rec {
    unicode_segmentation."1.3.0".default = (f.unicode_segmentation."1.3.0".default or true);
  }) [];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# url-1.7.2

  crates.url."1.7.2" = deps: { features?(features_.url."1.7.2" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "1.7.2";
    authors = [ "The rust-url developers" ];
    sha256 = "0qzrjzd9r1niv7037x4cgnv98fs1vj0k18lpxx890ipc47x5gc09";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."1.7.2"."idna"}" deps)
      (crates."matches"."${deps."url"."1.7.2"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."1.7.2"."percent_encoding"}" deps)
    ]);
    features = mkFeatures (features."url"."1.7.2" or {});
  };
  features_.url."1.7.2" = deps: f: updateFeatures f (rec {
    idna."${deps.url."1.7.2".idna}".default = true;
    matches."${deps.url."1.7.2".matches}".default = true;
    percent_encoding."${deps.url."1.7.2".percent_encoding}".default = true;
    url = fold recursiveUpdate {} [
      { "1.7.2".default = (f.url."1.7.2".default or true); }
      { "1.7.2".encoding =
        (f.url."1.7.2".encoding or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2".heapsize =
        (f.url."1.7.2".heapsize or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
    ];
  }) [
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# utf8-ranges-1.0.3

  crates.utf8_ranges."1.0.3" = deps: { features?(features_.utf8_ranges."1.0.3" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0nkh73y241czrxagm77qz20qcfn3h54a6v9cpvc7wjzwkaaqkswp";
  };
  features_.utf8_ranges."1.0.3" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.3".default = (f.utf8_ranges."1.0.3".default or true);
  }) [];


# end
# uuid-0.7.4

  crates.uuid."0.7.4" = deps: { features?(features_.uuid."0.7.4" deps {}) }: buildRustCrate {
    crateName = "uuid";
    version = "0.7.4";
    authors = [ "Ashley Mannix<ashleymannix@live.com.au>" "Christopher Armstrong" "Dylan DPC<dylan.dpc@gmail.com>" "Hunar Roop Kahlon<hunar.roop@gmail.com>" ];
    sha256 = "1kzjah6i8vf51hrla6qnplymaqx2fadhhlnbvgivgld311lqyz9m";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.uuid."0.7.4".rand or false then [ (crates.rand."${deps."uuid"."0.7.4".rand}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."uuid"."0.7.4" or {});
  };
  features_.uuid."0.7.4" = deps: f: updateFeatures f (rec {
    rand = fold recursiveUpdate {} [
      { "${deps.uuid."0.7.4".rand}"."stdweb" =
        (f.rand."${deps.uuid."0.7.4".rand}"."stdweb" or false) ||
        (uuid."0.7.4"."stdweb" or false) ||
        (f."uuid"."0.7.4"."stdweb" or false); }
      { "${deps.uuid."0.7.4".rand}"."wasm-bindgen" =
        (f.rand."${deps.uuid."0.7.4".rand}"."wasm-bindgen" or false) ||
        (uuid."0.7.4"."wasm-bindgen" or false) ||
        (f."uuid"."0.7.4"."wasm-bindgen" or false); }
      { "${deps.uuid."0.7.4".rand}".default = true; }
    ];
    uuid = fold recursiveUpdate {} [
      { "0.7.4".byteorder =
        (f.uuid."0.7.4".byteorder or false) ||
        (f.uuid."0.7.4".u128 or false) ||
        (uuid."0.7.4"."u128" or false); }
      { "0.7.4".default = (f.uuid."0.7.4".default or true); }
      { "0.7.4".md5 =
        (f.uuid."0.7.4".md5 or false) ||
        (f.uuid."0.7.4".v3 or false) ||
        (uuid."0.7.4"."v3" or false); }
      { "0.7.4".nightly =
        (f.uuid."0.7.4".nightly or false) ||
        (f.uuid."0.7.4".const_fn or false) ||
        (uuid."0.7.4"."const_fn" or false); }
      { "0.7.4".rand =
        (f.uuid."0.7.4".rand or false) ||
        (f.uuid."0.7.4".v4 or false) ||
        (uuid."0.7.4"."v4" or false); }
      { "0.7.4".sha1 =
        (f.uuid."0.7.4".sha1 or false) ||
        (f.uuid."0.7.4".v5 or false) ||
        (uuid."0.7.4"."v5" or false); }
      { "0.7.4".std =
        (f.uuid."0.7.4".std or false) ||
        (f.uuid."0.7.4".default or false) ||
        (uuid."0.7.4"."default" or false); }
      { "0.7.4".winapi =
        (f.uuid."0.7.4".winapi or false) ||
        (f.uuid."0.7.4".guid or false) ||
        (uuid."0.7.4"."guid" or false); }
    ];
  }) [
    (features_.rand."${deps."uuid"."0.7.4"."rand"}" deps)
  ];


# end
# vcpkg-0.2.6

  crates.vcpkg."0.2.6" = deps: { features?(features_.vcpkg."0.2.6" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.6";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1ig6jqpzzl1z9vk4qywgpfr4hfbd8ny8frqsgm3r449wkc4n1i5x";
  };
  features_.vcpkg."0.2.6" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.6".default = (f.vcpkg."0.2.6".default or true);
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# want-0.0.6

  crates.want."0.0.6" = deps: { features?(features_.want."0.0.6" deps {}) }: buildRustCrate {
    crateName = "want";
    version = "0.0.6";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "03cc2lndz531a4kgql1v9kppyb1yz2abcz5l52j1gg2nypmy3lh8";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."want"."0.0.6"."futures"}" deps)
      (crates."log"."${deps."want"."0.0.6"."log"}" deps)
      (crates."try_lock"."${deps."want"."0.0.6"."try_lock"}" deps)
    ]);
  };
  features_.want."0.0.6" = deps: f: updateFeatures f (rec {
    futures."${deps.want."0.0.6".futures}".default = true;
    log."${deps.want."0.0.6".log}".default = true;
    try_lock."${deps.want."0.0.6".try_lock}".default = true;
    want."0.0.6".default = (f.want."0.0.6".default or true);
  }) [
    (features_.futures."${deps."want"."0.0.6"."futures"}" deps)
    (features_.log."${deps."want"."0.0.6"."log"}" deps)
    (features_.try_lock."${deps."want"."0.0.6"."try_lock"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
      { "0.3.7".impl-debug =
        (f.winapi."0.3.7".impl-debug or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# ws2_32-sys-0.2.1

  crates.ws2_32_sys."0.2.1" = deps: { features?(features_.ws2_32_sys."0.2.1" deps {}) }: buildRustCrate {
    crateName = "ws2_32-sys";
    version = "0.2.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1zpy9d9wk11sj17fczfngcj28w4xxjs3b4n036yzpy38dxp4f7kc";
    libName = "ws2_32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
    ]);
  };
  features_.ws2_32_sys."0.2.1" = deps: f: updateFeatures f (rec {
    winapi."${deps.ws2_32_sys."0.2.1".winapi}".default = true;
    winapi_build."${deps.ws2_32_sys."0.2.1".winapi_build}".default = true;
    ws2_32_sys."0.2.1".default = (f.ws2_32_sys."0.2.1".default or true);
  }) [
    (features_.winapi."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    (features_.winapi_build."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
  ];


# end
}
