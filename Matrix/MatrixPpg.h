// MatrixPpg.h : Declaration of the CMatrixPropPage property page class.

////////////////////////////////////////////////////////////////////////////
// CMatrixPropPage : See MatrixPpg.cpp.cpp for implementation.

class CMatrixPropPage : public COlePropertyPage
{
	DECLARE_DYNCREATE(CMatrixPropPage)
	DECLARE_OLECREATE_EX(CMatrixPropPage)

// Constructor
public:
	CMatrixPropPage();

// Dialog Data
	//{{AFX_DATA(CMatrixPropPage)
	enum { IDD = IDD_PROPPAGE_MATRIX };
		// NOTE - ClassWizard will add data members here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Message maps
protected:
	//{{AFX_MSG(CMatrixPropPage)
		// NOTE - ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};
