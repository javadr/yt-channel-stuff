\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{pcsu}[]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\DeclareOption*{\PassOptionsToClass{x11names}{xcolor}}
\newif\ifpcsu@han
\newif\ifpcsu@boundingbox
\DeclareOption{han}{\pcsu@hantrue}
\DeclareOption{bbox}{\pcsu@boundingboxtrue}
\ProcessOptions\relax
\LoadClass[tikz, border=12mm, convert={true,}]{standalone}
\RequirePackage{xparse}
\RequirePackage[utf8]{inputenc}
\RequirePackage{GoudyIn}
\RequirePackage{xcolor} 
\RequirePackage{pgfornament-han}
\ifpcsu@han
    \let\ornament\pgfornamenthan%
\else
    \let\ornament\pgfornament%
\fi
%
\def\goudy{\protect\fontsize{19mm}{19mm}\selectfont\GoudyInfamily{}}
\newsavebox{\pcsbox}
\newsavebox{\univbox}
\savebox{\univbox}{\goudy UNIVERSITY}
\savebox{\pcsbox}{\goudy PERSIAN%
\tikz\pgfornament[height=\ht\univbox, anchor=south, opacity=1]{124};\hskip2pt%
CS}
%
\DeclareDocumentCommand{\pcsucaption}{ O{38} O{40} m O{61} }{%
\def\pcsu@opacity{\ifx#3\relax 1\else .6\fi}
    \begin{tikzpicture}[color=black]
        \node (pcs) {\usebox{\pcsbox}};
        \node (univ) [below of=pcs, anchor=north, yshift=2mm]  {\usebox{\univbox}};
        \node (text) [anchor=north, yshift=-9mm] at (\ifx#3\relax univ\else univ.south\fi) {%
            \ttfamily \textcolor{gray}{\makebox[\wd\univbox]{\fontsize{#1}{#2}\selectfont #3}}
        };
        \node (tl) at (pcs.north west) [yshift=7mm] {\ornament[height=2cm, opacity=\pcsu@opacity]{#4}};
        \node (tr) at (pcs.north east) [yshift=7mm] {\ornament[height=2cm, symmetry=v, opacity=\pcsu@opacity]{#4}};
        \node (bl) at (text.south west) [yshift=-4mm] {\ornament[height=2cm, symmetry=h, opacity=\pcsu@opacity]{#4}};
        \node (br) at (text.south east) [yshift=-4mm] {\ornament[height=2cm, symmetry=c, opacity=\pcsu@opacity]{#4}};
%        \pgfornamenthline{tl}{tr}{north}{87}
        \ifpcsu@boundingbox\draw [use as bounding box, double, thick] (tl.north west) rectangle (br.south east);\fi
    \end{tikzpicture}
}
%% End of file
