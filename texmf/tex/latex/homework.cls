%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/10/14 Homework Class]


\LoadClass{assignment}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{environ}


\graphicspath{ {./images/} }

\titlespacing*{\section}{0pt}{5.5ex plus 1ex minus .2ex}{1.3ex plus .2ex}

\captionsetup{justification=raggedright, singlelinecheck=false, format=hang}

\titleformat{\section}[runin]{\normalfont\bfseries\Large}{}{}{}[]

\NewEnviron{question}{%
  \section*{\BODY}
}

\newcounter{QuestionCounter}
\setcounter{QuestionCounter}{1}
\NewEnviron{numquestion}{%
  \section*{\arabic{QuestionCounter}.}%
  \stepcounter{QuestionCounter}%
  \BODY
}

\NewEnviron{solution}{%
  \hspace{\itemindent}

  \BODY
}

