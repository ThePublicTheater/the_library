using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.NodeFactory;



public partial class usercontrols_SlideshowDemo : System.Web.UI.UserControl
{

    private string _slideShowID;

    public string firstImage = "";
    public string firstText = "";


    public string slideShowID
    {
        get
        {
            return this._slideShowID;
        }
        set
        {
            this._slideShowID = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        GetSlideshowData();
    }

    public void GetSlideshowData()
    {
        int ID = Convert.ToInt32(slideShowID);
        Node parent = new Node(ID);

        ArrayList repeaterData = new ArrayList();

        Nodes children = parent.Children;

        for (int i = 0; i < children.Count; i++)
        {

           
            string image = children[i].GetProperty("image").Value.ToString();
            string text = children[i].GetProperty("slideshowText").Value.ToString();

            if (i == 0)
            {
                firstImage = image;
                firstText = text;
            }

            repeaterData.Add(new SlideShowItem(image, text));

        }

        Slideshow.DataSource = repeaterData;
        Slideshow.DataBind();

    }

    public class SlideShowItem
    {
        private string _image;
        private string _text;

        public SlideShowItem(string image, string text)
        {
            this._image = image;
            this._text = text;
        }

        public string image
        {
            get
            {
                return this._image;
            }
            set
            {
                this._image = value;
            }
        }

        public string text
        {
            get
            {
                return this._text;
            }
            set
            {
                this._text = value;
            }
        }

    }
}