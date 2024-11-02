#include <QtWidgets/QApplication>
#include <QMainWindow>

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    QMainWindow mainWindow;
    mainWindow.setWindowTitle("Hello, Qt!");
    mainWindow.resize(400, 300);
    mainWindow.show();

    return app.exec();
}