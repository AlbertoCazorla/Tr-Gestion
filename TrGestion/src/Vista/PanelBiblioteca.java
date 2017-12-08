package Vista;

import Modelo.*;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionListener;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;
import javax.swing.event.ListSelectionListener;

public class PanelBiblioteca extends JPanel {
    
    public final static String INSERT="INSERT",BORRAR="BORRAR",ACTUALIZAR="ACTUALIZAS",SALIR="SALIR";
    private JButton Binsertar,Bborrar,Bactualizar,Bsalir;
    private JTextField TFtitulo,TFautor;
    private JList<Usuario> libros;
    private DefaultListModel <Usuario>modeloListaLibros;//Cambiar usuario por libros---------
    private JList<Usuario> materias;
    private DefaultListModel <Usuario>modeloListaMaterias;//Cambiar usuario por materias---------
    
    public PanelBiblioteca(){
        
        Binsertar=new JButton("Insertar");
        Bborrar=new JButton("Borrar");
        Bactualizar=new JButton("Actualizar");
        Bsalir=new JButton("Salir");
        TFtitulo=new JTextField(20);
        TFtitulo.setBorder(new TitledBorder("Titulo:"));
        TFautor=new JTextField(20);
        TFautor.setBorder(new TitledBorder("Autor:"));
        
        libros = new JList<Usuario>();
	modeloListaLibros = new DefaultListModel<Usuario>();
	libros.setModel(modeloListaLibros);
        materias = new JList<Usuario>();
	modeloListaMaterias = new DefaultListModel<Usuario>();
	materias.setModel(modeloListaMaterias);
        
        //---------Contruccion de la Ventana-----------
        setLayout(new BorderLayout());
        
        //-----------Paneles de la parte NORTE-------------
        JPanel panelnorte=new JPanel();
        add(panelnorte,BorderLayout.NORTH);
        
        JPanel panelnorteArriba=new JPanel();
        panelnorteArriba.setLayout(new GridLayout(1,1));
        panelnorteArriba.add(new JLabel("Materia"));
        JScrollPane paneldeMaterias = new JScrollPane(materias);
        panelnorteArriba.add(paneldeMaterias);
        panelnorte.add(panelnorteArriba,BorderLayout.NORTH);
        
        
        JScrollPane panelnorteAbajo = new JScrollPane(libros);
        panelnorte.add(panelnorteAbajo,BorderLayout.SOUTH);
        
        //-----------Paneles de la parte SUR-------------
        JPanel panelsur=new JPanel();
        panelsur.setLayout(new BorderLayout());
        add(panelsur,BorderLayout.SOUTH);
        
        JPanel panelsurArriba=new JPanel();
        panelsurArriba.setLayout(new GridLayout(1,1));
        panelsurArriba.add(TFtitulo);
        panelsurArriba.add(TFautor);
        panelsur.add(panelsurArriba,BorderLayout.NORTH);
        
        JPanel panelsurAbajo =new JPanel();
        panelsurArriba.setLayout(new GridLayout(4,1));
        panelsurAbajo.add(Binsertar);
        panelsurAbajo.add(Bborrar);
        panelsurAbajo.add(Bactualizar);
        panelsurAbajo.add(Bsalir);
        panelsur.add(panelsurAbajo,BorderLayout.SOUTH);   
    }
    
    public void controlador(ActionListener ctrl) {
	Binsertar.addActionListener(ctrl);
	Binsertar.setActionCommand(INSERT);
        Bborrar.addActionListener(ctrl);
	Bborrar.setActionCommand(BORRAR);
        Bactualizar.addActionListener(ctrl);
	Bactualizar.setActionCommand(ACTUALIZAR);
        Bsalir.addActionListener(ctrl);
	Bsalir.setActionCommand(SALIR);
    }
    
    public void controladorLista(ListSelectionListener ctrLista){
	libros.addListSelectionListener(ctrLista);
    }
    
    public void MostrarUsuarios(java.util.List<Usuario> lista){
	for(Usuario u: lista){
            modeloListaLibros.addElement(u);
	}
    }

    public void limpiar() {
	modeloListaLibros.clear();
    }
}
