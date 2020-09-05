#Libraries
import streamlit as st
import numpy as np
import pandas as pd
import time
from PIL import Image
#Importing code to calculate distance
from Calc_Dist import PlayIt

#Loading Dataframe to calculate distance
dataframe = pd.read_csv('dummy_ign.csv',sep='|')

#Creating Dict structure of user's choice
def Get_Results(platform,theme1,theme2,old,critic):
    user_dict = {'title':["User's choice"], 'release_date':[None],'score':[None], 'score_phrase':[None],'editors_choice':[None],
                'genre':[None],'url':[None],'old_game':[0], 'critic_high_score':[0],'Sony':[0],'Microsoft':[0],'Nintendo':[0],
                'Portable':[0],'Old_Consoles':[0],'Mobile':[0],'PC':[0],'Others_Plat':[0],'Playstation_4':[0],'Xbox_One':[0],
                'Wii_U':[0],'Action':[0],'Adult':[0],'Adventure':[0],'Baseball':[0],'Battle':[0],'Board':[0],'Card':[0],
                'Casino':[0],'Compilation':[0],'Editor':[0],'Educational':[0],'Episodic':[0],'Fighting':[0],'First-Person':[0],
                'Flight':[0],'Golf':[0],'Hardware':[0],'Hunting':[0],'Music':[0],'Other':[0],'Party':[0],'Pet':[0],'Pinball':[0],
                'Platformer':[0],'Productivity':[0],'Puzzle':[0],'RPG':[0],'Racing':[0],'Shooter':[0],'Simulation':[0],'Sports':[0],
                'Strategy':[0],'Trivia':[0],'Virtual':[0],'Word':[0],'Wrestling':[0]}

    if old == 'Hell Yeah':
        user_dict['old_game'] = [1]
    else:
        pass  

    if critic == 'Yes, milord':
        user_dict['critic_high_score'] = [1] 
    else:
        pass
    
    for key,value in user_dict.items():
        if key == theme1 or key == theme2 or key == platform:
            user_dict[key] = [1]
        else:
            pass
    return user_dict


#Function to gather user inputs and calculate the distance
def Calc_Dist():
    user_choice = Get_Results(platform_selectbox,themes1_selectbox,themes2_selectbox,old_selectbox,critic_selectbox)
    calc = PlayIt(dataframe,user_choice,metric=metric_selectbox, n_results=number_results)
    return st.dataframe(calc.play_it())

st.title('What I Should Play?')
@st.cache()
def load_image(): 
    return Image.open('./Layout/back.jpg')

st.image(load_image(), caption="<a href='https://br.freepik.com/fotos-vetores-gratis/amor'> criado por gstudioimagen - br.freepik.com</a>", use_column_width=True)

#Initilizing Class to load Select Fields
play = PlayIt()

#Name of the sidebar
st.sidebar.title('Choose your weapons')

#Select Box of Platform in the sidebar
platform_selectbox = st.sidebar.selectbox(
    "Choose one Console or Fabricant.",
    (play.platforms)
)

#Select Box of Theme 1 in the sidebar
themes1_selectbox = st.sidebar.selectbox(
    "And what about the genres, which do you like the most?",
    (play.themes)
)

#Select Box of Theme 2 in the sidebar
themes2_selectbox = st.sidebar.selectbox(
    "Choose another on the house, if you want of course",
    (play.themes),index=2
)

#Select Box of Old in the sidebar
old_selectbox = st.sidebar.selectbox(
    "Would you like this game be an old one? We consider everything before 2k old... Milennials ¯\_(ツ)_/¯",
    ('Hell Yeah', 'Nops' )
)

#Select Box of Critic Score in the sidebar
critic_selectbox = st.sidebar.selectbox(
    "Does specialized critic matter to you?",
    ('Yes, milord', 'Hate this guys' )
)

#Select Box of Metric in the sidebar
metric_selectbox = st.sidebar.selectbox(
    "What kind of metric do you want to use?",
    ('cityblock','correlation', 'cosine', 'dice', 'euclidean'),index=4
)


#Input of the number of results the user
number_results = st.sidebar.number_input('How many results do you want to see?',min_value=10,max_value=60,value=20)

#number_results = st.sidebar.slider('How many results do you want to see?',min_value=10,max_value=60,value=20)


#Button to run the distance calculation
apply_button = st.sidebar.button('Play It')
if apply_button:
    Calc_Dist()
else:
    pass
    