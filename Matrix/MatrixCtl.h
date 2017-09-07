// MatrixCtl.h : Declaration of the CMatrixCtrl OLE control class.

/////////////////////////////////////////////////////////////////////////////
// CMatrixCtrl : See MatrixCtl.cpp for implementation.

class CMatrixCtrl : public COleControl
{
	DECLARE_DYNCREATE(CMatrixCtrl)

// Constructor
public:
	BYTE m_aPoints[49];

	void ResetData(void);
	void SetData(void);
	void ChangeData(UINT nFlags, CPoint& point);
	
	CMatrixCtrl();

// Overrides

	// Drawing function
	virtual void OnDraw(
				CDC* pdc, const CRect& rcBounds, const CRect& rcInvalid);

	// Persistence
	virtual void DoPropExchange(CPropExchange* pPX);

	// Reset control state
	virtual void OnResetState();

// Implementation
protected:
	~CMatrixCtrl();

	DECLARE_OLECREATE_EX(CMatrixCtrl)    // Class factory and guid
	DECLARE_OLETYPELIB(CMatrixCtrl)      // GetTypeInfo
	DECLARE_PROPPAGEIDS(CMatrixCtrl)     // Property page IDs
	DECLARE_OLECTLTYPE(CMatrixCtrl)		// Type name and misc status

// Message maps
	//{{AFX_MSG(CMatrixCtrl)
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

// Dispatch maps
	//{{AFX_DISPATCH(CMatrixCtrl)
	afx_msg void Reset();
	afx_msg void GetData(LPUNKNOWN p);
	afx_msg void PutData(LPUNKNOWN p);
	afx_msg void InvalidateLine(short line);
	afx_msg void ResetBlack();
	//}}AFX_DISPATCH
	DECLARE_DISPATCH_MAP()

// Event maps
	//{{AFX_EVENT(CMatrixCtrl)
	//}}AFX_EVENT
	DECLARE_EVENT_MAP()

// Dispatch and event IDs
public:
	enum {
	//{{AFX_DISP_ID(CMatrixCtrl)
	dispidReset = 1L,
	dispidGetData = 2L,
	dispidPutData = 3L,
	dispidInvalidateLine = 4L,
	dispidResetBlack = 5L,
	//}}AFX_DISP_ID
	};
};
