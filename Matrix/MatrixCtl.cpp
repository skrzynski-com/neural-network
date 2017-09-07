// MatrixCtl.cpp : Implementation of the CMatrixCtrl OLE control class.

#include "stdafx.h"
#include "Matrix.h"
#include "MatrixCtl.h"
#include "MatrixPpg.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define SIZE 49
#define WIDTH 7

IMPLEMENT_DYNCREATE(CMatrixCtrl, COleControl)


/////////////////////////////////////////////////////////////////////////////
// Message map

BEGIN_MESSAGE_MAP(CMatrixCtrl, COleControl)
	//{{AFX_MSG_MAP(CMatrixCtrl)
	ON_WM_MOUSEMOVE()
	ON_WM_LBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
	//}}AFX_MSG_MAP
	ON_OLEVERB(AFX_IDS_VERB_PROPERTIES, OnProperties)
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// Dispatch map

BEGIN_DISPATCH_MAP(CMatrixCtrl, COleControl)
	//{{AFX_DISPATCH_MAP(CMatrixCtrl)
	DISP_FUNCTION(CMatrixCtrl, "Reset", Reset, VT_EMPTY, VTS_NONE)
	DISP_FUNCTION(CMatrixCtrl, "GetData", GetData, VT_EMPTY, VTS_UNKNOWN)
	DISP_FUNCTION(CMatrixCtrl, "PutData", PutData, VT_EMPTY, VTS_UNKNOWN)
	DISP_FUNCTION(CMatrixCtrl, "InvalidateLine", InvalidateLine, VT_EMPTY, VTS_I2)
	DISP_FUNCTION(CMatrixCtrl, "ResetBlack", ResetBlack, VT_EMPTY, VTS_NONE)
	//}}AFX_DISPATCH_MAP
END_DISPATCH_MAP()


/////////////////////////////////////////////////////////////////////////////
// Event map

BEGIN_EVENT_MAP(CMatrixCtrl, COleControl)
	//{{AFX_EVENT_MAP(CMatrixCtrl)
	//}}AFX_EVENT_MAP
END_EVENT_MAP()


/////////////////////////////////////////////////////////////////////////////
// Property pages

// TODO: Add more property pages as needed.  Remember to increase the count!
BEGIN_PROPPAGEIDS(CMatrixCtrl, 1)
	PROPPAGEID(CMatrixPropPage::guid)
END_PROPPAGEIDS(CMatrixCtrl)


/////////////////////////////////////////////////////////////////////////////
// Initialize class factory and guid

IMPLEMENT_OLECREATE_EX(CMatrixCtrl, "MATRIX.MatrixCtrl.1",
	0x2e618093, 0x802a, 0x11d1, 0xb2, 0x7c, 0, 0, 0, 0, 0, 0)


/////////////////////////////////////////////////////////////////////////////
// Type library ID and version

IMPLEMENT_OLETYPELIB(CMatrixCtrl, _tlid, _wVerMajor, _wVerMinor)


/////////////////////////////////////////////////////////////////////////////
// Interface IDs

const IID BASED_CODE IID_DMatrix =
		{ 0x2e618091, 0x802a, 0x11d1, { 0xb2, 0x7c, 0, 0, 0, 0, 0, 0 } };
const IID BASED_CODE IID_DMatrixEvents =
		{ 0x2e618092, 0x802a, 0x11d1, { 0xb2, 0x7c, 0, 0, 0, 0, 0, 0 } };


/////////////////////////////////////////////////////////////////////////////
// Control type information

static const DWORD BASED_CODE _dwMatrixOleMisc =
	OLEMISC_ACTIVATEWHENVISIBLE |
	OLEMISC_SETCLIENTSITEFIRST |
	OLEMISC_INSIDEOUT |
	OLEMISC_CANTLINKINSIDE |
	OLEMISC_RECOMPOSEONRESIZE;

IMPLEMENT_OLECTLTYPE(CMatrixCtrl, IDS_MATRIX, _dwMatrixOleMisc)


/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl::CMatrixCtrlFactory::UpdateRegistry -
// Adds or removes system registry entries for CMatrixCtrl

BOOL CMatrixCtrl::CMatrixCtrlFactory::UpdateRegistry(BOOL bRegister)
{
	if (bRegister)
		return AfxOleRegisterControlClass(
			AfxGetInstanceHandle(),
			m_clsid,
			m_lpszProgID,
			IDS_MATRIX,
			IDB_MATRIX,
			FALSE,                      //  Not insertable
			_dwMatrixOleMisc,
			_tlid,
			_wVerMajor,
			_wVerMinor);
	else
		return AfxOleUnregisterClass(m_clsid, m_lpszProgID);
}

void CMatrixCtrl::ResetData(void)
{
	for(int i=0; i<SIZE; ++i)
	{
		m_aPoints[i] = 0;
	}
}

void CMatrixCtrl::SetData(void)
{
	for(int i=0; i<SIZE; ++i)
	{
		m_aPoints[i] = 1;
	}
}

/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl::CMatrixCtrl - Constructor

CMatrixCtrl::CMatrixCtrl()
{
	InitializeIIDs(&IID_DMatrix, &IID_DMatrixEvents);

	// TODO: Initialize your control's instance data here.
	ResetData();
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl::~CMatrixCtrl - Destructor

CMatrixCtrl::~CMatrixCtrl()
{
	// TODO: Cleanup your control's instance data here.
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl::OnDraw - Drawing function

void CMatrixCtrl::OnDraw(
			CDC* pdc, const CRect& rcBounds, const CRect& rcInvalid)
{
	// TODO: Replace the following code with your own drawing code.

	//czarne pioro
	CPen *pPen = (CPen *)pdc->SelectObject(
		CPen::FromHandle( 
			(HPEN)GetStockObject(BLACK_PEN)
		)
	);
	
	//szare pioro
	CPen pen(PS_SOLID, 0, RGB(128,128,128));

	int i;
	int width = rcBounds.right-rcBounds.left,
		height = rcBounds.bottom-rcBounds.top;

	//dane
	CRect rect;
	for(i=0; i<SIZE; ++i)
	{
		rect.left = (i%WIDTH)*width/WIDTH-1; 
		rect.right = (i%WIDTH+1)*width/WIDTH-1; 
		rect.top = (i/WIDTH)*height/WIDTH-1;
		rect.bottom = (i/WIDTH+1)*height/WIDTH-1;

		pdc->FillRect(
			rect, 
			CBrush::FromHandle(
				(HBRUSH)GetStockObject(
					m_aPoints[i]?BLACK_BRUSH:WHITE_BRUSH
				)
			)
		);

	}

	pdc->MoveTo(rcBounds.left, rcBounds.bottom);
	pdc->LineTo(rcBounds.left, rcBounds.top);
	pdc->LineTo(rcBounds.right, rcBounds.top);

	pdc->SelectObject(&pen);

	for(i=1; i<=WIDTH; ++i)
	{
		pdc->MoveTo((int)(i*width/WIDTH)-1,rcBounds.top);
		pdc->LineTo((int)(i*width/WIDTH)-1,rcBounds.bottom);

		pdc->MoveTo(rcBounds.left,(int)(i*height/WIDTH)-1);
		pdc->LineTo(rcBounds.right,(int)(i*height/WIDTH)-1);
	}

	//startowe pioro
	pdc->SelectObject(pPen);
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl::DoPropExchange - Persistence support

void CMatrixCtrl::DoPropExchange(CPropExchange* pPX)
{
	ExchangeVersion(pPX, MAKELONG(_wVerMinor, _wVerMajor));
	COleControl::DoPropExchange(pPX);

	// TODO: Call PX_ functions for each persistent custom property.

}


/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl::OnResetState - Reset control to default state

void CMatrixCtrl::OnResetState()
{
	COleControl::OnResetState();  // Resets defaults found in DoPropExchange

	// TODO: Reset any other control state here.
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl message handlers

void CMatrixCtrl::Reset() 
{
	// TODO: Add your dispatch handler code here
	ResetData();
	InvalidateControl();
}

void CMatrixCtrl::ResetBlack() 
{
	// TODO: Add your dispatch handler code here
	SetData();
	InvalidateControl();
}

void CMatrixCtrl::GetData(LPUNKNOWN p) 
{
	// TODO: Add your dispatch handler code here
	for(int i=0; i<SIZE; ++i)
	{
		((BYTE *)p)[i] = m_aPoints[i];
	}
}

void CMatrixCtrl::PutData(LPUNKNOWN p) 
{
	// TODO: Add your dispatch handler code here
	for(int i=0; i<SIZE; ++i)
	{
		m_aPoints[i] = ((BYTE *)p)[i] ;
	}
}

void CMatrixCtrl::ChangeData(UINT nFlags, CPoint& point)
{
	CRect rect;
	GetClientRect(&rect);

	long width = rect.right-rect.left,
		height = rect.bottom-rect.top;

	ASSERT(width>=0);
	ASSERT(height>=0);

	if(point.x<0||point.x>=width||
		point.y<0||point.y>=height)
	{
		return;
	}

	int i = WIDTH*point.y/height*WIDTH +
			WIDTH*point.x/width;

	if(i>48)
	{
		i = 48;
	}

	ASSERT(i>=0 && i<=48);

	if(nFlags & MK_LBUTTON && !m_aPoints[i] ||
		nFlags & MK_RBUTTON && m_aPoints[i])
	{
		m_aPoints[i] = !(m_aPoints[i]);

		rect.left = (i%WIDTH)*width/WIDTH-1; 
		rect.right = (i%WIDTH+1)*width/WIDTH-1; 
		rect.top = (i/WIDTH)*height/WIDTH-1;
		rect.bottom = (i/WIDTH+1)*height/WIDTH-1;

		InvalidateControl(&rect);
	}
}

void CMatrixCtrl::OnMouseMove(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	ChangeData(nFlags, point);

	COleControl::OnMouseMove(nFlags, point);
}

void CMatrixCtrl::OnLButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	ChangeData(nFlags, point);
	
	COleControl::OnLButtonDown(nFlags, point);
}

void CMatrixCtrl::OnRButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	ChangeData(nFlags, point);
	
	COleControl::OnRButtonDown(nFlags, point);
}

void CMatrixCtrl::InvalidateLine(short line) 
{
	// TODO: Add your dispatch handler code here
	if(!line)
	{
		InvalidateControl();
	}
}
