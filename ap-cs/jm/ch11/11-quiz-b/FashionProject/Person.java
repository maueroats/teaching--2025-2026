public abstract class Person {
    private String name;
    public String getName() {
        return name;
    }
    public Person(String n) {
        name = n;
    }
    public abstract int getWarmth();
    public abstract int getFashion();
}

