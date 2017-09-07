// WzorceDlg.h : header file
//
#include <iostream.h>
#include <fstream.h>

/////////////////////////////////////////////////////////////////////////////
// CWzorceDlg dialog
//{{AFX_INCLUDES()
#include "matrix.h"
//}}AFX_INCLUDES

class CWzorceDlg : public CDialog
{
// Construction
public:
	CWzorceDlg(CWnd* pParent = NULL);	// standard constructor

	~CWzorceDlg();

	BOOL m_bIsWorking;
	int m_iNoPat;
	int m_iPat;
	ofstream *pOUT;

// Dialog Data
	//{{AFX_DATA(CWzorceDlg)
	enum { IDD = IDD_WZORCE_DIALOG };
	CButton	m_butPattern;
	CButton	m_butOutName;
	CComboBox	m_cbPatPerDig;
	CStatic	m_statOutName;
	CString	m_strOutName;
	CString	m_strPatPerDig;
	CMatrix	m_Matrix;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWzorceDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CWzorceDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnOutput();
	afx_msg void OnPattern();
	afx_msg void OnClear();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
