FROM tensorflow/tensorflow:2.12.0-gpu

COPY dot_jupyter /root/.jupyter

RUN pip install --upgrade pip
RUN pip install jupyter notebook jupyter-contrib-nbextensions autopep8
# RUN pip install tqdm matplotlib pandas numpy sklearn
# RUN pip install openai
# RUN pip install pyproj geopandas

RUN jupyter contrib nbextension install --user
