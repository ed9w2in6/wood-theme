;;; wood.el --- wood-theme base -*- lexical-binding: t -*-

;; Copyright © 2023-2025, by ed9w2in6

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 3.

;; Author: ed9w2in6
;; Version: 1.0
;; Created: [2023-08-13]
;; Keywords: theme
;; Homepage: http://github.com/ed9w2in6/wood-theme.el
;; Package-Requires: ((autothemer "0.2.18") (emacs "26.1"))

;;; Commentary:

;; A warm theme inspired by wood and plants colours.

;; This file defines everything but the colour palette shared by derived themes.

;;; Code:

(require 'autothemer)

;; Check if the user's Emacs version is at least 26.1
;; (let ((maj-ver 26)
;;       (min-ver 1))
;;   (unless (or (> emacs-major-version maj-ver)
;;               (and (= emacs-major-version maj-ver)
;;                    (>= emacs-minor-version min-ver)))
;;     (error "Need Emacs >= %d.%d" maj-ver min-ver)))

(defgroup wood nil
  "Customization for the Wood theme family.

Most if not all of the customization MUST be set before theme load."
  :group 'faces)

(defcustom wood-tab-line-box-line-width 14
  "The tab-line height, for tab-line face's box line-width.

It is recommended to do this in your config:

\(if (display-graphic-p)
    (/ (max 2 (line-pixel-height)) 2)
    -1)"
  :type 'integer
  :group 'wood)

(defcustom wood-default-face-height 140
  "Height in 1/10 pt unit for the default face.

Height of other faces are defined relatively to this."
  :type 'integer
  :group 'wood)

(defcustom wood-default-face-font-family nil
  "Font family for the default face."
  :type 'string
  :group 'wood)

(defcustom wood-variable-pitch-face-font-family nil
  "Font family for the variable pitch face."
  :type 'string
  :group 'wood)

;; TODO: Just a template for now, ignoring warnings.
(defun wood-gen-palette-svg (from-path to-path)
  "Use `autothemer-generate-palette-svg' on FROM-PATH output to TO-PATH."
  (autothemer-generate-palette-svg
   `(:theme-file ,(file-truename "~/.emacs.d/straight/repos/wood-theme/wood-theme.el")
     :svg-out-file ,(file-truename "~/.emacs.d/straight/repos/wood-theme/wood-theme.el.svg")
     :bg-color "#331400"
     :text-accent-color "#eeee88"
     :text-color "#e39b00"
     :swatch-border-color "#161616"
     :columns 7
     :font-family "Source Sans Pro"
     :h-space 0
     :v-space 0
     :page-bottom-margin 60
     :page-left-margin 30
     :page-right-margin 30
     :page-top-margin 120
     :sort-palette ,(list
                     :sort-fn ''autothemer-saturated-order
                     :group-fn ''autothemer-brightness-grouping
                     :group-args 'autothemer-dark-mid-light-brightness-groups)
     :swatch-height 120
     :swatch-rotate 40
     :swatch-width 130
     :visually-group-swatches t
     ;; :page-template - see page-template below
     ;; :swatch-template - see swatch-template below
     )))

(defmacro wood-deftheme (name description palette &rest body)
  "Define a wood theme variant with NAME, DESCRIPTION, PALETTE and BODY."
  `(autothemer-deftheme
    ,name
    ,description
    ,palette
    
    ;; Config faces.  Symbols that not palette name MUST be quoted, e.g. ... :weight 'bold
    ((default (:height wood-default-face-height :family wood-default-face-font-family :background wood-bark :foreground wood-birch-light))
     (fixed-pitch (:weight 'light :inherit 'default))
     (variable-pitch (:weight 'light :family wood-variable-pitch-face-font-family))
     (ac-completion-face (:underline t :foreground wood-lilac))
     (widget-field (:inherit 'org-block)) ; (:background wood-sap-light :foreground wood-birch-light)
     
     (ansi-color-black (:background wood-soot :foreground wood-soot))
     (ansi-color-bright-black (:background wood-ash-dark :foreground wood-ash-dark))
     (ansi-color-red (:background wood-rose :foreground wood-rose))
     (ansi-color-bright-red (:background wood-rose-light :foreground wood-rose-light))
     (ansi-color-green (:background wood-leaf-young :foreground wood-leaf-young))
     (ansi-color-bright-green (:background wood-leaf-bottom :foreground wood-leaf-bottom))
     (ansi-color-yellow (:background wood-leaf-old :foreground wood-leaf-old))
     (ansi-color-bright-yellow (:background wood-leaf-old-light :foreground wood-leaf-old-light))
     (ansi-color-blue (:background wood-iris :foreground wood-iris))
     (ansi-color-bright-blue (:background wood-iris-light :foreground wood-iris-light))
     (ansi-color-magenta (:background wood-lilac :foreground wood-lilac))
     (ansi-color-bright-magenta (:background wood-lilac-light :foreground wood-lilac-light))
     (ansi-color-cyan (:background wood-sky :foreground wood-sky))
     (ansi-color-bright-cyan (:background wood-sky-light :foreground wood-sky-light))
     (ansi-color-white (:background wood-ash :foreground wood-ash))
     (ansi-color-bright-white (:background wood-ash-light :foreground wood-ash-light))
     ;; term color inherits from ansi, hence removed, see term.el
     
     (aw-leading-char-face (:foreground wood-rose :height 5.0))
     (cursor (:background wood-rose))
     (default-italic (:slant 'italic))
     (error (:foreground wood-sky-light :weight 'bold))
     ;; rely on inherit for now
     ;; (flycheck-error (:inherit 'error))
     ;; (flycheck-warning (:inherit 'warning))
     ;; (flycheck-info (:inherit 'success))
     ;; (ffap (:foreground wood-birch-mute))
     
     (font-latex-bold-face (:foreground wood-leaf-bottom))
     (font-latex-italic-face (:foreground wood-leaf-dry :slant 'italic))
     (font-latex-match-reference-keywords (:foreground wood-rose))
     (font-latex-match-variable-keywords (:foreground wood-leaf-dry))
     (font-latex-string-face (:foreground wood-birch))
     (font-lock-builtin-face (:foreground wood-rose-light))
     (font-lock-comment-face (:foreground wood-ash-dark))
     (font-lock-constant-face (:foreground wood-rose))
     (font-lock-doc-face (:foreground wood-ash-dark))
     (font-lock-function-name-face (:foreground wood-leaf-old))
     (font-lock-keyword-face (:weight 'bold :foreground wood-lilac))
     (font-lock-negation-char-face (:foreground wood-rose))
     (font-lock-reference-face (:foreground wood-rose))
     (font-lock-string-face (:foreground wood-birch))
     (font-lock-type-face (:foreground wood-leaf-bottom))
     (font-lock-variable-name-face (:foreground wood-leaf-dry))
     (font-lock-warning-face (:foreground wood-leaf-momiji)) ; :background wood-bark-light
     (fringe (:background wood-bark-light :foreground wood-birch-mute))
     (gnus-header-content (:foreground wood-lilac))
     (gnus-header-from (:foreground wood-leaf-dry))
     (gnus-header-name (:foreground wood-leaf-bottom))
     (gnus-header-subject (:foreground wood-leaf-old :weight 'bold))
     (header-line (:background wood-heart :foreground wood-birch-mute :inverse-video nil :box nil
                               :underline (:color wood-birch-light :style 'wave :position nil) :weight 'bold))
     (highlight (:background wood-heart :foreground wood-birch-mute))
     ;; highlight-indent-guides auto calculates from theme, hence removed, see highlight-indent-guides.el

     (hl-line (:background wood-sap))
     (icompletep-determined (:foreground wood-rose-light))
     (ido-first-match (:foreground wood-lilac :weight 'bold))
     (ido-only-match (:foreground wood-leaf-momiji))
     (info-quoted-name (:foreground wood-rose-light))
     (info-string (:foreground wood-birch))
     
     (isearch (:weight 'bold :foreground wood-iris-light :background wood-heart))
     (ivy-current-match (:underline t :inherit 'highlight :foreground wood-iris-light))
     
     (jde-java-font-lock-constant-face (:foreground wood-rose))
     (jde-java-font-lock-modifier-face (:foreground wood-birch-mute))
     (jde-java-font-lock-number-face (:foreground wood-leaf-dry))
     (jde-java-font-lock-package-face (:foreground wood-leaf-dry))
     (jde-java-font-lock-private-face (:foreground wood-lilac))
     (jde-java-font-lock-public-face (:foreground wood-lilac))
     (jde-jave-font-lock-protected-face (:foreground wood-lilac))
     (js2-external-variable (:foreground wood-leaf-bottom))
     (js2-function-param (:foreground wood-rose))
     (js2-jsdoc-html-tag-delimiter (:foreground wood-birch))
     (js2-jsdoc-html-tag-name (:foreground wood-leaf-dry))
     (js2-jsdoc-value (:foreground wood-birch))
     (js2-private-function-call (:foreground wood-rose))
     (js2-private-member (:foreground wood-birch-mute))
     (js3-error-face (:underline wood-leaf-momiji))
     (js3-external-variable-face (:foreground wood-leaf-dry))
     (js3-function-param-face (:foreground wood-birch-mute))
     (js3-instance-member-face (:foreground wood-rose))
     (js3-jsdoc-tag-face (:foreground wood-lilac))
     (js3-warning-face (:underline wood-lilac))

     (jupyter-repl-input-prompt (:foreground wood-birch-light))
     (jupyter-repl-output-prompt (:foreground wood-ash-dark))
     (jupyter-repl-traceback (:background wood-bark))
     (jupyter-eval-overlay (:weight 'bold :foreground wood-sky))

     (lazy-highlight (:foreground wood-birch-mute :background wood-heart))
     (line-number (:inherit 'fringe))
     (line-number-current-line (:inherit 'fringe :foreground wood-birch-light :weight 'bold))
     (link (:underline t :foreground wood-leaf-dry))
     (magit-branch (:foreground wood-rose :weight 'bold))
     (magit-diff-context-highlight (:background wood-heart :foreground wood-birch-mute))
     (magit-diff-file-header (:foreground wood-birch-mute :background wood-heart))
     (magit-diffstat-added (:foreground wood-leaf-bottom))
     (magit-diffstat-removed (:foreground wood-leaf-dry))
     (magit-hash (:foreground wood-birch-mute))
     (magit-hunk-heading (:background wood-heart))
     (magit-hunk-heading-highlight (:background wood-heart))
     ;; (magit-item-highlight nil)
     (magit-log-author (:foreground wood-rose-light))
     (magit-process-ng (:foreground wood-leaf-momiji :weight 'bold))
     (magit-process-ok (:foreground wood-leaf-old :weight 'bold))
     (magit-section-heading (:foreground wood-lilac :weight 'bold))
     (magit-section-highlight (:background wood-sap))
     ;; marginalia-key theme inspired by helm-M-x-key:
     ;; https://github.com/emacs-helm/helm/blob/eae4f5a24a2a5d9fac0ec1a9200362bf9efa911b/helm-command.el#L69
     (marginalia-key (:inherit 'font-lock-warning-face :weight 'thin :slant 'italic))
     (menu (:background wood-sap-light))
     (minibuffer-prompt (:weight 'bold :foreground wood-lilac))

     (mode-line (:background wood-heart-light :foreground wood-birch-mute :box nil :weight 'bold))
     (mode-line-buffer-id (:foreground wood-birch-light))
     (mode-line-emphasis (:foreground wood-leaf-old))
     (mode-line-highlight (:background wood-heart))
     (mode-line-inactive (:background wood-bark-dark :foreground wood-leaf-dry :weight 'normal))
     
     (mu4e-cited-1-face (:foreground wood-birch-mute))
     (mu4e-cited-7-face (:foreground wood-birch-mute))
     (mu4e-header-marks-face (:foreground wood-leaf-bottom))
     (mu4e-view-url-number-face (:foreground wood-leaf-bottom))
     (org-block (:inherit '(shadow fixed-pitch) :extend t :background wood-sap-light :foreground wood-birch-light))
     (org-block-begin-line (:background wood-sap :foreground wood-leaf-dry-dark :extend t :inherit 'org-meta-line))
     (org-block-end-line (:background wood-sap :foreground wood-leaf-dry-dark :extend t :inherit 'org-block-begin-line))
     (org-checkbox (:inherit '(bold fixed-pitch)))
     (org-code (:inherit '(shadow fixed-pitch)))
     (org-document-title (:foreground wood-leaf-sprout :weight 'bold :height 2.074))
     (org-formula (:foreground wood-leaf-momiji :inherit 'fixed-pitch))
     (org-level-1 (:inherit 'org-level-8 :extend nil :foreground wood-rose :height 1.728))
     (org-level-2 (:height 1.44 :foreground wood-lilac :extend nil :inherit 'org-level-8))
     (org-level-3 (:height 1.2 :foreground wood-leaf :extend nil :inherit 'org-level-8))
     (org-level-4 (:height 1.1 :inherit 'org-level-8 :extend nil :foreground wood-leaf-dry))
     (org-level-8 (:extend nil :weight 'semi-bold :inherit 'variable-pitch))
     (org-link (:foreground wood-leaf-dry :inherit 'link))
     (org-meta-line (:inherit '(font-lock-comment-face fixed-pitch)))
     (org-sexp-date (:background wood-ash-dark :foreground wood-soot :distant-foreground wood-ash-light))
     
     ;; org-special-keyword used to format org-comment-string, and property entries
     ;; alt: font-lock-property-name-face, font-lock-comment-face (not recommended)
     (org-special-keyword (:inherit '(font-lock-builtin-face fixed-pitch)))
     (org-table (:foreground wood-leaf-old :inherit 'fixed-pitch))
     (org-verbatim (:inherit '(shadow fixed-pitch)))
     
     (rainbow-delimiters-depth-1-face (:foreground wood-birch-light))
     (rainbow-delimiters-depth-2-face (:foreground wood-leaf-bottom))
     (rainbow-delimiters-depth-3-face (:foreground wood-leaf-dry))
     (rainbow-delimiters-depth-4-face (:foreground wood-rose))
     (rainbow-delimiters-depth-5-face (:foreground wood-lilac))
     (rainbow-delimiters-depth-6-face (:foreground wood-birch-light))
     (rainbow-delimiters-depth-7-face (:foreground wood-leaf-bottom))
     ;; (rainbow-delimiters-depth-8-face nil)
     (rainbow-delimiters-unmatched-face (:foreground wood-leaf-momiji))
     
     (region (:inverse-video t))
     (show-paren-match (:background wood-leaf-old :foreground wood-bark :inverse-video nil))
     (show-paren-mismatch (:foreground wood-bark :background wood-leaf-momiji :inverse-video))
     (slime-repl-inputed-output-face (:foreground wood-leaf-bottom))
     (success (:foreground wood-leaf-young :weight 'bold))

     ;; tab-line related faces originally set inherit to nil
     (tab-line (:background wood-bark-dark :foreground wood-birch-mute :weight 'bold :height 1.0 :box (:line-width -1 :color wood-bark-dark) :inherit 'variable-pitch))
     (tab-line-tab (:background wood-heart-light :box (:line-width wood-tab-line-box-line-width :color wood-heart-light) :inherit 'tab-line))
     ;; colour matching mode-line
     (tab-line-tab-current (:background wood-heart-light :box (:line-width wood-tab-line-box-line-width :color wood-heart-light) :inherit 'tab-line))
     (tab-line-tab-inactive (:box (:line-width wood-tab-line-box-line-width :color wood-bark-dark) :inherit 'tab-line))
     (tab-line-tab-modified (:foreground wood-sky))
     (tab-line-highlight (:background wood-heart :inherit 'tab-line))
     
     (telephone-line-accent-active (:foreground wood-bark :background wood-leaf-sprout :inherit 'mode-line))
     (telephone-line-accent-inactive (:foreground wood-bark :background wood-leaf :inherit 'mode-line-inactive))
     ;; (yas-field-highlight-face (:background wood-sap-light))
     
     (trailing-whitespace (:background wood-leaf-momiji))
     (tty-menu-disabled-face (:background wood-sap :foreground wood-ash-dark))
     (tty-menu-enabled-face (:background wood-sap :foreground wood-leaf-dry-dark :weight 'bold))
     (tty-menu-selected-face (:background wood-sap-light))

     (undo-tree-visualizer-current-face (:foreground wood-rose-light))
     (undo-tree-visualizer-default-face (:foreground wood-birch-mute))
     (undo-tree-visualizer-register-face (:foreground wood-leaf-bottom))
     (undo-tree-visualizer-unmodified-face (:foreground wood-leaf-dry))

     (vertical-border (:foreground wood-heart-light))
     (warning (:foreground wood-sky))
     (web-mode-builtin-face (:inherit 'font-lock-builtin-face))
     (web-mode-comment-face (:inherit 'font-lock-comment-face))
     (web-mode-constant-face (:inherit 'font-lock-constant-face))
     (web-mode-doctype-face (:inherit 'font-lock-comment-face))
     (web-mode-function-name-face (:inherit 'font-lock-function-name-face))
     (web-mode-html-attr-name-face (:foreground wood-leaf-old))
     (web-mode-html-attr-value-face (:foreground wood-lilac))
     (web-mode-html-tag-face (:foreground wood-rose-light))
     (web-mode-keyword-face (:foreground wood-lilac))
     (web-mode-string-face (:foreground wood-birch))
     (web-mode-type-face (:inherit 'font-lock-type-face))
     (web-mode-warning-face (:inherit 'font-lock-warning-face)))

    ,@body))

(provide 'wood)
;;; wood.el ends here
