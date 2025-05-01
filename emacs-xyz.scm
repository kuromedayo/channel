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

;; (define-public emacs-catppuccin-theme
;;   (let ((commit "206f823ce870c41c2d2306fce260a643c5985832")
;;         (revision "3"))
;;     (package
;;       (name "emacs-catppuccin-theme")
;;       (version (git-version "1.0.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/catppuccin/emacs")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "10j41fl453gym4g3i2d8xn3i16p7q0hpdakypiq01p25mv7qyv4b"))))
;;       (build-system emacs-build-system)
;;       (home-page "https://github.com/catppuccin/emacs")
;;       (synopsis "Soothing pastel theme for Emacs")
;;       (description
;;        "Catppuccin is a soothing pastel theme for Emacs.  It provides
;; different color palettes, such as @samp{frappe}, @samp{macchiato}, or
;; @samp{latte}.")
;;       (license license:expat))))

;;; FSDG problem in issues
(define-public emacs-nerd-icons-completion
  (let ((commit "8e5b995eb2439850ab21ba6062d9e6942c82ab9c")
        (revision "0"))
    (package
      (name "emacs-nerd-icons-completion")
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

(define-public emacs-affe
  (package
    (name "emacs-affe")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/minad/affe")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "166v7d120hbk6vczj1iam85xivk6wwpvga8m0vxgcii19issh5b3"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-consult))
    (home-page "https://github.com/minad/affe")
    (synopsis "Asynchronous fuzzy finder for Emacs")
    (description "This package provides Affe, an asynchronous fuzzy finder for
GNU Emacs written in pure Emacs Lisp.  It spawns an external producer process,
such as @command{find} or @command{grep}, and filters the output asynchronously.
The UI remains responsive, and results are shown via the Consult interface.
Affe is experimental and best suited for small to medium projects.")
    (license license:gpl3+)))
