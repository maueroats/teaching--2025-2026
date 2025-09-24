// predict results: error or say what output
public void testAnimals() { 
    Cat c = new Cat();
    Dog d = new Dog();
    Borzoi b = new Borzoi();
    
    b.speak();
    c.speak();
    d.speak();
    
    Dog x;
    x.trick(); // predict 

    x = new Borzoi();
    x.trick(); // predict
    
    x = new Boxer();
    x.trick(); // predict
    
    Animal y = new Boxer();
    y.trick(); // predict
}
