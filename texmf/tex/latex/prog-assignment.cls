%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prog-assignment}[2020/10/03 Math Assignment Class]

\LoadClass{math-assignment}
\RequirePackage{listings}
\RequirePackage{color}

\definecolor{coperation}{RGB}{57,113,237}
\definecolor{csection}{RGB}{163,106,199}
\definecolor{cregister}{RGB}{204,52,43}
\definecolor{cstring}{RGB}{25,136,68}
\definecolor{ccomment}{RGB}{180,183,180}
\definecolor{cbackground}{RGB}{250,250,250}

\input{avr-lst.tex}

\lstset{
    showstringspaces=false,
    aboveskip=3mm,
    belowskip=3mm,
    numbers=left,
    numbersep=10pt,
    tabsize=3,
    basicstyle={\small\ttfamily},
    keywordstyle=[1]\color{coperation},
    keywordstyle=[2]\color{csection},
    keywordstyle=[3]\color{cregister},
    stringstyle=\color{cstring},
    commentstyle=\color{ccomment},
    backgroundcolor=\color{cbackground},
    upquote=true,
    frame=single,
    rulecolor=\color{cbackground},
}
