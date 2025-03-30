(define-module (fonts)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages c)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xorg))

;; (define-public font-google-noto
;;   (package
;;     (name "font-google-noto")
;;     (version "2025.03.01")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/notofonts/notofonts.github.io")
;;              (commit (string-append "noto-monthly-release-" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1bkwp30y46w05774qikd806jcadpcr2w6i6nrhxf1hmja4n7inp3"))))
;;     (build-system font-build-system)
;;     (arguments
;;      (list
;;       #:modules
;;       '((guix build font-build-system)
;;         (guix build utils)
;;         (ice-9 ftw))
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (replace 'install
;;             (lambda _
;;               (define* (install source #:optional (output #$output))
;;                 (let ((%install (assoc-ref %standard-phases 'install)))
;;                   (with-directory-excursion source
;;                     (%install #:outputs `(("out" . ,output))))))

;;               (define (scan-directory name)
;;                 (scandir name (lambda (file)
;;                                 (not (member file '("." ".." "LICENSE"))))))

;;               (define (install-font-variant variant)
;;                 "Given font variant VARIANT, install one of its formats,
;; variable TTF or OTF or TTF."
;;                 (with-directory-excursion variant
;;                   (let ((formats (scan-directory ".")))
;;                     (cond
;;                      ((member "variable-ttf" formats)
;;                       (install "variable-ttf"))
;;                      ((member "otf" formats)
;;                       (install "otf"))
;;                      ((member "ttf" formats)
;;                       (install "ttf"))))))

;;               (define (install-font font)
;;                 "Given FONT, install one of its variants, either full or
;; unhinted, and install its hinted variant into 'ttf' output.  According to the
;; source, unhinted and hinted variants are always available."
;;                 (with-directory-excursion font
;;                   (if (member "full" (scan-directory "."))
;;                       (install-font-variant "full")
;;                       (install-font-variant "unhinted"))
;;                   (install "hinted" #$output:ttf)))

;;               (with-directory-excursion "fonts"
;;                 (for-each install-font (scan-directory "."))))))))
;;     (outputs '("out" "ttf"))
;;     (home-page "https://fonts.google.com/noto")
;;     (synopsis "Fonts to cover all languages")
;;     (description "Google Noto Fonts is a family of fonts designed to support
;; all languages with a consistent look and aesthetic.  Its goal is to properly
;; display all Unicode symbols.")
;;     (license license:silofl1.1)))

;;  (define-public font-tamzen
;;      (package
;;        (name "font-tamzen")
;;        (version "1.11.6")
;;        (source
;;         (origin
;;           (method git-fetch)
;;           (uri (git-reference
;;                 (url "https://github.com/sunaku/tamzen-font")
;;                 (commit (string-append "Tamzen-" version))))
;;           (file-name (git-file-name name version))
;;           (sha256
;;            (base32 "1lmb50rdna549dv64whb1ilff324ivz9cxlrdkf3r9vbdsram5av"))))
;;        (build-system font-build-system)
;;        (home-page "https://github.com/sunaku/tamzen-font")
;;        (synopsis "Monospaced bitmap font for console and X11")
;;        (description
;;         "Tamzen is a fork of the @code{Tamsyn} font.  It is programmatically forked
;; from @code{Tamsyn} version 1.11, backporting glyphs from older versions while
;; deleting deliberately empty glyphs (which are marked as unimplemented) to
;; allow secondary/fallback fonts to provide real glyphs at those codepoints.

;; The @code{TamzenForPowerline} fonts provide additional @code{Powerline} symbols,
;; which are programmatically injected with @code{bitmap-font-patcher} and
;; later hand-tweaked with the gbdfed(1) editor:

;; @enumerate
;; @item all icons are expanded to occupy the maximum available space
;; @item the branch of the fork icon ( U+E0A0) was made larger than the trunk
;; @item for the newline icon ( U+E0A1), the @emph{N} was made larger at the bottom
;; @item the keyhole in the padlock icon ( U+E0A2) was replaced with @emph{//} lines.
;; @end enumerate
;; ")
;;        (license (license:non-copyleft "file://LICENSE"))))

;; (define-public font-junicode
;;   (package
;;     (name "font-junicode")
;;     (version "2.211")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/psb1558/Junicode-font")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "0nk6fgby5sp6035p542pfk2fgjir36vk315mj5z5xf7rafy13jhb"))))
;;     (build-system font-build-system)
;;     (home-page "https://github.com/psb1558/Junicode-font")
;;     (synopsis "Unicode font for medievalists, linguists, and others")
;;     (description
;;      "The Junicode font was developed for students and scholars of
;; medieval Europe, but its large glyph repertoire also makes it useful as a
;; general-purpose font.  Its visual design is based on the typography used by
;; Oxford University Press in the late 17th and early 18th centuries.  The font
;; implements the @acronym{MUFI, Medieval Unicode Font Initiative} recommendation
;; for encoding ligatures, alternative letter forms, and other features of
;; interest to medievalists using Unicode's Private Use Area.

;; Junicode 2 is a major reworking of the font family.  Its OpenType programming
;; has been rebuilt to support the creation of searchable, accessible electronic
;; documents using the @acronym{MUFI} characters.  The family includes five
;; weights and five widths in both Roman and Italic, plus variable fonts.")
;;     (license license:silofl1.1)))

;; (define-public font-ibm-plex
;;   (package
;;     (name "font-ibm-plex")
;;     (version "6.4.2")
;;     ;; We prefer git-fetch since it lets us get the opentype, truetype and web
;;     ;; fonts all in one download. The zip archive releases separate the
;;     ;; opentype, truetype and web fonts into three separate archives.
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/IBM/plex")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "00lzbm1b7zbx5q3p0s8fh9q9zj6z4k01fn7n177iybh9xn4jgx0p"))))
;;     (build-system font-build-system)
;;     (outputs '("out" "ttf" "woff"))
;;     (home-page "https://github.com/IBM/plex")
;;     (synopsis "IBM Plex typeface")
;;     (description
;;      "This package provides the Plex font family.  It comes in a Sans, Serif,
;; Mono and Sans Condensed, all with roman and true italics.  The fonts have been
;; designed to work well in user interface (UI) environments as well as other
;; mediums.")
;;     (license license:silofl1.1)))

;; (define-public font-stix-two
;;   (package
;;     (name "font-stix-two")
;;     (version "2.14")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/stipub/stixfonts")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "02wy9n49nzyvhc55jjmpxrv7hh6ncxv31liniqjgjn7vp68fj40n"))))
;;     (build-system font-build-system)
;;     (home-page "https://www.stixfonts.org/")
;;     (synopsis
;;      "OpenType Unicode fonts for scientific, technical, and mathematical texts")
;;     (description
;;      "The mission of the Scientific and Technical Information Exchange (STIX)
;; font creation project is the preparation of a comprehensive set of fonts that
;; serve the scientific and engineering community in the process from manuscript
;; creation through final publication, both in electronic and print formats.")
;;     (license license:silofl1.1)))

;; (define-public font-monaspace
;;   (package
;;     (name "font-monaspace")
;;     (version "1.200")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/githubnext/monaspace")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "0llhn40mbi67slkb9y3g16165v6hayczr11kygpz0zx6azg3m1lv"))))
;;     (build-system font-build-system)
;;     (outputs '("out" "ttf" "woff"))
;;     (home-page "https://monaspace.githubnext.com")
;;     (synopsis "Innovative superfamily of fonts for code")
;;     (description
;;      "The Monaspace type system is a monospaced type superfamily with some
;; modern tricks up its sleeve.  It consists of five variable axis typefaces.
;; Each one has a distinct voice, but they are all metrics-compatible with one
;; another, allowing you to mix and match them for a more expressive
;; typographical palette.")
;;     (license license:silofl1.1)))

;; (define-public font-sarasa-gothic
;;   (package
;;     (name "font-sarasa-gothic")
;;     (version "1.0.29")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (string-append "https://github.com/be5invis/Sarasa-Gothic"
;;                            "/releases/download/v"
;;                            version
;;                            "/Sarasa-TTC-"
;;                            version
;;                            ".7z"))
;;        (sha256
;;         (base32 "1y82wp3rgm1xnn92f0jppgiqjsimdy83ljyh5q9dybzx3fp0x8w7"))))
;;     (build-system font-build-system)
;;     (arguments
;;      (list
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (replace 'unpack
;;             (lambda* (#:key source #:allow-other-keys)
;;               (mkdir "source")
;;               (chdir "source")
;;               (invoke "7z" "x" source))))))
;;     (native-inputs (list p7zip))
;;     (home-page "https://github.com/be5invis/Sarasa-Gothic")
;;     (license license:silofl1.1)
;;     (synopsis "CJK programming font based on Iosevka and Source Han Sans")
;;     (description
;;      "Sarasa Gothic is a programming font based on Iosevka and Source Han Sans,
;; most CJK characters are same height, and double width as ASCII characters.")
;;     (properties '((upstream-name . "Sarasa")))))

;; (define-public font-openmoji
;;   (package
;;     (name "font-openmoji")
;;     (version "15.1.0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/hfg-gmuend/openmoji/")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1iil5jmkkqrqgq06q3gvgv7j1bq8499q3h2340prwlfi2sqcqzlk"))))
;;     (build-system font-build-system)
;;     (arguments
;;      (list
;;       #:modules `((ice-9 ftw)
;;                   (guix build font-build-system)
;;                   (guix build utils))
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (add-after 'unpack 'chdir
;;             (lambda _
;;               (chdir "font")))
;;           (add-after 'chdir 'strip-alternative-variants
;;             (lambda _
;;               (let ((keep '("OpenMoji-black-glyf" "OpenMoji-color-glyf_colr_0"
;;                             "." "..")))
;;                 (for-each (lambda (f)
;;                             (unless (member f keep)
;;                               (delete-file-recursively f)))
;;                           (scandir ".")))))
;;           (add-before 'install-license-files 'chdir-back
;;             (lambda _
;;               (chdir ".."))))))
;;     (home-page "https://openmoji.org")
;;     (synopsis "Font for rendering emoji characters")
;;     (description
;;      "This package provides the OpenMoji font in both color and black
;; variants.")
;;     (license license:cc-by-sa4.0)))

;; (define-public symbols-nerd-font
;;   (package
;;     (name "symbols-nerd-font")
;;     (version "3.3.0")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (string-append
;;                     "https://github.com/ryanoasis/nerd-fonts/releases/download/v"
;;                     version
;;                     "/NerdFontsSymbolsOnly.zip"))
;;               (sha256
;;                (base32
;;                 "0h53ldrkydxaps4kv087k71xgmb40b1s2nv2kvxc4bvs3qy60y10"))))
;;     (build-system font-build-system)
;;     (home-page "https://www.nerdfonts.com")
;;     (synopsis "Patched developer fonts with extra glyphs")
;;     (description "This package provides patched developer-targeted fonts with a
;; high number of additional glyphs.  It includes extra glyphs from popular iconic
;; fonts such as Font Awesome, Devicons, Octicons, and more.")
;;     (license (list license:expat license:silofl1.1))))

;; (define-public font-ubuntu
;;   (package
;;    (name "font-ubuntu")
;;    (version "0.83")
;;    (source (origin
;;             (method url-fetch)
;;             (uri (string-append
;;                   "https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-"
;;                   version
;;                   ".zip"))
;;             (sha256
;;              (base32
;;               "1kwfsvqkkh0928mf75md37g150hs46wqnhzgkzqm5mbga91b78k1"))))
;;    (build-system font-build-system)
;;    (home-page "https://design.ubuntu.com/font")
;;    (synopsis "Ubuntu font family")
;;    (description
;;     "The Ubuntu font family is a sans-serif typeface family available in 22
;; styles plus a variable font with adjustable weight and width axes.  Its
;; fixed-width companion, Ubuntu Mono, comes in 8 styles and a variable font with
;; an adjustable weight axis.")
;;    (license license:silofl1.1))) ; there is no ubuntu license in licenses.scm

