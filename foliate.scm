(define-module (foliate)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix build-system meson))

(define-public my-foliate
  (package
   (name "my-foliate")
   (version "3.2.1")
   (source (origin
             ;; Probably I should include foliate-js manually because it is more reproducible
            (method url-fetch)
            (uri (string-append
                  "https://github.com/johnfactotum/foliate/releases/download/"
                  version
                  "/com.github.johnfactotum.Foliate-"
                  version
                  ".tar.xz"))
            (sha256
             (base32
              "193fcx6mb7m7wycl2bxc1z63dvw67ry99qip695br7hs9267mhh1"))))
   (build-system meson-build-system)
   (arguments
    (list #:glib-or-gtk? #t
          #:phases
          #~ (modify-phases %standard-phases
                            (add-after 'glib-or-gtk-wrap 'wrap-program
                                       (lambda* (#:key outputs #:allow-other-keys)
                                         (let ((prog (string-append (assoc-ref outputs "out")
                                                                    "/bin/foliate")))
                                           ;; Put existing typelibs before sushi's deps, so as to
                                           ;; correctly infer gdk-pixbuf.
                                           (wrap-program prog
                                                         `("GI_TYPELIB_PATH" suffix
                                                           (,(getenv "GI_TYPELIB_PATH")))
                                                         ;; for icon.
                                                         `("GDK_PIXBUF_MODULE_FILE" =
                                                           (,(getenv "GDK_PIXBUF_MODULE_FILE"))))))))))
   (native-inputs
    (list pkg-config
          gettext-minimal
          desktop-file-utils
          `(,glib "bin")
          `(,gtk+ "bin")
          `(,gtk "bin")))
   (inputs
    (list gjs
          libadwaita
          webkitgtk
          gtk))
   (home-page "https://johnfactotum.github.io/foliate/")
   (synopsis "Foliate synopsis dayo")
   (description
    "Foliate description dayo")
   (license (list license:gpl3))))

