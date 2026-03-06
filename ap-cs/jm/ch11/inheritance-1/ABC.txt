public class ABC {
    public void print(String s) { System.out.println(s); }
    
    public class A {
        public void p() { print("hi"); q(); }
        public void q() { print("Sally"); }
    }
    public class B extends A {
        public void p() { super.p(); print("bye"); }
    }
    public class C extends A {
        public void q() { print("Ava"); }
        public void r() { print("$1000"); }
    }
    // what do these do? or do they compile at all?
    public void questions() {
        // 1
        A a = new A();
        a.p();

        // 2
        B b = new B();
        b.p();

        // 3
        A x = new B();
        x.p();
        x.q();

        // 4
        B y = new C();
        y.q();

        // 5
        B z = new A();
        z.q();

        // 6
        A w = new C();
        w.p();
        w.r();

        // 7
        C w = new C();
        w.r();
    }
}
