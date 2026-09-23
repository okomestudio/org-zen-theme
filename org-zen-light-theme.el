;;; org-zen-light-theme.el --- Org Zen Light Theme  -*- lexical-binding: t -*-
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
;; This package provides the light version of Org Zen theme.
;;
;; See, for example, https://www.colordic.org/ for inspiration about
;; Japanese colors.
;;
;;; Code:

(require 'org-zen-theme-common)

(deftheme org-zen-light "Org Zen light theme.")

(org-zen-theme-apply-faces
 'org-zen-light
 '( :background "#ffffff"
    :foreground "#000000"
    :primary "#43676b"         ; 御召茶（おめしちゃ）
    :primary-faded "#c8d5bb"   ; 柳鼠（やなぎねず）
    :secondary "#9d896c"       ; 仙斎茶（せんさいちゃ）
    :secondary-faded "#dcd3b2" ; 砂色（すないろ）
    ))

(provide-theme 'org-zen-light)

(provide 'org-zen-light-theme)
;;; org-zen-light-theme.el ends here
