;;; annotation-comments.el --- Search annotation-comments

;; Copyright (C) 2024 Tomiaki Ishiduka

;; Author: tomi <tomiacannondale atmark gmail.com>
;; URL: -
;; Package-Requires: ((rg "2.3.0"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package allows you to search annotation-comments(ex TODO or NOTE) inside your project.

;;; Code:

(require 'rg)

(defun annotation-comments (annotation directory)
  "Search annotation comments with ANNOTATION."
  (interactive (list (completing-read "Which one?: " '("TODO: " "NOTE: " "FIXME: "))
                     (read-directory-name "Directory: " (project-root (project-current)))))
  (let ((default-directory (file-name-as-directory directory)))
    (rg-run annotation "*" default-directory)))

(provide 'annotation-comments)

;;; annotation-comments.el ends here
