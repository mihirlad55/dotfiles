%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math-assignment}[2020/09/18 Math Assignment Class]


\LoadClass{assignment}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{nicematrix}
\RequirePackage{systeme}
\RequirePackage{environ}


\graphicspath{ {./images/} }

\titlespacing*{\section}{0pt}{5.5ex plus 1ex minus .2ex}{1.3ex plus .2ex}

\captionsetup{justification=raggedright, singlelinecheck=false, format=hang}

% Fix spacing when two fractions are above/below each other
\NiceMatrixOptions{cell-space-top-limit=1pt,cell-space-bottom-limit=1pt}

\titleformat{\section}[runin]{\normalfont\bfseries\Large}{}{}{}[]

\NewEnviron{question}[1]{%
  \section*{#1}
  \BODY
}

\newcounter{QuestionCounter}
\setcounter{QuestionCounter}{1}
\NewEnviron{numquestion}{%
  \section*{\arabic{QuestionCounter}.}%
  \stepcounter{QuestionCounter}%
  \BODY
}

\NewEnviron{solution}{%
  \bigskip\hspace{\itemindent}\textbf{Solution}

  \BODY
}

\NewEnviron{alignterms}{%
    \sysdelim{.}{.}\systeme{\BODY}
}

\NewEnviron{matrixsteps}{%
  \begin{align*}
    \begin{NiceMatrixBlock}[auto-columns-width]
      \begin{aligned}
        \BODY
      \end{aligned}
    \end{NiceMatrixBlock}
  \end{align*}
}

\newcommand{\tageq}[1]{\label{eq:#1}\tag{eq. #1}}
\newcommand{\req}[1]{\eqref{eq:#1}}

\newcommand{\elementarystep}[2]{%
  \begin{bNiceMatrix}[r]
    #2
  \end{bNiceMatrix} & \hspace{10pt}\text{\parbox{4cm}{#1}} \\ \\
}

\newcommand{\emptyline}{\phantom{T}}

\allowdisplaybreaks

\makeatletter
\setlength\@fptop{0pt}
\setlength\@fpsep{8pt plus 1fil}
\setlength\@fpbot{0pt}
\makeatother

