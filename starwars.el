;;; starwars.el --- Starwars on Emacs

;; Copyright (C) 2017  takeshi tsukamoto

;; Author: Takeshi Tsukamoto <itometeam@gmail.com>
;; URL: https://github.com/itome/emacs-starwars
;; Created: 20190123
;; Version: 0.1.0
;; Status: experimental

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;; Starwars on Emacs
;; Just run M-x starwars

;;; Code:
(defun starwars ()
  (interactive)
  (switch-to-buffer (get-buffer-create "starwars"))
  (erase-buffer)
  (sit-for 0)
  (let ((index -1)
         (sit-time 0)
         (lines (starwars--read-lines "./sw1.txt")))
    (cl-loop for line in lines
             do
             (incf index)
             (cond
              ((= (% index 14) 0)
               (sit-for sit-time)
               (setf sit-time (/ (string-to-number (concat line ".0")) 30))
               (erase-buffer))
              (t (insert line) (newline))))))

(defun starwars--read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" nil nil)))

(provide 'starwars)
