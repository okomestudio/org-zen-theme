;;; org-zen-theme-common.el --- Org Zen Theme Common Code  -*- lexical-binding: t -*-
;;
;; Copyright (C) 2026 Taro Sato
;;
;;; License:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; This package provides common code for preparing a Org Zen theme.
;;
;;; Code:

(defvar-local org-zen-theme--remap-cookie nil
  "Store the face remap cookie.")

(defun org-zen-theme-apply-faces (theme palette)
  "Apply face specifications for THEME using PALETTE plist."
  (let ((bg (plist-get palette :background))
        (fg (plist-get palette :foreground))
        (primary (plist-get palette :primary))
        (primary-faded (plist-get palette :primary-faded))
        (secondary (plist-get palette :secondary))
        (secondary-faded (plist-get palette :secondary-faded)))
    (custom-theme-set-faces
     theme
     `(org-archived ((t (:background ,bg :foreground ,secondary))))
     `(org-block ((t (:background ,bg :foreground ,secondary-faded))))
     `(org-block-begin-line ((t (:background ,bg :foreground ,secondary-faded))))
     `(org-block-end-line ((t (:background ,bg :foreground ,secondary-faded))))
     `(org-document-info ((t (:background ,bg :foreground ,secondary))))
     `(org-document-info-keyword ((t (:background ,bg :foreground ,secondary))))
     `(org-document-title ((t (:background ,bg :foreground ,primary))))
     `(org-drawer ((t (:background ,bg :foreground ,secondary))))
     `(org-ellipsis ((t (:background unspecified :foreground unspecified))))
     `(org-hide ((t (:background ,bg :foreground ,bg))))
     `(org-level-1 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-2 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-3 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-4 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-5 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-6 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-7 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-level-8 ((t (:background ,bg :foreground ,primary :weight bold))))
     `(org-link ((t (:background unspecified  :foreground unspecified :underline t))))
     `(org-list-dt ((t (:background ,bg :foreground ,fg :weight bold))))
     `(org-meta-line ((t (:background ,bg :foreground ,secondary))))
     `(org-quote ((t (:background ,bg :foreground ,fg :extend t))))
     `(org-special-keyword ((t (:background ,bg :foreground ,secondary))))
     `(org-tag ((t (:background ,primary-faded :foreground ,fg))))
     `(org-tag-group ((t (:background ,primary-faded :foreground ,fg))))
     `(org-todo ((t (:background ,secondary :foreground ,bg))))

     `(org-modern-date-active ((t ( :background ,primary-faded :foreground ,primary
                                    :inherit org-modern-label ))))
     `(org-modern-tag ((t (:background ,primary-faded :foreground ,primary))))
     `(org-modern-todo ((t (:background ,secondary :foreground ,bg))))

     `(org-ref-cite-face ((t (:underline (:style dashes)))))

     `(org-dividers-hl ((t (:background ,bg :foreground ,primary)))))

    (custom-theme-set-variables
     theme
     '(underline-minimum-offset 3))

    (defun org-zen-theme--face-remap ()
      (setq-local org-zen-theme--remap-cookie
                  (list (face-remap-add-relative 'default :background bg)
                        (face-remap-add-relative 'fringe :background bg))))

    (defun org-zen-theme--on-enable (theme)
      (dolist (buf (buffer-list))
        (with-current-buffer buf
          (when org-zen-theme--remap-cookie
            (face-remap-remove-relative org-zen-theme--remap-cookie)
            (setq-local org-zen-theme--remap-cookie nil))

          (when (and (derived-mode-p 'org-mode)
                     (member theme '(org-zen-dark org-zen-light)))
            (org-zen-theme--face-remap)))))

    (add-hook 'org-mode-hook #'org-zen-theme--face-remap)
    (add-hook 'enable-theme-functions #'org-zen-theme--on-enable)))

(provide 'org-zen-theme-common)
;;; org-zen-theme-common.el ends here
