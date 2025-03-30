(define-module (fontfor)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mc)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-check)
  #:use-module (gnu packages crates-crypto)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix svn-download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cargo)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1))

;; (define-public rust-fontconfig-parser-0.5
;;   (package
;;     (name "rust-fontconfig-parser")
;;     (version "0.5.7")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "fontconfig-parser" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "19xdfsvl9sjha9n1lk3s6bqixcihsmjsd7zf3y90rsd69kagrz61"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-log" ,rust-log-0.4)
;;         ("rust-roxmltree" ,rust-roxmltree-0.20)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-criterion" ,rust-criterion-0.5)
;;         ("rust-glob" ,rust-glob-0.3)
;;         ("rust-k9" ,rust-k9-0.12)
;;         ("rust-serde-json" ,rust-serde-json-1))))
;;     (home-page "https://github.com/fschutt/rust-fontconfig")
;;     (synopsis "Pure-Rust rewrite of the Linux fontconfig library")
;;     (description "This package provides a Pure-Rust implementation of the Linux fontconfig library, with no system dependencies. It uses the @package{ttf-parser} and @package{allsorts} crates for font parsing and handling.")
;;     (license license:expat)))

;; (define-public rust-ttf-parser-0.20
;;   (package
;;     (inherit rust-ttf-parser-0.25)
;;     (name "rust-ttf-parser")
;;     (version "0.20.0")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "ttf-parser" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1d4n3p9ccjvy4mj72700i0c2q6d49dxjpwflw47q79rpv1v7vxqp"))))
;;     (arguments
;;      `(#:skip-build? #t)))) ; Cut the dependency graph.

;; (define-public rust-fontdb-0.16
;;   (package
;;     (name "rust-fontdb")
;;     (version "0.16.2")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "fontdb" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1hqxv3jnh06s4bflrwnb39mi3knllfs4mxm44vsn0gzgqch90adh"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-fontconfig-parser" ,rust-fontconfig-parser-0.5)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-memmap2" ,rust-memmap2-0.9)
;;         ("rust-slotmap" ,rust-slotmap-1)
;;         ("rust-tinyvec" ,rust-tinyvec-1)
;;         ("rust-ttf-parser" ,rust-ttf-parser-0.20))
;;        #:cargo-development-inputs
;;        (("rust-env-logger" ,rust-env-logger-0.10))))
;;     (home-page "https://github.com/alexheretic/ab-glyph")
;;     (synopsis "In-memory font database with CSS-like queries")
;;     (description "This package provides an in-memory font database that supports
;;  loading fonts from files, directories, and raw data. It allows querying of
;;  fonts using CSS-like queries and includes functionality for loading system
;;  fonts by scanning predefined directories. Each font face is assigned a unique
;;  ID.")
;;     (license license:expat)))

;; ;; Below are probably needless

;; (define-public rust-wit-bindgen-rt-0.39
;;   (package
;;     (name "rust-wit-bindgen-rt")
;;     (version "0.39.0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wit-bindgen-rt" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1hd65pa5hp0nl664m94bg554h4zlhrzmkjsf6lsgsb7yc4734hkg"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      (list #:cargo-inputs
;;            `(("rust-bitflags" ,rust-bitflags-2)
;;              ("rust-futures" ,rust-futures-0.3)
;;              ("rust-once-sell" ,rust-once-cell-1))))
;;     (home-page "https://github.com/bytecodealliance/wasi")
;;     (synopsis "Runtime support for wit-bindgen bindings")
;;     (description "This package provides runtime support for wit-bindgen, a suite
;;  of bindings generators for languages compiled to WebAssembly using the
;;  component model. It facilitates the use of bindings described in *.wit files,
;;  managing imports, exports, and reuse between bindings definitions.")
;;     (license (list license:asl2.0 license:expat))))

;; (define-public rust-wasi-0.14
;;   (package
;;     (name "rust-wasi")
;;     (version "0.14.2+wasi-0.2.4")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasi" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1cwcqjr3dgdq8j325awgk8a715h0hg0f7jqzsb077n4qm6jzk0wn"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      (list #:skip-build? #t
;;            #:cargo-inputs
;;            `(("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;              ("rust-rustc-std-workspace-alloc"
;;               ,rust-rustc-std-workspace-alloc-1)
;;              ("rust-rustc-std-workspace-core"
;;               ,rust-rustc-std-workspace-core-1)
;;              ("rust-wit-bindgen-rt" ,rust-wit-bindgen-rt-0.39))))
;;     (home-page "https://github.com/bytecodealliance/wasi")
;;     (synopsis "Experimental WASI API bindings for Rust")
;;     (description
;;      "This package provides experimental WASI API bindings for Rust.")
;;     (license (list license:asl2.0
;;                    license:expat))))

;; (define-public rust-r-efi-5
;;   (package
;;     (name "rust-r-efi")
;;     (version "5.2.0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "r-efi" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1ig93jvpqyi87nc5kb6dri49p56q7r7qxrn8kfizmqkfj5nmyxkl"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      (list #:cargo-inputs
;;            `(("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;              ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
;;     (home-page "https://github.com/r-efi/r-efi/wiki")
;;     (synopsis "UEFI Reference Specification Protocol Constants and Definitions")
;;     (description
;;      "The r-efi project provides the protocol constants and definitions of the
;; UEFI Reference Specification as native rust code.  The scope of this project is
;; limited to those protocol definitions.  The protocols are not actually
;; implemented.  As such, this project serves as base for any UEFI application that
;; needs to interact with UEFI, or implement (parts of) the UEFI specification.")
;;     (license (list license:expat
;;                    license:asl2.0
;;                    license:lgpl2.1+))))

;; (define-public rust-wasm-bindgen-shared-0.2
;;   (package
;;     (name "rust-wasm-bindgen-shared")
;;     (version "0.2.100")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (crate-uri "wasm-bindgen-shared" version))
;;         (file-name (string-append name "-" version ".tar.gz"))
;;         (sha256
;;          (base32 "0gffxvqgbh9r9xl36gprkfnh3w9gl8wgia6xrin7v11sjcxxf18s"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-unicode-ident" ,rust-unicode-ident-1))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/")
;;     (synopsis "Shared support between wasm-bindgen and wasm-bindgen cli")
;;     (description "This package provides shared support between
;; @code{wasm-bindgen} and @code{wasm-bindgen} cli, an internal dependency.")
;;     (license (list license:asl2.0
;;                    license:expat))))

;; (define-public rust-wasm-bindgen-backend-0.2
;;   (package
;;     (name "rust-wasm-bindgen-backend")
;;     (version "0.2.100")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen-backend" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1ihbf1hq3y81c4md9lyh6lcwbx6a5j0fw4fygd423g62lm8hc2ig"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-bumpalo" ,rust-bumpalo-3)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2)
;;         ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/")
;;     (synopsis "Backend code generation of the wasm-bindgen tool")
;;     (description
;;      "Backend code generation of the wasm-bindgen tool.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-wasm-bindgen-macro-support-0.2
;;   (package
;;     (name "rust-wasm-bindgen-macro-support")
;;     (version "0.2.100")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen-macro-support" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1plm8dh20jg2id0320pbmrlsv6cazfv6b6907z19ys4z1jj7xs4a"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2)
;;         ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
;;         ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/")
;;     (synopsis "The @code{#[wasm_bindgen]} macro")
;;     (description
;;      "The part of the implementation of the @code{#[wasm_bindgen]}
;; attribute that is not in the shared backend crate.")
;;     (license (list license:asl2.0 license:expat))))

;; (define-public rust-wasm-bindgen-macro-0.2
;;   (package
;;     (name "rust-wasm-bindgen-macro")
;;     (version "0.2.100")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen-macro" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "01xls2dvzh38yj17jgrbiib1d3nyad7k2yw9s0mpklwys333zrkz"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:tests? #f      ; use of undeclared crate or module `web_sys`
;;        #:cargo-inputs
;;        (("rust-quote" ,rust-quote-1)
;;         ("rust-wasm-bindgen-macro-support" ,rust-wasm-bindgen-macro-support-0.2))
;;        #:cargo-development-inputs
;;        (("rust-trybuild" ,rust-trybuild-1))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/")
;;     (synopsis "Definition of the @code{#[wasm_bindgen]} attribute")
;;     (description
;;      "Definition of the @code{#[wasm_bindgen]} attribute, an internal
;; dependency.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-wasm-bindgen-0.2
;;   (package
;;     (name "rust-wasm-bindgen")
;;     (version "0.2.100")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1x8ymcm6yi3i1rwj78myl1agqv2m86i648myy3lc97s9swlqkp0y"))
;;        (modules '((guix build utils)))
;;        (snippet
;;         '(begin (substitute* "Cargo.toml"
;;                   (("\"=([[:digit:]]+(\\.[[:digit:]]+)*)" _ version)
;;                    (string-append "\"^" version)))))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;       (("rust-cfg-if" ,rust-cfg-if-1)
;;        ("rust-once-cell" ,rust-once-cell-1)
;;        ("rust-serde" ,rust-serde-1)
;;        ("rust-serde-json" ,rust-serde-json-1)
;;        ("rust-wasm-bindgen-macro" ,rust-wasm-bindgen-macro-0.2)
;;        ("rust-rustversion" ,rust-rustversion-1))
;;       #:cargo-development-inputs
;;       (("rust-once-cell" ,rust-once-cell-1)
;;        ("rust-paste" ,rust-paste-1)
;;        ("rust-serde-derive" ,rust-serde-derive-1))))
;;     (home-page "https://rustwasm.github.io/")
;;     (synopsis "Easy support for interacting between JS and Rust")
;;     (description
;;      "Easy support for interacting between JS and Rust.")
;;     (license (list license:asl2.0 license:expat))))

;; (define-public rust-js-sys-0.3
;;   (package
;;     (name "rust-js-sys")
;;     (version "0.3.77")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "js-sys" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "13x2qcky5l22z4xgivi59xhjjx4kxir1zg7gcj0f1ijzd4yg7yhw"))
;;        (modules '((guix build utils)))
;;        (snippet
;;         '(begin (substitute* "Cargo.toml"
;;                   (("\"=([[:digit:]]+(\\.[[:digit:]]+)*)" _ version)
;;                    (string-append "\"^" version)))))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-once-cell" ,rust-once-cell-1)
;;         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/")
;;     (synopsis "Bindings for all JS global objects and functions in WASM")
;;     (description
;;      "Bindings for all JS global objects and functions in all JS environments
;; like Node.js and browsers, built on @code{#[wasm_bindgen]} using the
;; wasm-bindgen crate.")
;;     (license (list license:asl2.0 license:expat))))

;; (define-public rust-web-sys-0.3
;;   (package
;;     (name "rust-web-sys")
;;     (version "0.3.77")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "web-sys" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1lnmc1ffbq34qw91nndklqqm75rasaffj2g4f8h1yvqqz4pdvdik"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-js-sys" ,rust-js-sys-0.3)
;;         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
;;        #:cargo-development-inputs (("rust-futures" ,rust-futures-0.3))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
;;     (synopsis
;;      "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
;;     (description
;;      "Bindings for all Web APIs, a procedurally generated crate from WebIDL.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-wasm-bindgen-futures-0.4
;;   (package
;;     (name "rust-wasm-bindgen-futures")
;;     (version "0.4.50")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen-futures" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "0q8ymi6i9r3vxly551dhxcyai7nc491mspj0j1wbafxwq074fpam"))
;;        (modules '((guix build utils)))
;;        (snippet
;;         '(begin (substitute* "Cargo.toml"
;;                   (("\"=([[:digit:]]+(\\.[[:digit:]]+)*)" _ version)
;;                    (string-append "\"^" version)))))))
;;     (build-system cargo-build-system)
;;     (arguments
;;       `(#:cargo-inputs
;;         (("rust-cfg-if" ,rust-cfg-if-1)
;;          ("rust-futures-core" ,rust-futures-core-0.3)
;;          ("rust-js-sys" ,rust-js-sys-0.3)
;;          ("rust-once-cell" ,rust-once-cell-1)
;;          ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
;;          ("rust-web-sys" ,rust-web-sys-0.3))
;;         #:cargo-development-inputs
;;         (("rust-futures-channel" ,rust-futures-channel-0.3)
;;          ("rust-futures-lite" ,rust-futures-lite-2))))
;;     (home-page "https://rustwasm.github.io/wasm-bindgen/")
;;     (synopsis
;;      "Bridging the gap between Rust Futures and JavaScript Promises")
;;     (description
;;      "Bridging the gap between Rust Futures and JavaScript Promises.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-wasm-bindgen-test-macro-0.3
;;   (package
;;     (name "rust-wasm-bindgen-test-macro")
;;     (version "0.3.50")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen-test-macro" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "16znd6wz79v2i3b2sf5n4ld2kcci8br3wcx7z5c9c07sqln09m8p"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2))
;;        #:cargo-development-inputs
;;        (("rust-tokio" ,rust-tokio-1)
;;         ("rust-trybuild" ,rust-trybuild-1))))
;;     (home-page "https://github.com/rustwasm/wasm-bindgen")
;;     (synopsis "Internal testing macro for wasm-bindgen")
;;     (description
;;      "This library contains the internal testing macro for wasm-bindgen.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-wasm-bindgen-test-0.3
;;   (package
;;     (name "rust-wasm-bindgen-test")
;;     (version "0.3.50")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "wasm-bindgen-test" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1hsjc60wynlhgw02p32pgb93303pqmsdfxj67gxdkdm37kixbj36"))
;;        (modules '((guix build utils)))
;;        (snippet
;;         '(begin (substitute* "Cargo.toml"
;;                   (("\"=([[:digit:]]+(\\.[[:digit:]]+)*)" _ version)
;;                    (string-append "\"^" version)))))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-gg-alloc" ,rust-gg-alloc-1)
;;         ("rust-js-sys" ,rust-js-sys-0.3)
;;         ("rust-minicov" ,rust-minicov-0.3)
;;         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
;;         ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
;;         ("rust-wasm-bindgen-test-macro" ,rust-wasm-bindgen-test-macro-0.3))))
;;     (home-page "https://github.com/rustwasm/wasm-bindgen")
;;     (synopsis
;;      "Internal testing crate for wasm-bindgen")
;;     (description
;;      "Internal testing crate for wasm-bindgen.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-getrandom-0.3
;;   (package
;;     (name "rust-getrandom")
;;     (version "0.3.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "getrandom" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1w2mlixa1989v7czr68iji7h67yra2pbg3s480wsqjza1r2sizkk"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-r-efi" ,rust-r-efi-5)
;;         ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-js-sys" ,rust-js-sys-0.3)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
;;         ("rust-wasi" ,rust-wasi-0.14)
;;         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
;;        #:cargo-development-inputs
;;        (("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
;;     (home-page "https://github.com/rust-random/getrandom")
;;     (synopsis "Retrieve random data from system source")
;;     (description
;;      "This package provides a small cross-platform library for
;; retrieving random data from system source.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-rand-core-0.9
;;   (package
;;     (name "rust-rand-core")
;;     (version "0.9.3")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "rand_core" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "0f3xhf16yks5ic6kmgxcpv1ngdhp48mmfy4ag82i1wnwh8ws3ncr"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-getrandom" ,rust-getrandom-0.3)
;;         ("rust-serde" ,rust-serde-1))))
;;     (home-page "https://rust-random.github.io/book")
;;     (synopsis "Core random number generator traits and tools")
;;     (description
;;      "This package provides core random number generator traits and
;; tools for implementation.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-rand-chacha-0.9
;;   (package
;;     (name "rust-rand-chacha")
;;     (version "0.9.0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "rand_chacha" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-ppv-lite86" ,rust-ppv-lite86-0.2)
;;         ("rust-rand-core" ,rust-rand-core-0.9)
;;         ("rust-serde" ,rust-serde-1))
;;        #:cargo-development-inputs
;;        (("rust-rand-core" ,rust-rand-core-0.9)
;;         ("rust-serde-json" ,rust-serde-json-1))))
;;     (home-page "https://crates.io/crates/rand_chacha")
;;     (synopsis "ChaCha random number generator")
;;     (description
;;      "This package provides the ChaCha random number generator.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-rand-pcg-0.9
;;   (package
;;     (name "rust-rand-pcg")
;;     (version "0.9.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (crate-uri "rand_pcg" version))
;;         (file-name (string-append name "-" version ".tar.gz"))
;;         (sha256
;;          (base32
;;           "1xr04g5zrzqi9n7vyzjznnyrmy55i8k34ripsb2gmdxazzvw72ml"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-rand-core" ,rust-rand-core-0.9)
;;         ("rust-serde" ,rust-serde-1))
;;        #:cargo-development-inputs
;;        (("rust-bincode" ,rust-bincode-1)
;;         ("rust-rand-core" ,rust-rand-core-0.9))))
;;     (home-page "https://crates.io/crates/rand_pcg")
;;     (synopsis
;;      "Selected PCG random number generators")
;;     (description
;;      "This package implements a selection of PCG random number generators.")
;;     (license (list license:asl2.0
;;                    license:expat))))

;; ;; (define-public rust-rand-0.9
;; ;;   (package
;; ;;     (name "rust-rand")
;; ;;     (version "0.9.0")
;; ;;     (source
;; ;;      (origin
;; ;;        (method url-fetch)
;; ;;        (uri (crate-uri "rand" version))
;; ;;        (file-name (string-append name "-" version ".tar.gz"))
;; ;;        (sha256
;; ;;         (base32 "156dyvsfa6fjnv6nx5vzczay1scy5183dvjchd7bvs47xd5bjy9p"))))
;; ;;     (build-system cargo-build-system)
;; ;;     (arguments
;; ;;      `(#:cargo-inputs
;; ;;        (("rust-log" ,rust-log-0.4)
;; ;;         ("rust-rand-chacha" ,rust-rand-chacha-0.9)
;; ;;         ("rust-zerocopy" ,rust-zerocopy-0.8)
;; ;;         ("rust-rand-core" ,rust-rand-core-0.9)
;; ;;         ("rust-serde" ,rust-serde-1))
;; ;;        #:cargo-development-inputs
;; ;;        (("rust-bincode" ,rust-bincode-1)
;; ;;         ("rust-rand-pcg" ,rust-rand-pcg-0.9)
;; ;;         ("rust-rayon" ,rust-rayon-1))))
;; ;;     (home-page "https://crates.io/crates/rand")
;; ;;     (synopsis "Random number generators and other randomness functionality")
;; ;;     (description
;; ;;      "Rand provides utilities to generate random numbers, to convert them to
;; ;; useful types and distributions, and some randomness-related algorithms.")
;; ;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-serde-derive-1
;;   (package
;;     (name "rust-serde-derive")
;;     (version "1.0.219")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde_derive" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "001azhjmj7ya52pmfiw4ppxm16nd44y15j2pf5gkcwrcgz7pc0jv"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2))
;;        #:cargo-development-inputs
;;        (("rust-serde" ,rust-serde-1))))
;;     (home-page "https://serde.rs")
;;     (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
;;     (description
;;      "This package provides the macros 1.1 implementation of
;; @code{#[derive(Serialize, Deserialize)]}.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-serde-1
;;   (package
;;     (name "rust-serde")
;;     (version "1.0.219")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1dl6nyxnsi82a197sd752128a4avm6mxnscywas1jq30srp2q3jz"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-serde-derive" ,rust-serde-derive-1))
;;        #:cargo-development-inputs
;;        (("rust-serde-derive" ,rust-serde-derive-1))))
;;     (home-page "https://serde.rs")
;;     (synopsis "Generic serialization/deserialization framework")
;;     (description
;;      "This package provides a generic serialization/deserialization framework.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-serde-json-1
;;   (package
;;     (name "rust-serde-json")
;;     (version "1.0.140")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde_json" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "0wwkp4vc20r87081ihj3vpyz5qf7wqkqipq17v99nv6wjrp8n1i0"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-indexmap" ,rust-indexmap-2)
;;         ("rust-itoa" ,rust-itoa-1)
;;         ("rust-memchr" ,rust-memchr-2)
;;         ("rust-ryu" ,rust-ryu-1)
;;         ("rust-serde" ,rust-serde-1))
;;        #:cargo-development-inputs
;;        (("rust-automod" ,rust-automod-1)
;;         ("rust-indoc" ,rust-indoc-2)
;;         ("rust-ref-cast" ,rust-ref-cast-1)
;;         ("rust-rustversion" ,rust-rustversion-1)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-serde-bytes" ,rust-serde-bytes-0.11)
;;         ("rust-serde-derive" ,rust-serde-derive-1)
;;         ("rust-serde-stacker" ,rust-serde-stacker-0.1)
;;         ("rust-trybuild" ,rust-trybuild-1))))
;;     (home-page "https://github.com/serde-rs/json")
;;     (synopsis "JSON serialization file format")
;;     (description
;;      "This package provides a JSON serialization file format.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-grid-0.13
;;   (package
;;     (name "rust-grid")
;;     (version "0.13.0")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "grid" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "135mp5gji3r7xgmkr7vj9gc7hqa1z0mrn92r2d9qmcbxcb0zz5ni"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-serde" ,rust-serde-1))
;;        #:cargo-development-inputs
;;        (("rust-criterion" ,rust-criterion-0.3)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-serde-json" ,rust-serde-json-1))))
;;     (home-page "https://github.com/alexheretic/ab-glyph")
;;     (synopsis "In-memory font database with CSS-like queries")
;;     (description "This package provides an in-memory font database that supports
;;  loading fonts from files, directories, and raw data. It allows querying of
;;  fonts using CSS-like queries and includes functionality for loading system
;;  fonts by scanning predefined directories. Each font face is assigned a unique
;;  ID.")
;;     (license license:expat)))

;; (define-public rust-gen-ops-0.4
;;   (package
;;     (name "rust-gen-ops")
;;     (version "0.4.0")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "gen_ops" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "02hfbxyz79z284g4l9gdqhw99rn8pgyb0si9babj1102nyfy2k9h"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-development-inputs
;;        (("rust-paste" ,rust-paste-1))))
;;     (home-page "https://github.com/K-Vinayak/gen_ops")
;;     (synopsis "Rust macros for operator overloading of generic types")
;;     (description "This package provides a set of Rust macros that facilitate
;; operator overloading for generic types.  The macros allow specifying generic
;; parameters, type signatures, and callable expressions for various operators,
;; along with optional where clauses.")
;;     (license license:expat)))

;; (define-public rust-binary-merge-0.1
;;   (package
;;     (name "rust-binary-merge")
;;     (version "0.1.2")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "binary-merge" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1aslcmvvsa8k7zzddlfbji618jvpsylangxjh51nljx5h0fbhysr"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-development-inputs
;;        (("rust-criterion" ,rust-criterion-0.3)
;;         ("rust-proptest" ,rust-proptest-1))))
;;     (home-page "https://github.com/rklaehn/binary-merge")
;;     (synopsis "Minimum comparison merge of two sorted random access sequences")  
;;     (description "This package provides a library for efficiently merging two
;; sorted random access sequences with a minimal number of comparisons.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-testdrop-0.1
;;   (package
;;     (name "rust-testdrop")
;;     (version "0.1.2")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "testdrop" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1bmyxcxc8d1pzkfl6jpg3pr4ld2qmhrlazcjsddk5dcflhrfwf9x"))))
;;     (build-system cargo-build-system)
;;     (home-page "https://github.com/malbarbo/testdrop")
;;     (synopsis "Utility to help test drop implementations")  
;;     (description "This package provides a small crate to help test drop
;;  implementation")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-inplace-vec-builder-0.1
;;   (package
;;     (name "rust-inplace-vec-builder")
;;     (version "0.1.1")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "inplace-vec-builder" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "01ykl6cis06m2hw88413jhmjs4qvhsi8fx8j3ykr2s12r3nw4r6g"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:tests? #f ;; It fails...
;;        #:cargo-inputs
;;        (("rust-smallvec" ,rust-smallvec-1))
;;        #:cargo-development-inputs
;;        (("rust-testdrop" ,rust-testdrop-0.1))))
;;     (home-page "https://github.com/rklaehn/inplace-vec-builder")
;;     (synopsis "Library for building Vec or SmallVec in-place without allocation")  
;;     (description "This package provides a small library for constructing a Vec
;; or SmallVec in-place without additional memory allocation.  It is particularly
;; useful for writing in-place operations such as mapping, filtering, and modifying
;; elements while reusing the existing storage.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-ref-cast-impl-1
;;   (package
;;     (name "rust-ref-cast-impl")
;;     (version "1.0.24")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "ref-cast-impl" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1ir7dm7hpqqdgg60hlspsc1ck6wli7wa3xcqrsxz7wdz45f24r8i"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2))
;;        #:cargo-development-inputs (("rust-ref-cast" ,rust-ref-cast-1))))
;;     (home-page "https://github.com/dtolnay/ref-cast")
;;     (synopsis "Derive implementation for @code{ref_cast::RefCast}")
;;     (description
;;      "Derive implementation for @code{ref_cast::RefCast}.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-ref-cast-1
;;   (package
;;     (name "rust-ref-cast")
;;     (version "1.0.24")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "ref-cast" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1kx57g118vs9sqi6d2dcxy6vp8jbx8n5hilmv1sacip9vc8y82ja"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:tests? #f          ; Doesn't always interact well with the test crate.
;;        #:cargo-inputs
;;        (("rust-ref-cast-impl" ,rust-ref-cast-impl-1))
;;        #:cargo-development-inputs
;;        (("rust-ref-cast-test-suite" ,rust-ref-cast-test-suite-0.0.0)
;;         ("rust-rustversion" ,rust-rustversion-1)
;;         ("rust-trybuild" ,rust-trybuild-1))))
;;     (home-page "https://github.com/dtolnay/ref-cast")
;;     (synopsis "Safely cast &T to &U")
;;     (description
;;      "Safely cast &T to &U where the struct U contains a single field of type T.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-obey-0.1
;;   (package
;;     (name "rust-obey")
;;     (version "0.1.1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "obey" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "13qv0wi69f421ppl3bmq5s7gc0fv9bk4swb57b7bf3wiy8mn64w3"))))
;;     (build-system cargo-build-system)
;;     (home-page "")
;;     (synopsis "Test utilities for collections")
;;     (description
;;      "This package provides tools for property based tests of collections")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-range-collections-0.4
;;   (package
;;     (name "rust-range-collections")
;;     (version "0.4.6")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "range-collections" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1l50y6hhjm5n49n277wra1gpzsn2rr0x5law9icdgpjakkm0c5w6"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-binary-merge" ,rust-binary-merge-0.1)
;;         ("rust-inplace-vec-builder" ,rust-inplace-vec-builder-0.1)
;;         ("rust-ref-cast" ,rust-ref-cast-1)
;;         ("rust-smallvec" ,rust-smallvec-1)
;;         ("rust-bytecheck" ,rust-bytecheck-0.6)
;;         ("rust-rkyv" ,rust-rkyv-0.7)
;;         ("rust-serde" ,rust-serde-1))
;;        #:cargo-development-inputs
;;        (("rust-criterion" ,rust-criterion-0.3)
;;         ("rust-hex" ,rust-hex-0.4)
;;         ("rust-num-traits" ,rust-num-traits-0.2)
;;         ("rust-obey" ,rust-obey-0.1)
;;         ("rust-proptest" ,rust-proptest-1)
;;         ("rust-quickcheck" ,rust-quickcheck-0.8)
;;         ("rust-quickcheck-macros" ,rust-quickcheck-macros-0.8)
;;         ("rust-rand" ,rust-rand-0.7)
;;         ("rust-rkyv" ,rust-rkyv-0.7)
;;         ("rust-serde-cbor" ,rust-serde-cbor-0.11)
;;         ("rust-testdrop" ,rust-testdrop-0.1))))
;;     (home-page "https://github.com/CarlKCarlK/range-set-blaze")
;;     (synopsis "Fast integer sets using sorted disjoint ranges")
;;     (description "This package provides the @command{range-set-blaze} crate,
;; which implements fast integer sets using sorted disjoint ranges.  It supports
;; various integer sizes and full set operations while efficiently storing ranges
;; in a BTreeMap.  The main struct is @code{RangeSetBlaze}, and the main trait is
;; @code{SortedDisjoint}.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-range-set-0.0.10
;;   (package
;;     (name "rust-range-set")
;;     (version "0.0.10")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "range-set" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "04l8fs1033gs12lilhny2a9yigqds5w8s0w19gbdrb13d4krjkpm"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-num-traits" ,rust-num-traits-0.2)
;;         ("rust-smallvec" ,rust-smallvec-1)
;;         ("rust-serde" ,rust-serde-1))))
;;     (home-page "https://github.com/spearman/range-set")
;;     (synopsis "Store collections of PrimInt values as inclusive ranges")  
;;     (description "This package provides a data structure for storing collections
;; of @code{PrimInt} values as inclusive ranges using generic @code{SmallVec}
;; -backed storage.  A generic @code{smallvec::Array} parameter allows configuring
;; how many ranges will be stored on the stack before spilling over onto the
;; heap.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-permutator-0.4
;;   (package
;;     (name "rust-permutator")
;;     (version "0.4.3")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "permutator" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1mhh4mpmmlh45by6bavfk241g2qriw7lgaj4wd5w6d98qf7z7im9"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-num" ,rust-num-0.2))))
;;     (home-page "https://github.com/NattapongSiri/permutator")
;;     (synopsis "Lexicographic cartesian product and permutation generator")  
;;     (description "This package provides functions to compute lexicographic
;; cartesian products and permutations at any specific index from given data.  It
;; can generate a complete lexicographic cartesian product from one or multiple
;; datasets, produce lexicographic combinations, and compute non-lexicographic
;; permutations and k-permutations.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-criterion-0.3.5;; TODO: rangemap let ranbindings would be better
;;   (package
;;     (inherit rust-criterion-0.3)
;;     (name "rust-criterion")
;;     (version "0.3.5")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "criterion" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "044d2x7cxfvw2g558lzyllcv7jcdkw9xmacmb0nzx8pv4pyxl10n"))))
;;     (arguments
;;      `(#:tests? #f
;;        #:cargo-inputs
;;        (("rust-async-std" ,rust-async-std-1)
;;         ("rust-atty" ,rust-atty-0.2)
;;         ("rust-cast" ,rust-cast-0.3)
;;         ("rust-clap" ,rust-clap-2)
;;         ("rust-criterion-plot" ,rust-criterion-plot-0.4)
;;         ("rust-csv" ,rust-csv-1)
;;         ("rust-futures" ,rust-futures-0.3)
;;         ("rust-itertools" ,rust-itertools-0.10)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-num-traits" ,rust-num-traits-0.2)
;;         ("rust-oorandom" ,rust-oorandom-11)
;;         ("rust-plotters" ,rust-plotters-0.3)
;;         ("rust-rayon" ,rust-rayon-1)
;;         ("rust-regex" ,rust-regex-1)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-serde-cbor" ,rust-serde-cbor-0.11)
;;         ("rust-serde-derive" ,rust-serde-derive-1)
;;         ("rust-serde-json" ,rust-serde-json-1)
;;         ("rust-smol" ,rust-smol-1)
;;         ("rust-tinytemplate" ,rust-tinytemplate-1)
;;         ("rust-tokio" ,rust-tokio-1)
;;         ("rust-walkdir" ,rust-walkdir-2))
;;        #:cargo-development-inputs
;;        (("rust-approx" ,rust-approx-0.5)
;;         ("rust-futures" ,rust-futures-0.3)
;;         ("rust-quickcheck" ,rust-quickcheck-1)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-tempfile" ,rust-tempfile-3))))))

;; (define-public rust-syntactic-for-0.1
;;   (package
;;     (name "rust-syntactic-for")
;;     (version "0.1.1")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "syntactic-for" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "0mr7jjnmb4k9sdg1hxi6f2q1hkjwjf3ipb2wvhvb6cwk46id35x8"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;     (home-page "https://github.com/NattapongSiri/permutator")
;;     (synopsis "Syntactic 'for' loop macro")  
;;     (description "This package provides a Rust macro that implements a syntactic
;; for loop.")
;;     (license license:expat)))

;; (define-public rust-rangemap-1
;;   (package
;;     (name "rust-rangemap")
;;     (version "1.5.1")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "rangemap" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "116nhgzbjil97qjq3d64mg7fi7lqka5hqdf44bzjwd29d1ywq3zn"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-serde" ,rust-serde-1))
;;        #:cargo-development-inputs
;;        (("rust-chrono" ,rust-chrono-0.4)
;;         ("rust-criterion" ,rust-criterion-0.3.5)
;;         ("rust-permutator" ,rust-permutator-0.4)
;;         ("rust-proptest" ,rust-proptest-1)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-rustc-version" ,rust-rustc-version-0.4)
;;         ("rust-serde-json" ,rust-serde-json-1)
;;         ("rust-test-strategy" ,rust-test-strategy-0.3))))
;;     (home-page "https://github.com/jeffparsons/rangemap")
;;     (synopsis "Map and set data structures with range-based keys")  
;;     (description "This package provides RangeMap and RangeInclusiveMap, map data
;; structures that use ranges as keys.  Contiguous and overlapping ranges mapping
;; to the same value are automatically merged.  Corresponding RangeSet and
;; RangeInclusiveSet structures are also included.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-range-set-blaze-0.1
;;   (package
;;     (name "rust-range-set-blaze")
;;     (version "0.1.16")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "range-set-blaze" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1lhk1wpwnshx6kz6rb2fnhq3hgpzjwl3d38496zanbi6b7aba8c4"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:tests? #f
;;        #:cargo-inputs
;;        (("rust-gen-ops" ,rust-gen-ops-0.4)
;;         ("rust-itertools" ,rust-itertools-0.12)
;;         ("rust-num-integer" ,rust-num-integer-0.1)
;;         ("rust-num-traits" ,rust-num-traits-0.2))
;;        #:cargo-development-inputs
;;        (("rust-criterion" ,rust-criterion-0.5)
;;         ("rust-glob" ,rust-glob-0.3)
;;         ("rust-quickcheck" ,rust-quickcheck-1)
;;         ("rust-quickcheck-macros" ,rust-quickcheck-macros-1)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-range-collections" ,rust-range-collections-0.4)
;;         ("rust-range-set" ,rust-range-set-0.0.10)
;;         ("rust-rangemat" ,rust-rangemap-1)
;;         ("rust-roaring" ,rust-roaring-0.10)
;;         ("rust-syntactic-for" ,rust-syntactic-for-0.1)
;;         ("rust-thousands" ,rust-thousands-0.2)
;;         ("rust-trybuild" ,rust-trybuild-1)
;;         ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
;;     (home-page "https://github.com/CarlKCarlK/range-set-blaze")
;;     (synopsis "Fast integer sets using sorted disjoint ranges")
;;     (description "This package provides the @command{range-set-blaze} crate,
;; which implements fast integer sets using sorted disjoint ranges.  It supports
;; various integer sizes and full set operations while efficiently storing ranges
;; in a BTreeMap. The main struct is @code{RangeSetBlaze}, and the main trait is
;; @code{SortedDisjoint}.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-ttf-parser-0.21
;;   (package
;;     (inherit rust-ttf-parser-0.25)
;;     (name "rust-ttf-parser")
;;     (version "0.21.1")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "ttf-parser" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "1y0wsfgri7yi41cn57g4fzqm30x1v5nlrci6j5mqcxwpys1isn9c")))))) 

;; (define-public rust-tui-input-0.8
;;   (package
;;     (name "rust-tui-input")
;;     (version "0.8.0")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (crate-uri "tui-input" version))
;;               (file-name (string-append name "-" version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "00fwd3w06kb2w83jcdcffcwbayf8ch5rsria1a04rbx3cgw8brxk"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-unicode-width" ,rust-unicode-width-0.1)
;;         ("rust-crossterm" ,rust-crossterm-0.27)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-termion" ,rust-termion-2))))
;;     (home-page "https://github.com/sayanarijit/tui-input")
;;     (synopsis "TUI input library supporting multiple backends")  
;;     (description "This package provides a TUI input library supporting multiple backends.")
;;     (license license:expat)))

;; (define-public my-fontfor
;;   (package
;;     (name "my-fontfor")
;;     (version "0.4.3")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/7sDream/fontfor")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "13v9b2w94fqixy7v6nvzm35ran27smiw28x2rh2ycagzy947v6c0"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-ab-glyph" ,rust-ab-glyph-0.2)
;;         ("rust-clap" ,rust-clap-4)
;;         ("rust-crossterm" ,rust-crossterm-0.27)
;;         ("rust-fontdb" ,rust-fontdb-0.16)
;;         ("rust-grid" ,rust-grid-0.13)
;;         ("rust-httparse" ,rust-httparse-1)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-once-cell" ,rust-once-cell-1)
;;         ("rust-range-set-blaze" ,rust-range-set-blaze-0.1)
;;         ("rust-ratatui" ,rust-ratatui-0.26)
;;         ("rust-thiserror" ,rust-thiserror-1)
;;         ("rust-ttf-parser" ,rust-ttf-parser-0.21)
;;         ("rust-tui-input" ,rust-tui-input-0.8)
;;         ("rust-env-logger" ,rust-env-logger-0.11))))
;;     (home-page "https://github.com/7sDream/fontfor")
;;     (synopsis "Find and preview fonts that support a specified character")
;;     (description "FontFor is a tool for finding fonts that can display a given
;; character and previewing them.  The tool loads font files quickly
;; using mmap and only parses necessary font tables. It supports previews both in
;; the terminal and in a web browser for user-friendly font exploration.")
;;     (license license:gpl3+)))
