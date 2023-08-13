\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{pcsu}[]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\DeclareOption*{\PassOptionsToClass{x11names}{xcolor}}
\newif\ifpcsu@han
\newif\ifpcsu@boundingbox
\DeclareOption{han}{\pcsu@hantrue}
\DeclareOption{bbox}{\pcsu@boundingboxtrue}
\ProcessOptions\relax
\LoadClass[tikz, border=12mm, convert]{standalone}
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
\savebox{\pcsbox}{\protect\goudy PERSIAN\phantom{T}CS}
\DeclareDocumentCommand{\pcsucaption}{ O{38} O{40} m O{61} }{%
    \begin{tikzpicture}[color=black]
        \node (pcs) {\usebox{\pcsbox}};
        \node (univ) [below of=pcs, anchor=north, yshift=2mm]  {\goudy UNIVERSITY};
        \node (text) [below of=univ, anchor=north, yshift=-9mm] {\ttfamily \textcolor{gray}{\makebox[\wd\pcsbox]{\fontsize{#1}{#2}\selectfont #3}}};
        \node (tl) at (pcs.north west) [yshift=7mm] {\ornament[height=2cm]{#4}};
        \node (tr) at (pcs.north east) [yshift=7mm] {\ornament[height=2cm, symmetry=v]{#4}};
        \node (bl) at (text.south west) [yshift=-4mm] {\ornament[height=2cm, symmetry=h]{#4}};
        \node (br) at (text.south east) [yshift=-4mm] {\ornament[height=2cm, symmetry=c]{#4}};
%        \pgfornamenthline{tl}{tr}{north}{87}
        \ifpcsu@boundingbox\draw [use as bounding box, double, thick] (tl.north west) rectangle (br.south east);\fi
    \end{tikzpicture}
}
%% End of file
