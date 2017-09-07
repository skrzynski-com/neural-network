// MatrixPpg.cpp : Implementation of the CMatrixPropPage property page class.

#include "stdafx.h"
#include "Matrix.h"
#include "MatrixPpg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


IMPLEMENT_DYNCREATE(CMatrixPropPage, COlePropertyPage)


/////////////////////////////////////////////////////////////////////////////
// Message map

BEGIN_MESSAGE_MAP(CMatrixPropPage, COlePropertyPage)
	//{{AFX_MSG_MAP(CMatrixPropPage)
	// NOTE - ClassWizard will add and remove message map entries
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// Initialize class factory and guid

IMPLEMENT_OLECREATE_EX(CMatrixPropPage, "MATRIX.MatrixPropPage.1",
	0x2e618094, 0x802a, 0x11d1, 0xb2, 0x7c, 0, 0, 0, 0, 0, 0)


/////////////////////////////////////////////////////////////////////////////
// CMatrixPropPage::CMatrixPropPageFactory::UpdateRegistry -
// Adds or removes system registry entries for CMatrixPropPage

BOOL CMatrixPropPage::CMatrixPropPageFactory::UpdateRegistry(BOOL bRegister)
{
	if (bRegister)
		return AfxOleRegisterPropertyPageClass(AfxGetInstanceHandle(),
			m_clsid, IDS_MATRIX_PPG);
	else
		return AfxOleUnregisterClass(m_clsid, NULL);
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixPropPage::CMatrixPropPage - Constructor

CMatrixPropPage::CMatrixPropPage() :
	COlePropertyPage(IDD, IDS_MATRIX_PPG_CAPTION)
{
	//{{AFX_DATA_INIT(CMatrixPropPage)
	// NOTE: ClassWizard will add member initialization here
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA_INIT
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixPropPage::DoDataExchange - Moves data between page and properties

void CMatrixPropPage::DoDataExchange(CDataExchange* pDX)
{
	//{{AFX_DATA_MAP(CMatrixPropPage)
	// NOTE: ClassWizard will add DDP, DDX, and DDV calls here
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA_MAP
	DDP_PostProcessing(pDX);
}


/////////////////////////////////////////////////////////////////////////////
// CMatrixPropPage message handlers
