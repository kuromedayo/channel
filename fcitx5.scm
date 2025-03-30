;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2020, 2022 Zhu Zihao <all_but_last@163.com>
;;; Copyright © 2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2022 Dominic Martinez <dom@dominicm.dev>
;;; Copyright © 2022 dan <i@dan.games>
;;; Copyright © 2024 Zheng Junjie <873216071@qq.com>
;;; Copyright © 2024 Charles <charles@charje.net>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (fcitx5)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages anthy)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages language)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages unicode)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

;; ;; Does not work properly with macOS-light/dark
;; (define-public fcitx5-themes-candlelight
;;   (let ((commit "d4146d3d3f7a276a8daa2847c3e5c08de20485da")
;;         (revision "0"))
;;     (package
;;       (name "fcitx5-themes-candlelight")
;;       (version (git-version "0.1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/thep0y/fcitx5-themes-candlelight")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0hm3axrfkd4cxr7shxclw00nk2xxwb2w4b2qjwmps1xkv3mlv1zw"))))
;;       (build-system copy-build-system)
;;       (arguments
;;        (list
;;         #:install-plan
;;         #~'(("spring" "share/fcitx5/themes/")
;;             ("summer" "share/fcitx5/themes/")
;;             ("autumn" "share/fcitx5/themes/")
;;             ("winter" "share/fcitx5/themes/")
;;             ("green" "share/fcitx5/themes/")
;;             ("transparent-green" "share/fcitx5/themes/")
;;             ("macOS-light" "share/fcitx5/themes/")
;;             ("macOS-dark" "share/fcitx5/themes/"))))
;;       (home-page "https://github.com/thep0y/fcitx5-themes-candlelight")
;;       (synopsis "Simple theme for fcitx5")
;;       (description
;;        "Fcitx5-themes-candlelight is a simple theme for fcitx 5. It has following color variants:

;; @itemize
;; @item spring
;; @item summer
;; @item autumn
;; @item winter
;; @item green
;; @item transparent-green
;; @item macOS-light
;; @item macOS-dark
;; @end itemize\n")
;;       (license license:expat))))

(define-public my-fcitx5-catppuccin-theme
  (let ((commit "383c27ac46cbb55aa5f58acbd32841c1ed3a78a0")
        (revision "0"))
    (package
      (name "my-fcitx5-catppuccin-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/catppuccin/fcitx5")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07l5d1nlwiq2jhydxckv7a44kic1y8jl93q0jr2i0lmq0zvdzkcz"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("src" "share/fcitx5/themes"))))
      (home-page "https://github.com/catppuccin/fcitx5")
      (synopsis "Soothing pastel theme for Fcitx5")
      (description
       "Fcitx5-catppuccin-theme is a soothing pastel theme for Fcitx 5.  It
provides 4 flavors (latte, frappe, macchiato and mocha) and 14 accent colors
(rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky,
sapphire, blue and lavender).")
      (license license:expat))))

;; (define-public fcitx5-nord-theme
;;   (let ((commit "bdaa8fb723b8d0b22f237c9a60195c5f9c9d74d1")
;;         (revision "0"))
;;     (package
;;       (name "fcitx5-nord-theme")
;;       (version (git-version "0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/tonyfettes/fcitx5-nord")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "04bjxzx26x9r01ss7l0fam22nhsvh38dpijy7za0grnr5g93ynm9"))))
;;       (build-system copy-build-system)
;;       (arguments
;;        (list
;;         #:install-plan
;;         #~'(("Nord-Dark" "share/fcitx5/themes/")
;;             ("Nord-Light" "share/fcitx5/themes/"))))
;;       (home-page "https://github.com/tonyfettes/fcitx5-nord")
;;       (synopsis "Fcitx5 theme based on Nord color")
;;       (description
;;        "Fcitx5-nord-theme is a Fcitx 5 theme based on Nord Color, featuring
;; dimmed pastel colors for a comfortable yet vibrant ambiance.  It offers 2
;; versions: Nord-dark and Nord-light.")
;;       (license license:expat))))

;; (define-public fcitx5-fluent-theme
;;   (let ((commit "399699ac7d366ed6c1952646ed71647e3c8f99b5")
;;         (revision "0"))
;;     (package
;;       (name "fcitx5-fluent-theme")
;;       (version (git-version "0.4.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/Reverier-Xu/Fluent-fcitx5")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "188gsggh78gjf2kg9kxds819hxidc2yf5aivwbbqayw7cb2h5ijr"))))
;;       (build-system copy-build-system)
;;       (arguments
;;        (list
;;         #:install-plan
;;         #~'(("FluentDark-solid" "share/fcitx5/themes/")
;;             ("FluentDark" "share/fcitx5/themes/")
;;             ("FluentLight-solid" "share/fcitx5/themes/")
;;             ("FluentLight" "share/fcitx5/themes/"))))
;;       (home-page "https://github.com/Reverier-Xu/Fluent-fcitx5")
;;       (synopsis "Fluent-Design theme with blur effect and shadow for fcitx5")
;;       (description
;;        "Fcitx5-fluent-theme is a fluent-design theme with blur effect and
;; shadow.  It offers 4 versions: FluentDark, FluentDark-solid, FluentLight, and
;; FluentLight-solid.")
;;       (license license:mpl2.0))))

