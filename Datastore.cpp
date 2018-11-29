#include "Datastore.h"

Datastore::Datastore()
{
    opendoors.clear();
    load();
}

Datastore::~Datastore()
{
    save();
}

void Datastore::deletefile()
{
    QString pathtodir = QStandardPaths::locate(QStandardPaths::DataLocation, QString(), QStandardPaths::LocateDirectory);
    QString pathandname = pathtodir + filename;
    if (file.exists(pathandname))
    {
        file.setFileName(pathandname);
        file.remove();
        file.close();
        opendoors.clear();
    }
}

void Datastore::load()
{
    QString pathtodir = QStandardPaths::locate(QStandardPaths::DataLocation, QString(), QStandardPaths::LocateDirectory);
    QString pathandname = pathtodir + filename;
    if (file.exists(pathandname))
    {
        file.setFileName(pathandname);
        file.open(QIODevice::ReadOnly);
        if (file.isOpen()&&file.isReadable())
        {
            qDebug() << "File open and readable: " << file.fileName();
            QDataStream in(&file);
            opendoors.clear();
            // First uint is number of open doors
            uint n;
            in >> n;
            qDebug() << "Number of entries = " << n;
            for(uint i = 0; i<n; i++)
            {
                // loop through data and get the number of the open doors
                uint door;
                in >> door;
                opendoors.push_back(door);
                qDebug() << opendoors[i];
            }
            qDebug() << "Data Loaded";
        }
        file.close();
    }
    else
    {
        qDebug() << "Unable to open file: " << file.fileName();
    }
    return;
}

void Datastore::save()
{
    QString pathtodir = QStandardPaths::locate(QStandardPaths::DataLocation, QString(), QStandardPaths::LocateDirectory);
    QString pathandname = pathtodir + filename;
    file.setFileName(pathandname);
    file.open(QIODevice::WriteOnly);
    if(file.isOpen()&&file.isWritable())
    {
        qDebug() << "File opened and writable: " << file.fileName();
        QDataStream out(&file);
        // First uint is number open doors
        uint n = opendoors.size();
        out << n;
        for(uint i = 0; i<n; i++)
        {
            // loop through opendoors and write the number of the open doors
            out << opendoors[i];
            qDebug() << opendoors[i];
        }
        file.close();
        qDebug() << "Data saved";
    }
    else
    {
        qDebug() << "Could not open file: " << pathandname;
    }

    return;
}



bool Datastore::isopen(int door)
{
    bool open = false;
    for(int i = 0; i<opendoors.size(); i++)
    {
        if (opendoors[i] == door) open = true;
    }
    qDebug() << "door " << door << " checked and is open: " << open;
    return open;
}

void Datastore::addnum(int num)
{
    opendoors.push_back(num);
    save();
    return;
}
