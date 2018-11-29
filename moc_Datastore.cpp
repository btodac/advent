/****************************************************************************
** Meta object code from reading C++ file 'Datastore.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.8.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "Datastore.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Datastore.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.8.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Datastore_t {
    QByteArrayData data[7];
    char stringdata0[39];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Datastore_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Datastore_t qt_meta_stringdata_Datastore = {
    {
QT_MOC_LITERAL(0, 0, 9), // "Datastore"
QT_MOC_LITERAL(1, 10, 4), // "load"
QT_MOC_LITERAL(2, 15, 0), // ""
QT_MOC_LITERAL(3, 16, 4), // "save"
QT_MOC_LITERAL(4, 21, 6), // "isopen"
QT_MOC_LITERAL(5, 28, 6), // "addnum"
QT_MOC_LITERAL(6, 35, 3) // "num"

    },
    "Datastore\0load\0\0save\0isopen\0addnum\0"
    "num"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Datastore[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x02 /* Public */,
       3,    0,   35,    2, 0x02 /* Public */,
       4,    1,   36,    2, 0x02 /* Public */,
       5,    1,   39,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Bool, QMetaType::Int,    2,
    QMetaType::Void, QMetaType::Int,    6,

       0        // eod
};

void Datastore::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Datastore *_t = static_cast<Datastore *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->load(); break;
        case 1: _t->save(); break;
        case 2: { bool _r = _t->isopen((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 3: _t->addnum((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject Datastore::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Datastore.data,
      qt_meta_data_Datastore,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Datastore::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Datastore::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Datastore.stringdata0))
        return static_cast<void*>(const_cast< Datastore*>(this));
    return QObject::qt_metacast(_clname);
}

int Datastore::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
