\ProvidesClass{pginz}
 
\newcommand{\headlinecolor}{\normalcolor}
\LoadClass[10pt,a4paper,twoside]{report}

\RequirePackage[a4paper,inner=3.5cm,outer=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
%\RequirePackage[a4paper,hmargin=2.5cm,vmargin=2.5cm]{geometry}
\linespread{1.3} %interlinia 1.5
\setlength{\parindent}{1.25cm}

\RequirePackage{pdfrender}
\RequirePackage[utf8]{inputenc}
\RequirePackage[main=polish,english]{babel}
\RequirePackage{pdfpages}

\RequirePackage[titletoc,title]{appendix}
\RequirePackage{titlesec}
\RequirePackage{helvet}

\RequirePackage{siunitx}
\renewcommand*{\familydefault}{\sfdefault}

%*************
\RequirePackage{newtxtext, newtxmath} %lepiej wyglądające nagłówki
\RequirePackage{epstopdf} %do dołączania obrazków w formacie eps
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,   % włącza kolory zamiast ramek
    linkcolor=black,   % spis treści i odwołania wewnątrz tekstu (czarne)
    filecolor=black,   % linki do plików (czarne)
    urlcolor=blue,     % linki do stron www (niebieskie)
    citecolor=black    % cytowania bibliografii (czarne)
}
\RequirePackage{xcolor,listings} %listingi 
\RequirePackage[font=small,labelfont=bf]{caption} %ustawienie czcionki 9pt na podpisach
\RequirePackage{cleveref} %odniesienia
\captionsetup[table]{justification=justified,singlelinecheck=false, format=hang} %ustawienie podpisów tabel 
\RequirePackage{enumitem} %to, czego brakowało przy symbolach
\RequirePackage[normalem]{ulem}
%*************

\setlist[itemize,2]{label=$\circ$}

% Ujednolicony wygląd nagłówków

% *** Chapter ***
\titleformat{\chapter}[hang]
{\normalfont\fontsize{15}{17}\bfseries\MakeUppercase}{\thechapter.}{1em}{}
\titlespacing*{\chapter}{0pt}{12pt}{6pt}

% *** Section ***
% Używamy \bfseries (pogrubienie) i \normalfont\fontsize{10}{12}
\titleformat{\section}[hang]
{\normalfont\fontsize{14}{16}\bfseries}{\thesection.}{0.5em}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}

% *** Subsection ***
% Używamy \fontseries{sb} (semi-bold) zamiast \bfseries
\titleformat{\subsection}[hang]
{\normalfont\fontsize{13}{15}\fontseries{sb}\selectfont}{\thesubsection.}{0.5em}{}
\titlespacing*{\subsection}{0pt}{6pt}{3pt}

% *** Subsubsection ***
% Dodajemy definicję dla subsubsection, używamy \normalfont\fontsize{10}{12} i lekko mniejszego odstępu przed.
\titleformat{\subsubsection}[hang]
{\normalfont\fontsize{12}{14}\selectfont}{\thesubsubsection.}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{6pt}{3pt}

% *** Paragraph (jeśli chcesz numerować i formatować też ten poziom) ***
% Domyślnie w klasie report nie jest numerowany, ale możemy to zmienić.
\titleformat{\paragraph}[runin]
{\normalfont\normalsize\bfseries}{\theparagraph.}{0.5em}{}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{1em}{}


\setcounter{secnumdepth}{2} % Ustawia poziom numerowania: 0=chapter, 1=section, 2=subsection, 3=subsubsection, 4=paragraph

\setcounter{tocdepth}{2} % Ustawia poziom w spisie treści (4 = paragraph)

%\titleformat{\chapter}[hang]
%{\normalfont\fontsize{12}{15}\bfseries\MakeUppercase}{\thechapter.}{1em}{}
%\titlespacing*{\chapter}{0pt}{12pt}{6pt}

%\titleformat{\section}[hang]
%{\normalfont\fontsize{10}{12}\bfseries\itshape}{\thesection.}{0.5em}{}
%\titlespacing*{\section}{0pt}{12pt}{6pt}

%\titleformat{\subsection}[hang]
%{\normalfont\fontsize{10}{12}\itshape}{\thesubsection.}{0.5em}{}
%\titlespacing*{\subsection}{0pt}{12pt}{6pt}

\crefformat{equation}{(#2#1#3)}

\renewcommand\familydefault{\sfdefault}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstset{style=mystyle}

\crefname{figure}{rys.}{rys.}
\Crefname{figure}{Rysunek}{Rysunki}
\crefname{table}{Tabela}{Tabele}
\Crefname{table}{Tabela}{Tabele}
\crefname{section}{Sekcja}{Sekcje}
\Crefname{section}{Sekcja}{Sekcje}
\crefname{chapter}{Rozdział}{Rozdziały}
\Crefname{chapter}{Rozdział}{Rozdziały}

\crefname{lstlisting}{Listing}{Listingi}
\Crefname{lstlisting}{Listing}{Listingi}

\RequirePackage{textcase}
\makeatletter
\let\oldcontentsline\contentsline
\def\contentsline#1#2{%
  \expandafter\ifx\csname l@#1\endcsname\l@chapter
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
  {%
    \oldcontentsline{#1}{\MakeTextUppercase{#2}}%
  }{%
    \oldcontentsline{#1}{#2}%
  }%
}
\makeatother