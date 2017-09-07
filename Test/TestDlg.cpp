// TestDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Test.h"
#include "TestDlg.h"
#include "math.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTestDlg dialog

CTestDlg::CTestDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTestDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTestDlg)
	m_str0 = _T("");
	m_str1 = _T("");
	m_str2 = _T("");
	m_str3 = _T("");
	m_str4 = _T("");
	m_str5 = _T("");
	m_str8 = _T("");
	m_str9 = _T("");
	m_strInpName = _T("");
	m_str6 = _T("");
	m_str7 = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

CTestDlg::~CTestDlg()
{
}


void CTestDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTestDlg)
	DDX_Control(pDX, IDS_INPNAME, m_statInpName);
	DDX_Control(pDX, IDC_S9, m_strS9);
	DDX_Control(pDX, IDC_S8, m_strS8);
	DDX_Control(pDX, IDC_S7, m_strS7);
	DDX_Control(pDX, IDC_S6, m_strS6);
	DDX_Control(pDX, IDC_S5, m_strS5);
	DDX_Control(pDX, IDC_S4, m_strS4);
	DDX_Control(pDX, IDC_S3, m_strS3);
	DDX_Control(pDX, IDC_S2, m_strS2);
	DDX_Control(pDX, IDC_S1, m_strS1);
	DDX_Control(pDX, IDC_S0, m_strS0);
	DDX_Control(pDX, IDC_INPNAME, m_butInpName);
	DDX_Text(pDX, IDC_0, m_str0);
	DDX_Text(pDX, IDC_1, m_str1);
	DDX_Text(pDX, IDC_2, m_str2);
	DDX_Text(pDX, IDC_3, m_str3);
	DDX_Text(pDX, IDC_4, m_str4);
	DDX_Text(pDX, IDC_5, m_str5);
	DDX_Text(pDX, IDC_8, m_str8);
	DDX_Text(pDX, IDC_9, m_str9);
	DDX_Control(pDX, IDC_MATRIXCTRL1, m_Matrix);
	DDX_Text(pDX, IDS_INPNAME, m_strInpName);
	DDX_Text(pDX, IDC_6, m_str6);
	DDX_Text(pDX, IDC_7, m_str7);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTestDlg, CDialog)
	//{{AFX_MSG_MAP(CTestDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_INPNAME, OnInpname)
	ON_BN_CLICKED(IDC_PATTERN, OnPattern)
	ON_BN_CLICKED(IDC_CLEAR, OnClear)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestDlg message handlers

BOOL CTestDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_bIsWorking = FALSE;
	m_iFunctionH = 1;//!!!
	m_iFunctionO = 1;//!!!
	m_dBias = 1.0;//!!!
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CTestDlg::OnPaint() 
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
HCURSOR CTestDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CTestDlg::OnInpname() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	CString str('\000',_MAX_PATH);
	CFileDialog fg(FALSE,NULL,(LPCTSTR)str,
		OFN_EXPLORER|OFN_SHOWHELP|OFN_HIDEREADONLY,
		"Pliki tekstowe (*.txt)|*.txt|Wszystkie pliki (*.*)|*.*||");

	if( fg.DoModal() == IDOK )
	{
		m_strInpName = fg.GetPathName();
		UpdateData(FALSE);
		m_statInpName.UpdateWindow();

		FILE *f = fopen((LPCTSTR)m_strInpName, "rt");
		if(!f)
		{
			AfxMessageBox("Nie moge otworzyc pliku z siecia",
				MB_OK|MB_ICONINFORMATION);
		}

		fscanf(f, "%d", &m_iHNo);
		fscanf(f, "%d", &m_iFunctionH);
		fscanf(f, "%d", &m_iFunctionO);
		fscanf(f, "%lf", &m_dBias);

		int i,j;

		for(i=0; i<m_iHNo; ++i)
		{
			for(j=0; j<NIN; ++j)
			{
				fscanf(f, "%lf", &m_Wh[i][j]);
			}
		}

		for(i=0; i<NOUT; ++i)
		{
			for(j=0; j<m_iHNo+1; ++j)
			{
				fscanf(f, "%lf", &m_Wo[i][j]);
			}
		}

		fclose(f);

		m_bIsWorking = TRUE;
	}
}

void CTestDlg::OnPattern() 
{
	// TODO: Add your control notification handler code here
	if(!m_bIsWorking)
	{
		AfxMessageBox("Podaj nazwe pliku opisujacego siec", 
			MB_OK|MB_ICONINFORMATION);
			return;
	}
	m_butInpName.EnableWindow(FALSE);
	//praca
	m_Matrix.GetData((LPUNKNOWN)&points);
//3'
	int i, j;
	for(i=0; i<NIN-1; ++i)
	{
		m_X[i] = (double)points[i];
	}
	m_X[NIN-1] = m_dBias;


//4'
	for(i=0; i<m_iHNo; ++i)
	{
		m_Nh[i] = 0;
		for(j=0; j<NIN; ++j)
		{
			m_Nh[i] += m_Wh[i][j]*m_X[j];
		}
		m_Yhb[i] = fh(m_Nh[i]);
	}
	m_Yhb[m_iHNo] = m_dBias;

//5'
	for(i=0; i<NOUT; ++i)
	{
		m_No[i] = 0;
		for(j=0; j<m_iHNo+1; ++j)
		{
			m_No[i] += m_Wo[i][j]*m_Yhb[j];
		}
		m_Y[i] = fo(m_No[i]);
	}

	char buf[20];
	sprintf(buf, "%f", m_Y[0]);
	m_str0 = buf;
	sprintf(buf, "%f", m_Y[1]);
	m_str1 = buf;
	sprintf(buf, "%f", m_Y[2]);
	m_str2 = buf;
	sprintf(buf, "%f", m_Y[3]);
	m_str3 = buf;
	sprintf(buf, "%f", m_Y[4]);
	m_str4 = buf;
	sprintf(buf, "%f", m_Y[5]);
	m_str5 = buf;
	sprintf(buf, "%f", m_Y[6]);
	m_str6 = buf;
	sprintf(buf, "%f", m_Y[7]);
	m_str7 = buf;
	sprintf(buf, "%f", m_Y[8]);
	m_str8 = buf;
	sprintf(buf, "%f", m_Y[9]);
	m_str9 = buf;
	UpdateData(FALSE);
	OnClear();

	m_butInpName.EnableWindow();
}

void CTestDlg::OnClear() 
{
	// TODO: Add your control notification handler code here
	m_Matrix.Reset();
}

double CTestDlg::fh(double d)
{
	switch(m_iFunctionH)
	{
	case 0:
		return d;
		break;
	case 1:
		return pow(1.0+exp(-d),-1.0);
		break;
	case 2:
		{
			double e1 = exp(d);
			double e2 = exp(-d);

			return (e1-e2)/(e1+e2);
		}
		break;
	}
	return 0;
}

double CTestDlg::fhp(double d)
{
	switch(m_iFunctionH)
	{
	case 0:
		return 1.0;
		break;
	case 1:
		{
			double dd = pow(1.0+exp(-d),-1.0);

			return dd*(1.0-dd);
		}
		break;
	case 2:
		{
			double e1 = exp(d);
			double e2 = exp(-d);
			double dd = (e1-e2)/(e1+e2);

			return (1+dd*(1-dd))/2.0;
		}
		break;
	}
	return 0;
}

double CTestDlg::fo(double d)
{
	switch(m_iFunctionO)
	{
	case 0:
		return d;
		break;
	case 1:
		return pow(1.0+exp(-d),-1.0);
		break;
	case 2:
		{
			double e1 = exp(d);
			double e2 = exp(-d);

			return (e1-e2)/(e1+e2);
		}
		break;
	}
	return 0;
}

double CTestDlg::fop(double d)
{
	switch(m_iFunctionO)
	{
	case 0:
		return 1.0;
		break;
	case 1:
		{
			double dd = pow(1.0+exp(-d),-1.0);

			return dd*(1.0-dd);
		}
		break;
	case 2:
		{
			double e1 = exp(d);
			double e2 = exp(-d);
			double dd = (e1-e2)/(e1+e2);

			return (1+dd*(1-dd))/2.0;
		}
		break;
	}
	return 0;
}
