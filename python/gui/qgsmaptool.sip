/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/gui/qgsmaptool.h                                                 *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/






%ModuleHeaderCode
// fix to allow compilation with sip 4.7 that for some reason
// doesn't add these includes to the file where the code from
// ConvertToSubClassCode goes.
#include <qgsmaptoolzoom.h>
#include <qgsmaptoolpan.h>
#include <qgsmaptoolemitpoint.h>
#include <qgsmaptoolidentify.h>
%End

class QgsMapTool : QObject
{
%Docstring
 Abstract base class for all map tools.
 Map tools are user interactive tools for manipulating the
 map canvas. For example map pan and zoom features are
 implemented as map tools.
%End

%TypeHeaderCode
#include "qgsmaptool.h"
%End
%ConvertToSubClassCode
    if ( dynamic_cast<QgsMapToolZoom *>( sipCpp ) != NULL )
      sipType = sipType_QgsMapToolZoom;
    else if ( dynamic_cast<QgsMapToolPan *>( sipCpp ) != NULL )
      sipType = sipType_QgsMapToolPan;
    else if ( dynamic_cast<QgsMapToolEmitPoint *>( sipCpp ) != NULL )
      sipType = sipType_QgsMapToolEmitPoint;
    else if ( dynamic_cast<QgsMapToolIdentify *>( sipCpp ) != NULL )
      sipType = sipType_QgsMapToolIdentify;
    else
      sipType = NULL;
%End
  public:

    enum Flag
    {
      Transient,
      EditTool,
      AllowZoomRect,
    };
    typedef QFlags<QgsMapTool::Flag> Flags;


    virtual Flags flags() const;
%Docstring
 Returns the flags for the map tool.
.. versionadded:: 2.16
 :rtype: Flags
%End

    virtual ~QgsMapTool();

    virtual void canvasMoveEvent( QgsMapMouseEvent *e );
%Docstring
Mouse move event for overriding. Default implementation does nothing.
%End

    virtual void canvasDoubleClickEvent( QgsMapMouseEvent *e );
%Docstring
Mouse double-click event for overriding. Default implementation does nothing.
%End

    virtual void canvasPressEvent( QgsMapMouseEvent *e );
%Docstring
Mouse press event for overriding. Default implementation does nothing.
%End

    virtual void canvasReleaseEvent( QgsMapMouseEvent *e );
%Docstring
Mouse release event for overriding. Default implementation does nothing.
%End

    virtual void wheelEvent( QWheelEvent *e );
%Docstring
Mouse wheel event for overriding. Default implementation does nothing.
%End

    virtual void keyPressEvent( QKeyEvent *e );
%Docstring
Key event for overriding. Default implementation does nothing.
%End

    virtual void keyReleaseEvent( QKeyEvent *e );
%Docstring
Key event for overriding. Default implementation does nothing.
%End

    virtual bool gestureEvent( QGestureEvent *e );
%Docstring
gesture event for overriding. Default implementation does nothing.
 :rtype: bool
%End

    void setAction( QAction *action );
%Docstring
 Use this to associate a QAction to this maptool. Then when the setMapTool
 method of mapcanvas is called the action state will be set to on.
 Usually this will cause e.g. a toolbutton to appear pressed in and
 the previously used toolbutton to pop out. *
%End

    QAction *action();
%Docstring
Return associated action with map tool or NULL if no action is associated
 :rtype: QAction
%End

    void setButton( QAbstractButton *button );
%Docstring
 Use this to associate a button to this maptool. It has the same meaning
 as setAction() function except it works with a button instead of an QAction. *
%End

    QAbstractButton *button();
%Docstring
Return associated button with map tool or NULL if no button is associated
 :rtype: QAbstractButton
%End

    virtual void setCursor( const QCursor &cursor );
%Docstring
Set a user defined cursor
%End

    virtual void activate();
%Docstring
called when set as currently active map tool
%End

    virtual void deactivate();
%Docstring
called when map tool is being deactivated
%End

    virtual void clean();
%Docstring
convenient method to clean members
%End

    QgsMapCanvas *canvas();
%Docstring
returns pointer to the tool's map canvas
 :rtype: QgsMapCanvas
%End

    QString toolName();
%Docstring
 Emit map tool changed with the old tool
.. versionadded:: 2.3
 :rtype: str
%End

    static double searchRadiusMM();
%Docstring
 Get search radius in mm. Used by identify, tip etc.
  The values is currently set in identify tool options (move somewhere else?)
  and defaults to Qgis.DEFAULT_SEARCH_RADIUS_MM.
.. versionadded:: 2.3
 :rtype: float
%End

    static double searchRadiusMU( const QgsRenderContext &context );
%Docstring
 Get search radius in map units for given context. Used by identify, tip etc.
  The values is calculated from searchRadiusMM().
.. versionadded:: 2.3
 :rtype: float
%End

    static double searchRadiusMU( QgsMapCanvas *canvas );
%Docstring
 Get search radius in map units for given canvas. Used by identify, tip etc.
  The values is calculated from searchRadiusMM().
.. versionadded:: 2.3
 :rtype: float
%End

  signals:
    void messageEmitted( const QString &message, QgsMessageBar::MessageLevel = QgsMessageBar::INFO );
%Docstring
emit a message
%End

    void messageDiscarded();
%Docstring
emit signal to clear previous message
%End

    void activated();
%Docstring
signal emitted once the map tool is activated
%End

    void deactivated();
%Docstring
signal emitted once the map tool is deactivated
%End

  protected:

    QgsMapTool( QgsMapCanvas *canvas /TransferThis/ );
%Docstring
constructor takes map canvas as a parameter
%End

    QgsPointXY toMapCoordinates( QPoint point );
%Docstring
transformation from screen coordinates to map coordinates
 :rtype: QgsPointXY
%End

    QgsPointXY toLayerCoordinates( const QgsMapLayer *layer, QPoint point );
%Docstring
transformation from screen coordinates to layer's coordinates
 :rtype: QgsPointXY
%End

    QgsPointXY toLayerCoordinates( const QgsMapLayer *layer, const QgsPointXY &point );
%Docstring
transformation from map coordinates to layer's coordinates
 :rtype: QgsPointXY
%End

    QgsPointXY toMapCoordinates( const QgsMapLayer *layer, const QgsPointXY &point );
%Docstring
transformation from layer's coordinates to map coordinates (which is different in case reprojection is used)
 :rtype: QgsPointXY
%End

    QgsPoint toMapCoordinates( const QgsMapLayer *layer, const QgsPoint &point ) /PyName=toMapCoordinatesV2/;
%Docstring
 transformation from layer's coordinates to map coordinates (which is different in case reprojection is used)
.. note::

   available in Python bindings as toMapCoordinatesV2
 :rtype: QgsPoint
%End

    QgsRectangle toLayerCoordinates( const QgsMapLayer *layer, const QgsRectangle &rect );
%Docstring
trnasformation of the rect from map coordinates to layer's coordinates
 :rtype: QgsRectangle
%End

    QPoint toCanvasCoordinates( const QgsPointXY &point );
%Docstring
transformation from map coordinates to screen coordinates
 :rtype: QPoint
%End






};

QFlags<QgsMapTool::Flag> operator|(QgsMapTool::Flag f1, QFlags<QgsMapTool::Flag> f2);


/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/gui/qgsmaptool.h                                                 *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
