wino test
===============

.. code:: ipython3

    # make a plot
    from pylab import *
    from matplotlib.patches import Ellipse

    delta = 45.0 # degrees

    angles = arange(0, 360+delta, delta)
    ells = [Ellipse((1, 1), 4, 2, a) for a in angles]

    a = subplot(111, aspect='equal')

    for e in ells:
        e.set_clip_box(a.bbox)
        e.set_alpha(0.1)
        a.add_artist(e)

    xlim(-2, 4)
    ylim(-1, 3)

    show()



.. image:: output_0_0.png


.. code:: ipython3

    import pandas as pd
    pd.set_option('display.max_colwidth', None)
    from utils import *

.. code:: ipython3

    df = pd.read_csv("reunion10.csv",sep=";")

.. code:: ipython3

    df = df.iloc[:,1:]

.. code:: ipython3

    df.head()




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>id_schema</th>
          <th>masked</th>
          <th>options</th>
          <th>answer</th>
          <th>response1</th>
          <th>prob1</th>
          <th>response2</th>
          <th>prob2</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>0</th>
          <td>1</td>
          <td>La coupe n'entre pas dans la valise marron, car la &lt;mask&gt; est trop grande.</td>
          <td>coupe valise</td>
          <td>coupe</td>
          <td>valise</td>
          <td>0.073809</td>
          <td>coupe</td>
          <td>0.029513</td>
        </tr>
        <tr>
          <th>1</th>
          <td>1</td>
          <td>La coupe n'entre pas dans la valise marron, car la &lt;mask&gt; est trop petite.</td>
          <td>coupe valise</td>
          <td>valise</td>
          <td>valise</td>
          <td>0.057826</td>
          <td>coupe</td>
          <td>0.039332</td>
        </tr>
        <tr>
          <th>2</th>
          <td>2</td>
          <td>Paul a essayé de joindre Georges sur son téléphone, mais &lt;mask&gt; n'a pas réussi.</td>
          <td>Paul Georges</td>
          <td>Paul</td>
          <td>Paul</td>
          <td>0.006893</td>
          <td>Georges</td>
          <td>0.003115</td>
        </tr>
        <tr>
          <th>3</th>
          <td>2</td>
          <td>Paul a essayé de joindre Georges sur son téléphone, mais &lt;mask&gt; n'a pas répondu.</td>
          <td>Paul Georges</td>
          <td>Georges</td>
          <td>Georges</td>
          <td>0.355219</td>
          <td>Paul</td>
          <td>0.015403</td>
        </tr>
        <tr>
          <th>4</th>
          <td>3</td>
          <td>L'avocat a posé une question au témoin, mais l'&lt;mask&gt; a refusé de la répéter.</td>
          <td>avocat témoin</td>
          <td>avocat</td>
          <td>avocat</td>
          <td>0.512168</td>
          <td>témoin</td>
          <td>0.000918</td>
        </tr>
      </tbody>
    </table>
    </div>



.. code:: ipython3

    # right ones
    df.loc[df['answer'] == df['response1']]




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>id_schema</th>
          <th>masked</th>
          <th>options</th>
          <th>answer</th>
          <th>response1</th>
          <th>prob1</th>
          <th>response2</th>
          <th>prob2</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>1</th>
          <td>1</td>
          <td>La coupe n'entre pas dans la valise marron, ca...</td>
          <td>coupe valise</td>
          <td>valise</td>
          <td>valise</td>
          <td>0.057826</td>
          <td>coupe</td>
          <td>0.039332</td>
        </tr>
        <tr>
          <th>2</th>
          <td>2</td>
          <td>Paul a essayé de joindre Georges sur son télép...</td>
          <td>Paul Georges</td>
          <td>Paul</td>
          <td>Paul</td>
          <td>0.006893</td>
          <td>Georges</td>
          <td>0.003115</td>
        </tr>
        <tr>
          <th>3</th>
          <td>2</td>
          <td>Paul a essayé de joindre Georges sur son télép...</td>
          <td>Paul Georges</td>
          <td>Georges</td>
          <td>Georges</td>
          <td>0.355219</td>
          <td>Paul</td>
          <td>0.015403</td>
        </tr>
        <tr>
          <th>4</th>
          <td>3</td>
          <td>L'avocat a posé une question au témoin, mais l...</td>
          <td>avocat témoin</td>
          <td>avocat</td>
          <td>avocat</td>
          <td>0.512168</td>
          <td>témoin</td>
          <td>0.000918</td>
        </tr>
        <tr>
          <th>5</th>
          <td>3</td>
          <td>L'avocat a posé une question au témoin, mais l...</td>
          <td>avocat témoin</td>
          <td>témoin</td>
          <td>témoin</td>
          <td>0.202304</td>
          <td>avocat</td>
          <td>0.001174</td>
        </tr>
        <tr>
          <th>...</th>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
        </tr>
        <tr>
          <th>205</th>
          <td>106</td>
          <td>Samuel et Amélie sont passionnément amoureux m...</td>
          <td>Samuel parents</td>
          <td>parents</td>
          <td>parents</td>
          <td>0.985915</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>209</th>
          <td>108</td>
          <td>Gabrielle est contente d'avoir échangé son pul...</td>
          <td>pull gilet</td>
          <td>gilet</td>
          <td>gilet</td>
          <td>0.028197</td>
          <td>pull</td>
          <td>0.007661</td>
        </tr>
        <tr>
          <th>211</th>
          <td>28</td>
          <td>Regarde! Il y a un requin qui nage juste en de...</td>
          <td>têtard canard</td>
          <td>canard</td>
          <td>canard</td>
          <td>0.032424</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>212</th>
          <td>57</td>
          <td>J'ai lâché une aile de papillon sur la table e...</td>
          <td>aile table</td>
          <td>aile</td>
          <td>aile</td>
          <td>0.002834</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>213</th>
          <td>57</td>
          <td>J'ai lâché une encyclopédie sur la table et la...</td>
          <td>aile table</td>
          <td>table</td>
          <td>table</td>
          <td>0.614531</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
      </tbody>
    </table>
    <p>131 rows × 8 columns</p>
    </div>



.. code:: ipython3

    # get correspondance
    df.loc[df['answer'] == df['response1']].loc[df['id_schema']==12]




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>id_schema</th>
          <th>masked</th>
          <th>options</th>
          <th>answer</th>
          <th>response1</th>
          <th>prob1</th>
          <th>response2</th>
          <th>prob2</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>22</th>
          <td>12</td>
          <td>Joël a vendu sa maison et en a acheté une nouv...</td>
          <td>ancienne nouvelle</td>
          <td>ancienne</td>
          <td>ancienne</td>
          <td>0.976027</td>
          <td>nouvelle</td>
          <td>0.000220</td>
        </tr>
        <tr>
          <th>23</th>
          <td>12</td>
          <td>Joël a vendu sa maison et en a acheté une nouv...</td>
          <td>ancienne nouvelle</td>
          <td>nouvelle</td>
          <td>nouvelle</td>
          <td>0.926526</td>
          <td>ancienne</td>
          <td>0.000112</td>
        </tr>
      </tbody>
    </table>
    </div>



.. code:: ipython3

    asso = [12, 13, 17, 19, 30, 31, 32, 33, 67, 71, 79, 83, 102, 104, 106]
    df_asso = df.loc[df['answer'] == df['response1']].loc[df['id_schema'].isin(asso)]

.. code:: ipython3

    temp = df_asso.filter(items=["id_schema","masked","options","answer"])

.. code:: ipython3

    # for i,row in temp.iterrows():
    #     row["masked"] = row["masked"].replace("<mask>",row["answer"])

.. code:: ipython3

    temp




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>id_schema</th>
          <th>masked</th>
          <th>answer</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>22</th>
          <td>12</td>
          <td>Joël a vendu sa maison et en a acheté une nouv...</td>
          <td>ancienne</td>
        </tr>
        <tr>
          <th>23</th>
          <td>12</td>
          <td>Joël a vendu sa maison et en a acheté une nouv...</td>
          <td>nouvelle</td>
        </tr>
        <tr>
          <th>24</th>
          <td>13</td>
          <td>Les gens qui commencent à lire les livres de P...</td>
          <td>gens</td>
        </tr>
        <tr>
          <th>25</th>
          <td>13</td>
          <td>Les gens qui commencent à lire les livres de P...</td>
          <td>livres</td>
        </tr>
        <tr>
          <th>32</th>
          <td>17</td>
          <td>Le chemin pour aller au lac était bloqué, donc...</td>
          <td>chemin</td>
        </tr>
        <tr>
          <th>33</th>
          <td>17</td>
          <td>Le chemin pour aller au lac était bloqué, donc...</td>
          <td>lac</td>
        </tr>
        <tr>
          <th>36</th>
          <td>19</td>
          <td>Fred et Alice ont des manteaux très chauds, ma...</td>
          <td>Fred</td>
        </tr>
        <tr>
          <th>56</th>
          <td>30</td>
          <td>Les archéologues ont découvert que des hommes ...</td>
          <td>archéologues</td>
        </tr>
        <tr>
          <th>57</th>
          <td>30</td>
          <td>Les archéologues ont découvert que des hommes ...</td>
          <td>hommes</td>
        </tr>
        <tr>
          <th>58</th>
          <td>31</td>
          <td>La police a arrêté tous les membres d'un gang....</td>
          <td>police</td>
        </tr>
        <tr>
          <th>59</th>
          <td>31</td>
          <td>La police a arrêté tous les membres d'un gang....</td>
          <td>gang</td>
        </tr>
        <tr>
          <th>60</th>
          <td>32</td>
          <td>J'ai mis le gâteau dans le frigo. Il y a beauc...</td>
          <td>gâteau</td>
        </tr>
        <tr>
          <th>61</th>
          <td>32</td>
          <td>J'ai mis le gâteau dans le frigo. Il y a beauc...</td>
          <td>frigo</td>
        </tr>
        <tr>
          <th>129</th>
          <td>67</td>
          <td>Le rendez-vous n'a commencé qu'à 16:00 et mon ...</td>
          <td>train</td>
        </tr>
        <tr>
          <th>137</th>
          <td>71</td>
          <td>Je n'ai pas pu mettre la carafe sur l'étagère,...</td>
          <td>étagère</td>
        </tr>
        <tr>
          <th>152</th>
          <td>79</td>
          <td>Marie a pris son violon pour jouer un de ses m...</td>
          <td>violon</td>
        </tr>
        <tr>
          <th>158</th>
          <td>83</td>
          <td>Les scientifiques étudient trois espèces de po...</td>
          <td>scientifiques</td>
        </tr>
        <tr>
          <th>159</th>
          <td>83</td>
          <td>Les scientifiques étudient trois espèces de po...</td>
          <td>poissons</td>
        </tr>
        <tr>
          <th>196</th>
          <td>102</td>
          <td>Je suis sûre que ce monument est dans mon guid...</td>
          <td>monument</td>
        </tr>
        <tr>
          <th>197</th>
          <td>102</td>
          <td>Je suis sûre que ce monument est dans mon guid...</td>
          <td>guide</td>
        </tr>
        <tr>
          <th>200</th>
          <td>104</td>
          <td>J'ai mis la clé dans la serrure, mais elle éta...</td>
          <td>clé</td>
        </tr>
        <tr>
          <th>201</th>
          <td>104</td>
          <td>J'ai mis la clé dans la serrure, mais elle éta...</td>
          <td>serrure</td>
        </tr>
        <tr>
          <th>204</th>
          <td>106</td>
          <td>Samuel et Amélie sont passionnément amoureux m...</td>
          <td>Samuel</td>
        </tr>
        <tr>
          <th>205</th>
          <td>106</td>
          <td>Samuel et Amélie sont passionnément amoureux m...</td>
          <td>parents</td>
        </tr>
      </tbody>
    </table>
    </div>



.. code:: ipython3

    temp.to_json(orient='records')




.. parsed-literal::

    '[{"id_schema":12,"masked":"Jo\\u00ebl a vendu sa maison et en a achet\\u00e9 une nouvelle \\u00e0 quelques kilom\\u00e8tres. Il va d\\u00e9m\\u00e9nager ce jeudi de son <mask> maison","answer":"ancienne"},{"id_schema":12,"masked":"Jo\\u00ebl a vendu sa maison et en a achet\\u00e9 une nouvelle \\u00e0 quelques kilom\\u00e8tres. Il va emm\\u00e9nager ce jeudi dans sa <mask> maison","answer":"nouvelle"},{"id_schema":13,"masked":"Les gens qui commencent \\u00e0 lire les livres de Paul ne peuvent plus les l\\u00e2cher. Les <mask> sont enthousiastes car Paul \\u00e9crit vraiment bien.","answer":"gens"},{"id_schema":13,"masked":"Les gens qui commencent \\u00e0 lire les livres de Paul ne peuvent plus les l\\u00e2cher. Les <mask> de Paul sont populaires car Paul \\u00e9crit vraiment bien.","answer":"livres"},{"id_schema":17,"masked":"Le chemin pour aller au lac \\u00e9tait bloqu\\u00e9, donc on n\'a pas pu emprunter le <mask>.","answer":"chemin"},{"id_schema":17,"masked":"Le chemin pour aller au lac \\u00e9tait bloqu\\u00e9, donc on n\'a pas pu atteindre le <mask>.","answer":"lac"},{"id_schema":19,"masked":"Fred et Alice ont des manteaux tr\\u00e8s chauds, mais <mask> et Alice ne sont pas pr\\u00e9par\\u00e9s pour l\'hiver en Alaska.","answer":"Fred"},{"id_schema":30,"masked":"Les arch\\u00e9ologues ont d\\u00e9couvert que des hommes pr\\u00e9historiques vivaient \\u00e0 Laputa il y a 20 000 ans. Les <mask> cherchaient des indices sur les berges de la rivi\\u00e8re.","answer":"arch\\u00e9ologues"},{"id_schema":30,"masked":"Les arch\\u00e9ologues ont d\\u00e9couvert que des hommes pr\\u00e9historiques vivaient \\u00e0 Laputa il y a 20 000 ans. Les <mask> pr\\u00e9historiques cherchaient du gibier sur les berges de la rivi\\u00e8re.","answer":"hommes"},{"id_schema":31,"masked":"La police a arr\\u00eat\\u00e9 tous les membres d\'un gang. La <mask> essayait de stopper un trafic de drogue dans le quartier.","answer":"police"},{"id_schema":31,"masked":"La police a arr\\u00eat\\u00e9 tous les membres d\'un gang. Le <mask> essayait d\'organiser un trafic de drogue dans le quartier.","answer":"gang"},{"id_schema":32,"masked":"J\'ai mis le g\\u00e2teau dans le frigo. Il y a beaucoup de sucre dans le <mask>.","answer":"g\\u00e2teau"},{"id_schema":32,"masked":"J\'ai mis le g\\u00e2teau dans le frigo. Il y a beaucoup de restes dans le <mask>.","answer":"frigo"},{"id_schema":67,"masked":"Le rendez-vous n\'a commenc\\u00e9 qu\'\\u00e0 16:00 et mon train \\u00e9tait \\u00e0 16:30 donc j\'\\u00e9tais press\\u00e9. Heureusement, le <mask> a \\u00e9t\\u00e9 retard\\u00e9.","answer":"train"},{"id_schema":71,"masked":"Je n\'ai pas pu mettre la carafe sur l\'\\u00e9tag\\u00e8re, parce que l\'<mask> \\u00e9tait trop haute.","answer":"\\u00e9tag\\u00e8re"},{"id_schema":79,"masked":"Marie a pris son violon pour jouer un de ses morceaux favoris. Elle poss\\u00e8de le <mask> depuis son enfance.","answer":"violon"},{"id_schema":83,"masked":"Les scientifiques \\u00e9tudient trois esp\\u00e8ces de poissons trouv\\u00e9es r\\u00e9cemment dans l\'oc\\u00e9an indien. Les <mask> ont commenc\\u00e9 il y a deux ans.","answer":"scientifiques"},{"id_schema":83,"masked":"Les scientifiques \\u00e9tudient trois esp\\u00e8ces de poissons trouv\\u00e9es r\\u00e9cemment dans l\'oc\\u00e9an indien. Les <mask> sont apparus il y a deux ans.","answer":"poissons"},{"id_schema":102,"masked":"Je suis s\\u00fbre que ce monument est dans mon guide, le <mask> est incontournable.","answer":"monument"},{"id_schema":102,"masked":"Je suis s\\u00fbre que ce monument est dans mon guide, le <mask> est complet.","answer":"guide"},{"id_schema":104,"masked":"J\'ai mis la cl\\u00e9 dans la serrure, mais elle \\u00e9tait bouch\\u00e9e avec du chewing-gum, je n\'ai pas pu extirper la <mask>.","answer":"cl\\u00e9"},{"id_schema":104,"masked":"J\'ai mis la cl\\u00e9 dans la serrure, mais elle \\u00e9tait bouch\\u00e9e avec du chewing-gum, je n\'ai pas pu ouvrir la <mask>.","answer":"serrure"},{"id_schema":106,"masked":"Samuel et Am\\u00e9lie sont passionn\\u00e9ment amoureux mais les parents d\'Am\\u00e9lie sont contre cette relation car <mask> et Am\\u00e9lie sont jeunes.","answer":"Samuel"},{"id_schema":106,"masked":"Samuel et Am\\u00e9lie sont passionn\\u00e9ment amoureux mais les parents d\'Am\\u00e9lie sont contre cette relation car les <mask> d\'Am\\u00e9lie sont snobs.","answer":"parents"}]'



.. code:: ipython3

    with open('frenchAsso.json', 'w', encoding='utf-8') as file:
        temp.to_json(file, force_ascii=False,orient="records")

.. code:: ipython3

    df_pmi = pd.read_csv("synthese.csv")
    for i,row in df_pmi.iterrows():
        if row["Special_Alternate"] == row["Contxt_R0_R1"]:
            df_pmi.loc[i,"real_answer"] = "true"
        else:
            df_pmi.loc[i,"real_answer"] = "false"

.. code:: ipython3

    df_pmi




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>ID_Schema</th>
          <th>Special_Alternate</th>
          <th>Contxt_R0_R1</th>
          <th>spe_alt</th>
          <th>r0_r1</th>
          <th>Word_Head_S_A</th>
          <th>Word_Head_R</th>
          <th>target</th>
          <th>rep</th>
          <th>mi</th>
          <th>...</th>
          <th>Score_full</th>
          <th>Delta_score_full</th>
          <th>Score_partial</th>
          <th>Word_Head_S_A.1</th>
          <th>Word_Head_R.1</th>
          <th>Score_answer_cos_sim</th>
          <th>Delta_score_cosim</th>
          <th>Score_answer_log_sigm</th>
          <th>Delta_score_log_sigm</th>
          <th>real_answer</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>0</th>
          <td>1</td>
          <td>0</td>
          <td>0</td>
          <td>spe</td>
          <td>r0</td>
          <td>grande</td>
          <td>coupe</td>
          <td>grand</td>
          <td>coupe</td>
          <td>3.148</td>
          <td>...</td>
          <td>-73.452945</td>
          <td>3.303328</td>
          <td>-14.085338</td>
          <td>-0.132424</td>
          <td>-8.713390</td>
          <td>0.001731</td>
          <td>0.034914</td>
          <td>-0.654499</td>
          <td>0.519351</td>
          <td>true</td>
        </tr>
        <tr>
          <th>1</th>
          <td>1</td>
          <td>0</td>
          <td>1</td>
          <td>spe</td>
          <td>r1</td>
          <td>grande</td>
          <td>valise</td>
          <td>grand</td>
          <td>valise</td>
          <td>3.357</td>
          <td>...</td>
          <td>-76.756274</td>
          <td>NaN</td>
          <td>-12.956042</td>
          <td>-0.115142</td>
          <td>-8.772401</td>
          <td>0.036645</td>
          <td>NaN</td>
          <td>-0.135148</td>
          <td>NaN</td>
          <td>false</td>
        </tr>
        <tr>
          <th>2</th>
          <td>1</td>
          <td>1</td>
          <td>0</td>
          <td>alt</td>
          <td>r0</td>
          <td>petite</td>
          <td>coupe</td>
          <td>petit</td>
          <td>coupe</td>
          <td>3.549</td>
          <td>...</td>
          <td>-72.550225</td>
          <td>2.591899</td>
          <td>-13.182617</td>
          <td>-0.125082</td>
          <td>-7.838149</td>
          <td>0.007567</td>
          <td>0.068768</td>
          <td>-0.538646</td>
          <td>0.519389</td>
          <td>false</td>
        </tr>
        <tr>
          <th>3</th>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>alt</td>
          <td>r1</td>
          <td>petite</td>
          <td>valise</td>
          <td>petit</td>
          <td>valise</td>
          <td>5.256</td>
          <td>...</td>
          <td>-75.142124</td>
          <td>NaN</td>
          <td>-11.341892</td>
          <td>-0.102280</td>
          <td>-7.421442</td>
          <td>0.076334</td>
          <td>NaN</td>
          <td>-0.019257</td>
          <td>NaN</td>
          <td>true</td>
        </tr>
        <tr>
          <th>4</th>
          <td>2</td>
          <td>0</td>
          <td>0</td>
          <td>spe</td>
          <td>r0</td>
          <td>réussi</td>
          <td>Paul</td>
          <td>réussir</td>
          <td>Paul</td>
          <td>2.627</td>
          <td>...</td>
          <td>-73.211253</td>
          <td>1.682328</td>
          <td>-14.660852</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>true</td>
        </tr>
        <tr>
          <th>...</th>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
        </tr>
        <tr>
          <th>423</th>
          <td>28</td>
          <td>1</td>
          <td>1</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>requin</td>
          <td>canard</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>...</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>true</td>
        </tr>
        <tr>
          <th>424</th>
          <td>57</td>
          <td>0</td>
          <td>0</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>aile</td>
          <td>aile</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>...</td>
          <td>-90.722183</td>
          <td>13.210348</td>
          <td>-35.057221</td>
          <td>-0.069287</td>
          <td>-3.803763</td>
          <td>0.087102</td>
          <td>0.035995</td>
          <td>-0.002640</td>
          <td>0.082681</td>
          <td>true</td>
        </tr>
        <tr>
          <th>425</th>
          <td>57</td>
          <td>0</td>
          <td>1</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>aile</td>
          <td>table</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>...</td>
          <td>-77.511835</td>
          <td>NaN</td>
          <td>-22.290879</td>
          <td>-0.043223</td>
          <td>-2.261306</td>
          <td>0.051106</td>
          <td>NaN</td>
          <td>-0.085322</td>
          <td>NaN</td>
          <td>false</td>
        </tr>
        <tr>
          <th>426</th>
          <td>57</td>
          <td>1</td>
          <td>0</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>encyclopédie</td>
          <td>encyclopédie</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>...</td>
          <td>-74.934387</td>
          <td>3.923951</td>
          <td>-53.521716</td>
          <td>-0.142205</td>
          <td>-6.874139</td>
          <td>-0.028513</td>
          <td>0.048646</td>
          <td>-1.727217</td>
          <td>1.424948</td>
          <td>false</td>
        </tr>
        <tr>
          <th>427</th>
          <td>57</td>
          <td>1</td>
          <td>1</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>encyclopédie</td>
          <td>table</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>...</td>
          <td>-71.010437</td>
          <td>NaN</td>
          <td>-49.597765</td>
          <td>-0.028521</td>
          <td>-1.546662</td>
          <td>0.020133</td>
          <td>NaN</td>
          <td>-0.302270</td>
          <td>NaN</td>
          <td>true</td>
        </tr>
      </tbody>
    </table>
    <p>428 rows × 21 columns</p>
    </div>



.. code:: ipython3

    #! filter df_pmi target,rep,mi,delta_mi
    df_pmi_asso = df_pmi.filter(items=["ID_Schema","target","rep","mi","delta_mi","real_answer"]).loc[df_pmi['ID_Schema'].isin(asso)]
    for i,row in df_pmi_asso.iterrows():
        if i%2 == 0 and row["mi"] > df_pmi_asso.loc[i+1]["mi"]:
            df_pmi_asso.loc[i,"answer"] = "true"
            df_pmi_asso.loc[i+1,"answer"] = "false"
        if i%2 == 0 and row["mi"] < df_pmi_asso.loc[i+1]["mi"]:
            df_pmi_asso.loc[i+1,"answer"] = "true"
            df_pmi_asso.loc[i,"answer"] = "false"
    cols = df_pmi_asso.columns.tolist()
    # cols = cols[:-3] + cols[-1:]
    # cols
    df_pmi_asso = df_pmi_asso.loc[:,cols]

.. code:: ipython3

    print(df_pmi_asso)
    df_pmi_asso["real_answer"] == df_pmi_asso["answer"]


.. parsed-literal::

         ID_Schema          target                     rep      mi  delta_mi  \
    44          12       déménager                  ancien   3.591     0.946
    45          12       déménager                 nouveau   4.537       NaN
    46          12       emménager                  ancien   5.279     1.575
    47          12       emménager                 nouveau   6.854       NaN
    48          13    enthousiaste                    gens   2.447    12.123
    49          13    enthousiaste             livre, Paul  14.570       NaN
    50          13       populaire                    gens   3.906    10.052
    51          13       populaire             livre, Paul  13.958       NaN
    64          17       emprunter                  chemin   9.262     4.628
    65          17       emprunter                     lac   4.634       NaN
    66          17       atteindre                  chemin   3.936     0.991
    67          17       atteindre                     lac   4.927       NaN
    72          19        préparés             Fred, Alice     NaN       NaN
    73          19        préparés                manteaux   1.652       NaN
    74          19      suffisants             Fred, Alice     NaN       NaN
    75          19      suffisants                manteaux   3.293       NaN
    112         30         indices            archéologues   4.804     0.391
    113         30         indices  hommes, préhistoriques   5.195       NaN
    114         30          gibier            archéologues     NaN       NaN
    115         30          gibier  hommes, préhistoriques   9.588       NaN
    116         31         stopper                  police   4.730     1.774
    117         31         stopper                    gang   6.504       NaN
    118         31       organiser                  police   3.404     1.284
    119         31       organiser                    gang   4.688       NaN
    120         32           sucre                  gâteau   7.599     2.416
    121         32           sucre                   frigo   5.183       NaN
    122         32           reste                  gâteau   3.270     1.906
    123         32           reste                   frigo   5.176       NaN
    124         33          guérie                cheville   5.391     1.585
    125         33          guérie                béquille   6.976       NaN
    126         33       superflue                cheville     NaN       NaN
    127         33       superflue                béquille   7.530       NaN
    256         67           durée             Rendez-vous   8.385     1.524
    257         67           durée                   train   6.861       NaN
    258         67         retardé             Rendez-vous   3.787     1.798
    259         67         retardé                   train   5.585       NaN
    272         71           lourd                  carafe     NaN       NaN
    273         71           lourd                 étagère   4.003       NaN
    274         71        encombré                  carafe     NaN       NaN
    275         71        encombré                 étagère  10.011       NaN
    304         79         possède                  violon   3.894     0.308
    305         79         possède                 morceau   3.586       NaN
    306         79            aime                  violon   3.687     0.290
    307         79            aime                 morceau   3.977       NaN
    316         83          débuté           scientifiques   2.509     0.217
    317         83          débuté                poissons   2.726       NaN
    318         83          apparu           scientifiques   2.857     0.137
    319         83          apparu                poissons   2.994       NaN
    392        102  incontournable                monument   6.450     1.250
    393        102  incontournable                   guide   5.200       NaN
    394        102         complet                monument   3.243     3.447
    395        102         complet                   guide   6.690       NaN
    400        104        extirper                clé/clef   3.464    13.458
    401        104        extirper                 serrure  16.922       NaN
    402        104          ouvrir                clé/clef  -2.420     9.190
    403        104          ouvrir                 serrure   6.770       NaN
    408        106           jeune                  Samuel   5.993     7.621
    409        106           jeune                 parents  -1.628       NaN
    410        106            snob                  Samuel     NaN       NaN
    411        106            snob                 parents     NaN       NaN

        real_answer answer
    44         true  false
    45        false   true
    46        false  false
    47         true   true
    48         true  false
    49        false   true
    50        false  false
    51         true   true
    64         true   true
    65        false  false
    66        false  false
    67         true   true
    72         true    NaN
    73        false    NaN
    74        false    NaN
    75         true    NaN
    112        true  false
    113       false   true
    114       false    NaN
    115        true    NaN
    116        true  false
    117       false   true
    118       false  false
    119        true   true
    120        true   true
    121       false  false
    122       false  false
    123        true   true
    124        true  false
    125       false   true
    126       false    NaN
    127        true    NaN
    256        true   true
    257       false  false
    258       false  false
    259        true   true
    272        true    NaN
    273       false    NaN
    274       false    NaN
    275        true    NaN
    304        true   true
    305       false  false
    306       false  false
    307        true   true
    316        true  false
    317       false   true
    318       false  false
    319        true   true
    392        true   true
    393       false  false
    394       false  false
    395        true   true
    400        true  false
    401       false   true
    402       false  false
    403        true   true
    408        true   true
    409       false  false
    410       false    NaN
    411        true    NaN




.. parsed-literal::

    44     False
    45     False
    46      True
    47      True
    48     False
    49     False
    50      True
    51      True
    64      True
    65      True
    66      True
    67      True
    72     False
    73     False
    74     False
    75     False
    112    False
    113    False
    114    False
    115    False
    116    False
    117    False
    118     True
    119     True
    120     True
    121     True
    122     True
    123     True
    124    False
    125    False
    126    False
    127    False
    256     True
    257     True
    258     True
    259     True
    272    False
    273    False
    274    False
    275    False
    304     True
    305     True
    306     True
    307     True
    316    False
    317    False
    318     True
    319     True
    392     True
    393     True
    394     True
    395     True
    400    False
    401    False
    402     True
    403     True
    408     True
    409     True
    410    False
    411    False
    dtype: bool



.. code:: ipython3

    correct = len([x for x in df_pmi_asso["real_answer"] == df_pmi_asso["answer"] if x == True])
    correct
    total = df_pmi_asso.shape[0]

.. code:: ipython3

    # correct/total




.. parsed-literal::

    0.5333333333333333



.. code:: ipython3

    # total




.. parsed-literal::

    60



.. code:: ipython3

    correct




.. parsed-literal::

    32







.. parsed-literal::

    44     False
    45     False
    46     False
    47     False
    48     False
    49     False
    50     False
    51     False
    64     False
    65     False
    66     False
    67     False
    72     False
    73     False
    74     False
    75     False
    112    False
    113    False
    114    False
    115    False
    116    False
    117    False
    118    False
    119    False
    120    False
    121    False
    122    False
    123    False
    124    False
    125    False
    126    False
    127    False
    256    False
    257    False
    258    False
    259    False
    272    False
    273    False
    274    False
    275    False
    304    False
    305    False
    306    False
    307    False
    316    False
    317    False
    318    False
    319    False
    392    False
    393    False
    394    False
    395    False
    400    False
    401    False
    402    False
    403    False
    408    False
    409    False
    410    False
    411    False
    Name: answer, dtype: bool



.. code:: ipython3

    df_pmi_asso





.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>ID_Schema</th>
          <th>target</th>
          <th>rep</th>
          <th>mi</th>
          <th>delta_mi</th>
          <th>real_answer</th>
          <th>answer</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>44</th>
          <td>12</td>
          <td>déménager</td>
          <td>ancien</td>
          <td>3.591</td>
          <td>0.946</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>45</th>
          <td>12</td>
          <td>déménager</td>
          <td>nouveau</td>
          <td>4.537</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>46</th>
          <td>12</td>
          <td>emménager</td>
          <td>ancien</td>
          <td>5.279</td>
          <td>1.575</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>47</th>
          <td>12</td>
          <td>emménager</td>
          <td>nouveau</td>
          <td>6.854</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>48</th>
          <td>13</td>
          <td>enthousiaste</td>
          <td>gens</td>
          <td>2.447</td>
          <td>12.123</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>49</th>
          <td>13</td>
          <td>enthousiaste</td>
          <td>livre, Paul</td>
          <td>14.570</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>50</th>
          <td>13</td>
          <td>populaire</td>
          <td>gens</td>
          <td>3.906</td>
          <td>10.052</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>51</th>
          <td>13</td>
          <td>populaire</td>
          <td>livre, Paul</td>
          <td>13.958</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>64</th>
          <td>17</td>
          <td>emprunter</td>
          <td>chemin</td>
          <td>9.262</td>
          <td>4.628</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>65</th>
          <td>17</td>
          <td>emprunter</td>
          <td>lac</td>
          <td>4.634</td>
          <td>NaN</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>66</th>
          <td>17</td>
          <td>atteindre</td>
          <td>chemin</td>
          <td>3.936</td>
          <td>0.991</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>67</th>
          <td>17</td>
          <td>atteindre</td>
          <td>lac</td>
          <td>4.927</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>72</th>
          <td>19</td>
          <td>préparés</td>
          <td>Fred, Alice</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>73</th>
          <td>19</td>
          <td>préparés</td>
          <td>manteaux</td>
          <td>1.652</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>74</th>
          <td>19</td>
          <td>suffisants</td>
          <td>Fred, Alice</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>75</th>
          <td>19</td>
          <td>suffisants</td>
          <td>manteaux</td>
          <td>3.293</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>112</th>
          <td>30</td>
          <td>indices</td>
          <td>archéologues</td>
          <td>4.804</td>
          <td>0.391</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>113</th>
          <td>30</td>
          <td>indices</td>
          <td>hommes, préhistoriques</td>
          <td>5.195</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>114</th>
          <td>30</td>
          <td>gibier</td>
          <td>archéologues</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>115</th>
          <td>30</td>
          <td>gibier</td>
          <td>hommes, préhistoriques</td>
          <td>9.588</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>116</th>
          <td>31</td>
          <td>stopper</td>
          <td>police</td>
          <td>4.730</td>
          <td>1.774</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>117</th>
          <td>31</td>
          <td>stopper</td>
          <td>gang</td>
          <td>6.504</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>118</th>
          <td>31</td>
          <td>organiser</td>
          <td>police</td>
          <td>3.404</td>
          <td>1.284</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>119</th>
          <td>31</td>
          <td>organiser</td>
          <td>gang</td>
          <td>4.688</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>120</th>
          <td>32</td>
          <td>sucre</td>
          <td>gâteau</td>
          <td>7.599</td>
          <td>2.416</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>121</th>
          <td>32</td>
          <td>sucre</td>
          <td>frigo</td>
          <td>5.183</td>
          <td>NaN</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>122</th>
          <td>32</td>
          <td>reste</td>
          <td>gâteau</td>
          <td>3.270</td>
          <td>1.906</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>123</th>
          <td>32</td>
          <td>reste</td>
          <td>frigo</td>
          <td>5.176</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>124</th>
          <td>33</td>
          <td>guérie</td>
          <td>cheville</td>
          <td>5.391</td>
          <td>1.585</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>125</th>
          <td>33</td>
          <td>guérie</td>
          <td>béquille</td>
          <td>6.976</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>126</th>
          <td>33</td>
          <td>superflue</td>
          <td>cheville</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>127</th>
          <td>33</td>
          <td>superflue</td>
          <td>béquille</td>
          <td>7.530</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>256</th>
          <td>67</td>
          <td>durée</td>
          <td>Rendez-vous</td>
          <td>8.385</td>
          <td>1.524</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>257</th>
          <td>67</td>
          <td>durée</td>
          <td>train</td>
          <td>6.861</td>
          <td>NaN</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>258</th>
          <td>67</td>
          <td>retardé</td>
          <td>Rendez-vous</td>
          <td>3.787</td>
          <td>1.798</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>259</th>
          <td>67</td>
          <td>retardé</td>
          <td>train</td>
          <td>5.585</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>272</th>
          <td>71</td>
          <td>lourd</td>
          <td>carafe</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>273</th>
          <td>71</td>
          <td>lourd</td>
          <td>étagère</td>
          <td>4.003</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>274</th>
          <td>71</td>
          <td>encombré</td>
          <td>carafe</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>275</th>
          <td>71</td>
          <td>encombré</td>
          <td>étagère</td>
          <td>10.011</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>304</th>
          <td>79</td>
          <td>possède</td>
          <td>violon</td>
          <td>3.894</td>
          <td>0.308</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>305</th>
          <td>79</td>
          <td>possède</td>
          <td>morceau</td>
          <td>3.586</td>
          <td>NaN</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>306</th>
          <td>79</td>
          <td>aime</td>
          <td>violon</td>
          <td>3.687</td>
          <td>0.290</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>307</th>
          <td>79</td>
          <td>aime</td>
          <td>morceau</td>
          <td>3.977</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>316</th>
          <td>83</td>
          <td>débuté</td>
          <td>scientifiques</td>
          <td>2.509</td>
          <td>0.217</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>317</th>
          <td>83</td>
          <td>débuté</td>
          <td>poissons</td>
          <td>2.726</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>318</th>
          <td>83</td>
          <td>apparu</td>
          <td>scientifiques</td>
          <td>2.857</td>
          <td>0.137</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>319</th>
          <td>83</td>
          <td>apparu</td>
          <td>poissons</td>
          <td>2.994</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>392</th>
          <td>102</td>
          <td>incontournable</td>
          <td>monument</td>
          <td>6.450</td>
          <td>1.250</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>393</th>
          <td>102</td>
          <td>incontournable</td>
          <td>guide</td>
          <td>5.200</td>
          <td>NaN</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>394</th>
          <td>102</td>
          <td>complet</td>
          <td>monument</td>
          <td>3.243</td>
          <td>3.447</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>395</th>
          <td>102</td>
          <td>complet</td>
          <td>guide</td>
          <td>6.690</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>400</th>
          <td>104</td>
          <td>extirper</td>
          <td>clé/clef</td>
          <td>3.464</td>
          <td>13.458</td>
          <td>true</td>
          <td>false</td>
        </tr>
        <tr>
          <th>401</th>
          <td>104</td>
          <td>extirper</td>
          <td>serrure</td>
          <td>16.922</td>
          <td>NaN</td>
          <td>false</td>
          <td>true</td>
        </tr>
        <tr>
          <th>402</th>
          <td>104</td>
          <td>ouvrir</td>
          <td>clé/clef</td>
          <td>-2.420</td>
          <td>9.190</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>403</th>
          <td>104</td>
          <td>ouvrir</td>
          <td>serrure</td>
          <td>6.770</td>
          <td>NaN</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>408</th>
          <td>106</td>
          <td>jeune</td>
          <td>Samuel</td>
          <td>5.993</td>
          <td>7.621</td>
          <td>true</td>
          <td>true</td>
        </tr>
        <tr>
          <th>409</th>
          <td>106</td>
          <td>jeune</td>
          <td>parents</td>
          <td>-1.628</td>
          <td>NaN</td>
          <td>false</td>
          <td>false</td>
        </tr>
        <tr>
          <th>410</th>
          <td>106</td>
          <td>snob</td>
          <td>Samuel</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>false</td>
          <td>NaN</td>
        </tr>
        <tr>
          <th>411</th>
          <td>106</td>
          <td>snob</td>
          <td>parents</td>
          <td>NaN</td>
          <td>NaN</td>
          <td>true</td>
          <td>NaN</td>
        </tr>
      </tbody>
    </table>
    </div>



.. code:: ipython3

    #! get the number of response
    responses = len([x for x in df_pmi_asso.answer.tolist() if x in ["true","false"]])
    print("number of responses")
    print(responses)
    print("total responses")
    print(total)
    print("correct responses")
    print(correct)
    print("taux de bonne réponses pmi")
    print(correct/responses)
    print("taux de bonnes reponses bert")
    print()


.. parsed-literal::

    number of responses
    46
    total responses
    60
    correct responses
    32
    taux de bonne réponses
    0.6956521739130435


.. code:: ipython3

    #! use bert
    # extract items
    items = df_pmi_asso.ID_Schema.tolist()
    items = set(items)
    # df_pmi

.. code:: ipython3

    items




.. parsed-literal::

    {12, 13, 17, 19, 30, 31, 32, 33, 67, 71, 79, 83, 102, 104, 106}



.. code:: ipython3

    for_bert = pd.read_json("frenchAsso.json")

.. code:: ipython3

    for_bert = for_bert.loc[for_bert["id_schema"].isin(items)]

.. code:: ipython3

    questions = for_bert.masked.tolist()
    import re
    questions_final = []
    for q in questions:
        q = re.split(r",|\.",q)
        if q[-1] != "":
            questions_final.append(q[-1])
        else:
            questions_final.append(q[-2])

.. code:: ipython3


    hehe = [x.lstrip() for x in questions_final]
    hehe[2] = "Les <mask> sont enthousiastes."
    hehe[3] = "Les <mask> sont populaires."
    for i,h in enumerate(hehe):
        hehe[i] = hehe[i].replace("préhistoriques ","")
        hehe[i] = hehe[i].replace("de son ","de cette ")
        hehe[i] = hehe[i].replace("dans sa ","dans cette ")
        hehe[i] = hehe[i].replace("l'<mask> ","cette <mask> ")
        hehe[i] = hehe[i].replace("l'<mask> ","cette <mask> ")
        hehe[i] = hehe[i].replace("La <mask> essayait de stopper","Chaque <mask> stoppe")
        hehe[i] = hehe[i].replace("Le <mask> essayait d'organiser","Chaque <mask> organise")

    options = for_bert.options.tolist()

    answers = for_bert.answer.tolist()
    df_bert = pd.DataFrame(list(zip(hehe, options,answers)), columns =['masked', 'options',"answers"])
    # answers

.. code:: ipython3

    #! test bert
    import torch
    def load_cam(model):
        camembert = torch.hub.load('pytorch/fairseq', model)
        camembert.eval()
        return camembert
    cam_base_oscar = load_cam("camembert")


.. parsed-literal::

    Using cache found in /Users/xiaoou/.cache/torch/hub/pytorch_fairseq_master


.. code:: ipython3

    #! create a dataframe to use product_answers
    #! masked and options


.. code:: ipython3

    def prob_options(obj_camembert,options):
        answers = [(x[2].strip(),x[1]) for x in obj_camembert if x[2].strip() in options]
        # different number of answers
        if len(answers) == 0:
            return (0,0,0,0)
        elif len(answers) == 1:
            return (answers[0][0],answers[0][1],0,0)
        else:
            return (answers[0][0],answers[0][1],answers[1][0],answers[1][1])


    def produce_answers(model,pd_good):
        for i, row in pd_good.iterrows():
            masked_line = row.masked
            options = row.options.split()
            answers = model.fill_mask(masked_line, topk=1000)
            pd_good.loc[i, "response1"], pd_good.loc[i, "prob1"], pd_good.loc[i, "response2"], pd_good.loc[
                i, "prob2"] = prob_options(answers, options)
        return pd_good

.. code:: ipython3

    # df_bert

.. code:: ipython3

    test = produce_answers(cam_base_oscar,df_bert)
    test




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }

        .dataframe tbody tr th {
            vertical-align: top;
        }

        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>masked</th>
          <th>options</th>
          <th>answers</th>
          <th>response1</th>
          <th>prob1</th>
          <th>response2</th>
          <th>prob2</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>0</th>
          <td>Il va déménager ce jeudi de cette &lt;mask&gt; maison</td>
          <td>ancienne nouvelle</td>
          <td>ancienne</td>
          <td>ancienne</td>
          <td>0.092925</td>
          <td>nouvelle</td>
          <td>0.078515</td>
        </tr>
        <tr>
          <th>1</th>
          <td>Il va emménager ce jeudi dans cette &lt;mask&gt; maison</td>
          <td>ancienne nouvelle</td>
          <td>nouvelle</td>
          <td>nouvelle</td>
          <td>0.049356</td>
          <td>ancienne</td>
          <td>0.016588</td>
        </tr>
        <tr>
          <th>2</th>
          <td>Les &lt;mask&gt; sont enthousiastes.</td>
          <td>gens livres</td>
          <td>gens</td>
          <td>gens</td>
          <td>0.012422</td>
          <td>livres</td>
          <td>0.000041</td>
        </tr>
        <tr>
          <th>3</th>
          <td>Les &lt;mask&gt; sont populaires.</td>
          <td>gens livres</td>
          <td>livres</td>
          <td>livres</td>
          <td>0.003961</td>
          <td>gens</td>
          <td>0.000173</td>
        </tr>
        <tr>
          <th>4</th>
          <td>donc on n'a pas pu emprunter le &lt;mask&gt;</td>
          <td>chemin lac</td>
          <td>chemin</td>
          <td>chemin</td>
          <td>0.091530</td>
          <td>lac</td>
          <td>0.000378</td>
        </tr>
        <tr>
          <th>5</th>
          <td>donc on n'a pas pu atteindre le &lt;mask&gt;</td>
          <td>chemin lac</td>
          <td>lac</td>
          <td>lac</td>
          <td>0.001522</td>
          <td>chemin</td>
          <td>0.001067</td>
        </tr>
        <tr>
          <th>6</th>
          <td>mais &lt;mask&gt; et Alice ne sont pas préparés pour...</td>
          <td>Fred manteaux</td>
          <td>Fred</td>
          <td>Fred</td>
          <td>0.009106</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>7</th>
          <td>Les &lt;mask&gt; cherchaient des indices sur les ber...</td>
          <td>archéologues hommes</td>
          <td>archéologues</td>
          <td>archéologues</td>
          <td>0.044883</td>
          <td>hommes</td>
          <td>0.026849</td>
        </tr>
        <tr>
          <th>8</th>
          <td>Les &lt;mask&gt; cherchaient du gibier sur les berge...</td>
          <td>archéologues hommes</td>
          <td>hommes</td>
          <td>hommes</td>
          <td>0.016358</td>
          <td>archéologues</td>
          <td>0.000649</td>
        </tr>
        <tr>
          <th>9</th>
          <td>Chaque &lt;mask&gt; stoppe un trafic de drogue dans ...</td>
          <td>police gang</td>
          <td>police</td>
          <td>police</td>
          <td>0.013508</td>
          <td>gang</td>
          <td>0.009511</td>
        </tr>
        <tr>
          <th>10</th>
          <td>Chaque &lt;mask&gt; organise un trafic de drogue dan...</td>
          <td>police gang</td>
          <td>gang</td>
          <td>gang</td>
          <td>0.082230</td>
          <td>police</td>
          <td>0.032634</td>
        </tr>
        <tr>
          <th>11</th>
          <td>Il y a beaucoup de sucre dans le &lt;mask&gt;</td>
          <td>gâteau frigo</td>
          <td>gâteau</td>
          <td>gâteau</td>
          <td>0.011465</td>
          <td>frigo</td>
          <td>0.000417</td>
        </tr>
        <tr>
          <th>12</th>
          <td>Il y a beaucoup de restes dans le &lt;mask&gt;</td>
          <td>gâteau frigo</td>
          <td>frigo</td>
          <td>frigo</td>
          <td>0.002842</td>
          <td>gâteau</td>
          <td>0.000481</td>
        </tr>
        <tr>
          <th>13</th>
          <td>le &lt;mask&gt; a été retardé</td>
          <td>rendez-vous train</td>
          <td>train</td>
          <td>train</td>
          <td>0.088362</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>14</th>
          <td>parce que cette &lt;mask&gt; était trop haute</td>
          <td>carafe étagère</td>
          <td>étagère</td>
          <td>étagère</td>
          <td>0.020681</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>15</th>
          <td>Elle possède le &lt;mask&gt; depuis son enfance</td>
          <td>violon morceau</td>
          <td>violon</td>
          <td>violon</td>
          <td>0.004770</td>
          <td>morceau</td>
          <td>0.000085</td>
        </tr>
        <tr>
          <th>16</th>
          <td>Les &lt;mask&gt; ont commencé il y a deux ans</td>
          <td>scientifiques poissons</td>
          <td>scientifiques</td>
          <td>scientifiques</td>
          <td>0.000038</td>
          <td>poissons</td>
          <td>0.000021</td>
        </tr>
        <tr>
          <th>17</th>
          <td>Les &lt;mask&gt; sont apparus il y a deux ans</td>
          <td>scientifiques poissons</td>
          <td>poissons</td>
          <td>poissons</td>
          <td>0.001160</td>
          <td>scientifiques</td>
          <td>0.000240</td>
        </tr>
        <tr>
          <th>18</th>
          <td>le &lt;mask&gt; est incontournable</td>
          <td>monument guide</td>
          <td>monument</td>
          <td>guide</td>
          <td>0.003779</td>
          <td>monument</td>
          <td>0.000236</td>
        </tr>
        <tr>
          <th>19</th>
          <td>le &lt;mask&gt; est complet</td>
          <td>monument guide</td>
          <td>guide</td>
          <td>guide</td>
          <td>0.019625</td>
          <td>0</td>
          <td>0.000000</td>
        </tr>
        <tr>
          <th>20</th>
          <td>je n'ai pas pu extirper la &lt;mask&gt;</td>
          <td>clé serrure</td>
          <td>clé</td>
          <td>clé</td>
          <td>0.008129</td>
          <td>serrure</td>
          <td>0.000533</td>
        </tr>
        <tr>
          <th>21</th>
          <td>je n'ai pas pu ouvrir la &lt;mask&gt;</td>
          <td>clé serrure</td>
          <td>serrure</td>
          <td>clé</td>
          <td>0.001862</td>
          <td>serrure</td>
          <td>0.000748</td>
        </tr>
        <tr>
          <th>22</th>
          <td>Samuel et Amélie sont passionnément amoureux m...</td>
          <td>Samuel parents</td>
          <td>Samuel</td>
          <td>Samuel</td>
          <td>0.971663</td>
          <td>parents</td>
          <td>0.000034</td>
        </tr>
        <tr>
          <th>23</th>
          <td>Samuel et Amélie sont passionnément amoureux m...</td>
          <td>Samuel parents</td>
          <td>parents</td>
          <td>parents</td>
          <td>0.971620</td>
          <td>parents</td>
          <td>0.000038</td>
        </tr>
      </tbody>
    </table>
    </div>



.. code:: ipython3

    cam_large_ccnet = load_cam("camembert-large")


.. parsed-literal::

    Using cache found in /Users/xiaoou/.cache/torch/hub/pytorch_fairseq_master


.. code:: ipython3

    options
    # test2 = produce_answers(cam_large_ccnet,df_bert)





.. parsed-literal::

    ['ancienne nouvelle',
     'ancienne nouvelle',
     'gens livres',
     'gens livres',
     'chemin lac',
     'chemin lac',
     'Fred manteaux',
     'archéologues hommes',
     'archéologues hommes',
     'polices gangs',
     'polices gangs',
     'gâteau frigo',
     'gâteau frigo',
     'rendez-vous train',
     'carafe étagère',
     'violon morceau',
     'scientifiques poissons',
     'scientifiques poissons',
     'monument guide',
     'monument guide',
     'clé serrure',
     'clé serrure',
     'Samuel parents',
     'Samuel parents']



.. code:: ipython3

    #

    # test2

.. code:: ipython3

    #! exclude the triche partie
    #! do it a la main
    14/18 * 100




.. parsed-literal::

    77.77777777777779



.. code:: ipython3

    (20-2)/(23-3)




.. parsed-literal::

    0.9



