

SET SERVEROUTPUT ON 

/*
DROP TABLE Personne CASCADE CONSTRAINT;
DROP TABLE Auteur CASCADE CONSTRAINT;
DROP TABLE Livre CASCADE CONSTRAINT;
DROP TABLE Ecriture CASCADE CONSTRAINT;
DROP TABLE Exemplaire CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_Personne;
DROP SEQUENCE SEQ_Auteur;
DROP SEQUENCE SEQ_Livre;
DROP SEQUENCE SEQ_Exemplaire;

CREATE TABLE Personne (
	id number(8,0),
	nom varchar2(32),
	prenom varchar2(32),
	pere number(8,0),
	CONSTRAINT pk_Personne PRIMARY KEY(id),
	CONSTRAINT fk_pere FOREIGN KEY(pere) REFERENCES Personne(id)
);

-- Séquence à utiliser pour valuer la colonne id de la table Personne
CREATE SEQUENCE SEQ_Personne START WITH 1;

CREATE TABLE Auteur (
	id number(8,0),
	goncourt number(1),
	idPersonne number(8,0),
	CONSTRAINT pk_Auteur PRIMARY KEY(id),
	CONSTRAINT fk_idPersonne FOREIGN KEY(idPersonne) REFERENCES Personne(id)
);

-- Séquence à utiliser pour valuer la colonne id de la table Auteur
CREATE SEQUENCE SEQ_Auteur START WITH 1;

CREATE TABLE Livre (
	ISBN number(8,0),
	titre varchar2(32),
	CONSTRAINT pk_Livre PRIMARY KEY(ISBN)
);

-- Séquence à utiliser pour valuer la colonne ISBN de la table Livre
CREATE SEQUENCE SEQ_Livre START WITH 1;

CREATE TABLE Ecriture (
	idAuteur number(8,0),
	idLivre number(8,0),
	CONSTRAINT pk_Ecriture PRIMARY KEY(idAuteur, idLivre),
	CONSTRAINT fk_idAuteur FOREIGN KEY(idAuteur) REFERENCES Auteur(id),
	CONSTRAINT fk_idLivre FOREIGN KEY(idLivre) REFERENCES Livre(ISBN)
);

CREATE TABLE Exemplaire (
	id number(8,0),
	prix number(10,2),
	duLivre number(8,0),
	emprunteur number(8,0), 
	dateEmprunt date,
	CONSTRAINT pk_Exemplaire PRIMARY KEY(id),
	CONSTRAINT fk_emprunteur FOREIGN KEY(emprunteur) REFERENCES Personne(id),
	CONSTRAINT fk_duLivre FOREIGN KEY(duLivre) REFERENCES Livre(ISBN)
);

-- Séquence à utiliser pour valuer la colonne id de la table Exemplaire
CREATE SEQUENCE SEQ_Exemplaire START WITH 1;*/


                    /*insertion */
                    
      /*              
                    -- Insertion de données dans le modèle logique
INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, 'A l''image des géants');
INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, 'Dieux du Stade');
INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, 'Le Monde comme je le vois');
INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, 'Harry Potter, tome 6');
INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, 'L''Arche des ombres, Tome 1');
INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, 'Livre sans exemplaire');

INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Hawking', 'Stephen', null);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Goudon', 'Fred', null);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Jospin', 'Lionel', null);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Rowling', 'J.K.', null);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Hobb', 'Robin', null);

INSERT INTO Auteur 
       SELECT SEQ_Auteur.NEXTVAL, DECODE(Personne.nom, 'Goudon',0,1), Personne.id  FROM PERSONNE;

INSERT INTO Ecriture SELECT Livre.isbn, Auteur.id FROM Livre, Auteur where Livre.isbn = Auteur.id;

INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Hawking', 'Hans', 1);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Hawking', 'Jens', 6);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Hobb', 'Thierry', 5);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Shaw', 'Andrew', NULL);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Dieter', 'Fensen', NULL);
INSERT INTO Personne VALUES (SEQ_Personne.NEXTVAL, 'Baden', 'Thomas', NULL);

INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 26.60 , 1, 8, TO_DATE('05/10/2005', 'DD/MM/YYYY'));
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 26.60 , 1, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 26.60 , 1, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 26.60 , 1, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 26.60 , 1, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 24.70 , 2, 8, TO_DATE('15/10/2005', 'DD/MM/YYYY'));
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 24.70 , 2, 9, TO_DATE('15/10/2005', 'DD/MM/YYYY'));
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 24.70 , 2, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 24.70 , 2, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 24.70 , 2, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 22.33 , 3, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 22.33 , 3, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 22.33 , 3, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 23.75 , 4, NULL, NULL);
INSERT INTO Exemplaire VALUES (SEQ_Exemplaire.NEXTVAL, 32.78  ,5, NULL, NULL);

                                    */
                                    
/***************************** A3 ****************************************************

select isbn,titre ,COUNT(exemplaire.id) 
from livre 
LEFT JOIN exemplaire ON livre.isbn= exemplaire.dulivre
group by isbn,titre  ; */


/***************************** A4 ****************************************************


SELECT  id  , NVL(round(sysdate - dateemprunt)  , 0 )
FROM dual  , exemplaire  ; */


/***************************** A5 ****************************************************

select nom ,prenom 
from personne p , auteur a 
where p.id= a.id ; */



/***************************** A6 ****************************************************

select    nom , prenom 
from personne p
MINUS 
select p.nom , p.prenom
from auteur a  , personne p 
where p.id = a.idpersonne
 ; 
*/


/***************************** A7 ****************************************************


select level  , nom ,prenom 
from personne 
start with nom='Hawking' and prenom = 'Jens'
connect by  pere = id ; 

*/

/***************************************************************************************************/
/*********************************************pl/sql ***********************************************/
 
 
/*********************************************B-1 ***********************************************/
/*
 declare 
  str   VARCHAR2(20) := 'HELLO WORLD !'; 
  
  begin 
   dbms_output.put_line(str )   ; 
  
  end  ;

  */
  
  
  /*********************************************B-2 ***********************************************/
  
  /*
  declare 
  
  nom              VARCHAR2(30) := 'Roramle ' ; 
  prenom           VARCHAR2(30) := 'Jennifer ' ;
  idt              VARCHAR2(3)  ; 
  idt2             VARCHAR2(3)  ; 

  
  Begin 
   idt := SUBSTR( nom , 1 , 3 ) ;
   dbms_output.put_line( idt )   ; 
   
   idt2 := SUBSTR( prenom , 1 , 3 ) ; 
   dbms_output.put_line( idt2 )   ;
   
   dbms_output.put_line( idt|| idt2 )   ;    
   
  end ; 
  */
          
          
          
/*****************************************b-3****************************************************/
   
   
 /* l 'avantage d 'utilisetr l'operateur %TYPE ET %ROWTYPE permet de declarer des variable du type souhaité  ,
 affectation de valeur aux variable et aussi la possibilite d'avoir des variable de stockage */
 
 
 
 /*****************************************B-4****************************************************/
 

/*
DECLARE c Personne.nom%TYPE  ; 

BEGIN DBMS_OUTPUT.PUT_LINE(c);

END;
*/
/*remarque : la valeur par defaut de la variable c   de type nom de la colone de la table personne est vide   */


  


/*      
declare 

  Type  livre  is record (
        isbn number (20) NOT NULL := 100,  ,
        titre varchar2 (25) NOT NULL := 'los Angelos ', 
        ) ;
        
        monlivre livre  ; 
        
        begin 
        
  DBMS_OUTPUT.PUT_LINE('monlivre ');
  DBMS_OUTPUT.PUT_LINE('---------');
  DBMS_OUTPUT.PUT_LINE( monlivre.isbn); 
        
        end  ; */
      
/*********************************************B-5 ***********************************************/ 
  /* 1eme solution*/
  /*
DECLARE
  TYPE livre IS RECORD (
    isbn    NUMBER(4) NOT NULL := 100,
    titre  VARCHAR2(30) NOT NULL := 'Los Angeles'
  
  );
 
  monlivre  livre ;

BEGIN
  DBMS_OUTPUT.PUT_LINE('monlivre:');
  DBMS_OUTPUT.PUT_LINE('---------');
  DBMS_OUTPUT.PUT_LINE('isbn:   ' || monlivre.isbn);
  DBMS_OUTPUT.PUT_LINE('titre: ' || monlivre.titre);


END;
*/

/* 2eme solution
declare 
 monLivre  livre%ROWTYPE  ; 
 
 BEGIN 
    monLivre.ISBN := 100 ;
    monLivre.titre := 'Los Angelos ' ; 
   
    DBMS_OUTPUT.PUT_LINE(monLivre.isbn );
      DBMS_OUTPUT.PUT_LINE(monLivre.titre );
   
   END  ; 
    
            
   /***************************************************  b-6 ************************************************/
  
  /*
    declare 
    BEGIN 
    
    INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, '');
    UPDATE livre  SET  titre = 'le chemin qui monte'  WHERE  isbn = 7 ;
    
    END ; */
  

 


 /***************************************************  b-7 ************************************************/

/*
   DECLARE

  str   VARCHAR2(20) ; 
  monlivre  livre%ROWTYPE  ;
  
   BEGIN
  
   SELECT titre   into str  
   from livre l 
   where l.isbn = 1;
  
   INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, str);
   DBMS_OUTPUT.PUT_LINE( str); 
   
END;*/

 /***************************************************  b-8 ************************************************/   
 /*
 
  DECLARE
  
  str   VARCHAR2(20) ; 
 

  BEGIN
  str := 'soleil' ; 
  
  if  (SUBSTR(str , 1 , 3 )<> 't')  
  
     then  INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, str );
     
  else 
  
         INSERT INTO LIVRE VALUES (SEQ_Livre.NEXTVAL, upper(str));
  
   
  END;
*/

 /***************************************************  b-11 ************************************************/  
 /*declare  
     cursor  c is 

     select prix 
     from exemplaire 
     where  dulivre = 1 ; 

     var c%ROWTYPE ; 
 BEGIN 
  
    OPEN C  ; 
    LOOP 
    FETCH C INTO  VAR  ; 
    EXIT WHEN 
    C%notfound ; 
    
        update exemplaire set prix = var.prix + 10  WHERE EXEMPLAIRE.DULIVRE = 1 ; 


     end loop  ; 
 end ; */
/*************************************************** Procedure et fonction  ***************************************************/
 

create or replace
procedure AugmenterPrix ( Myisbn IN NUMBER)
 
 as  
 
     cursor  c is 

     select prix 
     from exemplaire 
     where  dulivre = Myisbn ; 

     var c%ROWTYPE ;
     
 BEGIN 
  
    OPEN C  ; 
    LOOP 
    FETCH C INTO  VAR  ; 
    EXIT WHEN 
    C%notfound ; 
    
       update exemplaire set prix = var.prix + 10  WHERE EXEMPLAIRE.DULIVRE = 1 ; 

     end loop ; 

 end AugmenterPrix ;


DECLARE 
 BEGIN 
   AugmenterPrix ( 1) ;
 
 END ; 


----------------------------------------c2-------------------------------------------------------------------------
