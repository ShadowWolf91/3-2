using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Spire.Doc;
using Spire.Doc.Collections;
using Spire.Doc.Documents;
using Spire.Doc.Fields;

namespace AproshmethodApi
{
    public partial class Form1 : Form
    {

        string filepath_document = "";
        string path_document = "";
        string encrypt_word = "";
        float space_for_0 = 0.1f;
        float space_for_1 = -0.1f;
        Random random = new Random();

        public Form1()
        {

            InitializeComponent();
            openFileDialog1.Filter = "Word Documents(*.doc, *.docx, *.docm, *.dot, *.dotm, *.dotx)|*.doc;*.docx;*.docm;*.dot;*.dotm;*.dotx;" +
                "|Text files(*.txt)|*.txt" +
                "|XML files(*.xml)|*.xml" +
                "|All files(*.*)|*.*";
            saveFileDialog1.Filter = "Word Documents(*.docx)|*.docx;" +
                "|All files(*.*)|*.*";
        }



        private void button1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                filepath_document = openFileDialog1.FileName;
                label1.Text = Path.GetFullPath(filepath_document);
                path_document = Path.GetFullPath(filepath_document);
                MessageBox.Show("Файл выбран!");
            }

        }

        static string ConvertMessToByte(string text)
        {
            string bitMessage = "";
            string Message = "";
            for (int i = 0; i < text.Length; i++)
            {
                if (text[i] != ' ')
                {
                    Message += text[i];
                }
                else
                {
                    var a = Convert.ToString(Convert.ToInt32(Message), 2);
                    Message = "";
                    foreach (var ch in a) { bitMessage += ch; }
                    bitMessage += " ";
                }
            }
            return bitMessage;
        }

        static string ConvertToASCII(string text)
        {
            string messageInASCII = "";
            foreach (char ch in text)
            {
                messageInASCII += Convert.ToInt32(ch).ToString() + " ";
            }
            return messageInASCII;
        }


        static string ConvertBiteToMessage(string text)
        {
            string messageDescript = "";
            string biteMessage = "";

            for (int i = 0; i < text.Length; i++)
            {
                if (text[i] != ' ')
                {
                    messageDescript += text[i];
                }
                else
                {
                    var bytes = messageDescript.Split(' ').Select(x => Convert.ToByte(x, 2)).ToArray();
                    biteMessage += Encoding.ASCII.GetString(bytes);
                    messageDescript = "";
                }
            }
            return biteMessage;

        }


        private void Encrypt_information_Click(object sender, EventArgs e)
        {
            //textBox1.Text = ConvertMessToByte(ConvertToASCII(Word.Text));
            Document document = new Document();
            if (path_document != "")
            {
                document.LoadFromFile(path_document);
                string text = document.GetText();
                if (Word.Text != "")
                {
                    encrypt_word = ConvertMessToByte(ConvertToASCII(Word.Text));
                    //   label8.Text = ConvertToASCII(Word.Text);
                    //  label9.Text = ConvertMessToByte(ConvertToASCII(Word.Text));

                    Document doc = new Document();
                    Paragraph paragraph1 = doc.AddSection().AddParagraph();
                    paragraph1.AppendText(text);

                    int part = text.Length / encrypt_word.Length;
                    if (part > 1)
                    {
                        TextRange textRange = new TextRange(doc);
                        if (space_for_1 != 0 && space_for_0 != 0)
                        {
                            if (space_for_0 != space_for_1)
                            {
                                for (int i = 0; i < encrypt_word.Length; i++)
                                {
                                    var randPositin = random.Next(part * i + 1, part * (i + 1));
                                    TextSelection selections = new TextSelection(paragraph1, randPositin, randPositin + 1);
                                    textRange = selections.GetAsOneRange();

                                    if (encrypt_word[i] == '1')
                                    {
                                        textRange.CharacterFormat.CharacterSpacing = space_for_1;
                                        textRange.CharacterFormat.TextColor = Color.Blue;
                                    }
                                    if (encrypt_word[i] == '0')
                                    {
                                        textRange.CharacterFormat.CharacterSpacing = space_for_0;
                                        textRange.CharacterFormat.TextColor = Color.Red;

                                    }
                                    if (encrypt_word[i] == ' ')
                                    {
                                        textRange.CharacterFormat.CharacterSpacing = 0.05f;
                                        textRange.CharacterFormat.Bold = true;
                                    }

                                }
                                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                                {
                                    string filename = saveFileDialog1.FileName;
                                    var filepath_document_1 = Path.GetFullPath(filename);
                                    doc.SaveToFile(filepath_document_1, FileFormat.Docx);
                                    MessageBox.Show("Файл успешно сохранен");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Отступы не должны быть равны");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Выберите отсутпы для 0 и 1");
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Введите сообщение!");
                }
            }
            else
            {
                MessageBox.Show("Выберите файл!");
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            string decryptionMessage = "";
            Document document = new Document();
            if (filepath_document != "")
            {
                document.LoadFromFile(filepath_document);
                ParagraphCollection paragraph = document.Sections[0].Paragraphs;
                foreach (Paragraph par in paragraph)
                {
                    foreach (DocumentObject docObj in par.ChildObjects)
                    {
                        if (docObj is TextRange)
                        {

                            TextRange textRange = docObj as TextRange;
                            if (textRange.CharacterFormat.CharacterSpacing == space_for_1)
                            {
                                decryptionMessage += '1';
                            }
                            if (textRange.CharacterFormat.CharacterSpacing == space_for_0)
                            {
                                decryptionMessage += '0';
                            }
                            if (textRange.CharacterFormat.CharacterSpacing == 0.05f)
                            {
                                decryptionMessage += ' ';
                            }
                        }
                    }
                }
                textBox1.Text = "Извлечённая информации: " + ConvertBiteToMessage(decryptionMessage);
            }
            else
            {
                MessageBox.Show("Файл не найден!");
            }
        }
    }
}
