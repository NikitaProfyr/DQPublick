PGDMP  .                     |            DQDB    16.0    16.0 ;    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16418    DQDB    DATABASE     z   CREATE DATABASE "DQDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "DQDB";
                postgres    false            �            1259    16532    Answer    TABLE     �   CREATE TABLE public."Answer" (
    id integer NOT NULL,
    title character varying NOT NULL,
    "right" boolean NOT NULL,
    "questionId" integer
);
    DROP TABLE public."Answer";
       public         heap 
   dies_admin    false            �            1259    16531    Answer_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Answer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Answer_id_seq";
       public       
   dies_admin    false    221            /           0    0    Answer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Answer_id_seq" OWNED BY public."Answer".id;
          public       
   dies_admin    false    220            �            1259    16541    Question    TABLE     x   CREATE TABLE public."Question" (
    id integer NOT NULL,
    title character varying NOT NULL,
    "quizId" integer
);
    DROP TABLE public."Question";
       public         heap 
   dies_admin    false            �            1259    16540    Question_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Question_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Question_id_seq";
       public       
   dies_admin    false    223            0           0    0    Question_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Question_id_seq" OWNED BY public."Question".id;
          public       
   dies_admin    false    222            �            1259    16555    Quiz    TABLE     �   CREATE TABLE public."Quiz" (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    image character varying,
    "authorId" integer
);
    DROP TABLE public."Quiz";
       public         heap 
   dies_admin    false            �            1259    16590    QuizResults    TABLE        CREATE TABLE public."QuizResults" (
    id integer NOT NULL,
    result integer,
    "userId" integer,
    "quizId" integer
);
 !   DROP TABLE public."QuizResults";
       public         heap 
   dies_admin    false            �            1259    16589    QuizResults_id_seq    SEQUENCE     �   CREATE SEQUENCE public."QuizResults_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."QuizResults_id_seq";
       public       
   dies_admin    false    227            1           0    0    QuizResults_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."QuizResults_id_seq" OWNED BY public."QuizResults".id;
          public       
   dies_admin    false    226            �            1259    16554    Quiz_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Quiz_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Quiz_id_seq";
       public       
   dies_admin    false    225            2           0    0    Quiz_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Quiz_id_seq" OWNED BY public."Quiz".id;
          public       
   dies_admin    false    224            �            1259    16514    Token    TABLE     u   CREATE TABLE public."Token" (
    id integer NOT NULL,
    "userId" integer,
    "refreshToken" character varying
);
    DROP TABLE public."Token";
       public         heap 
   dies_admin    false            �            1259    16513    Token_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Token_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Token_id_seq";
       public       
   dies_admin    false    219            3           0    0    Token_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Token_id_seq" OWNED BY public."Token".id;
          public       
   dies_admin    false    218            �            1259    16503    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying,
    "hashedPassword" character varying,
    "userName" character varying
);
    DROP TABLE public."User";
       public         heap 
   dies_admin    false            �            1259    16502    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public       
   dies_admin    false    217            4           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public       
   dies_admin    false    216            �            1259    16497    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap 
   dies_admin    false            o           2604    16535 	   Answer id    DEFAULT     j   ALTER TABLE ONLY public."Answer" ALTER COLUMN id SET DEFAULT nextval('public."Answer_id_seq"'::regclass);
 :   ALTER TABLE public."Answer" ALTER COLUMN id DROP DEFAULT;
       public       
   dies_admin    false    221    220    221            p           2604    16544    Question id    DEFAULT     n   ALTER TABLE ONLY public."Question" ALTER COLUMN id SET DEFAULT nextval('public."Question_id_seq"'::regclass);
 <   ALTER TABLE public."Question" ALTER COLUMN id DROP DEFAULT;
       public       
   dies_admin    false    222    223    223            q           2604    16558    Quiz id    DEFAULT     f   ALTER TABLE ONLY public."Quiz" ALTER COLUMN id SET DEFAULT nextval('public."Quiz_id_seq"'::regclass);
 8   ALTER TABLE public."Quiz" ALTER COLUMN id DROP DEFAULT;
       public       
   dies_admin    false    225    224    225            r           2604    16593    QuizResults id    DEFAULT     t   ALTER TABLE ONLY public."QuizResults" ALTER COLUMN id SET DEFAULT nextval('public."QuizResults_id_seq"'::regclass);
 ?   ALTER TABLE public."QuizResults" ALTER COLUMN id DROP DEFAULT;
       public       
   dies_admin    false    226    227    227            n           2604    16517    Token id    DEFAULT     h   ALTER TABLE ONLY public."Token" ALTER COLUMN id SET DEFAULT nextval('public."Token_id_seq"'::regclass);
 9   ALTER TABLE public."Token" ALTER COLUMN id DROP DEFAULT;
       public       
   dies_admin    false    218    219    219            m           2604    16506    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public       
   dies_admin    false    217    216    217            "          0    16532    Answer 
   TABLE DATA           D   COPY public."Answer" (id, title, "right", "questionId") FROM stdin;
    public       
   dies_admin    false    221   �@       $          0    16541    Question 
   TABLE DATA           9   COPY public."Question" (id, title, "quizId") FROM stdin;
    public       
   dies_admin    false    223   �H       &          0    16555    Quiz 
   TABLE DATA           K   COPY public."Quiz" (id, title, description, image, "authorId") FROM stdin;
    public       
   dies_admin    false    225   &N       (          0    16590    QuizResults 
   TABLE DATA           G   COPY public."QuizResults" (id, result, "userId", "quizId") FROM stdin;
    public       
   dies_admin    false    227   ZQ                  0    16514    Token 
   TABLE DATA           ?   COPY public."Token" (id, "userId", "refreshToken") FROM stdin;
    public       
   dies_admin    false    219   �Q                 0    16503    User 
   TABLE DATA           I   COPY public."User" (id, email, "hashedPassword", "userName") FROM stdin;
    public       
   dies_admin    false    217   'R                 0    16497    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public       
   dies_admin    false    215   �S       5           0    0    Answer_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Answer_id_seq"', 432, true);
          public       
   dies_admin    false    220            6           0    0    Question_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Question_id_seq"', 164, true);
          public       
   dies_admin    false    222            7           0    0    QuizResults_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."QuizResults_id_seq"', 16, true);
          public       
   dies_admin    false    226            8           0    0    Quiz_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Quiz_id_seq"', 65, true);
          public       
   dies_admin    false    224            9           0    0    Token_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Token_id_seq"', 190, true);
          public       
   dies_admin    false    218            :           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 45, true);
          public       
   dies_admin    false    216            �           2606    16539    Answer Answer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Answer" DROP CONSTRAINT "Answer_pkey";
       public         
   dies_admin    false    221            �           2606    16548    Question Question_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Question" DROP CONSTRAINT "Question_pkey";
       public         
   dies_admin    false    223            �           2606    16595    QuizResults QuizResults_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."QuizResults" DROP CONSTRAINT "QuizResults_pkey";
       public         
   dies_admin    false    227            �           2606    16562    Quiz Quiz_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Quiz"
    ADD CONSTRAINT "Quiz_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Quiz" DROP CONSTRAINT "Quiz_pkey";
       public         
   dies_admin    false    225            |           2606    16521    Token Token_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Token" DROP CONSTRAINT "Token_pkey";
       public         
   dies_admin    false    219            v           2606    16512    User User_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_email_key";
       public         
   dies_admin    false    217            x           2606    16510    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public         
   dies_admin    false    217            z           2606    16530    User User_userName_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_userName_key" UNIQUE ("userName");
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_userName_key";
       public         
   dies_admin    false    217            t           2606    16501 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public         
   dies_admin    false    215            }           1259    16528    ix_Token_id    INDEX     ?   CREATE INDEX "ix_Token_id" ON public."Token" USING btree (id);
 !   DROP INDEX public."ix_Token_id";
       public         
   dies_admin    false    219            ~           1259    16621    ix_Token_refreshToken    INDEX     \   CREATE UNIQUE INDEX "ix_Token_refreshToken" ON public."Token" USING btree ("refreshToken");
 +   DROP INDEX public."ix_Token_refreshToken";
       public         
   dies_admin    false    219            �           2606    16578    Answer Answer_questionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Answer" DROP CONSTRAINT "Answer_questionId_fkey";
       public       
   dies_admin    false    4738    221    223            �           2606    16573    Question Question_quizId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_quizId_fkey" FOREIGN KEY ("quizId") REFERENCES public."Quiz"(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Question" DROP CONSTRAINT "Question_quizId_fkey";
       public       
   dies_admin    false    225    4740    223            �           2606    16611 #   QuizResults QuizResults_quizId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_quizId_fkey" FOREIGN KEY ("quizId") REFERENCES public."Quiz"(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."QuizResults" DROP CONSTRAINT "QuizResults_quizId_fkey";
       public       
   dies_admin    false    225    4740    227            �           2606    16616 #   QuizResults QuizResults_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."QuizResults"
    ADD CONSTRAINT "QuizResults_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."QuizResults" DROP CONSTRAINT "QuizResults_userId_fkey";
       public       
   dies_admin    false    217    227    4728            �           2606    16583    Quiz Quiz_authorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Quiz"
    ADD CONSTRAINT "Quiz_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Quiz" DROP CONSTRAINT "Quiz_authorId_fkey";
       public       
   dies_admin    false    225    217    4728            �           2606    16622    Token Token_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Token" DROP CONSTRAINT "Token_userId_fkey";
       public       
   dies_admin    false    219    4728    217            "   �  x��W�nG]7���	����H�6ff1A�B2i��";���d��_YNb'�`�M�f�-������S�%Ҕ1����u��}�{o���o���nQ��F=�S��B���Zg�N�n�f�3����[w��;����o�{��g����7fd�f^�<��Uq'���G33����fa�:Jq��q9 ����&7�M^��)pp
$�N��x��Y-������ɚD �|y�W�A�^9	���|sg�N����o�����%Z��\- ` rRK�:-�����f��0�;8�>��%�?'A��(4�ͩSw1��$0������@��<�+�tlx�ƪ�$�t�	�#g&HMD�[z�L*�g��=���X"#���/̫�XDx�ՠMB�p|�6�
RP��N���V��8inڃ6��x~�N��_�C񑐭˅9m<���JVr�Z������A�����3S��?��' ���߀vO�����g��WJĂ�����Q1,yGp�īĨ���?���RFL�˼�]���2g^>�w�U)7��_�Ki6%�y������i��I�!�&�����Mƚ|S����I���#��B�����| R���^�.W�{��責Ǚ�P�I�$*�"��-r&k�K��Rt�JQ��ҕmc�p鞋<-Y�Vh�R�%慨OU�t��A&-VE�1�^s�#Kc�E�N��S�<��g՝TI[ �#�Aaμ�̴*5WU������<�Ah�����Vn����YAr�-l��B*�jn�B��d����k�;S�;\��+qGx�I%���)��x�H�?rE_�,��ꍏ�W�i���U�o|�I�>�zhN�Ωo5Y���558��
6������$-!��a
H���X_A;F:J��)���]�R���G2@1]{�%��W!G7�t_* &3e�ҋ͍����О�V�7��D�6wi���Y�6�����%���ӈu ��;Ҕ�;�gq�X
Lu\���ld�L]YΫ{L.R���`���Ǯ�WfT��7:�7z�z!!�}~���fQ���;����Vgs/Tx�:;�ݭ��u�)�����%|V�ǶS3����3�9��ݭ�6;]y$#�������ɇ����� k)�P�M�R�z�b�H��٠Xǡ�P���m^7�ZJ\}�����#~�������PC�3ލ;��)��!'�8'��w��)4*����@�=Xpy9I���6q����Y��Y�H�d�h���Ss��9����aD4͊]ہkʮ���������ӤpR�f�p��|��~)��x�r蛩�؄�7��)��c$~�5^i<Px��ފ�}�V��@���l���>FN`��o�C@P�!h����'��֩p�Dy��ExY'n�Pc5�������.I!�W$om^��h�'�6����x�C�5l�8�����0R<j��q��uM"��Ob����b	9u���D�g�ub���g.�g�ݠ-t�hF�	��dD�:tQ��N,?�"m#S��+���>1�6񶃫�����]�:����Ν�[��W�z���Wz���t�; -�q@�CnZ���x�x��/�������lֲ���KJse\A����	�\q�Y+��_s�ƪ��P51�2/ �����c�f5�VS��}���$el���^��-�<j�H5�-�j���L�`U�u6ĩ�PTk�b�<��p�Ww�%�Wc�[m���-�#��^�I1������������j��
|����w���C����<W;��zۮ!��[+��rf��Qب��ť5}ˊ�\ ��{4y�Uø�6W�[r�Α��S�vX�r$�ho$1�P��fK�#B���kݍOo��eة��Ģ���S��X���uٺ����A�V�/٤�      $   y  x��W�nU];_��H�c��Ub�=B,�T������!��X-Tj��X2�x��=�?�s߼�I������{����^���_}�W>�f�:�&��k�W����?�1~��K��G����蠳a�3>�j�S��gVM`��������sZ�����ᇜ[��AϿv4�?� ��3���:��9��m H	��`d�D���Wո�����ڶ�6��C����ʗ�?�=�JT�r=����>��u�p�;��C�zA�S@<���l��׾JC�d!���%@���!H��kuZ9Z*�T"����V12R���_�[A�l<�<|Of�{���>0��J��V�VS+?/pu
h0E	��Ч�k0�K8%p��+��v��@�dp-��f�0G��o8��m*�g����;=�DAJ��WJ�j�o�c��4a�e~.?Iç8@jU��`���{�<��}���'��T��CŚ-Ӣ�X!3�r����� m�T(��C�:h� �nr��~��c�BV�TчZ�����u�U���_�	��h=���#��wػw�v.�2�N�zf-e֑'rAlD����:T�U��P��ǡQ�r�.��"g�
�P鏜!y��ޔ��d)�0�!��-v̫�q~ػ�^��0^�E�$����n�q�i#:uu�@�|$�'�hj����9���풆�x����\ֱb�v%�Z��ژ-��)n)Sc�w"lA�_�N'��D���:�:]���c��U���Z��?��<W&�Z"��J)��:#�V������O�y���&�ҙܔ�������r���&�@��do�"gE�p�LթyP�U첕鏊<t�̨��x�ܪ[��{&Ȝl����29�^�$u�yE�'ڱ2AawD�#�w�˜�:.l��s�e� ĩ!�����pH��?�oJ��\�-K��;b��:��nL�4}�P��
��-V�2�:�(��j-��%�|�Y`�J�Q�87��ӽ��#	#3u�|R��ư��I��T�������� G���^�J.�M�6��r�u'˰I%��3m[�ufe��s����N��..7�(vNlo��mG妺JCW�pC�`!p��3�W����2����	�G��i����f�FT��et:�2/��%�~�Q�\=���%�Q]���͘p�V��6�x�5�O`ABT��l�&VP�eu�:��ʲ�L�\�����~aZ,�oY����[s�U�G�,;���m�m��ïu���6aX��ix��u�M�uy�D��L&ι���f8���عf���|s���5�n���P�is�����/�.XF������BK��O�6�������`Q���`w�i�2���RtS����Mė����kq�      &   $  x��U]O�P�.��?`biiK/�pQ!J4KHi*���M���hF����#�_R��U���s������f]�Ŗ �9�=��<����q�#m�6q�!qh�'Cx�>���%O��m�#�����q�5=�'O��K�qѦ�<��{6�czƃ�;���{��S�5�\�g���ͅ�^�f��xR-�==�I�����|�P�X[�h5�(6V��R���M6�䢤��y�H�8�K�~�V�'�+�}F��5s�EK��
Z%��S�!E��7 �(������9� �=�#�'��6F7�k�gqa�k���-����iN`5���u����}��E-]�g�cf?��`���=������1�gU�|JHd0����5�;f�#���!1r�:p���� �t�\�4Ͳ=&���jLRe�,h�d(�
"G>��+��<�7y �@Od@�z�`�����a����B��) ��"=�[�t��v�_�YEA%A�GI��J;HBB@������"0w��PC%bR/ �=���	٘F��^�hl���yaK�=I2��F!��T�g��sˑR&cJIS5s��bzC�]NŬe]����8(>M��xj�^�lZ��3K��ꊲ�K4��Y?��?w�=|r���`5��@.X�C�h=V� ��WǸ�gez�MFp����{2~|'��0O>cD�K`f�ہ4`�|^����l8B$l(�6��c�!�������/L�_�o���oB�0����(��>���a��9@��)lO�wz��]Cߴ�Q�	}�B?-6�5      (       x�34�44�4�4��24�4���b���� 2��          �   x���
�0 �k�0c�y)��7�I�	��Z��4����s�G�4���Bs���fF��]��Pʀ{xMT��R��T]V�cV����K��S���+B��������>�ה����,�L[��jW>��`�Ҵ��#����-7         �  x�M�ɒ�0 ��3<��I�M���V@��Pٷ4��S]5S�|�������"\<ɞ�6Z[��x�.��+�D�b�dUz���`�O�m����js�v<Z}8v�3��z�9Zk�P*'�*��:�k.�=�����4*vA�p�"D<>���rҧ�ǃ�_z
G;�f:Y������=���1���y���c�9dx�N=�:��Qi�)��Vs�7қ����ػ��H값���_�"��"�l��h�9e�����@�����>��W��e�q=0\��T��|q*-y�?�<�#˖�K�k��
;�_��|�5����m��б��!�T�l��]�c��ꪭ�i	�䯮��&� 7>&۔`�Ǵ~�F���qk�E�Z't��#ץb����������            x�37M42�0�H1L������ (s�     