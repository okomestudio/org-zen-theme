;;; org-zen-theme.el --- Org Zen Theme  -*- lexical-binding: t -*-
;;
;; Copyright (C) 2026 Taro Sato
;;
;; Author: Taro Sato <okomestudio@gmail.com>
;; URL: https://github.com/okomestudio/org-zen-theme
;; Version: 0.1.3
;; Keywords: faces, themes, convenience
;; Package-Requires: ((emacs "31.1"))
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
;; The entry point for Zen-inspired Org mode themes.
;;
;;; Code:

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (member dir custom-theme-load-path)
      (add-to-list 'custom-theme-load-path dir))))

(provide 'org-zen-theme)
;;; org-zen-theme.el ends here
