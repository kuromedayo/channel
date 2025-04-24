(define-module (ibus)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages anthy)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages language)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages unicode)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (srfi srfi-1))

(define-public ibus-anthy
  (package
    (name "ibus-anthy")
    (version "1.5.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ibus/ibus-anthy/releases/download/"
                    version "/ibus-anthy-" version ".tar.gz"))
              (sha256
               (base32
                "0h5x3bb7n6dyvrr748x219vqkz2pfpxxic0fkh6mxgm2gnnjh7cy"))))
    (build-system glib-or-gtk-build-system)
    (arguments
     (list
      ;; The test suite hangs. See:
      ;; https://github.com/ibus/ibus-anthy/issues/28#issuecomment-1591386573
      ;; https://issues.guix.gnu.org/52576#10
      #:tests? #f
      #:configure-flags
      ;; Use absolute exec path in the anthy.xml.
      #~(list (string-append "--libexecdir=" #$output "/libexec")
              (string-append
               "--with-anthy-zipcode="
               (assoc-ref %build-inputs "anthy") "/share/anthy/zipcode.t"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-check
            (lambda _
              (substitute* "data/Makefile.in"
                ;; Use a year written in era.y, to avoid the
                ;; "This year ２０ＸＸ is not included in era.y" error.
                (("`date '\\+%Y'`")
                 "2021"))))
          (add-after 'unpack 'do-not-override-GI_TYPELIB_PATH
            ;; Do not override the GI_TYPELIB_PATH to avoid the pygobject
            ;; error: "ValueError: Namespace Gdk not available".
            (lambda _
              (substitute* "tests/test-build.sh"
                (("GI_TYPELIB_PATH=\\$BUILDDIR/../gir" all)
                 (string-append all ":$GI_TYPELIB_PATH")))))
          (add-before 'configure 'pre-configure
            (lambda _
              ;; We need generate new _config.py with correct PKGDATADIR.
              (delete-file "setup/python3/_config.py")
              (delete-file "engine/python3/_config.py")))
          (add-before 'check 'prepare-for-tests
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                ;; IBus requires write access to the HOME directory.
                (setenv "HOME" "/tmp")
                ;; The single test is skipped if no actual display is found.
                (system "Xvfb :1 &")
                (setenv "DISPLAY" ":1"))))
          (add-after 'install 'wrap-programs
            (lambda* (#:key inputs #:allow-other-keys)
              (for-each
               (lambda (prog)
                 (wrap-program (string-append #$output "/libexec/" prog)
                   `("GUIX_PYTHONPATH" ":" prefix
                     (,(getenv "GUIX_PYTHONPATH")))
                   `("GI_TYPELIB_PATH" ":" prefix
                     (,(getenv "GI_TYPELIB_PATH")
                      ,(string-append #$output "/lib/girepository-1.0")))))
               '("ibus-engine-anthy" "ibus-setup-anthy")))))))
    (native-inputs
     (list gettext-minimal
           `(,glib "bin")
           intltool
           pkg-config
           procps                       ;for ps
           python
           python-pycotap
           util-linux                   ;for getopt
           xorg-server-for-tests))
    (inputs
     (list bash-minimal
           anthy
           gtk+
           ibus
           gobject-introspection
           python-pygobject))
    (synopsis "Anthy Japanese language input method for IBus")
    (description "IBus-Anthy is an engine for the input bus \"IBus\").  It
adds the Anthy Japanese language input method to IBus.  Because most graphical
applications allow text input via IBus, installing this package will enable
Japanese language input in most graphical applications.")
    (home-page "https://github.com/fujiwarat/ibus-anthy")
    (license gpl2+)))

