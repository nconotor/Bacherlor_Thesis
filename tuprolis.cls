\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tuprolis}[2020/05/28]
\LoadClassWithOptions{beamer}
\usetheme[progressbar=none, block=fill, subsectionpage=none]{metropolis}
\RequirePackage{xcolor}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\RequirePackage{etoolbox}
\RequirePackage{lmodern}

%----------------------------------------------------------
%Switch für verschiedene Interpreter
%----------------------------------------------------------

\ifluatex
    \usepackage[english,ngerman]{babel}
\else
    \ifxetex
        \usepackage[english,ngerman]{babel}
    \else
        \usepackage[english,ngerman]{babel}
    \fi
\fi

%----------------------------------------------------------
%Fonts
%----------------------------------------------------------

\setbeamerfont{frametitle}{size=\large, series=\bfseries}
\setbeamerfont{block title}{series=\bfseries}
\setbeamerfont{section in toc}{series=\bfseries}
\setbeamerfont*{title}{size=\huge}

%----------------------------------------------------------
%Farben
%----------------------------------------------------------

\xdefinecolor{tugreen}{RGB}{132, 184, 25}       
\colorlet{tulight}{tugreen!20!white}
\colorlet{tudark}{tugreen!60!black}

%Titelpage
\setbeamercolor{title}{fg=tugreen, bg=white}
%
%Footer Color
\setbeamercolor{structure}{fg=tugreen, bg=white}
%
%Frametitel
\setbeamercolor{frametitle}{fg=black, bg=tugreen}
%
%Lineseperator
\setbeamercolor{lower separation line head}{bg=tudark}

\setbeamercolor{progress bar}{fg=tudark, bg=tulight}

\setbeamercolor{footline}{fg=tugreen}

%----------------------------------------------------------
%Template Optionen
%----------------------------------------------------------

%----------------------------------------------------------
%Enviorments
%----------------------------------------------------------


\ExecuteOptions{}
\ProcessOptions

\endinput
