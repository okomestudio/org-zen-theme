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
        (salient (plist-get palette :salient))
        (muted (plist-get palette :muted))
        (popout (plist-get palette :popout)))
    (custom-theme-set-faces
     theme
     `(org-archived ((t (:background ,bg :foreground ,muted))))
     `(org-block ((t (:background ,bg :foreground ,muted))))
     `(org-block-begin-line ((t (:background ,bg :foreground ,muted))))
     `(org-block-end-line ((t (:background ,bg :foreground ,muted))))
     `(org-document-info ((t (:background ,bg :foreground ,muted))))
     `(org-document-info-keyword ((t (:background ,bg :foreground ,muted))))
     `(org-document-title ((t (:background ,bg :foreground ,salient))))
     `(org-drawer ((t (:background ,bg :foreground ,muted))))
     `(org-ellipsis ((t (:background unspecified :foreground unspecified))))
     `(org-hide ((t (:background ,bg :foreground ,bg))))
     `(org-level-1 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-2 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-3 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-4 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-5 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-6 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-7 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-level-8 ((t (:background ,bg :foreground ,salient :weight bold))))
     `(org-link ((t (:background unspecified  :foreground unspecified :underline t))))
     `(org-list-dt ((t (:background ,bg :foreground ,fg :weight bold))))
     `(org-meta-line ((t (:background ,bg :foreground ,muted))))
     `(org-quote ((t (:background ,bg :foreground ,fg :extend t))))
     `(org-special-keyword ((t (:background ,bg :foreground ,muted))))
     `(org-tag ((t (:background ,popout :foreground ,fg))))
     `(org-tag-group ((t (:background ,popout :foreground ,fg))))
     `(org-todo ((t (:background ,popout :foreground ,bg))))

     `(org-modern-tag ((t (:background ,popout :foreground ,salient))))
     `(org-modern-todo ((t (:background ,salient :foreground ,bg))))

     `(org-ref-cite-face ((t (:underline (:style dashes)))))

     `(org-dividers-hl ((t (:background ,bg :foreground ,salient)))))

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
