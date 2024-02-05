# Workshop-Cpp



Le but de ce workshop est de pouvoir mieux comprendre comment fonctionnent les différents paradigmes de la programmation orientée objet.



Dans ce workshop, vous allez donc pouvoir découvrir l'**héritage**,le **polymorphisme**, ainsi que l'**abstraction**.



Si vous avez un soucis, n'hésitez pas à appeler un assistant pédagogique afin qu'il puisse vous aider.


Une première architecture est proposée dans ce repository afin que vous puissiez davantage vous concentrez sur la mise en place du code

## Exercice 1 - Les Interfaces



Pour commencer, nous allons créer une interface. D'après [ce site](https://medium.com/@sumana.dotnettricks/interfaces-in-c-exploring-the-key-concepts-and-implementation-techniques-c1b3b9e0cb7e#:~:text=in%20C%2B%2B%3F-,Interfaces%20in%20C%2B%2B%20serve%20as%20contracts%20that%20define%20a%20set,enhancing%20code%20modularity%20and%20flexibility.), une interface permet de définir une liste de méthode que les classes doivent posséder. Ces méthodes doivent être virtuelle pure. Voici un exemple d'interface:

```c++
class Interface {
    public:
        virtual ~Interface() = default;

        virtual void display() const = 0;
        virtual int add(int a, int b) = 0;
        virtual int sub(int a, int b) = 0;
}
```

Comme vous pouvez le voir ci-dessus, une interface ne possède pas de constructeurs. Toutes ses méthodes sont `virtual` pures. 



Pour ce premier exercice, je vous propose de créer un fichier `IEntities.hpp` qui contiendra notre interface `IEntities` possédant 3 méthodes:

* Une méthode `sayHello` qui ne retourne rien.
* Une méthode `sayGoodbye` qui ne retourne rien.





## Exercice 2 - Les Classes Abstraites et Héritages



Dans la programmation orientée objet, l'abstraction est primordiale si nous voulons un programme qui soit maintenable et clair. Une classe abstraite doit contenir au moins **UNE MÉTHODE VIRTUELLE PURE**. Si aucune méthode n'est virtuelle pure, il ne s'agit pas d'une classe abstraite. 

Voici un exemple de classes "abstraites":



```c++
#include "Interface.hpp"

// Abstract.hpp

class Abstract : public Interface {
	public:
    	Abstract();
    	virtual ~Abstract();
    
    	virtual void display() const;
    	virtual int add(int a, int b);
    	virtual int sub(int a, int b);
    	virtual int pytaghore(int a, int b, int c) = 0;
    // etc...
    protected:
    	int last_result;
};
```

```c++
#include "Abstract.hpp"

Abstract::Abstract()
{
	// ctor    
}

Abstract::~Abstract()
{
    // dtor
}

void Abstract::display() const
{
    std::cout << "[*] The last result is " << last_result << std::endl;
}

int Abstract::add(int a, int b)
{
	return a + b;
}

int Abstract::sub(int a, int b)
{
    return a - b;
}
```





Ici, le but de cet exercie est de créer deux classes abstraites `APerson` et `APet` qui héritent toutes deux de votre interface.

**ATTENTION**, vous devez obligatoirement possédez une seule classe par fichier !!!



Voici une liste des méthodes à implémenter pour ces classes



`APerson`:

* Une méthode `work ` `virtual pure`  qui ne retourne rien
* Une implémentation dans un fichier `APerson.cpp` des autres méthodes
* Le constructeur doit afficher "A Person is coming..." et prendre en paramètre le nom ainsi que le role de la personne
* Le destructeur doit afficher "A Person is leaving..."
* La méthode `sayHello` doit afficher "This person says hello"
* La méthode sayGoodbye doit afficher "This person says goodbye"
* Un `enum` est créer dans le fichier `APerson.hpp` en dehors de la classe (Role: STUDENT,  TEACHER)
* La classe `APerson` possède un attribut protégé `name` contenant le nom de la personne
* La classe `APerson` possède un attribut protégé `role` contenant le rôle de la personne
* Une méthode constante `getName`
* Une méthode constante `getRole`



`APet`:

* Une méthode `eat` `virtual pure` qui ne retourne rien
* Une implémentation dans un fichier `APet.cpp` des autres méthodes
* Le constructeur doit afficher "A Pet is coming..." et prendre en paramètre le nom ainsi que le type de l'animal
* Le destructeur doit afficher "A Pet is leaving..."
* La méthode `sayHello` doit afficher "This pet  smiles"
* La méthode sayGoodbye doit afficher "This pet is leaving"
* Un `enum` est créer dans le fichier `APet.hpp` en dehors de la classe (Animal: CAT,  DOG, FISH)
* La classe `APet` possède un attribut protégé `name` contenant le nom de l'animal
* La classe `APet` possède un attribut protégé `type` contenant le rôle de l'animal
* Une méthode constante `getName`
* Une méthode constante `getType`



## Exercice 3 - Polymorphisme



Maintenant que votre interface ainsi que vos classes abstraites sont réalisées, vous pouvez créer une classe pour chaque enumerators qui va hériter de vos classes abstraites



Enfants de `APerson`:

* Students
* Teacher



Enfants de `APets`:

* Cat
* Dog
* Fish



Vous devez donc maintenant implémenter les méthodes restantes: 

* `work` 
* `eat`

Mais également, lorsque cela est nécessaire,  créer une méthode `override` des méthodes `sayHello` et `sayGoodbye` (Petit tips: Un poisson ça ne parle pas :) )



