\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{pcsu}[2023/08/14 Caption Maker for Persian CS University youtube channel]
\newif\ifpcsu@han
\newif\ifpcsu@boundingbox
\DeclareOption{han}{\pcsu@hantrue}
\DeclareOption{bbox}{\pcsu@boundingboxtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax
\LoadClass[tikz, convert={true,}]{standalone}
\usetikzlibrary{calc}
\PassOptionsToPackage{x11names}{xcolor}
\RequirePackage{xcolor} 
\RequirePackage{graphicx}
\RequirePackage{xparse}
\RequirePackage[utf8]{inputenc}
\RequirePackage{GoudyIn}
\RequirePackage{pgfornament-han}
\ifpcsu@han
    \let\ornament\pgfornamenthan%
\else
    \let\ornament\pgfornament%
\fi
%
\def\goudy{\protect\fontsize{10mm}{10mm}\selectfont\GoudyInfamily{}}
\newsavebox{\pcsbox}
\newsavebox{\univbox}
\newsavebox{\captionbox}
\savebox{\univbox}{\goudy UNIVERSITY}
\savebox{\pcsbox}{\goudy PERSIAN%
\tikz\pgfornament[height=\ht\univbox, anchor=south, opacity=1]{124};
\hskip-13pt%
CS}
%
\DeclareDocumentCommand{\pcsucaption}{ O{16} O{20} m O{61} }{%
\def\pcsu@opacity{\ifx#3\relax 1\else .6\fi}%
\savebox{\captionbox}{\ttfamily\textcolor{gray}{\fontsize{#1}{#2}\selectfont #3}}%
    \begin{tikzpicture}[color=black]
        \node (pcs) {\usebox{\pcsbox}};
        \node (univ) [anchor=north, yshift=2mm]  at (pcs.south) {\usebox{\univbox}};
        \node (text) [anchor=north, yshift=\ifx#3\relax 0\else-3mm\fi] at (univ.south){%
            {\makebox[\wd\univbox]{%
                \ifdim\wd\captionbox>\wd\univbox
                    \resizebox*{\wd\univbox}{!}{\usebox{\captionbox}}%
                \else%
                    \usebox{\captionbox}%
                \fi}}
        };
        \node (tl) at (pcs.north west) [xshift=-1cm, yshift=0mm] {\ornament[height=1cm, opacity=\pcsu@opacity]{#4}};
        \node (tr) at (pcs.north east) [xshift=1cm, yshift=0mm] {\ornament[height=1cm, symmetry=v, opacity=\pcsu@opacity]{#4}};
        \node (bl) at (text.south west) [xshift=-1cm, yshift=2mm] {\ornament[height=1cm, symmetry=h, opacity=\pcsu@opacity]{#4}};
        \node (br) at (text.south east) [xshift=1cm, yshift=2mm] {\ornament[height=1cm, symmetry=c, opacity=\pcsu@opacity]{#4}};
%        \pgfornamenthline{tl}{tr}{north}{87}
        \ifpcsu@boundingbox\draw [use as bounding box, double, thick] (tl.north west) rectangle (br.south east);\fi
    \end{tikzpicture}
}
%% End of file
