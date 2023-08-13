\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{pcsu}[]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\newif\ifpcsu@han
\newif\ifpcsu@boundingbox
\DeclareOption{han}{\pcsu@hantrue}
\DeclareOption{boundingbox}{\pcsu@boundingboxtrue}
\ProcessOptions\relax
\LoadClass[20pt, landscape]{extarticle}
\RequirePackage{xparse}
\RequirePackage[utf8]{inputenc}
\RequirePackage{GoudyIn}
\RequirePackage[x11names]{xcolor} 
\RequirePackage{pstricks}
\RequirePackage{tikz}
\usetikzlibrary{fit}
\usetikzlibrary{calc}
\RequirePackage{pgfornament-han}
\ifpcsu@han
    \let\ornament\pgfornamenthan%
\else
    \let\ornament\pgfornament%
\fi
%
\AtBeginDocument{%
    \parindent=0pt%
    \centering%
    \thispagestyle{empty}%
    \Huge%
}
\DeclareDocumentCommand{\pcsucaption}{ O{38} O{40} m O{61} }{%
    \begin{tikzpicture}[color=black]
        \node (pcs) {\GoudyInfamily{}PERSIAN\phantom{T}CS};
        \node (univ) [below of=pcs, anchor=north, yshift=7mm]  {\GoudyInfamily{}UNIVERSITY};
        \node (text) [below of=univ, anchor=north] {\ttfamily \textcolor{gray}{\fontsize{#1}{#2}\selectfont #3}};
        \node (tl) at (pcs.north west) {\ornament[height=2cm]{#4}};
        \node (tr) at (pcs.north east) {\ornament[height=2cm, symmetry=v]{#4}};
        \node (bl) at (text.south west) {\ornament[height=2cm, symmetry=h]{#4}};
        \node (br) at (text.south east) {\ornament[height=2cm, symmetry=c]{#4}};
        \ifpcsu@boundingbox\draw [use as bounding box, double, thick] (tl.north west) rectangle (br.south east);\fi
    \end{tikzpicture}
}
%% End of file
