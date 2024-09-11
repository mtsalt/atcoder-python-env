FROM python:3.10

# Variables for the UID and GID to match the host
# (Typically, regular users start with UID and GID of 1000)
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create a user and group with the same UID and GID as the host
RUN groupadd -g ${GROUP_ID} envgroup \
 && useradd -u ${USER_ID} -g ${GROUP_ID} -m envuser
 
# Switch to the newly created user
USER envuser

# Set the working directory
WORKDIR /home/envuser

# Copy the requirements file
COPY requirements.txt .

# Install atcoder-tools and its dependencies
RUN pip install -r requirements.txt \
 && rm requirements.txt

# Add the path to the user's local bin directory to PATH
# (Newly created users might not have the PATH set correctly)
ENV PATH="/home/envuser/.local/bin:${PATH}"

# Copy additioal configuration files
COPY .atcodertools.toml .
COPY my_template.py .

# Set the working directory for the application
WORKDIR /home/envuser/atcoder-workspace
