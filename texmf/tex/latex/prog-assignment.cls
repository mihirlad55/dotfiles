%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prog-assignment}[2020/10/03 Math Assignment Class]


\LoadClass{assignment}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{mathtools}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{nicematrix}
\RequirePackage{systeme}
\RequirePackage{textcomp}
\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{url}

\definecolor{coperation}{RGB}{57,113,237}
\definecolor{csection}{RGB}{163,106,199}
\definecolor{cregister}{RGB}{204,52,43}
\definecolor{cstring}{RGB}{25,136,68}
\definecolor{ccomment}{RGB}{180,183,180}
\definecolor{cbackground}{RGB}{250,250,250}

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

\graphicspath{ {./images/} }

\titlespacing*{\section}{0pt}{5.5ex plus 1ex minus .2ex}{1.3ex plus .2ex}

\captionsetup{justification=raggedright, singlelinecheck=false, format=hang}

% Fix spacing when two fractions are above/below each other
\NiceMatrixOptions{cell-space-top-limit=1pt,cell-space-bottom-limit=1pt}

\titleformat{\section}[runin]{\normalfont\bfseries\Large}{}{}{}[]

\newcommand{\question}[1]{\section*{#1}}

\newcounter{QuestionCounter}
\setcounter{QuestionCounter}{1}
\newcommand{%
  \numquestion}{%
  \section*{\arabic{QuestionCounter}.}%
  \stepcounter{QuestionCounter}%
}

\newcommand{\tageq}[1]{\label{eq:#1}\tag{eq. #1}}
\newcommand{\req}[1]{\eqref{eq:#1}}

\newcommand{\solution}[0]{\bigskip\hspace{\itemindent}\textbf{Solution}}

\newcommand{\alignterms}[1]{%
    \sysdelim{.}{.}\systeme{
      #1
   }
}

\allowdisplaybreaks

\makeatletter
\setlength\@fptop{0pt}
\setlength\@fpsep{8pt plus 1fil}
\setlength\@fpbot{0pt}
\makeatother

