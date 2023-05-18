
namespace AproshmethodApi
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.open_document = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.label1 = new System.Windows.Forms.Label();
            this.Encrypt_information = new System.Windows.Forms.Button();
            this.Word = new System.Windows.Forms.TextBox();
            this.status = new System.Windows.Forms.Label();
            this.Decryption_information = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.Word8 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // open_document
            // 
            this.open_document.Location = new System.Drawing.Point(15, 62);
            this.open_document.Margin = new System.Windows.Forms.Padding(2);
            this.open_document.Name = "open_document";
            this.open_document.Size = new System.Drawing.Size(134, 46);
            this.open_document.TabIndex = 0;
            this.open_document.Text = "Выбрать файл";
            this.open_document.UseVisualStyleBackColor = true;
            this.open_document.Click += new System.EventHandler(this.button1_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 40);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 13);
            this.label1.TabIndex = 1;
            // 
            // Encrypt_information
            // 
            this.Encrypt_information.Location = new System.Drawing.Point(15, 132);
            this.Encrypt_information.Margin = new System.Windows.Forms.Padding(2);
            this.Encrypt_information.Name = "Encrypt_information";
            this.Encrypt_information.Size = new System.Drawing.Size(134, 46);
            this.Encrypt_information.TabIndex = 2;
            this.Encrypt_information.Text = "Зашифровать";
            this.Encrypt_information.UseVisualStyleBackColor = true;
            this.Encrypt_information.Click += new System.EventHandler(this.Encrypt_information_Click);
            // 
            // Word
            // 
            this.Word.Location = new System.Drawing.Point(261, 62);
            this.Word.Margin = new System.Windows.Forms.Padding(2);
            this.Word.Multiline = true;
            this.Word.Name = "Word";
            this.Word.Size = new System.Drawing.Size(215, 81);
            this.Word.TabIndex = 3;
            // 
            // status
            // 
            this.status.AutoSize = true;
            this.status.Location = new System.Drawing.Point(506, 10);
            this.status.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.status.Name = "status";
            this.status.Size = new System.Drawing.Size(0, 13);
            this.status.TabIndex = 11;
            // 
            // Decryption_information
            // 
            this.Decryption_information.Location = new System.Drawing.Point(15, 200);
            this.Decryption_information.Margin = new System.Windows.Forms.Padding(2);
            this.Decryption_information.Name = "Decryption_information";
            this.Decryption_information.Size = new System.Drawing.Size(134, 47);
            this.Decryption_information.TabIndex = 13;
            this.Decryption_information.Text = "Дешифровать";
            this.Decryption_information.UseVisualStyleBackColor = true;
            this.Decryption_information.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 21);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(77, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Путь к файлу:";
            // 
            // Word8
            // 
            this.Word8.AutoSize = true;
            this.Word8.Location = new System.Drawing.Point(175, 217);
            this.Word8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Word8.Name = "Word8";
            this.Word8.Size = new System.Drawing.Size(0, 13);
            this.Word8.TabIndex = 21;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(28, 316);
            this.label8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(0, 13);
            this.label8.TabIndex = 22;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(226, 316);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(0, 13);
            this.label9.TabIndex = 23;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(189, 62);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(68, 13);
            this.label10.TabIndex = 24;
            this.label10.Text = "Сообщение:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(261, 171);
            this.textBox1.Margin = new System.Windows.Forms.Padding(2);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(215, 76);
            this.textBox1.TabIndex = 28;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(214, 174);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 13);
            this.label2.TabIndex = 24;
            this.label2.Text = "Вывод:";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(500, 276);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.Word8);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.Decryption_information);
            this.Controls.Add(this.status);
            this.Controls.Add(this.Word);
            this.Controls.Add(this.Encrypt_information);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.open_document);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Form1";
            this.Text = "AproshMethodApi";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button open_document;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button Encrypt_information;
        private System.Windows.Forms.TextBox Word;
        private System.Windows.Forms.Label status;
        private System.Windows.Forms.Button Decryption_information;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label Word8;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label2;
    }
}

