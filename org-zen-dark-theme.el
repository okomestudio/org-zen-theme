;;; org-zen-dark-theme.el --- Org Zen Dark Theme  -*- lexical-binding: t -*-
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
;; This package provides the dark version of Org Zen theme.
;;
;; The light version is not as mature yet.
;;
;;; Code:

(require 'org-zen-theme-common)

(deftheme org-zen-dark "Org Zen dark theme.")

(org-zen-theme-apply-faces
 'org-zen-dark
 '( :background "#000000"
    :foreground "#ffffff"
    :salient "#c8d5bb"        ; 柳鼠（やなぎねず）
    :muted "#9d896c"          ; 仙斎茶（せんさいちゃ）
    :popout "#43676b"         ; 御召茶（おめしちゃ）
    ))

(provide-theme 'org-zen-dark)

(provide 'org-zen-dark-theme)
;;; org-zen-dark-theme.el ends here
