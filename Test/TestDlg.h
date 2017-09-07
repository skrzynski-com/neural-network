// TestDlg.h : header file
//
#include <iostream.h>
#include <fstream.h>

/////////////////////////////////////////////////////////////////////////////
// CTestDlg dialog
//{{AFX_INCLUDES()
#include "matrix.h"
//}}AFX_INCLUDES

class CTestDlg : public CDialog
{
// Construction
public:
#define HMAX 400
#define NIN 50
#define NOUT 10
	int		m_iFunctionH;
	int		m_iFunctionO;
	double	m_dBias;

	
	int m_iHNo;

	double m_Wh[HMAX][NIN];

	double m_Wo[NOUT][HMAX+1];

	BYTE points[NIN-1];
	double m_X[NIN];

	double m_Nh[HMAX+1];
	double m_Yhb[HMAX+1];
//	double m_Eh[HMAX];

	double m_No[NOUT];
	double m_Y[NOUT];
//	double m_Z[NOUT];

//	double m_Eo[NOUT];
//	double m_e;

	
	BOOL m_bIsWorking;

	double fh(double d);
	double fhp(double d);
	double fo(double d);
	double fop(double d);

	CTestDlg(CWnd* pParent = NULL);	// standard constructor
	~CTestDlg();

// Dialog Data
	//{{AFX_DATA(CTestDlg)
	enum { IDD = IDD_TEST_DIALOG };
	CStatic	m_statInpName;
	CButton	m_strS9;
	CButton	m_strS8;
	CButton	m_strS7;
	CButton	m_strS6;
	CButton	m_strS5;
	CButton	m_strS4;
	CButton	m_strS3;
	CButton	m_strS2;
	CButton	m_strS1;
	CButton	m_strS0;
	CButton	m_butInpName;
	CString	m_str0;
	CString	m_str1;
	CString	m_str2;
	CString	m_str3;
	CString	m_str4;
	CString	m_str5;
	CString	m_str8;
	CString	m_str9;
	CMatrix	m_Matrix;
	CString	m_strInpName;
	CString	m_str6;
	CString	m_str7;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTestDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CTestDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnInpname();
	afx_msg void OnPattern();
	afx_msg void OnClear();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
