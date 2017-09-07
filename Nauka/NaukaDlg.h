// NaukaDlg.h : header file
//

#define WM_UPDATE_CTRLS WM_USER+1

/////////////////////////////////////////////////////////////////////////////
// CNaukaDlg dialog

class CNaukaDlg : public CDialog
{
// Construction
public:
#define HMAX 400
#define XMAX 100
#define NIN 50
#define NOUT 10
	int m_i;
	unsigned long m_lStep;

	char m_XX[100][NIN-1];
	int m_iNoXX;

	double m_Wh[HMAX][NIN];
	double m_dWh[HMAX][NIN];
	double m_mWh[HMAX][NIN];

	double m_Wo[NOUT][HMAX+1];
	double m_dWo[NOUT][HMAX+1];
	double m_mWo[NOUT][HMAX+1];

	double m_X[NIN];

	double m_Nh[HMAX+1];
	double m_Yhb[HMAX+1];
	double m_Eh[HMAX];

	double m_No[NOUT];
	double m_Y[NOUT];
	double m_Z[NOUT];
	double m_Eo[NOUT];
	double m_e;

	int m_iHNo;
	double	m_dWeightMinO;
	double	m_dWeightMinH;
	double	m_dWeightMaxO;
	double	m_dWeightMaxH;
	double	m_dLearnH;
	double	m_dLearnO;
	double	m_dMomentum;
	double	m_dBias;
	double	m_dErrange;
	double	m_dBeta;

	BOOL bEnd;
	BOOL m_bLos;

	double f(double d, BOOL h);
	double fp(double d, BOOL h);

	void Losuj();

	void Load();
	void Save();

	void ControlsOff();
	void ControlsOn();

	static DWORD ThreadProc( LPVOID pParam );

	void SetStartText(BOOL b = TRUE);	

	CNaukaDlg(CWnd* pParent = NULL);	// standard constructor
	~CNaukaDlg();

	HANDLE m_hEventWork;
	HANDLE m_hEventEnd;
	HANDLE m_hEventWeights;


// Dialog Data
	//{{AFX_DATA(CNaukaDlg)
	enum { IDD = IDD_NAUKA_DIALOG };
	CEdit	m_edBeta;
	CEdit	m_edErrange;
	CComboBox	m_cbBias;
	CComboBox	m_cbMomentum;
	CEdit	m_edLearnH;
	CEdit	m_edLearnO;
	CButton	m_butWeight2;
	CButton	m_butWeight1;
	CButton	m_butHNo2;
	CButton	m_butHNo1;
	CEdit	m_edHNo;
	CEdit	m_edWeightMinO;
	CEdit	m_edWeightMinH;
	CEdit	m_edWeightMaxO;
	CEdit	m_edWeightMaxH;
	CComboBox	m_cbFunctionO;
	CComboBox	m_cbFunctionH;
	CStatic	m_statOutName;
	CStatic	m_statInpName;
	CButton	m_butOutName;
	CButton	m_butInpName;
	CButton	m_butStart;
	CString	m_strInpName;
	CString	m_strOutName;
	int		m_iFunctionH;
	int		m_iFunctionO;
	CString	m_strWeightMaxH;
	CString	m_strWeightMaxO;
	CString	m_strWeightMinH;
	CString	m_strWeightMinO;
	CString	m_strHNo;
	CString	m_strLearnH;
	CString	m_strLearnO;
	CString	m_strMomentum;
	CString	m_strBias;
	CString	m_strErrange;
	CString	m_strEpok;
	CString	m_strError;
	CString	m_strBeta;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNaukaDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CNaukaDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnStart();
	afx_msg void OnAbout();
	afx_msg void OnInput();
	afx_msg void OnOutput();
	afx_msg void OnWeightRan1();
	afx_msg void OnWeightRan2();
	afx_msg void OnHno1();
	afx_msg void OnHno2();
	afx_msg void OnSave();
	afx_msg void OnSaveas();
	//}}AFX_MSG
	afx_msg LRESULT OnUpdateCtrls(WPARAM, LPARAM);
	DECLARE_MESSAGE_MAP()
};
