\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{pcsu}[2023/08/14 Caption Maker for Persian CS University youtube channel]
\newif\ifpcsu@han
\newif\ifpcsu@boundingbox
\newif\ifpcsu@corner\pcsu@cornertrue
\DeclareOption{han}{\pcsu@hantrue}
\DeclareOption{bbox}{\pcsu@boundingboxtrue}
\DeclareOption{nocorner}{\pcsu@cornerfalse}
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
\DeclareDocumentCommand{\pcsucaption}{ O{24} O{30} m O{61} }{%
\edef\pcsu@opacity{\ifx#3\relax 1\else .6\fi}%
\savebox{\captionbox}{\ttfamily\textcolor{gray}{\fontsize{#1}{#2}\selectfont #3}}%
    \begin{tikzpicture}[color=black]
        \node (pcs) {\usebox{\pcsbox}};
        \node (univ) [anchor=north, yshift=2mm]  at (pcs.south) {\usebox{\univbox}};
        \edef\yshift{\ifx#3\relax 0mm\else -3mm\fi}
        \node (text) [anchor=north, yshift=\yshift] at (univ.south){%
            {\makebox[\wd\univbox]{%
                \ifdim\wd\captionbox>\wd\univbox
                    \resizebox*{\wd\univbox}{!}{\usebox{\captionbox}}%
                \else%
                    \usebox{\captionbox}%
                \fi}}
        };
        \ifpcsu@corner
            \node (tl) at (pcs.north west) [xshift=-1cm, yshift=0mm] {\ornament[height=1cm, opacity=\pcsu@opacity]{#4}};
            \node (tr) at (pcs.north east) [xshift=1cm, yshift=0mm] {\ornament[height=1cm, symmetry=v, opacity=\pcsu@opacity]{#4}};
            \node (bl) at (text.south west) [xshift=-1cm, yshift=2mm] {\ornament[height=1cm, symmetry=h, opacity=\pcsu@opacity]{#4}};
            \node (br) at (text.south east) [xshift=1cm, yshift=2mm] {\ornament[height=1cm, symmetry=c, opacity=\pcsu@opacity]{#4}};
        \else
            \node (tl) at (pcs.north west) [xshift=-2mm, yshift=2mm] {};
            \node (br) at (text.south east) [xshift=2mm, yshift=1mm] {};
        \fi
%        \pgfornamenthline{tl}{tr}{north}{87}
        \ifpcsu@boundingbox\draw [use as bounding box, double, thick] (tl.north west) rectangle (br.south east);\fi
    \end{tikzpicture}
}
%% End of file
