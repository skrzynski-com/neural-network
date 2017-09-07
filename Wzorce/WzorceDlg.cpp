// WzorceDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Wzorce.h"
#include "WzorceDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWzorceDlg dialog

CWzorceDlg::CWzorceDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CWzorceDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CWzorceDlg)
	m_strOutName = _T("");
	m_strPatPerDig = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

CWzorceDlg::~CWzorceDlg()
{
	if(pOUT)
	{
		delete pOUT;
	}
}

void CWzorceDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CWzorceDlg)
	DDX_Control(pDX, IDC_PATTERN, m_butPattern);
	DDX_Control(pDX, IDC_OUTPUT, m_butOutName);
	DDX_Control(pDX, IDC_PATPERDIG, m_cbPatPerDig);
	DDX_Control(pDX, IDS_OUTPUT_NAME, m_statOutName);
	DDX_Text(pDX, IDS_OUTPUT_NAME, m_strOutName);
	DDX_CBString(pDX, IDC_PATPERDIG, m_strPatPerDig);
	DDX_Control(pDX, IDC_MATRIXCTRL1, m_Matrix);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CWzorceDlg, CDialog)
	//{{AFX_MSG_MAP(CWzorceDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_OUTPUT, OnOutput)
	ON_BN_CLICKED(IDC_PATTERN, OnPattern)
	ON_BN_CLICKED(IDC_CLEAR, OnClear)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWzorceDlg message handlers

BOOL CWzorceDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_bIsWorking = FALSE;
	m_iPat = 0;
	pOUT = NULL;

	m_strPatPerDig = "1";
	m_cbPatPerDig.LimitText(2);

	UpdateData(FALSE);	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CWzorceDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CWzorceDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CWzorceDlg::OnOutput() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	CString str('\000',_MAX_PATH);
	CFileDialog fg(FALSE,NULL,(LPCTSTR)str,
		OFN_EXPLORER|OFN_SHOWHELP|OFN_HIDEREADONLY,
		"Pliki tekstowe (*.txt)|*.txt|Wszystkie pliki (*.*)|*.*||");

	if( fg.DoModal() == IDOK )
	{
		m_strOutName = fg.GetPathName();
		UpdateData(FALSE);
		m_statOutName.UpdateWindow();
	}
}

void CWzorceDlg::OnPattern() 
{
	// TODO: Add your control notification handler code here
	if(!m_bIsWorking)
	{
		if(!strlen(m_strOutName))
		{
			AfxMessageBox("Podaj nazwe pliku wzorcow", 
				MB_OK|MB_ICONINFORMATION);
			return;
		}
		m_iNoPat = atoi(m_strPatPerDig);
		if(m_iNoPat<1 || m_iNoPat>99)
		{
			AfxMessageBox("Liczba wzorcow na cyfre\nmusi byc w przedziale <1,99>", 
				MB_OK|MB_ICONINFORMATION);
			return;
		}

		pOUT = new ofstream((LPCTSTR)m_strOutName);

		if(!pOUT)
		{
			AfxMessageBox("Nie moge otworzyc pliku wyjsciowego",
				MB_OK|MB_ICONINFORMATION);
			return;
		}

		m_cbPatPerDig.EnableWindow(FALSE);
		m_butOutName.EnableWindow(FALSE);
		m_bIsWorking = TRUE;

		*pOUT<<m_iNoPat;
		m_iNoPat *= 10;
	}

	BYTE points[49];
	m_Matrix.GetData((LPUNKNOWN)&points);
	char c;
	for(int i=0; i<49; ++i)
	{
		if(!(i%7))
		{
			*pOUT<<endl;
		} else {
			*pOUT<<" ";
		}
		c = points[i]+'0';
		*pOUT<<c;
	}
	*pOUT<<endl;

	++m_iPat;
	if(m_iPat == m_iNoPat)
	{
		AfxMessageBox("To byl ostatni wzorzec",
			MB_OK|MB_ICONINFORMATION);
		EndDialog(IDOK);
	}

	m_Matrix.Reset();
	char buf[20];
	itoa(m_iPat%10, buf, 10);
	strcat(buf, " (nastepny)");
	m_butPattern.SetWindowText(buf);
}

void CWzorceDlg::OnClear() 
{
	// TODO: Add your control notification handler code here
	m_Matrix.Reset();
}
