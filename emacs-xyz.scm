(define-module (emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix utils))

(define-public emacs-catppuccin-theme
  (let ((commit "206f823ce870c41c2d2306fce260a643c5985832")
        (revision "3"))
    (package
      (name "my-emacs-catppuccin-theme")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/catppuccin/emacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "10j41fl453gym4g3i2d8xn3i16p7q0hpdakypiq01p25mv7qyv4b"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/catppuccin/emacs")
      (synopsis "Soothing pastel theme for Emacs")
      (description
       "Catppuccin is a soothing pastel theme for Emacs.  It provides
different color palettes, such as @samp{frappe}, @samp{macchiato}, or
@samp{latte}.")
      (license license:expat))))

(define-public emacs-nerd-icons-completion
  (let ((commit "8e5b995eb2439850ab21ba6062d9e6942c82ab9c")
        (revision "0"))
    (package
      (name "my-emacs-nerd-icons-completion")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rainstormstudio/nerd-icons-completion")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0nbyrzz5sscycbr1h65ggzrm1m9agfwig2mjg7jljzw8dk1bmmd2"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-nerd-icons emacs-compat))
      (home-page "https://github.com/rainstormstudio/nerd-icons-completion")
      (synopsis "Use nerd-icons for completion")
      (description
       "This package provides functionality to enhance completion interfaces by
displaying icons from Nerd Fonts. It is inspired by
@code{all-the-icons-completion} and integrates Nerd Icons into various
completion frameworks.")
      (license license:gpl3+))))

(define-public emacs-smooth-scroll
  (package
    (name "my-emacs-smooth-scroll")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/k-talo/smooth-scroll.el")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0d2qzpgh486cp0aa12ky1np1i49d0gskvldfw627v55qsm6ql9ll"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/k-talo/smooth-scroll.el")
    (synopsis "Minor mode for smooth and in-place scrolling in Emacs")
    (description "This package provides the @code{smooth-scroll-mode} minor mode
 for Emacs, enabling smooth and in-place scrolling functionality.")
    (license license:gpl3+)))

(define-public emacs-outli
  (package
    (name "emacs-outli")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jdtsmith/outli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "01q37gbfc0mal3ha2x5a1axdcd2c0d55imav4w0cfzs3sm48azvs"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/jdtsmith/outli")
    (synopsis "Simple and stylish comment-based outliner for Emacs")
    (description "This package provides @code{outli}, a minimal and elegant
outliner for Emacs that enhances @code{outline-minor-mode} with configurable
heading syntax, styled headings, and org-mode-inspired navigation and structure
editing. It supports comment-based headers with customizable stems and repeat
characters, styled overlines and backgrounds, tab-based visibility toggling,
org-style speed keys for headline manipulation, and imenu integration for fast
navigation.")
    (license license:gpl3+)))
