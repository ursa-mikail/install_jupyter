# Function to check the command's existence
check_command() {
    command -v "$1" >/dev/null 2>&1
}

# Step 2: Check if pip3 and python3 are correctly installed.
echo "Checking for python3 and pip3 installation..."
if check_command python3 && check_command pip3; then
    echo "python3 and pip3 are installed."
else
    echo "python3 and/or pip3 are not installed. Please install them before running this script."
    exit 1
fi

# Step 3: Upgrade your pip to avoid errors during installation.
echo "Upgrading pip3..."
pip3 install --upgrade pip

# Step 4: Enter the following command to install Jupyter Notebook using pip3.
echo "Installing Jupyter Notebook using pip3..."
pip3 install jupyter

# Method 2: Using setup.py to install Jupyter Notebook
echo "Downloading the latest source package of Jupyter Notebook..."
curl -L https://files.pythonhosted.org/packages/58/f3/af28ea964ab8bc1e472dba2e82627d36d470c51f5cd38c37502eeffaa25e/jupyter-1.1.1.tar.gz -o jupyter.tar.gz

echo "Extracting the jupyter.tar.gz file..."
tar -xzvf jupyter.tar.gz

echo "Installing Jupyter Notebook from the source package..."
cd jupyter-1.1.1
sudo python3 setup.py install

echo "Cleaning up..."
cd ..
rm -rf jupyter-1.1.1 jupyter.tar.gz

echo "Jupyter Notebook installation is complete."

# Output alias to .zshrc
echo "Adding alias to .zshrc..."
echo "alias jupyter_start='jupyter notebook; open -a \"/Applications/Google Chrome.app\" http://localhost:8888/tree'" >> ~/.zshrc
echo "Alias added. Running 'source ~/.zshrc' to reload the configuration ..."
source ~/.zshrc;

echo "Installation and configuration are complete. You can start Jupyter Notebook using the command 'jupyter_start'."

