% Définitions de base de la classe
%	0.
\NeedsTeXFormat{LaTeX2e}
%	a. Quelle est notre classe ?
\ProvidesClass{PointAvancementDBG}[2017/06/18 v0.1l Classe rapport avancement (version debug)]
%   b. Quelles options veut-on mettre en place ?
\newif\ifPAabstract
\newif\ifPAauthor
\newif\ifPAtoc
\PAabstractfalse
\PAauthortrue
\PAtoctrue
%	c. Comment gère-t-on les options ?
\DeclareOption{french}{ \def\mylanguage{french} }
\def\mylangfrench{french}
\DeclareOption{english}{ \def\mylanguage{english} }
\def\mylangenglish{english}
\DeclareOption{abstract}{ \PAabstracttrue }
\DeclareOption{noauthor}{ \PAauthorfalse }
\DeclareOption{notoc}{ \PAtocfalse }
\ExecuteOptions{french}
\ProcessOptions\relax
\DeclareOption{12pt}{ \PassOptionsToClass{\CurrentOption}{article} }
\DeclareOption{11pt}{ \PassOptionsToClass{\CurrentOption}{article} }
\DeclareOption{10pt}{ \PassOptionsToClass{\CurrentOption}{article} }
\ExecuteOptions{11pt}
\ProcessOptions\relax
\DeclareOption{a5paper}{ \PassOptionsToClass{\CurrentOption}{article} }
\DeclareOption{a4paper}{ \PassOptionsToClass{\CurrentOption}{article} }
\ExecuteOptions{a4paper}
\ProcessOptions\relax
\DeclareOption*{ \ClassWarning{myclass}{Unknown option '\CurrentOption'} }
\ProcessOptions\relax
\LoadClass{article}
% -----------------------------------

% Packages de formattage et d'encodage
\RequirePackage[hmargin={2.4cm,2.4cm},vmargin={2.4cm,2.4cm},headheight=13.6pt]{geometry}
\RequirePackage[pdftex]{graphicx,color}
\ifx\mylanguage\mylangfrench
  \RequirePackage[french]{babel}
  \selectlanguage{french}
\fi
\ifx\mylanguage\mylangenglish
  \RequirePackage[english]{babel}
  \selectlanguage{english}
\fi
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{lmodern}
\RequirePackage{array}
\ifx\mylanguage\mylangfrench
  \RequirePackage{enumitem}
  \setlist[itemize]{nolistsep,noitemsep}
  \setlist[enumerate]{nolistsep,noitemsep}
  \frenchbsetup{StandardLists=true} % Utiliser des packages standards de listes pour babel-french
\fi
\ifx\mylanguage\mylangenglish
  \RequirePackage{enumitem}
  \setlist[itemize]{nolistsep,noitemsep} % Éviter trop d'espacement entre les items d'une liste en anglais…
  \setlist[enumerate]{nolistsep,noitemsep}
\fi

% Packages mathématiques
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{stmaryrd}
\RequirePackage{extarrows}

% Macros mathématiques
\newcommand{\R}{\ensuremath\mathbb{R}}
\newcommand{\N}{\ensuremath\mathbb{N}}
\newcommand{\Z}{\ensuremath\mathbb{Z}}
\newcommand{\Q}{\ensuremath\mathbb{Q}}
\newcommand{\B}{\ensuremath\mathbb{B}}
\newcommand{\dist}{\ensuremath\mathop{\mathrm{dist}}}
\newcommand{\xequal}[1]{\xlongequal{\!#1\!}}

% Algorithmes et autres packages d'informatique
\ifx\mylanguage\mylangfrench
  \RequirePackage[french,linesnumbered,ruled,vlined]{algorithm2e}
  \SetKwIF{Si}{SinonSi}{Sinon}{Si}{alors}{sinon si}{sinon}{}
  \SetKwFor{PourTout}{Pour tout}{faire}{}
  \SetKwFor{PourToute}{Pour toute}{faire}{}
  \SetKwFor{TantQue}{Tant que}{faire}{}
  \SetKwProg{Fonction}{Fonction}{:}{}
  \SetKwRepeat{Repeter}{Répéter}{jusqu'à}
\fi
\ifx\mylanguage\mylangenglish
  \RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}
  \SetKwProg{Function}{Function}{:}{}
  \SetKwFor{ForAll}{forall}{do}{}
\fi
\DontPrintSemicolon 
 
% Packages pour les références
\RequirePackage{hyperref}
\RequirePackage{acronym}
\RequirePackage{cite}

% Figures
\RequirePackage{tikz}
\usetikzlibrary{shapes,automata,arrows,positioning,petri}
\RequirePackage{caption}
\RequirePackage{subfigure}

% Tableaux
\RequirePackage{multirow}
\RequirePackage{tabularx}
\renewcommand{\tabularxcolumn}[1]{>{\small}m{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedright\arraybackslash}X}
\newcolumntype{L}{>{\raggedleft\arraybackslash}X}

% Commandes ToDo et affichage clair
\newcommand\todo[1]{\textcolor{red}{\textbf{ToDo:}\textrm{ #1}}}
\newcommand\ToDo[1]{\todo{#1}} % Alias pour \todo
\newcommand\Bleu[1]{\textcolor{blue}{#1}}
\definecolor{WIPorange}{RGB}{184,64,0}
\newcommand\WIP[1]{\textcolor{WIPorange}{\textbf{WIP:}\textrm{ #1}}}
\definecolor{WIPpurple}{RGB}{128,0,128}
\newcommand\Question[1]{\textcolor{WIPpurple}{\textbf{Question:}\textrm{ #1}}}
\newcommand\NdRedac[1]{\textcolor{WIPpurple}{\textbf{Note de rédaction:}\textrm{ #1}}}
\newcommand\Purple[1]{\textcolor{WIPpurple}{#1}}

% Théorèmes et environnements
\ifx\mylanguage\mylangfrench
  \newtheorem{definb}{Définition}
  \newtheorem{propnb}{Proposition}
  \newtheorem{conjnb}[propnb]{Conjecture}
  \newtheorem{theonb}[propnb]{Théorème}
  \newtheorem*{remq}{Remarque}
  \newtheorem{nota}[definb]{Notation}
  \def\ExampleText{Exemple}
\fi
\ifx\mylanguage\mylangenglish
  \newtheorem{definb}{Definition}
  \newtheorem{propnb}{Proposition}
  \newtheorem{theonb}[propnb]{Theorem}
  \nwetheorem{conjnb}[propnb]{Surmise}
  \newtheorem*{remq}{Remark}
  \newtheorem{nota}[definb]{Notation}
  \def\ExampleText{Example}
\fi
\newtheorem{explenb}{\ExampleText}
\RequirePackage{thmbox}
\ifx\mylanguage\mylangfrench
  \newtheorem{defi}[definb]{Définition}
  \newtheorem{prop}[propnb]{Proposition}
  \newtheorem{theo}[propnb]{Théorème}
  \newtheorem{conj}[propnb]{Conjecture}
  \renewcommand{\proofname}{Preuve}
\fi
\ifx\mylanguage\mylangenglish
  \newtheorem{defi}[definb]{Definition}
  \newtheorem{prop}[propnb]{Proposition}
  \newtheorem{theo}[propnb]{Theorem}
  \newtheorem{conj}[propnb]{Conjecture}
  \renewcommand{\proofname}{Proof}
\fi

\newtheorem{exple}[explenb]{\ExampleText}

% Affichage du sommaire sans titre de section
\RequirePackage[subfigure]{tocloft}
\renewcommand{\cftbeforesecskip}{0pt}

\makeatletter
\renewcommand{\@cftmaketoctitle}{}
%\renewcommand\tableofcontents{%
%    \@starttoc{toc}%
%}
\makeatother

% --- fin des premières définitions %

%\RequirePackage{etoolbox} % Package utile pour des définitions

% Définition du début de document
\ifx\mylanguage\mylangfrench
    \def\insertpredate{pour le}
    \def\insertpreauthor{rédigé par}
\fi
\ifx\mylanguage\mylangenglish
    \def\insertpredate{}
    \def\insertpreauthor{written by}
\fi
\setcounter{tocdepth}{2} % Limite la profondeur de la table des contenus aux sous-sections
\makeatletter
\AtBeginDocument{
	\begin{center}
		{\LARGE \bf \@title} \\
		\insertpredate{ }\@date
		\ifPAauthor \\
        \insertpreauthor{ }\@author
		\fi
	\end{center}
%	\maketitle
    \ifPAabstract
	  \hrule
	  \input{abstract.tex}
	\fi
	\ifPAtoc
	  \hrule \vspace{0.4em}
	  \tableofcontents \vspace{0.4em}
	\fi
	\hrule \vspace{0.4em}
}
\newcommand{\predate}[1]{\def\insertpredate{#1}}
\newcommand{\preauthor}[1]{\def\insertpreauthor{#1}}
\makeatother

% --- Outils de gestion des références
\def\insertbibfile{}%
\newcommand{\bibfile}[1]{\def\insertbibfile{#1}}%

% Définition de la fin de document
%\patchcmd{\thebibliography}{\section*{\refname}}{\vspace{0.2cm} \noindent {\large \bf \refname}}{}{} %Utilise etoolbox

\endinput
