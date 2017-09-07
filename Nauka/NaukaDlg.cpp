// NaukaDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Nauka.h"
#include "NaukaDlg.h"
#include "math.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

double CNaukaDlg::f(double d, BOOL h)
{
	switch(h?m_iFunctionH:m_iFunctionO)
	{
	case 0:
		return d;
		break;
	case 1:
		return pow(1.0+exp(m_dBeta*(-d)),-1.0);
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

double CNaukaDlg::fp(double d, BOOL h)
{
	switch(h?m_iFunctionH:m_iFunctionO)
	{
	case 0:
		return 1.0;
		break;
	case 1:
		{
			double dd = pow(1.0+exp(m_dBeta*(-d)),-1.0);

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


DWORD CNaukaDlg::ThreadProc( LPVOID pParam )
{
    CNaukaDlg* p = (CNaukaDlg*)pParam;

    if (p == NULL ||
        !p->IsKindOf(RUNTIME_CLASS(CDialog)))
    return (DWORD)-1;	// illegal parameter

	while(!p->bEnd)
	{
		while(!p->bEnd)
		{
			WaitForSingleObject( p->m_hEventWork, INFINITE );
			if(p->bEnd)
			{
				break;
			}
			//praca

			WaitForSingleObject(p->m_hEventWeights, INFINITE);

			int i,j;

//3'
			for(i=0; i<NIN-1; ++i)
			{
				p->m_X[i] = p->m_XX[p->m_i][i];
			}
			p->m_X[NIN-1] = p->m_dBias;

			for(i=0; i<NOUT; ++i)
			{
				p->m_Z[i] = i==p->m_i%10?1:0;
			}

//4'
			for(i=0; i<p->m_iHNo; ++i)
			{
				p->m_Nh[i] = 0;
				for(j=0; j<NIN; ++j)
				{
					p->m_Nh[i] += p->m_Wh[i][j]*p->m_X[j];
				}
				p->m_Yhb[i] = p->f(p->m_Nh[i], TRUE);
			}
			p->m_Yhb[p->m_iHNo] = p->m_dBias;

//5'
			for(i=0; i<NOUT; ++i)
			{
				p->m_No[i] = 0;
				for(j=0; j<p->m_iHNo+1; ++j)
				{
					p->m_No[i] += p->m_Wo[i][j]*p->m_Yhb[j];
				}
				p->m_Y[i] = p->f(p->m_No[i], FALSE);
			}

//6'
			p->m_e = 0;
			for(i=0; i<NOUT; ++i)
			{
				p->m_Eo[i] = p->m_Z[i] - p->m_Y[i];
				p->m_e += p->m_Eo[i]*p->m_Eo[i];
			}
			p->m_e /= 2;

			char buf[20];
			sprintf(buf, "%f", p->m_e);
			p->m_strError = buf;
			p->SendMessage(WM_UPDATE_CTRLS, 0, 0);

			if(p->m_e < p->m_dErrange)
			{
				break;
			}

//7'
			double T[HMAX+1];

			for(i=0; i<NOUT; ++i)
			{
				T[i] = p->m_Eo[i] * p->fp(p->m_No[i], FALSE);

			}
			for(i=0; i<NOUT; ++i)
			{
				for(j=0; j<p->m_iHNo+1; ++j)
				{
					p->m_dWo[i][j] = p->m_dLearnO*T[i]*p->m_Yhb[j];
				}
			}

//8'
			for(i=0; i<p->m_iHNo; ++i)
			{
				p->m_Eh[i] = 0;
				for(j=0; j<NOUT; ++j)
				{
					p->m_Eh[i] +=
						p->m_Wo[j][i]*p->m_Eo[j];

				}
				T[i] = p->m_Eh[i] * p->fp(p->m_Nh[i], TRUE);
			}
			for(i=0; i<p->m_iHNo; ++i)
			{
				for(j=0; j<NIN; ++j)
				{
					p->m_dWh[i][j] = 
						p->m_dLearnH*T[i]*p->m_X[j];

				}
			}

//9'
			for(i=0; i<NOUT; ++i)
			{
				for(j=0; j<p->m_iHNo+1; ++j)
				{
					p->m_Wo[i][j] +=
						p->m_dWo[i][j] + p->m_dMomentum*p->m_mWo[i][j];
					p->m_mWo[i][j] = p->m_dWo[i][j];
				}
			}

//10'
			for(i=0; i<p->m_iHNo; ++i)
			{
				for(j=0; j<NIN; ++j)
				{
					p->m_Wh[i][j] +=
						p->m_dWh[i][j] + p->m_dMomentum*p->m_mWh[i][j];
					p->m_mWh[i][j] = p->m_dWh[i][j];
				}
			}

			++p->m_lStep;
			sprintf(buf, "%ld", p->m_lStep);
			p->m_strEpok = buf;
			p->SendMessage(WM_UPDATE_CTRLS, 0, 0);

			p->m_i = (p->m_i+1)%p->m_iNoXX;

			SetEvent(p->m_hEventWeights);
		}
		if(!p->bEnd)
		{
			p->ControlsOn();
			ResetEvent(p->m_hEventWork);

			SetEvent(p->m_hEventWeights);
			p->SetStartText();
			p->m_butStart.SetCheck(0);
		}
	}
	SetEvent( p->m_hEventEnd );
	AfxEndThread(0);
	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CNaukaDlg dialog

CNaukaDlg::CNaukaDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNaukaDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNaukaDlg)
	m_strInpName = _T("");
	m_strOutName = _T("");
	m_iFunctionH = -1;
	m_iFunctionO = -1;
	m_strWeightMaxH = _T("");
	m_strWeightMaxO = _T("");
	m_strWeightMinH = _T("");
	m_strWeightMinO = _T("");
	m_strHNo = _T("");
	m_strLearnH = _T("");
	m_strLearnO = _T("");
	m_strMomentum = _T("");
	m_strBias = _T("");
	m_strErrange = _T("");
	m_strEpok = _T("");
	m_strError = _T("");
	m_strBeta = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);


	m_hEventWork = CreateEvent(NULL, TRUE, FALSE, NULL);
	m_hEventEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
	m_hEventWeights = CreateEvent(NULL, FALSE, TRUE, NULL);

	//watek ma pracowac
	bEnd = FALSE;

	//watek start
	AfxBeginThread((AFX_THREADPROC)ThreadProc, 
			(LPVOID)this);
}

CNaukaDlg::~CNaukaDlg()
{
	//koniec watku roboczego
	bEnd = TRUE;
	SetEvent( m_hEventWork );

	//czekac az watek sie zakonczy
	WaitForSingleObject(m_hEventEnd, INFINITE);

	//zamknac niepotrzebne ob. synchr.
	VERIFY( CloseHandle( m_hEventWork ) );
	VERIFY( CloseHandle( m_hEventEnd ) );
}

void CNaukaDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNaukaDlg)
	DDX_Control(pDX, IDC_BETA, m_edBeta);
	DDX_Control(pDX, IDC_ERRANGE, m_edErrange);
	DDX_Control(pDX, IDC_BIAS, m_cbBias);
	DDX_Control(pDX, IDC_MOMENTUM, m_cbMomentum);
	DDX_Control(pDX, IDC_LEARN_H, m_edLearnH);
	DDX_Control(pDX, IDC_LEARN_O, m_edLearnO);
	DDX_Control(pDX, IDC_WEIGHT_RAN2, m_butWeight2);
	DDX_Control(pDX, IDC_WEIGHT_RAN1, m_butWeight1);
	DDX_Control(pDX, IDC_HNO2, m_butHNo2);
	DDX_Control(pDX, IDC_HNO1, m_butHNo1);
	DDX_Control(pDX, IDC_HNO, m_edHNo);
	DDX_Control(pDX, IDC_WEIGHT_MIN_O, m_edWeightMinO);
	DDX_Control(pDX, IDC_WEIGHT_MIN_H, m_edWeightMinH);
	DDX_Control(pDX, IDC_WEIGHT_MAX_O, m_edWeightMaxO);
	DDX_Control(pDX, IDC_WEIGHT_MAX_H, m_edWeightMaxH);
	DDX_Control(pDX, IDC_FUNCTIONO, m_cbFunctionO);
	DDX_Control(pDX, IDC_FUNCTIONH, m_cbFunctionH);
	DDX_Control(pDX, IDS_OUTPUT_NAME, m_statOutName);
	DDX_Control(pDX, IDS_INPUT_NAME, m_statInpName);
	DDX_Control(pDX, IDB_OUTPUT, m_butOutName);
	DDX_Control(pDX, IDB_INPUT, m_butInpName);
	DDX_Control(pDX, IDC_START, m_butStart);
	DDX_Text(pDX, IDS_INPUT_NAME, m_strInpName);
	DDX_Text(pDX, IDS_OUTPUT_NAME, m_strOutName);
	DDX_CBIndex(pDX, IDC_FUNCTIONH, m_iFunctionH);
	DDX_CBIndex(pDX, IDC_FUNCTIONO, m_iFunctionO);
	DDX_Text(pDX, IDC_WEIGHT_MAX_H, m_strWeightMaxH);
	DDX_Text(pDX, IDC_WEIGHT_MAX_O, m_strWeightMaxO);
	DDX_Text(pDX, IDC_WEIGHT_MIN_H, m_strWeightMinH);
	DDX_Text(pDX, IDC_WEIGHT_MIN_O, m_strWeightMinO);
	DDX_Text(pDX, IDC_HNO, m_strHNo);
	DDX_Text(pDX, IDC_LEARN_H, m_strLearnH);
	DDX_Text(pDX, IDC_LEARN_O, m_strLearnO);
	DDX_CBString(pDX, IDC_MOMENTUM, m_strMomentum);
	DDX_CBString(pDX, IDC_BIAS, m_strBias);
	DDX_Text(pDX, IDC_ERRANGE, m_strErrange);
	DDX_Text(pDX, IDC_EPOK, m_strEpok);
	DDX_Text(pDX, IDC_ERROR, m_strError);
	DDX_Text(pDX, IDC_BETA, m_strBeta);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CNaukaDlg, CDialog)
	//{{AFX_MSG_MAP(CNaukaDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_START, OnStart)
	ON_BN_CLICKED(ID_ABOUT, OnAbout)
	ON_BN_CLICKED(IDB_INPUT, OnInput)
	ON_BN_CLICKED(IDB_OUTPUT, OnOutput)
	ON_BN_CLICKED(IDC_WEIGHT_RAN1, OnWeightRan1)
	ON_BN_CLICKED(IDC_WEIGHT_RAN2, OnWeightRan2)
	ON_BN_CLICKED(IDC_HNO1, OnHno1)
	ON_BN_CLICKED(IDC_HNO2, OnHno2)
	ON_BN_CLICKED(IDC_SAVE, OnSave)
	ON_BN_CLICKED(IDC_SAVEAS, OnSaveas)
	//}}AFX_MSG_MAP
	ON_MESSAGE(WM_UPDATE_CTRLS, OnUpdateCtrls)
END_MESSAGE_MAP()

LRESULT CNaukaDlg::OnUpdateCtrls(WPARAM, LPARAM)
{
	UpdateData(FALSE);
	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CNaukaDlg message handlers

BOOL CNaukaDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	CString strAboutMenu;
	strAboutMenu.LoadString(IDS_ABOUTBOX);
	if (!strAboutMenu.IsEmpty())
	{
		pSysMenu->AppendMenu(MF_SEPARATOR);
		pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_bLos = FALSE;

	m_strBeta = "1";

	m_i = 0;
	m_lStep = 1;

	m_iFunctionH = 1;
	m_iFunctionO = 1;
	
	char buf[20];
	sprintf(buf, "%f", 0.2);
	m_strLearnH = buf;
	m_strLearnO = buf;

	sprintf(buf, "%d", 1);
	m_strBias = buf;

	sprintf(buf, "%f", 0.8);
	m_strMomentum = buf;

	OnHno1();
	OnWeightRan1();

//	UpdateData(FALSE);

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CNaukaDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CNaukaDlg::OnPaint() 
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
HCURSOR CNaukaDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


void CNaukaDlg::SetStartText(BOOL b)
{
	m_butStart.SetWindowText(
		b ? "Start" : "Stop");
}

void CNaukaDlg::OnStart() 
{
	// TODO: Add your control notification handler code here
	if(m_butStart.GetCheck())
	{
		UpdateData();
		if(!m_bLos ||
			AfxMessageBox("Losowac wagi?", 
				MB_YESNO|MB_ICONQUESTION) == IDYES
			)
		{
			Losuj();
		}
		{
			CString in(m_strInpName);
			CString out(m_strOutName);

			in.MakeUpper();
			out.MakeUpper();

			if(in == out)
			{
				AfxMessageBox("Pliki: wzorców i wynikowy musza miec rozne\
 nazwy", MB_OK|MB_ICONINFORMATION);
				m_butStart.SetCheck(0);
				return;
			}
		}

		{
			FILE *f = fopen((LPCTSTR)m_strInpName, "rt");
			if(!f)
			{
				AfxMessageBox("Problem z plikiem wzorcow", MB_OK|MB_ICONINFORMATION);
				m_butStart.SetCheck(0);
				return;
			}
			fscanf(f, "%d", &m_iNoXX);
			m_iNoXX *= 10;
			for(int i=0; i<m_iNoXX*49; ++i)
			{
				fscanf(f, "%d", &m_XX[i/49][i%49]);
			}
			fclose(f);
		}

		m_dLearnH = atof((LPCTSTR)m_strLearnH);
		m_dLearnO = atof((LPCTSTR)m_strLearnO);
		m_iHNo = atoi((LPCTSTR)m_strHNo);
		if(m_iHNo<1 || m_iHNo>HMAX)
		{
			AfxMessageBox("Liczba neronow musi byc w zakresie <1,400>", MB_OK|MB_ICONINFORMATION);//!!!
			m_butStart.SetCheck(0);
			return;
		}
		m_dWeightMinH = atof((LPCTSTR)m_strWeightMinH);
		m_dWeightMinO = atof((LPCTSTR)m_strWeightMinO);
		m_dWeightMaxH = atof((LPCTSTR)m_strWeightMaxH);
		m_dWeightMaxO = atof((LPCTSTR)m_strWeightMaxO);
		m_dErrange = atof((LPCTSTR)m_strErrange);
		if(m_dErrange<=0)
		{
			AfxMessageBox("Blad musi byc wiekszy dodatni", MB_OK|MB_ICONINFORMATION);
			m_butStart.SetCheck(0);
			return;
		}
		m_dMomentum = atof((LPCTSTR)m_strMomentum);
		m_dBias = atof((LPCTSTR)m_strBias);
		m_dBeta = atof((LPCTSTR)m_strBeta);

		m_i = 0;
		m_lStep = 0;

		ControlsOff();
		SetStartText(FALSE);
		SetEvent( m_hEventWork );
	} else {
		ControlsOn();
		SetStartText();
		ResetEvent( m_hEventWork );
	}
}

void CNaukaDlg::OnAbout() 
{
	// TODO: Add your control notification handler code here
	CAboutDlg dlg;

	dlg.DoModal();
}

void CNaukaDlg::OnInput() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	CString str('\000',_MAX_PATH);
	CFileDialog fg(TRUE,NULL,(LPCTSTR)str,
		OFN_EXPLORER|OFN_SHOWHELP|OFN_HIDEREADONLY,
		"Pliki tekstowe (*.txt)|*.txt|Wszystkie pliki (*.*)|*.*||");

	if( fg.DoModal() == IDOK )
	{
		m_strInpName = fg.GetPathName();
		UpdateData(FALSE);
		m_statInpName.UpdateWindow();
	}
}

void CNaukaDlg::OnOutput() 
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
		Load();
	}
}

void CNaukaDlg::OnWeightRan1() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	int h;
	h = atoi(m_strHNo);
	char buf[20];
	if(h>0)
	{
		sprintf(buf, "%f", -2/sqrt(50));
		m_strWeightMinH = buf;

		sprintf(buf, "%f", 2/sqrt(50));
		m_strWeightMaxH = buf;

		sprintf(buf, "%f", -2/sqrt(h));
		m_strWeightMinO = buf;

		sprintf(buf, "%f", 2/sqrt(h));
		m_strWeightMaxO = buf;

		UpdateData(FALSE);
	}
}

void CNaukaDlg::OnWeightRan2() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	int h;
	h = atoi(m_strHNo);
	char buf[20];
	if(h>0)
	{
		sprintf(buf, "%f", -pow(h, ((double)1.0)/50.0));
		m_strWeightMinH = buf;

		sprintf(buf, "%f", pow(h, ((double)1.0)/50.0));
		m_strWeightMaxH = buf;

		sprintf(buf, "%f", -0.5);
		m_strWeightMinO = buf;

		sprintf(buf, "%f", 0.5);
		m_strWeightMaxO = buf;

		UpdateData(FALSE);
	}
}

void CNaukaDlg::ControlsOff()
{
	m_butInpName.EnableWindow(FALSE);
	m_butOutName.EnableWindow(FALSE);
	m_cbFunctionH.EnableWindow(FALSE);
	m_cbFunctionO.EnableWindow(FALSE);
	m_edWeightMaxH.EnableWindow(FALSE);
	m_edWeightMaxO.EnableWindow(FALSE);
	m_edWeightMinH.EnableWindow(FALSE);
	m_edWeightMinO.EnableWindow(FALSE);
	m_edHNo.EnableWindow(FALSE);
	m_butHNo1.EnableWindow(FALSE);
	m_butHNo2.EnableWindow(FALSE);
	m_butWeight1.EnableWindow(FALSE);
	m_butWeight2.EnableWindow(FALSE);
	m_edLearnH.EnableWindow(FALSE);
	m_edLearnO.EnableWindow(FALSE);
	m_cbBias.EnableWindow(FALSE);
	m_cbMomentum.EnableWindow(FALSE);
	m_edErrange.EnableWindow(FALSE);
	m_edBeta.EnableWindow(FALSE);
//	m_butRWeights.EnableWindow(FALSE);
}

void CNaukaDlg::ControlsOn()
{
	m_butInpName.EnableWindow();
	m_butOutName.EnableWindow();
	m_cbFunctionH.EnableWindow();
	m_cbFunctionO.EnableWindow();
	m_edWeightMaxH.EnableWindow();
	m_edWeightMaxO.EnableWindow();
	m_edWeightMinH.EnableWindow();
	m_edWeightMinO.EnableWindow();
	m_edHNo.EnableWindow();
	m_butHNo1.EnableWindow();
	m_butHNo2.EnableWindow();
	m_butWeight1.EnableWindow();
	m_butWeight2.EnableWindow();
	m_edLearnH.EnableWindow();
	m_edLearnO.EnableWindow();
	m_cbBias.EnableWindow();
	m_cbMomentum.EnableWindow();
	m_edErrange.EnableWindow();
	m_edBeta.EnableWindow();
//	m_butRWeights.EnableWindow();
}


void CNaukaDlg::OnHno1() 
{
	// TODO: Add your control notification handler code here
	char buf[20];

	sprintf(buf, "%d", 30);
	m_strHNo = buf;
	UpdateData(FALSE);
}

void CNaukaDlg::OnHno2() 
{
	// TODO: Add your control notification handler code here
	char buf[20];

	sprintf(buf, "%d", (int)sqrt(500));
	m_strHNo = buf;
	UpdateData(FALSE);
}

void CNaukaDlg::Load()
{
	FILE *f = fopen((LPCTSTR)m_strOutName, "rt");
	if(!f)
	{
		AfxMessageBox("Problem z odczytem", MB_OK|MB_ICONINFORMATION);
		m_bLos = FALSE;
	} else {
		fscanf(f, "%d\n", &m_iHNo);
		fscanf(f, "%d\n", &m_iFunctionH);
		fscanf(f, "%d\n", &m_iFunctionO);
		fscanf(f, "%lf\n", &m_dBias);

		m_strBias.Format( "%lf", m_dBias);

		int i,j;

		for(i=0; i<m_iHNo; ++i)
		{
			for(j=0; j<NIN; ++j)
			{
				fscanf(f, "%lf\n", &m_Wh[i][j]);
			}
		}

		for(i=0; i<NOUT; ++i)
		{
			for(j=0; j<m_iHNo+1; ++j)
			{
				fscanf(f, "%lf\n", &m_Wo[i][j]);
			}
		}

		fclose(f);
		UpdateData(FALSE);
		m_bLos = TRUE;
	}
}

void CNaukaDlg::Save()
{
	WaitForSingleObject(m_hEventWeights, INFINITE);
	FILE *f = fopen((LPCTSTR)m_strOutName, "wt");
	if(!f)
	{
		AfxMessageBox("Problem z zapisem", MB_OK|MB_ICONINFORMATION);
	} else {
		fprintf(f, "%d\n", m_iHNo);
		fprintf(f, "%d\n", m_iFunctionH);
		fprintf(f, "%d\n", m_iFunctionO);
		fprintf(f, "%lf\n", m_dBias);

		int i,j;

		for(i=0; i<m_iHNo; ++i)
		{
			for(j=0; j<NIN; ++j)
			{
				fprintf(f, "%lf\n", m_Wh[i][j]);
			}
		}

		for(i=0; i<NOUT; ++i)
		{
			for(j=0; j<m_iHNo+1; ++j)
			{
				fprintf(f, "%lf\n", m_Wo[i][j]);
			}
		}

		fclose(f);
	}

	SetEvent(m_hEventWeights);
}

void CNaukaDlg::OnSave() 
{
	// TODO: Add your control notification handler code here
	if(m_strOutName.IsEmpty())
	{
		OnSaveas();
	}
		{
			CString in(m_strInpName);
			CString out(m_strOutName);

			in.MakeUpper();
			out.MakeUpper();

			if(in == out)
			{
				AfxMessageBox("Pliki: wzorców i wynikowy musza miec rozne\
 nazwy", MB_OK|MB_ICONINFORMATION);
				return;
			}
		}
	Save();
}

void CNaukaDlg::OnSaveas() 
{
	// TODO: Add your control notification handler code here
	OnOutput();	
		{
			CString in(m_strInpName);
			CString out(m_strOutName);

			in.MakeUpper();
			out.MakeUpper();

			if(in == out)
			{
				AfxMessageBox("Pliki: wzorców i wynikowy musza miec rozne\
 nazwy", MB_OK|MB_ICONINFORMATION);
				return;
			}
		}
	Save();
}

void CNaukaDlg::Losuj() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	m_dWeightMinH = atof((LPCTSTR)m_strWeightMinH);
	m_dWeightMinO = atof((LPCTSTR)m_strWeightMinO);
	m_dWeightMaxH = atof((LPCTSTR)m_strWeightMaxH);
	m_dWeightMaxO = atof((LPCTSTR)m_strWeightMaxO);
	m_iHNo = atoi((LPCTSTR)m_strHNo);

	int i,j;
	for(i=0; i<m_iHNo; ++i)
	{
		for(j=0; j<NIN; ++j)
		{
			m_Wh[i][j] = ( rand()*
				fabs(m_dWeightMaxH 
				- m_dWeightMinH) )
				/RAND_MAX
				+(m_dWeightMinH<m_dWeightMaxH?
				m_dWeightMinH:m_dWeightMaxH);
			m_mWh[i][j] = 0;
		}
	}

	for(i=0; i<NOUT; ++i)
	{
		for(j=0; j<m_iHNo+1; ++j)
		{
			m_Wo[i][j] = ( rand()*
				fabs(m_dWeightMaxO 
				- m_dWeightMinO) )
				/RAND_MAX
				+(m_dWeightMinO<m_dWeightMaxO?
				m_dWeightMinO:m_dWeightMaxO);
			m_mWo[i][j] = 0;
		}
	}

	m_bLos = TRUE;
}
