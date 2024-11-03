#include <gtkmm-4.0/gtkmm.h>

class HelloWindow : public Gtk::Window
{
public:
    HelloWindow()
    {
        set_title("Hello, GTKmm");
        set_default_size(300, 200);
    }
};

int main(int argc, char *argv[])
{
    // Create the GTK application without passing argc and argv
    auto app = Gtk::Application::create("org.gtkmm.example");

    // Create the main window
    HelloWindow window;

    // Run the application with the main window
    return app->make_window_and_run<HelloWindow>(argc, argv);
}