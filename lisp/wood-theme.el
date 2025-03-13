;;; wood-theme.el --- wood-theme -*- lexical-binding: t -*-

;; Copyright © 2023-2025, by ed9w2in6

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;; Author: ed9w2in6
;; Version: 1.0
;; Created: [2023-08-13]
;; Keywords: theme
;; Homepage: http://github.com/ed9w2in6/wood-theme.el
;; Package-Requires: ((autothemer "0.2.18") (emacs "26.1"))

;;; Commentary:

;; A warm theme inspired by wood and plants colours.

;; This is the "vanilla" version for wood-theme.
;; Use this a base for colour palette derivation.

;;; Code:

(require 'wood)

(wood-deftheme wood
  "A warm theme inspired by wood and plants colours."
  
  ;; declare color classes to use
  ((((class color) (min-colors #xffffff)) ; 24 bit color
    ;; ((class color) (min-colors #xff))  ; 256-color
    )
   
   ;; Define colours, one columns per class in order
   ;; Woods (main)
   (wood-bark-dark "#2b0400")
   (wood-bark "#331400")
   (wood-bark-light "#401900") ; result of auto wood-indent from #331400
   (wood-sap "#402510")        ; slight blue for contrast
   (wood-sap-light "#533a2a")  ; More yellow for contrast, region face was #554422, menu was #583400
   (wood-heart "#542c29")
   (wood-heart-light "#785029") ; verticle-boarder was #76664f
   (wood-birch-mute "#ebc89b")
   (wood-birch "#ffc4ab")
   (wood-birch-light "#fffbca")
   
   ;; Leafs (accent)
   (wood-leaf "#488800")
   (wood-leaf-young "#7bbb00")
   (wood-leaf-sprout "#9ddd00")
   (wood-leaf-bottom "#bde271")
   (wood-leaf-old "#f5ec00")
   (wood-leaf-old-light "#eeee88")
   (wood-leaf-dry "#e39b00")
   (wood-leaf-dry-dark "#998050")
   (wood-leaf-momiji "#ff6900")
   
   ;; Flowers (emphasis)
   (wood-rose "#ba0016")
   (wood-rose-light "#ec6481") ; #d96c92 #ec6481 #ff5d71
   (wood-lilac "#7d1636")
   (wood-lilac-light "#e372d9") ; #f782f7 #d96c92
   (wood-iris "#5f4dcd")
   (wood-iris-light "#aaaaff")
   (wood-sky "#55aaff")
   (wood-sky-light "#55eeff")
   
   ;; Monochrome (muted). indent guide was but never used #3f2d1c #766553
   (wood-soot "#161616")
   (wood-ash-dark "#7a7a7a")
   (wood-ash "#c8cccd")
   (wood-ash-light "#feffff"))

  ;; Forms after the face specifications are evaluated.
  ;; (palette vars can be used, read below for details.)
  ;; (custom-theme-set-variables 'example-name
  ;;     `(ansi-color-names-vector [,wood-rose
  ;;                                ,wood-leaf-young
  ;;                                ,wood-iris
  ;;                                ,wood-lilac
  ;;                                ,wood-leaf-old
  ;;                                ,wood-leaf-momiji
  ;;                                ,wood-sky-light]))
  )

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'wood)
;;; wood-theme.el ends here
