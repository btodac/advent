#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include "Datastore.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QScopedPointer<Datastore> datastore(new Datastore);
    //datastore->deletefile();
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("datastore",datastore.data());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QGuiApplication::quit);
    return app.exec();
}
