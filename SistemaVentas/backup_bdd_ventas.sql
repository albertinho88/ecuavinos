PGDMP                          v            sys_sales_ecuavinos    10.1    10.1 I    v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            x           1262    16393    sys_sales_ecuavinos    DATABASE     �   CREATE DATABASE sys_sales_ecuavinos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_EC.UTF-8' LC_CTYPE = 'es_EC.UTF-8';
 #   DROP DATABASE sys_sales_ecuavinos;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            y           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13001    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            z           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24759    area_postal    TABLE     �   CREATE TABLE area_postal (
    codigo_postal character varying(10) NOT NULL,
    ciudad_id character varying(10) NOT NULL,
    descripcion character varying(100)
);
    DROP TABLE public.area_postal;
       public         postgres    false    3            {           0    0     COLUMN area_postal.codigo_postal    COMMENT     A   COMMENT ON COLUMN area_postal.codigo_postal IS 'código postal';
            public       postgres    false    198            |           0    0    COLUMN area_postal.ciudad_id    COMMENT     =   COMMENT ON COLUMN area_postal.ciudad_id IS 'código ciudad';
            public       postgres    false    198            }           0    0    COLUMN area_postal.descripcion    COMMENT     I   COMMENT ON COLUMN area_postal.descripcion IS 'descripción area postal';
            public       postgres    false    198            �            1259    24754    ciudades    TABLE     �   CREATE TABLE ciudades (
    ciudad_id character varying(10) NOT NULL,
    pais_id character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.ciudades;
       public         postgres    false    3            ~           0    0    COLUMN ciudades.ciudad_id    COMMENT     :   COMMENT ON COLUMN ciudades.ciudad_id IS 'código ciudad';
            public       postgres    false    197                       0    0    COLUMN ciudades.pais_id    COMMENT     7   COMMENT ON COLUMN ciudades.pais_id IS 'código país';
            public       postgres    false    197            �           0    0    COLUMN ciudades.nombre    COMMENT     6   COMMENT ON COLUMN ciudades.nombre IS 'nombre ciudad';
            public       postgres    false    197            �            1259    24774    clientes    TABLE        CREATE TABLE clientes (
    cliente_id character varying(10) NOT NULL,
    codigo_postal character varying(10) NOT NULL,
    tipo_cliente_id character varying(1) NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(500)
);
    DROP TABLE public.clientes;
       public         postgres    false    3            �           0    0    COLUMN clientes.cliente_id    COMMENT     @   COMMENT ON COLUMN clientes.cliente_id IS 'código del cliente';
            public       postgres    false    201            �           0    0    COLUMN clientes.codigo_postal    COMMENT     >   COMMENT ON COLUMN clientes.codigo_postal IS 'código postal';
            public       postgres    false    201            �           0    0    COLUMN clientes.tipo_cliente_id    COMMENT     F   COMMENT ON COLUMN clientes.tipo_cliente_id IS 'código tipo cliente';
            public       postgres    false    201            �           0    0    COLUMN clientes.nombre    COMMENT     /   COMMENT ON COLUMN clientes.nombre IS 'nombre';
            public       postgres    false    201            �           0    0    COLUMN clientes.direccion    COMMENT     >   COMMENT ON COLUMN clientes.direccion IS 'dirección cliente';
            public       postgres    false    201            �            1259    24782    ordenes_compra    TABLE     �   CREATE TABLE ordenes_compra (
    codigo_orden character varying(10) NOT NULL,
    codigo_postal character varying(10) NOT NULL,
    cliente_id character varying(10) NOT NULL,
    fecha date NOT NULL,
    direccion_entrega character varying(500)
);
 "   DROP TABLE public.ordenes_compra;
       public         postgres    false    3            �           0    0 "   COLUMN ordenes_compra.codigo_orden    COMMENT     O   COMMENT ON COLUMN ordenes_compra.codigo_orden IS 'código de orden de compra';
            public       postgres    false    202            �           0    0 #   COLUMN ordenes_compra.codigo_postal    COMMENT     D   COMMENT ON COLUMN ordenes_compra.codigo_postal IS 'código postal';
            public       postgres    false    202            �           0    0     COLUMN ordenes_compra.cliente_id    COMMENT     F   COMMENT ON COLUMN ordenes_compra.cliente_id IS 'código del cliente';
            public       postgres    false    202            �           0    0 '   COLUMN ordenes_compra.direccion_entrega    COMMENT     R   COMMENT ON COLUMN ordenes_compra.direccion_entrega IS 'dirección entrega orden';
            public       postgres    false    202            �            1259    24792    ordenes_compra_detalle    TABLE     L  CREATE TABLE ordenes_compra_detalle (
    codigo_detalle integer NOT NULL,
    codigo_orden character varying(10) NOT NULL,
    producto_id character varying(10) NOT NULL,
    anio character varying(4) NOT NULL,
    cantidad integer NOT NULL,
    precio_por_docena numeric(10,2) NOT NULL,
    precio_total numeric(10,2) NOT NULL
);
 *   DROP TABLE public.ordenes_compra_detalle;
       public         postgres    false    3            �           0    0 ,   COLUMN ordenes_compra_detalle.codigo_detalle    COMMENT     [   COMMENT ON COLUMN ordenes_compra_detalle.codigo_detalle IS 'código detalle orden compra';
            public       postgres    false    204            �           0    0 *   COLUMN ordenes_compra_detalle.codigo_orden    COMMENT     W   COMMENT ON COLUMN ordenes_compra_detalle.codigo_orden IS 'código de orden de compra';
            public       postgres    false    204            �           0    0 )   COLUMN ordenes_compra_detalle.producto_id    COMMENT     P   COMMENT ON COLUMN ordenes_compra_detalle.producto_id IS 'código del producto';
            public       postgres    false    204            �           0    0 "   COLUMN ordenes_compra_detalle.anio    COMMENT     V   COMMENT ON COLUMN ordenes_compra_detalle.anio IS 'año de elaboración del producto';
            public       postgres    false    204            �           0    0 &   COLUMN ordenes_compra_detalle.cantidad    COMMENT     N   COMMENT ON COLUMN ordenes_compra_detalle.cantidad IS 'cantidad de la compra';
            public       postgres    false    204            �           0    0 /   COLUMN ordenes_compra_detalle.precio_por_docena    COMMENT     ^   COMMENT ON COLUMN ordenes_compra_detalle.precio_por_docena IS 'precio unitario (por docena)';
            public       postgres    false    204            �           0    0 *   COLUMN ordenes_compra_detalle.precio_total    COMMENT     \   COMMENT ON COLUMN ordenes_compra_detalle.precio_total IS 'precio unitario por la cantidad';
            public       postgres    false    204            �            1259    24790    ordenes_compra_detalle_seq    SEQUENCE     |   CREATE SEQUENCE ordenes_compra_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ordenes_compra_detalle_seq;
       public       postgres    false    3    204            �           0    0    ordenes_compra_detalle_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE ordenes_compra_detalle_seq OWNED BY ordenes_compra_detalle.codigo_detalle;
            public       postgres    false    203            �            1259    24749    paises    TABLE     p   CREATE TABLE paises (
    pais_id character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.paises;
       public         postgres    false    3            �           0    0    COLUMN paises.pais_id    COMMENT     5   COMMENT ON COLUMN paises.pais_id IS 'código país';
            public       postgres    false    196            �           0    0    COLUMN paises.nombre    COMMENT     3   COMMENT ON COLUMN paises.nombre IS 'nombre país';
            public       postgres    false    196            �            1259    24769 	   productos    TABLE     �   CREATE TABLE productos (
    anio character varying(4) NOT NULL,
    producto_id character varying(10) NOT NULL,
    descripcion character varying(255) NOT NULL,
    precio_por_docena numeric(10,2) NOT NULL
);
    DROP TABLE public.productos;
       public         postgres    false    3            �           0    0    COLUMN productos.anio    COMMENT     H   COMMENT ON COLUMN productos.anio IS 'año de producción del producto';
            public       postgres    false    200            �           0    0    COLUMN productos.producto_id    COMMENT     C   COMMENT ON COLUMN productos.producto_id IS 'código del producto';
            public       postgres    false    200            �           0    0    COLUMN productos.descripcion    COMMENT     ;   COMMENT ON COLUMN productos.descripcion IS 'descripción';
            public       postgres    false    200            �           0    0 "   COLUMN productos.precio_por_docena    COMMENT     F   COMMENT ON COLUMN productos.precio_por_docena IS 'precio por docena';
            public       postgres    false    200            �            1259    24764    tipos_cliente    TABLE     �   CREATE TABLE tipos_cliente (
    tipo_cliente_id character varying(1) NOT NULL,
    descripcion character varying(50) NOT NULL
);
 !   DROP TABLE public.tipos_cliente;
       public         postgres    false    3            �           0    0 $   COLUMN tipos_cliente.tipo_cliente_id    COMMENT     K   COMMENT ON COLUMN tipos_cliente.tipo_cliente_id IS 'código tipo cliente';
            public       postgres    false    199            �           0    0     COLUMN tipos_cliente.descripcion    COMMENT     L   COMMENT ON COLUMN tipos_cliente.descripcion IS 'descripción tipo cliente';
            public       postgres    false    199            �
           2604    24795 %   ordenes_compra_detalle codigo_detalle    DEFAULT     �   ALTER TABLE ONLY ordenes_compra_detalle ALTER COLUMN codigo_detalle SET DEFAULT nextval('ordenes_compra_detalle_seq'::regclass);
 T   ALTER TABLE public.ordenes_compra_detalle ALTER COLUMN codigo_detalle DROP DEFAULT;
       public       postgres    false    203    204    204            m          0    24759    area_postal 
   TABLE DATA               E   COPY area_postal (codigo_postal, ciudad_id, descripcion) FROM stdin;
    public       postgres    false    198   mM       l          0    24754    ciudades 
   TABLE DATA               7   COPY ciudades (ciudad_id, pais_id, nombre) FROM stdin;
    public       postgres    false    197   �w       p          0    24774    clientes 
   TABLE DATA               Z   COPY clientes (cliente_id, codigo_postal, tipo_cliente_id, nombre, direccion) FROM stdin;
    public       postgres    false    201          q          0    24782    ordenes_compra 
   TABLE DATA               d   COPY ordenes_compra (codigo_orden, codigo_postal, cliente_id, fecha, direccion_entrega) FROM stdin;
    public       postgres    false    202   �       s          0    24792    ordenes_compra_detalle 
   TABLE DATA               �   COPY ordenes_compra_detalle (codigo_detalle, codigo_orden, producto_id, anio, cantidad, precio_por_docena, precio_total) FROM stdin;
    public       postgres    false    204   {�       k          0    24749    paises 
   TABLE DATA               *   COPY paises (pais_id, nombre) FROM stdin;
    public       postgres    false    196   �       o          0    24769 	   productos 
   TABLE DATA               O   COPY productos (anio, producto_id, descripcion, precio_por_docena) FROM stdin;
    public       postgres    false    200   l�       n          0    24764    tipos_cliente 
   TABLE DATA               >   COPY tipos_cliente (tipo_cliente_id, descripcion) FROM stdin;
    public       postgres    false    199   �       �           0    0    ordenes_compra_detalle_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('ordenes_compra_detalle_seq', 5, true);
            public       postgres    false    203            �
           2606    24763    area_postal area_postal_pk 
   CONSTRAINT     \   ALTER TABLE ONLY area_postal
    ADD CONSTRAINT area_postal_pk PRIMARY KEY (codigo_postal);
 D   ALTER TABLE ONLY public.area_postal DROP CONSTRAINT area_postal_pk;
       public         postgres    false    198            �
           2606    24758    ciudades ciudades_pk 
   CONSTRAINT     R   ALTER TABLE ONLY ciudades
    ADD CONSTRAINT ciudades_pk PRIMARY KEY (ciudad_id);
 >   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT ciudades_pk;
       public         postgres    false    197            �
           2606    24781    clientes clientes_pk 
   CONSTRAINT     S   ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pk PRIMARY KEY (cliente_id);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pk;
       public         postgres    false    201            �
           2606    24797 0   ordenes_compra_detalle ordenes_compra_detalle_pk 
   CONSTRAINT     s   ALTER TABLE ONLY ordenes_compra_detalle
    ADD CONSTRAINT ordenes_compra_detalle_pk PRIMARY KEY (codigo_detalle);
 Z   ALTER TABLE ONLY public.ordenes_compra_detalle DROP CONSTRAINT ordenes_compra_detalle_pk;
       public         postgres    false    204            �
           2606    24789     ordenes_compra ordenes_compra_pk 
   CONSTRAINT     a   ALTER TABLE ONLY ordenes_compra
    ADD CONSTRAINT ordenes_compra_pk PRIMARY KEY (codigo_orden);
 J   ALTER TABLE ONLY public.ordenes_compra DROP CONSTRAINT ordenes_compra_pk;
       public         postgres    false    202            �
           2606    24753    paises paises_pk 
   CONSTRAINT     L   ALTER TABLE ONLY paises
    ADD CONSTRAINT paises_pk PRIMARY KEY (pais_id);
 :   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_pk;
       public         postgres    false    196            �
           2606    24773    productos productos_pk 
   CONSTRAINT     \   ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pk PRIMARY KEY (anio, producto_id);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pk;
       public         postgres    false    200    200            �
           2606    24768    tipos_cliente tipos_cliente_pk 
   CONSTRAINT     b   ALTER TABLE ONLY tipos_cliente
    ADD CONSTRAINT tipos_cliente_pk PRIMARY KEY (tipo_cliente_id);
 H   ALTER TABLE ONLY public.tipos_cliente DROP CONSTRAINT tipos_cliente_pk;
       public         postgres    false    199            �
           2606    24808     clientes area_postal_clientes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY clientes
    ADD CONSTRAINT area_postal_clientes_fk FOREIGN KEY (codigo_postal) REFERENCES area_postal(codigo_postal);
 J   ALTER TABLE ONLY public.clientes DROP CONSTRAINT area_postal_clientes_fk;
       public       postgres    false    201    2783    198            �
           2606    24813 ,   ordenes_compra area_postal_ordenes_compra_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ordenes_compra
    ADD CONSTRAINT area_postal_ordenes_compra_fk FOREIGN KEY (codigo_postal) REFERENCES area_postal(codigo_postal);
 V   ALTER TABLE ONLY public.ordenes_compra DROP CONSTRAINT area_postal_ordenes_compra_fk;
       public       postgres    false    2783    202    198            �
           2606    24803 !   area_postal ciudad_area_postal_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY area_postal
    ADD CONSTRAINT ciudad_area_postal_fk FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id);
 K   ALTER TABLE ONLY public.area_postal DROP CONSTRAINT ciudad_area_postal_fk;
       public       postgres    false    198    2781    197            �
           2606    24828 )   ordenes_compra clientes_ordenes_compra_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ordenes_compra
    ADD CONSTRAINT clientes_ordenes_compra_fk FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id);
 S   ALTER TABLE ONLY public.ordenes_compra DROP CONSTRAINT clientes_ordenes_compra_fk;
       public       postgres    false    2789    201    202            �
           2606    24833 ?   ordenes_compra_detalle ordenes_compra_ordenes_compra_detalle_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ordenes_compra_detalle
    ADD CONSTRAINT ordenes_compra_ordenes_compra_detalle_fk FOREIGN KEY (codigo_orden) REFERENCES ordenes_compra(codigo_orden);
 i   ALTER TABLE ONLY public.ordenes_compra_detalle DROP CONSTRAINT ordenes_compra_ordenes_compra_detalle_fk;
       public       postgres    false    2791    202    204            �
           2606    24798    ciudades paises_ciudades_fk    FK CONSTRAINT     r   ALTER TABLE ONLY ciudades
    ADD CONSTRAINT paises_ciudades_fk FOREIGN KEY (pais_id) REFERENCES paises(pais_id);
 E   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT paises_ciudades_fk;
       public       postgres    false    197    196    2779            �
           2606    24823 :   ordenes_compra_detalle productos_ordenes_compra_detalle_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ordenes_compra_detalle
    ADD CONSTRAINT productos_ordenes_compra_detalle_fk FOREIGN KEY (anio, producto_id) REFERENCES productos(anio, producto_id);
 d   ALTER TABLE ONLY public.ordenes_compra_detalle DROP CONSTRAINT productos_ordenes_compra_detalle_fk;
       public       postgres    false    200    204    200    2787    204            �
           2606    24818 "   clientes tipos_cliente_clientes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY clientes
    ADD CONSTRAINT tipos_cliente_clientes_fk FOREIGN KEY (tipo_cliente_id) REFERENCES tipos_cliente(tipo_cliente_id);
 L   ALTER TABLE ONLY public.clientes DROP CONSTRAINT tipos_cliente_clientes_fk;
       public       postgres    false    2785    201    199            m      x�m}I��:��X�
��, �5�(^	J�T�����E�Ԋ�Nj%�Ǐ�Q�4�4�8p�h��;�o��e����P�MW�_�;s�����	���qn�$���,�'�.XS���=^��:�([����c7��pۆ:�
B��m�i-�vs;E"����O�u?\��?>�����5N��Џ�]�m��P/�m��ҵ�r��0G��h���} =�tŧp�5�-�+�#���HG�B�u�[A��
!�L��F�d���@~b=�C�K���tj�_M�:����8�G$�s'g�'�_�!���Փ�u�47z���E�.V��	G�Ih�_�H��njN�NH}BO$%����?>����EC�W��Ќ�~i�:��j�$����K��[�<�����ʔ��槹��%��o���;��6����U��_�F�B�D��}�M9�g�[��Lu/{��@�Ţ�U��om�o����tm�2�?��bi��⌟�d�ܗ�g��NN\?6G�c|ˢ7�V7!����9�����|!%VQ�D,'&K>�؅+ъ(��8�g�H�V�v���w�>��m�Y�S�h��qDm ��z���9��𜥵@��׆����8���:�J��]�a.H!����ؖ�.���1��Vgc���].Y�<��E6CZ���6�NN�QyR�YQ��3�cY���-ͷm�dX�t��q�O���I5��ש���J��U�G���G�`��ǉ�������%�hgNVE.]i_�a��V�%�V��Lz(\!tznd�9��濍O��=`�Ί�q���%��H�!l�+QG�9O��̉z���L�I�
?�Av^#¤��ҶGYG��Ʌ�L��5��82H���*(!�:r��ʀ�:a͏��#Vy%E�E����yb2�G�\ud .��R~�*%������wu#CDv6�_�=Ŷ��Pv�@���,�_�Zk	�s��	�d�n3X<��^����SN{�-��{�ņ�e~�B�O�5U��rξE-Yye��Ä��)��oai�>r
b�bϑ{02,t3uDw��=NRKƩ?h!�W��|�ei�q�Y�X����W�uP	'��z	m�[k��H�����)b'�$c�$GD4).O��x�I�!*�%�ᧇ�#,�vOrOI��l�~-cO3�"({S���ӭ�g8K�����I6�H���2�kO0�Xτ'�ٺ���o�
J���K���� B�f�#V����F4!*{]OdBM�]T�f�-��[]�Y���d����9�Q��7M����~LS���^\� �MTI�@mK�+�G�_�;�9/���h�G�fO���!j����=ɕ��y��X�Z�AuS�$$Mp����7�<bGMأ�@9B�t��
��q��C_�O,e��t�-l�*�؋�Su.�fOL#\��;�|J�M��e�Q�Ls﭅��2��ND�r
CK�$����w���m\��|!`��m9s)��Fs��Y�#�A�:N"��+)g)����z�A��<�d�d����flK�u���I7 �����)QA��Q{��h���5�RʓhQ2p`!�f(!)�H�rxa"C���%��.�F��Hd�(4B?�!I�,�S3ʭ�ԉ2"K�U��,+��'Q��5\,��b3+���9�GNTcSr�e,�F9��FH	�|�fl�G,��RN���^�g1R�&�@�l�&DER�a���:%��fT�h�6*���)�PDZ@���>�S0��il��y�hi�*�)�[j�;��8h�R~B�c�����9�)?�Ct�'����=ޅ��d����llh�}rn!ج��j@���.jR!^;�Ԙa���g��5���k�;�QP�ٱ�[�Mػ*^"�04�8)�M�n�h�,NY,3�oB�g�É�ٳ� �T"�L���8�!�K�V=kD�њ��f<n@E!�5b��8uFoJE��퀉���F4.1��|�D�2!��2b93AI^��hR�@A���K��,�Y���5� ��_/��q`��Webucd<�{�k͊�b"S��E2���f*غ�FQ��K�Gm�s�<��~�����Bd�ҝ�a8^Cb�*��Ds�&l[�mHO0��(�����E��mO�;�q<��o"t��x�2p�FZ�c�	ƌg�.K�73�2���B<�V�V)�*=��q5�$��c0c>5��'	��:ꪷ�ӽ[4�v�w"�'y-6�Y��P�A�1�D�m�!w���z����D"�Vh͜}�%��M_ήB��hE��ޠ9��41�.�h������Fb���uW���{�ҁNxx$����:����J��C�^Γ�����t�<� k�c��}���LMN@���$��g1�!nrm�߰���QE{�3n�d=+�`��I��8�^ED�A���b��i��<�M���=8��(s_�d�e��`�	a��Y���)���C �z�G;A�|�4��-�:�o����s�D����j�7x�6K�fb�S�H�XnÙ�9�PM��q�%����9�Jnjr$���ٚO8�aa�����=��k*%�b'���vBw����Z9ewS�Us��\���)+���w����''=cw�õ�V���LƕK����视�#V��z	F��o����{"nC�}�yP
K|��Dx]1t�͔E������۪ػ�)�� g�j���F+v��D��IPl��@��m+�b�*�6N��^��G<ܠ�V*9�A��DoXNW���M�!G����AO�!��$VsnZk+%���9��,��J��42�5��6�j�,9��vz\;C�b��'?��;� �,�\�Yj��d��E��I�!�w$�(�O
�ԄzX���������!xՓ^���v]S�M��F��Z�q��!{IE\�#�!{�:�[� �l����A�Ox�-HR�%��e$������.xfj�-�,'��90�S��9(��X�j��'z�r�P��NBtj���գ0�5��k$%����k&�p��P�up8%���Z���tdjo��6��t���#t�Q�����Ao�
n���P'+�͵M�!���71ڇ�	�K�R�"�pˏ)	9B5\��G幸mYzb���K4!*�g��o-���D���҃�2,]Ȉ���KŜ���]Lq��/�����<�,����#*�2���{��!�%.�򴠓��G[��H	;º��Ut����ⶵb2Kb�uo[p�>�q��-��6-`���r��j���;�V,�bpO����]��^Y�#+p	E�;i��73s�Nt�Rpé�&�*|�b�T$����CgY�2QO����"� [qX�݊/�➸^M���;J���z|�}�Ҽ$/Uu��%��k'��8�61���z�?�������2a�R1����Q%��R��}&�[뼊�v�祚�稲���914h�Kb?�UBa�j��=D5<_-�%�+��I(T;�gI+TQu�����N��OHy�T%EZIKx�[�Cf�?�����z���3��s����Jjƥ�L�i��7�����\�'��*i��F���6oc#{\���:X���$��8Gb6c��ؿT���d��zɢ�{d������C��K3mQM����bPB���v!Gh7-	�A	skT	��Կ_R! � `�}��牋�G����$\S=�z�Z�s]��N=K��D�Ql�h�V�]>�&�}S/=�)��Dp��7t%u������f:	�+�/}�W3/魉�5�3ڧS��n�pFd�w-���X/K�&�E�헻7��y.r�N��F'S+�3ҶnO�;QE�\�$����LP��'��S{G��v�H�u�,��s�.C��7N���.�9�K(��2����QYlժ��n�t��ft�kΖә�ti�q�ed��m6�g�s�r�3��H��/eΥ��>T#*>'�$�����"���8?���[@����t鹾̔N�̸��    [h���#��XJlsI۞����R{Yp�����oHni����}��K�Uu��?DL�6��n4��D��N���5��U�~�b�asg@I@4rz�*��J.�X�����}�}��N���8����)5A��p�a�;X�0V����}Y�n��9i�V\z :�0OP��P�x�!�'TO$OH����t(���m��eq��[�c�AE��M�j-��f�dyyX<.Q,�aݬ��y�W4F�H��-��������F�I��W�=��_Q�|��}�=QA�_lȊ0��gC���]8~����CE� DCVc-��|�Yߩ�\7�.uݺ��9t���4S�xo�y\�nE����*k��6u��n�b�bX(����M����XQ��Ҍ�2�������.5lZ⎸*R���9\qE]Q��Tq=���r�U<�"A�����#>�h����Õ{�8���rBZO��eC"�[����\9�ec]d���D�,���;-��%���F��@dMj������GS�
�I��f�'���^�!0�*�H��3�/m�]v�(�F������,6ԕ�s+y���}�󯺨��s���d�c�b��L쑺�����
��s��d������e��P�x�����������C 0�����d}>���Kw����b��5�ﾡ?Ȥ�L�<��/�2/Dȸ�*9𳻔�W�~H�H �Q'ļa�^�E��	ah*�"��}Ռ�pfAfPȗ�0"K�b��bg��m�2��	�g_�A�_�ت��������5щ6qV���%�N�m5�B	ҍ@�@���	N���hx.�'�F�y�/�����2�'�%$LF{%�S��ֈ4���
Z��H<�����Q`m�$��]���r�-}��'�^K\k�d�\����ngуN�z�m2h�Z=�d����(*�]z�:�K���*���,C+xVhf���VS�3W�hT	�pa ��-",�԰,enVm?����c��L��[C�|GbnՈ�����V�QgD��0�+�w���<�
>�&��8��x���(�Od	Au?NV����qYĥ�Ir~*E�^�A��^!+���~xQ�^!bU"�=�*!c��ZV��@�t��N�X>�@���4�BT1��^�� 	�DǗ�c�,-��Uk�1�CAD|a��ޡ�=�c�s��
�	)P�Ex��D��$�G5��d��D�R�:�zV�4JtL�pL�� >~ٮ�����͜�T��=��u���x�*E�RF=;5"9�vi���9���+�FͦwL� ܷ!�N��$͏K�9��0O�VJ	�X5l?v�~W��{1Bk�F&[H�c������XxS�2ܒ?��9,A*����4o��@Rv!=@�sT)?+�0���^3��{x�G�W��Z!c�g����E� 2��T���hAT-�0���Q4=�C�ޢ����{������eCe�w���p̰p�����m���;�OY���
�cJ~�pp�����1�Aa�y0,!Ư�b،q!OY��=��Y�f6�H��xw��p���8G��]�.)���@���4���M}"UB���=O4%�����	%rJ�G�U�I�"��SɎ�f��SV�����:Vr��W�c�cv�9jh��v�_��~��HCR���J��+~��p�N	�6�E�P��gQ�"tȸA�M[}�n����F[{�����A䆨E�����'�%��h�&+
�]���M>�,%�SP#�pF�W�_��Q�r�5�n7�UEp�c>�R>A��-�� �)A��Ȗ�K�8C)�ω��F������b+^���B����4��K\*��%t��G��k~<_�Ev�k�2��c��l��l����Ŧ���
�đ��eس���!��;*i��,&��1�M�����l��W�
g���:�������*1<wф!91**�D��P�X/a��u�O�d����'F?F^�2H�v�K�q����4�{�l�d�^¸g��'�v����!H\�:�嘕���h`�ֿz�� ؗ0Cb	���;�%Q�wn�����56�A����VG�cV~�����'G�y�����kǔ�9-�d%���jw�(HI��I���Aܭ8\\��ݷ�e�ekd�c�~>K,!�sa9&�(�i-3��1�d2q�)[�?X�c
~4+ �2�����%�F�.���"7�)QF�_\�P��R�bW/�#�쳱�Z��?n�F*����]��J�`�F�'���o�$UT��F�H#F��Y,fD�(�t�-�X+���C <�pm����2l��rL�q�+��\l��(�gr䇙t"�7��4����5��1�Gi��g���s� c�hc�brp�Zk9	��#�b��M̜;�sw��˥��=G'��D�EW� �lܒT�qD��KU}fؐH���J�;lHӥ�x�`t�Tw.r�9�m�3m���#�삟-K��#��؊�t�ES�W��6x�K�4��Oa��K2�/l��l������gĮ8�8��g�7tA�Ώ@7~ƻ*̩Q0���a���e4�p���Y��D��Z��z~J	m<6��p���*z����J�y��)8�~�_(�@���K���kUܯ8�eDw��Cpsg�=�@	�J�8Cx�51#��[���m�$wp鄼%���d���+Z��^[)�_(G�t	UN@�, ��}���	yT�'s!����\�P���g~�@<���v���o�Q�l�4(���(�#�ƅ�q&�	�=�ͬZ����	�w��
�}}ɵ����SB�c�p�w��6h�	K���W=т�.�G���p?��P9v��,����5;��(źҍ��X��<����$E��)���soHBD���(�9��\���x�=�N�+p�p3���#��G\@O���Z��~���`�E� �9s��%�G�U�9m�'��+����!q<:�Ҡ:$w�����߈����HS�$���ܣ�3�\qG�B�3�1_O=cLT$�Joۨ�H�z�ψ uLT��^i��Ų�e���>�K2�^� ��1�����GEr��{�+���u8�Rͅ�)��9�<%�e����"�-H�9T��[,pQ���B��KU&&�)ݹ��"�y~�ǹ_[L	j��ѽ�'�X,�i��k,ZP����by��/jn1O?�z��f��E�ؑ]���������%�J��[�]O5x�E��(�����v��OԻ��qg�5[��
J�#�fP	S:���&����
��Dm	z���u Qf�	"�齽��2|Nk���ޓ�Z�t��˗3��|�+����]��&�7HCd�cq�?�����ϸ,UƥB��4��k��T��f�>�B�
Sx�K���Ƈ�	��C�g�Q(w�Gd}�GAOP��:sSz��˸��媔l�`=Qp	:�z�;\���.�VnR�i�p	o����U21�tx)X���l��"69�$JW�u!:i+T�g��.<6����U���<s��D�DU�M5��M�r����U�ĉ�xL�*���_�����W�mD�&�x꠨"�P�T��뮥ʓZ(7/BR:�\���?��I�.c|�����J1n�9�F�tUş+af %�#�*j������C�c+� L�J�$�� x̯�]L�g���K���h�O��K�}�����d����$��\��jAʯ�L����C��h���7��p)!VA-8#�Q�A*0�T15	��;#��Ȱ�(|�S�������ܚw ��󋉑�d��%��jGib�cZ��c'g���Jl�V:��2z赒L�b����j��X���m阿�)��)�]�N�K*��"ǼI-Z��L�Th�Dޙ�ΘD���,̡t��	�%�/W[�����I�����NN�&�5�鉰�촙͎��0���覐�s����W}�+�Yn��;$�G;~i�n�ӻa�dӱ�asL�t���aL�$.CsT��
<ƛ��@ 
  �]즺�L��.��1�?��b����z�cQ�t0�?M~$∨*�H���H�P41t�Կ����O$IIR�sk�e+h~*V�Dn�r#;��7C�4�~����� ���!쫧�(�����������X���H�WHz��[�#OV�%+~^?��X�H�6X�K�[�x��U��t�$i�UزF��~A�� ��3��3�K%�޳hP��=��0�����_zh Zg�c3X�j��[�.��0�n�W�H��R��IfWfR���A6�����y�ZiCЋ�����0�^����<��	��P�m�vB�����h�1&Q�p�Rx��}:m���n���X��-�fK��U��|KE�qa���hD	�z��k� a���0��>�o����G(��>#j�3�H��x��W� (NP�T)�����T�����AA	]0���˘r(�J_/s�r�����{��_�ֶA���B�z<b�z�H_\�E��?�3���e<�ȑ�mH%���l\�����3]�{ue�eF~��� N2sĈ��nQ��ҘF��:��������C@�셦7ڔ��Z�I���q{�e;�"��6/��X��PWK�Ӓ�%���,ɩ�%��,b����wZZ�t��bB���bU ��{4D���d����7��m�/ZnS��_ٹ���^�èl�4dkyX�T�e��t�Y��Ľ��=df+�:2QN�G��H̦��W���6)�`?P����#���6�����@���s�xU��$�c�܊2�1[Nѹe7~P�G��^��Lv�ɜ'E�z\!ՙ��M�B��^bΑ��sP���O�H���"��C�����}J���9�/9�_��g�Y6��B�j�?���y��K�6]�i�?ۈ�W3i���pr����+���b�SjC�mk���[��l�z7����9x�_�ޏIN�?�u5��Q����@"�`H}��/+/YF�(���ǋ&�K����R�B������13%g�k]�I�"*]��a��%�zau%�K:�������M3�L4>b{��Z��P+c��c
��Ha�Ф��VJ�`���,T�)�)�1ꔑZ+s��mD�{E6_-���K�<(g�Q���φhB��ߵ{W�H�DҌ���<�H)��ΰ��\(?;a\t0�Hᇏ#qD�`XO�Q�B��M�"�K�Ds�x\�Nc�����W�)W�Q��δ���<,�'�w6k�c�~�T�R2�ˌ�4�P���-3�<�I4��.L��x����/�1ӛ+��{�Y���l�2n�tx�}Ҙ&��Ǟ�Uͧ"ߪ�7*��h�z��3Q�;�#�X��i�[��E"����\d3^z%,b:k�d���>B���,a��?��>�b����R�?]�ԃG��(!��L8%̗Sn��A��:��K��NA��T�<�G�hacU�)$J�{��'��:�;�����#˯oI� n\������7�Ѐ�����%чe�eӒ\sn5�� X�!��	�	�I�vh/x�lh�n2<�6ީ%�a螯��2E��=���̜�+�\�|��;t,�X�|��:'����?�S���Z�gD���鯛!�Z�[�����3�?<�y����B��F��6�g0��,>§h��N���Z��-��Р �7��ݿ ��='���tF��h���_]X�Q�/VX�,Sx"q�A��G�0e!g�����]L�~�o���;��gܬ�K�
�c{;8�V�'P��J�n�[$�>;��={��(6|�S�(�������#��m��`Z�>o�3�{�<����&հ���+HY�I�[>w���B���x���P� g��?lv������~�����h��z~��������Q�r��Q��o���͈��t5ϡ�y�,�U�����3�Q�I���jh���k^�'����!r����Ok(e�:UD�mD�"��|���r-�x�D�����K�9;�JIJMmh[8�=_"W�C���з��Bnӷ��P�M�n+_.��TG-��~o��E�x�mj!B��D�b_r�e��`�x��;1��`Bpw���ߐӃ�9�$��WV�`F��;B�vSCY�=*�!as��p��E�g�Ez�$����l^�XBl���N���;��2+$ɖ^Ȋ��E9�6[Kт脸���,-Y��d01�Q�r��:��'������8��`��l�����,��^�~²u��A�w����iy���&�){e���p���]�6[=V#II��R���3D�'O���g\��꼑� ;���嫻���x��<c9��o���@�ax���p���oËm�K�Wϛg�&~Ta���\�gĦ0szh^D�J�DI�	�'��)bZ�v����+�&x��G��'��	p�{����2������[�v�\f���K��wN$��~m�[���R�^���<�N|jO����.QLkבI8�D!&�Zr�s�:����VLX�W�X��Z1/��m��<}�H�L����'eRN]J�N��%���}��� R�\���E�٧�dna~����;�W���S�˗�n��]�����_�~���R$      l   c  x�UW͎�<��B��X?c����ӡH-%9��K�/�\`�$�L�b��ny��t�b7��խc}����6n>��p��ͯPr�Պ���F����Hn���f����I�mtEv:�\\�>}I.]��s��
�|��g��f}�����Ԛ�5���^K�>V�c����{��U_��@ug��W7#}�$��M!�j�i��O%������(x� UGG���o�=�y�!Ӕ~�z�����S��x�FA]�&Y!�D�T�ݹi�q�3��%��x�ւ:�Qhv�A�↰-]���$�Vc^��ö��N�[�}g�rw��i8����iJ�)�F;4�n�����w������c����nu㖾��X�Kb�J��ivʞ[���AGO��~��b+�����4b	y �	��ߖ@S��q���ޥBv�p�uK�^�'cÔ����d���y>9�I9<�f�W��t!�Y����(��V��,�Hz��Y�H����.x��#͓�:��Κ"�D������@���wC�gMs �k�͹���#7�b�z-ya`-��+��s�팎��]>��~�|q�.����\w2}�τ�L����SHq��)f���wN����g���/|���Cp��h�Y��j�ۗ����]s���vs��\��.����꽡�:���՘ۢD�4.[aM�
;��O��$��FK��'(�#�UĮUZ�Ǎ��+���,���~Y��W��������R��*u_���q��+9me�V�ͱ��F�z8�@�R"O�Q>�@�����B8�|ۀ-��͋���%O�
�bq�˧T��o�ؓ�V�OdPU!�B����"���R���G�>�G��0���^�����NK��	ᑼ�;�[�Z��4���9�u���q��5Иo�Fcr\u��7�Iҡ������j�x�Yt��>
	F!�(�#�'�s�U��ں���ưV���ĨJ- �8Ez��	�_u�W���Jj�Ll��{���7$�~�9������hv�vo�F����!�{`���}�>��I	zA�]e��� ��������a�	���@n�:$�;W��h41�A����dbmZUQ3m��5�I_�Z�;ng�9�gtw2Q��>}s�aF�C�w� ����*��A?������������F�;z���}B�����%�ax:��"�%�R϶[rl:r^9��g��u���*/;ZU��13�{ƀU�*-7�o��r#� �6{���a�R�6�L�G�1i������4Q�DM��"ݫ������e7y��M��C�VV7�{��2�[r�Յ��v�}����s�߁������OR^��BZ���E�Obh�/��KVϋ9WǠ6��7�80{Փ��"ل��'|��9-~uO��ᾈ����ѩ��4���6�\����SM�����d�C6��3�{ 9O[k��XX6�hg�8�>���9�����w·��x�K#mS��d� #!�Ȟ?�͒�!������J��]-ZZ6����f��U�W���J�A8E��V1D/�&�	L�+k�#�m>yb�$���#�s'&�ڦ�D��OY�iS��@ǻ:H*]��2N˒��	�GO�H�i���>��tZ��nr�Ƒ뤼��ԑ�F�.�IY�3���<4{3D�b�et5����.n)��af[7ѕ�z�r���D5���R��q7M�P�sƋCO�f7`�;4։0����ѡ� {le���T�η���§6��4��뒧��ڴ�������M���aXa�7�ka�.�p��?�-�W�����w9��O���o5Ӊ��f-�ަ��6�t܀jA;���{������}��W_���׷������_�;�Hjy������8��/�����T��      p   �   x�U�Aj�0EףS���%v��h�!ŮӢM7J,b�,Y.���JlhW����J+s��AB��U�4NO��̐�kl.q>M�u6�gDlwe'�����`=�|�<�뀧H�0[;���ѻ޻ı�uk_����V�`���IA^>Hx<�z���V��!��jt�-�_8����0^H(�<g�^���S�x���>�/������GF�1W�      q   g   x�646�447045�t61��4204�50�54�t,�Sp�=��(39Q���P��Ԝ+��Ā��ل����"�ܔ�-'5�D!��H��Y@���j��,F��� �b      s   a   x�Eͻ�0@����ۙ#m��#�R!����:��pb����l��(cl�#��e4���1���N/3K�7��6����鈥�_V��Y��      k   p   x��1�0��>'�����bA]~!��B��8TǮ]s�z~�sB�}Ҧ�=�]iCU��i�G���I���<�Sܑ�COA3vT�$˅�T���<о੷Bs馬k�獙�($      o   �   x�}��
�0�s�>�4�Zwvr�vS��$P{��`�z�ǟ?!� ���Q"^w��X��%!���֐E�w.�����\�3�5H���%�2�n������jr�b�afx0�4/ۦT��
��f��?�ˇ�?�1�{Rm�      n   "   x�����I-N�I�
�J-I������� qQ}     