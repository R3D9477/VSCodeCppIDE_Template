#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QGuiApplication::quit);

    engine.loadFromModule("QtQuick", "Rectangle");

    return app.exec();
}

/*

#include <QApplication>
#include <QPushButton>
#include <QQuickWidget>
#include <QUrl>

#include <QtPlugin>

Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin);
Q_IMPORT_PLUGIN(QtQuick2Plugin);

int main(int argc, char** argv) {
    QApplication a(argc, argv);

    QQuickWidget* quick = new QQuickWidget();
    quick->setSource(QUrl::fromLocalFile("wp.qml"));
    quick->show();

    return a.exec();
}

*/
