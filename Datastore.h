#ifndef DATASTORE_H
#define DATASTORE_H

#include <QObject>
#include <QFile>
#include <QVector>
#include <QDataStream>
#include <QStandardPaths>
#include <QDebug>

class Datastore : public QObject
{
    Q_OBJECT
public:
    Datastore();
    virtual ~Datastore();

    QFile file;
    QString filename = "data.dat";
    QVector<int> opendoors;

    void deletefile();
    Q_INVOKABLE void load();
    Q_INVOKABLE void save();
    Q_INVOKABLE bool isopen(int);
    Q_INVOKABLE void addnum(int num);

signals:

public slots:
};

#endif // DATASTORE_H
