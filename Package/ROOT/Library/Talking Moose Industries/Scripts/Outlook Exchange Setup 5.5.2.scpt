FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��

--------------------------------------------
Outlook Exchange Setup 5
� Copyright 2008-2018 William Smith
bill@talkingmoose.net

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/4.0/

This file is one of four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.5.2.scpt
2. OutlookExchangeSetupLaunchAgent.sh
3. net.talkingmoose.OutlookExchangeSetupLaunchAgent.plist
4. com.microsoft.Outlook.plist for creating a configuraiton profile

These scripts and files may be freely modified for personal or commercial
purposes but may not be republished for profit without prior consent.

If you find these resources useful or have ideas for improving them,
please let me know. It is only compatible with Outlook 2016 for Mac.

--------------------------------------------

This script assists a user with the setup of his Exchange account
information. Below are basic instructions for using the script.
Consult the Outlook Exchange Setup 5 Administrator's Guide
for complete details.

1.	Customize the "network and  server properties" below with information
	appropriate to your network.
	
2.	Deploy this script to a location on your Macs such as
	"/Library/CompanyName/Outlook Exchange Setup 5.5.2.scpt".

3. 	Deploy the recommended "Outlook preferences.mobileconfig"
	configuration profile to eliminate Outlook's startup windows.
	This assumes you're using the volume license edition
	of Office 2016 for Mac.
	
4.	Deploy the OutlookExchangeSetup5.plist file to
	/Library/LaunchAgents. Update the path to point to the
	OutlookExchangeSetup5.5.2.scpt script.
	  
This script assumes the user's full name is in the form of "Last, First",
but is easily modified if the full name is in the form of "First Last".
It works especially well if the Mac is bound to Active Directory where
the user's short name will match his login name. Optionally, you cans set dscl
to pull the user's mail from a directory service.

     � 	 	� 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 O u t l o o k   E x c h a n g e   S e t u p   5 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 8   W i l l i a m   S m i t h 
 b i l l @ t a l k i n g m o o s e . n e t 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 T h i s   f i l e   i s   o n e   o f   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 5 . 2 . s c p t 
 2 .   O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . s h 
 3 .   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t 
 4 .   c o m . m i c r o s o f t . O u t l o o k . p l i s t   f o r   c r e a t i n g   a   c o n f i g u r a i t o n   p r o f i l e 
 
 T h e s e   s c r i p t s   a n d   f i l e s   m a y   b e   f r e e l y   m o d i f i e d   f o r   p e r s o n a l   o r   c o m m e r c i a l 
 p u r p o s e s   b u t   m a y   n o t   b e   r e p u b l i s h e d   f o r   p r o f i t   w i t h o u t   p r i o r   c o n s e n t . 
 
 I f   y o u   f i n d   t h e s e   r e s o u r c e s   u s e f u l   o r   h a v e   i d e a s   f o r   i m p r o v i n g   t h e m , 
 p l e a s e   l e t   m e   k n o w .   I t   i s   o n l y   c o m p a t i b l e   w i t h   O u t l o o k   2 0 1 6   f o r   M a c . 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 T h i s   s c r i p t   a s s i s t s   a   u s e r   w i t h   t h e   s e t u p   o f   h i s   E x c h a n g e   a c c o u n t 
 i n f o r m a t i o n .   B e l o w   a r e   b a s i c   i n s t r u c t i o n s   f o r   u s i n g   t h e   s c r i p t . 
 C o n s u l t   t h e   O u t l o o k   E x c h a n g e   S e t u p   5   A d m i n i s t r a t o r ' s   G u i d e 
 f o r   c o m p l e t e   d e t a i l s . 
 
 1 . 	 C u s t o m i z e   t h e   " n e t w o r k   a n d     s e r v e r   p r o p e r t i e s "   b e l o w   w i t h   i n f o r m a t i o n 
 	 a p p r o p r i a t e   t o   y o u r   n e t w o r k . 
 	 
 2 . 	 D e p l o y   t h i s   s c r i p t   t o   a   l o c a t i o n   o n   y o u r   M a c s   s u c h   a s 
 	 " / L i b r a r y / C o m p a n y N a m e / O u t l o o k   E x c h a n g e   S e t u p   5 . 5 . 2 . s c p t " . 
 
 3 .   	 D e p l o y   t h e   r e c o m m e n d e d   " O u t l o o k   p r e f e r e n c e s . m o b i l e c o n f i g " 
 	 c o n f i g u r a t i o n   p r o f i l e   t o   e l i m i n a t e   O u t l o o k ' s   s t a r t u p   w i n d o w s . 
 	 T h i s   a s s u m e s   y o u ' r e   u s i n g   t h e   v o l u m e   l i c e n s e   e d i t i o n 
 	 o f   O f f i c e   2 0 1 6   f o r   M a c . 
 	 
 4 . 	 D e p l o y   t h e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   t o 
 	 / L i b r a r y / L a u n c h A g e n t s .   U p d a t e   t h e   p a t h   t o   p o i n t   t o   t h e 
 	 O u t l o o k E x c h a n g e S e t u p 5 . 5 . 2 . s c p t   s c r i p t . 
 	     
 T h i s   s c r i p t   a s s u m e s   t h e   u s e r ' s   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " L a s t ,   F i r s t " , 
 b u t   i s   e a s i l y   m o d i f i e d   i f   t h e   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " F i r s t   L a s t " . 
 I t   w o r k s   e s p e c i a l l y   w e l l   i f   t h e   M a c   i s   b o u n d   t o   A c t i v e   D i r e c t o r y   w h e r e 
 t h e   u s e r ' s   s h o r t   n a m e   w i l l   m a t c h   h i s   l o g i n   n a m e .   O p t i o n a l l y ,   y o u   c a n s   s e t   d s c l 
 t o   p u l l   t h e   u s e r ' s   m a i l   f r o m   a   d i r e c t o r y   s e r v i c e . 
 
   
  
 l     ��������  ��  ��        l     ��  ��      global logMesage     �   "   g l o b a l   l o g M e s a g e      l     ��������  ��  ��        l     ��  ��    0 *------------------------------------------     �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    , & Begin network, server and preferences     �   L   B e g i n   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s      l     ��   ��    0 *------------------------------------------      � ! ! T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   " # " l     ��������  ��  ��   #  $ % $ l     ��������  ��  ��   %  & ' & l     �� ( )��   ( C =------------- Exchange Server settings ----------------------    ) � * * z - - - - - - - - - - - - -   E x c h a n g e   S e r v e r   s e t t i n g s   - - - - - - - - - - - - - - - - - - - - - - '  + , + l     ��������  ��  ��   ,  - . - j     �� /�� 0 usekerberos useKerberos / m     ��
�� boovtrue .  0 1 0 l     �� 2 3��   2 B < Set this to true only if Macs in your environment are bound    3 � 4 4 x   S e t   t h i s   t o   t r u e   o n l y   i f   M a c s   i n   y o u r   e n v i r o n m e n t   a r e   b o u n d 1  5 6 5 l     �� 7 8��   7 C = to Active Directory and your network is properly configured.    8 � 9 9 z   t o   A c t i v e   D i r e c t o r y   a n d   y o u r   n e t w o r k   i s   p r o p e r l y   c o n f i g u r e d . 6  : ; : l     ��������  ��  ��   ;  < = < j    �� >��  0 exchangeserver ExchangeServer > m     ? ? � @ @ ( e x c h a n g e . e x a m p l e . c o m =  A B A l     �� C D��   C 6 0 Address of your organization's Exchange server.    D � E E `   A d d r e s s   o f   y o u r   o r g a n i z a t i o n ' s   E x c h a n g e   s e r v e r . B  F G F l     ��������  ��  ��   G  H I H j    �� J�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL J m    ��
�� boovtrue I  K L K l     �� M N��   M   True for most servers.    N � O O .   T r u e   f o r   m o s t   s e r v e r s . L  P Q P l     ��������  ��  ��   Q  R S R j   	 �� T�� .0 exchangeserversslport ExchangeServerSSLPort T m   	 
����� S  U V U l     �� W X��   W @ : If ExchangeServerRequiresSSL is true set the port to 443.    X � Y Y t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . V  Z [ Z l     �� \ ]��   \ @ : If ExchangeServerRequiresSSL is false set the port to 80.    ] � ^ ^ t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . [  _ ` _ l     �� a b��   a L F Use a different port number only if your administrator instructs you.    b � c c �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   a d m i n i s t r a t o r   i n s t r u c t s   y o u . `  d e d l     ��������  ��  ��   e  f g f j    �� h�� "0 directoryserver DirectoryServer h m     i i � j j  g c . e x a m p l e . c o m g  k l k l     �� m n��   m Z T Address of an internal Global Catalog server (a type of Windows domain controller).    n � o o �   A d d r e s s   o f   a n   i n t e r n a l   G l o b a l   C a t a l o g   s e r v e r   ( a   t y p e   o f   W i n d o w s   d o m a i n   c o n t r o l l e r ) . l  p q p l     �� r s��   r L F The LDAP server in a Windows network will be a Global Catalog server,    s � t t �   T h e   L D A P   s e r v e r   i n   a   W i n d o w s   n e t w o r k   w i l l   b e   a   G l o b a l   C a t a l o g   s e r v e r , q  u v u l     �� w x��   w 2 , which is separate from the Exchange Server.    x � y y X   w h i c h   i s   s e p a r a t e   f r o m   t h e   E x c h a n g e   S e r v e r . v  z { z l     ��������  ��  ��   {  | } | j    �� ~�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication ~ m    ��
�� boovtrue }   �  l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 80 directoryserverrequiresssl DirectoryServerRequiresSSL � m    ��
�� boovtrue �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 00 directoryserversslport DirectoryServerSSLPort � m    ����� �  � � � l     �� � ���   � B < If DirectoryServerRequiresSSL is true set the port to 3269.    � � � � x   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   3 2 6 9 . �  � � � l     �� � ���   � C = If DirectoryServerRequiresSSL is false set the port to 3268.    � � � � z   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   3 2 6 8 . �  � � � l     �� � ���   � U O Use a different port number only if your Exchange administrator instructs you.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   E x c h a n g e   a d m i n i s t r a t o r   i n s t r u c t s   y o u . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� >0 directoryservermaximumresults DirectoryServerMaximumResults � m    ����� �  � � � l     �� � ���   � G A When searching the Global Catalog server, this number determines    � � � � �   W h e n   s e a r c h i n g   t h e   G l o b a l   C a t a l o g   s e r v e r ,   t h i s   n u m b e r   d e t e r m i n e s �  � � � l     �� � ���   � 0 * the maximum number of entries to display.    � � � � T   t h e   m a x i m u m   n u m b e r   o f   e n t r i e s   t o   d i s p l a y . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 60 directoryserversearchbase DirectoryServerSearchBase � m     � � � � �   �  � � � l     �� � ���   � + % example: "cn=users,dc=domain,dc=com"    � � � � J   e x a m p l e :   " c n = u s e r s , d c = d o m a i n , d c = c o m " �  � � � l     �� � ���   �   Usually, this is empty.    � � � � 0   U s u a l l y ,   t h i s   i s   e m p t y . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � D >------------- For Active Directory users ---------------------    � � � � | - - - - - - - - - - - - -   F o r   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j     �� ��� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory � m    ��
�� boovtrue �  � � � l     �� � ���   � N H If Macs are bound to Active Directory via dsconfigad/Directory Utility,    � � � � �   I f   M a c s   a r e   b o u n d   t o   A c t i v e   D i r e c t o r y   v i a   d s c o n f i g a d / D i r e c t o r y   U t i l i t y , �  � � � l     �� � ���   � ^ X they can use dscl to return the current user's email address, phone number, title, etc.    � � � � �   t h e y   c a n   u s e   d s c l   t o   r e t u r n   t h e   c u r r e n t   u s e r ' s   e m a i l   a d d r e s s ,   p h o n e   n u m b e r ,   t i t l e ,   e t c . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � > 8------------- For Office 365 users ---------------------    � � � � p - - - - - - - - - - - - -   F o r   O f f i c e   3 6 5   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j   ! #�� ��� *0 useemailforusername useEmailForUsername � m   ! "��
�� boovfals �  � � � l     �� � ���   � S M Office 365 and similar mail services may require the username to be the same    � � � � �   O f f i c e   3 6 5   a n d   s i m i l a r   m a i l   s e r v i c e s   m a y   r e q u i r e   t h e   u s e r n a m e   t o   b e   t h e   s a m e �  � � � l     �� � ���   � P J as the email address. Set this to true if the username is the same as the    � � � � �   a s   t h e   e m a i l   a d d r e s s .   S e t   t h i s   t o   t r u e   i f   t h e   u s e r n a m e   i s   t h e   s a m e   a s   t h e �  � � � l     �� � ���   �   email address.    � � � �    e m a i l   a d d r e s s . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � B <------------- For non Active Directory users ---------------    � � � � x - - - - - - - - - - - - -   F o r   n o n   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - �    l     ��������  ��  ��    j   $ (���� 0 
domainname 
domainName m   $ ' �  e x a m p l e . c o m  l     ��	
��  	 P J Complete this only if not using Active Directory to get user information.   
 � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     ����   L F The part of your organization's email address following the @ symbol.    � �   T h e   p a r t   o f   y o u r   o r g a n i z a t i o n ' s   e m a i l   a d d r e s s   f o l l o w i n g   t h e   @   s y m b o l .  l     ����~��  �  �~    j   ) +�}�} 0 emailformat emailFormat m   ) *�|�|   l     �{�{   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     �z�z   P J When Active Directory is unavailable to determine a user's email address,    � �   W h e n   A c t i v e   D i r e c t o r y   i s   u n a v a i l a b l e   t o   d e t e r m i n e   a   u s e r ' s   e m a i l   a d d r e s s ,  !  l     �y"#�y  " V P this script will attempt to parse it from the display name of the user's login.   # �$$ �   t h i s   s c r i p t   w i l l   a t t e m p t   t o   p a r s e   i t   f r o m   t h e   d i s p l a y   n a m e   o f   t h e   u s e r ' s   l o g i n .! %&% l     �x�w�v�x  �w  �v  & '(' l     �u)*�u  ) 1 + Describe your organization's email format:   * �++ V   D e s c r i b e   y o u r   o r g a n i z a t i o n ' s   e m a i l   f o r m a t :( ,-, l     �t./�t  . / ) 1: Email format is first.last@domain.com   / �00 R   1 :   E m a i l   f o r m a t   i s   f i r s t . l a s t @ d o m a i n . c o m- 121 l     �s34�s  3 * $ 2: Email format is first@domain.com   4 �55 H   2 :   E m a i l   f o r m a t   i s   f i r s t @ d o m a i n . c o m2 676 l     �r89�r  8 N H 3: Email format is flast@domain.com (first name initial plus last name)   9 �:: �   3 :   E m a i l   f o r m a t   i s   f l a s t @ d o m a i n . c o m   ( f i r s t   n a m e   i n i t i a l   p l u s   l a s t   n a m e )7 ;<; l     �q=>�q  = . ( 4: Email format is shortName@domain.com   > �?? P   4 :   E m a i l   f o r m a t   i s   s h o r t N a m e @ d o m a i n . c o m< @A@ l     �p�o�n�p  �o  �n  A BCB j   , .�mD�m 0 displayname displayNameD m   , -�l�l C EFE l     �kGH�k  G P J Complete this only if not using Active Directory to get user information.   H �II �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .F JKJ l     �jLM�j  L M G Describe how the user's display name appears at the bottom of the menu   M �NN �   D e s c r i b e   h o w   t h e   u s e r ' s   d i s p l a y   n a m e   a p p e a r s   a t   t h e   b o t t o m   o f   t h e   m e n uK OPO l     �iQR�i  Q R L when clicking the Apple menu (Log Out Joe Cool... or Log Out Cool, Joe...).   R �SS �   w h e n   c l i c k i n g   t h e   A p p l e   m e n u   ( L o g   O u t   J o e   C o o l . . .   o r   L o g   O u t   C o o l ,   J o e . . . ) .P TUT l     �hVW�h  V / ) 1: Display name appears as "Last, First"   W �XX R   1 :   D i s p l a y   n a m e   a p p e a r s   a s   " L a s t ,   F i r s t "U YZY l     �g[\�g  [ . ( 2: Display name appears as "First Last"   \ �]] P   2 :   D i s p l a y   n a m e   a p p e a r s   a s   " F i r s t   L a s t "Z ^_^ l     �f�e�d�f  �e  �d  _ `a` j   / 3�cb�c 0 domainprefix domainPrefixb m   / 2cc �dd  a efe l     �bgh�b  g Y S Optionally append a NetBIOS domain name to the beginning of the user's short name.   h �ii �   O p t i o n a l l y   a p p e n d   a   N e t B I O S   d o m a i n   n a m e   t o   t h e   b e g i n n i n g   o f   t h e   u s e r ' s   s h o r t   n a m e .f jkj l     �alm�a  l 9 3 Be sure to use two backslashes when adding a name.   m �nn f   B e   s u r e   t o   u s e   t w o   b a c k s l a s h e s   w h e n   a d d i n g   a   n a m e .k opo l     �`qr�`  q N H Example: Use "TALKINGMOOSE\\" to set user name "TALKINGMOOSE\username".   r �ss �   E x a m p l e :   U s e   " T A L K I N G M O O S E \ \ "   t o   s e t   u s e r   n a m e   " T A L K I N G M O O S E \ u s e r n a m e " .p tut l     �_�^�]�_  �^  �]  u vwv l     �\�[�Z�\  �[  �Z  w xyx l     �Yz{�Y  z C =------------- User Experience -------------------------------   { �|| z - - - - - - - - - - - - -   U s e r   E x p e r i e n c e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -y }~} l     �X�W�V�X  �W  �V  ~ � j   4 8�U��U (0 verifyemailaddress verifyEMailAddress� m   4 5�T
�T boovfals� ��� l     �S���S  � M G If set to "true", a dialog asks the user to confirm his email address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   e m a i l   a d d r e s s .� ��� l     �R�Q�P�R  �Q  �P  � ��� j   9 =�O��O *0 verifyserveraddress verifyServerAddress� m   9 :�N
�N boovfals� ��� l     �M���M  � W Q If set to "true", a dialog asks the user to confirm his Exchange server address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �L�K�J�L  �K  �J  � ��� j   > B�I��I *0 displaydomainprefix displayDomainPrefix� m   > ?�H
�H boovfals� ��� l     �G���G  � C = If set to "true", the username appears as "DOMAIN\username".   � ��� z   I f   s e t   t o   " t r u e " ,   t h e   u s e r n a m e   a p p e a r s   a s   " D O M A I N \ u s e r n a m e " .� ��� l     �F���F  � 5 / Otherwise, the username appears as "username".   � ��� ^   O t h e r w i s e ,   t h e   u s e r n a m e   a p p e a r s   a s   " u s e r n a m e " .� ��� l     �E�D�C�E  �D  �C  � ��� j   C G�B��B *0 downloadheadersonly downloadHeadersOnly� m   C D�A
�A boovfals� ��� l     �@���@  � H B If set to "true", only email headers are downloaded into Outlook.   � ��� �   I f   s e t   t o   " t r u e " ,   o n l y   e m a i l   h e a d e r s   a r e   d o w n l o a d e d   i n t o   O u t l o o k .� ��� l     �?���?  � B < This takes much less time to sync but a user must be online   � ��� x   T h i s   t a k e s   m u c h   l e s s   t i m e   t o   s y n c   b u t   a   u s e r   m u s t   b e   o n l i n e� ��� l     �>���>  � %  to download and view messages.   � ��� >   t o   d o w n l o a d   a n d   v i e w   m e s s a g e s .� ��� l     �=�<�;�=  �<  �;  � ��� j   H L�:��: 20 hideonmycomputerfolders hideOnMyComputerFolders� m   H I�9
�9 boovfals� ��� l     �8���8  � - ' If set to "true", hides local folders.   � ��� N   I f   s e t   t o   " t r u e " ,   h i d e s   l o c a l   f o l d e r s .� ��� l     �7���7  � ; 5 A single Exchange account should do this by default.   � ��� j   A   s i n g l e   E x c h a n g e   a c c o u n t   s h o u l d   d o   t h i s   b y   d e f a u l t .� ��� l     �6�5�4�6  �5  �4  � ��� j   M Q�3��3 0 unifiedinbox unifiedInbox� m   M N�2
�2 boovfals� ��� l     �1���1  � C = If set to "true", turns on the Group Similar Folders feature   � ��� z   I f   s e t   t o   " t r u e " ,   t u r n s   o n   t h e   G r o u p   S i m i l a r   F o l d e r s   f e a t u r e� ��� l     �0���0  � / ) in Outlook menu > Preferences > General.   � ��� R   i n   O u t l o o k   m e n u   >   P r e f e r e n c e s   >   G e n e r a l .� ��� l     �/�.�-�/  �.  �-  � ��� j   R V�,��, (0 enableautodiscover enableAutodiscover� m   R S�+
�+ boovtrue� ��� l     �*���*  � < 6 If set to "true", disables Autodiscover functionality   � ��� l   I f   s e t   t o   " t r u e " ,   d i s a b l e s   A u t o d i s c o v e r   f u n c t i o n a l i t y� ��� l     �)���)  � C = for the Exchange account. Not recommended for mobile devices   � ��� z   f o r   t h e   E x c h a n g e   a c c o u n t .   N o t   r e c o m m e n d e d   f o r   m o b i l e   d e v i c e s� ��� l     �(���(  � B < that may connect to an internal Exchange server address and   � ��� x   t h a t   m a y   c o n n e c t   t o   a n   i n t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s   a n d� ��� l     �'���'  � ? 9 connect to a different external Exchange server address.   � ��� r   c o n n e c t   t o   a   d i f f e r e n t   e x t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �&�%�$�&  �%  �$  � ��� j   W ]�#��# 0 errormessage errorMessage� m   W Z�� ��� � O u t l o o k ' s   s e t u p   f o r   y o u r   E x c h a n g e   a c c o u n t   f a i l e d .   P l e a s e   c o n t a c t   t h e   H e l p   D e s k   f o r   a s s i s t a n c e .� ��� l     �"���"  � T N Customize this error message for your users in case their account setup fails   � ��� �   C u s t o m i z e   t h i s   e r r o r   m e s s a g e   f o r   y o u r   u s e r s   i n   c a s e   t h e i r   a c c o u n t   s e t u p   f a i l s� ��� l     �!� ��!  �   �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     � �    * $ End network, server and preferences    � H   E n d   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s�  l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 	 l     ����  �  �  	 

 l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ��     Begin log file setup    � *   B e g i n   l o g   f i l e   s e t u p  l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����  �  �    l     ��   < 6 create the log file in the current user's Logs folder    � l   c r e a t e   t h e   l o g   f i l e   i n   t h e   c u r r e n t   u s e r ' s   L o g s   f o l d e r  !  l     ����  �  �  ! "#" l    $��$ I     �%�� 0 writelog writeLog% &�
& m    '' �(( D S t a r t i n g   E x c h a n g e   a c c o u n t   s e t u p . . .�
  �  �  �  # )*) l   +�	�+ I    �,�� 0 writelog writeLog, -�- b    ./. m    	00 �11  S c r i p t :  / n   	 232 1   
 �
� 
pnam3  f   	 
�  �  �	  �  * 454 l   6��6 I    �7� � 0 writelog writeLog7 8��8 o    ��
�� 
ret ��  �   �  �  5 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  = 0 *------------------------------------------   > �?? T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -< @A@ l     ��BC��  B   End log file setup    C �DD (   E n d   l o g   f i l e   s e t u p  A EFE l     ��GH��  G 0 *------------------------------------------   H �II T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -F JKJ l     ��������  ��  ��  K LML l     ��NO��  N 0 *------------------------------------------   O �PP T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -M QRQ l     ��ST��  S &   Begin logging script properties   T �UU @   B e g i n   l o g g i n g   s c r i p t   p r o p e r t i e sR VWV l     ��XY��  X 0 *------------------------------------------   Y �ZZ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -W [\[ l     ��������  ��  ��  \ ]^] l   _����_ I    ��`���� 0 writelog writeLog` a��a m    bb �cc & S e t u p   p r o p e r t i e s . . .��  ��  ��  ��  ^ ded l    ,f����f I     ,��g���� 0 writelog writeLogg h��h b   ! (iji m   ! "kk �ll  U s e   K e r b e r o s :  j o   " '���� 0 usekerberos useKerberos��  ��  ��  ��  e mnm l  - 9o����o I   - 9��p���� 0 writelog writeLogp q��q b   . 5rsr m   . /tt �uu " E x c h a n g e   S e r v e r :  s o   / 4����  0 exchangeserver ExchangeServer��  ��  ��  ��  n vwv l  : Fx����x I   : F��y���� 0 writelog writeLogy z��z b   ; B{|{ m   ; <}} �~~ < E x c h a n g e   S e r v e r   R e q u i r e s   S S L :  | o   < A���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL��  ��  ��  ��  w � l  G S������ I   G S������� 0 writelog writeLog� ���� b   H O��� m   H I�� ��� , E x c h a n g e   S e r v e r   P o r t :  � o   I N���� .0 exchangeserversslport ExchangeServerSSLPort��  ��  ��  ��  � ��� l  T `������ I   T `������� 0 writelog writeLog� ���� b   U \��� m   U V�� ��� $ D i r e c t o r y   S e r v e r :  � o   V [���� "0 directoryserver DirectoryServer��  ��  ��  ��  � ��� l  a m������ I   a m������� 0 writelog writeLog� ���� b   b i��� m   b c�� ��� T D i r e c t o r y   S e r v e r   R e q u i r e s   A u t h e n t i c a t i o n :  � o   c h���� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication��  ��  ��  ��  � ��� l  n z������ I   n z������� 0 writelog writeLog� ���� b   o v��� m   o p�� ��� > D i r e c t o r y   S e r v e r   R e q u i r e s   S S L :  � o   p u���� 80 directoryserverrequiresssl DirectoryServerRequiresSSL��  ��  ��  ��  � ��� l  { ������� I   { �������� 0 writelog writeLog� ���� b   | ���� m   | }�� ��� 6 D i r e c t o r y   S e r v e r   S S L   P o r t :  � o   } ����� 00 directoryserversslport DirectoryServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� D D i r e c t o r y   S e r v e r   M a x i m u m   R e s u l t s :  � o   � ����� >0 directoryservermaximumresults DirectoryServerMaximumResults��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� < D i r e c t o r y   S e r v e r   S e a r c h   B a s e :  � o   � ����� 60 directoryserversearchbase DirectoryServerSearchBase��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :  � o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� o   � ���
�� 
ret ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l  ������� Z   �������� =  � ���� o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory� m   � ���
�� boovfals� k   ��� ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D o m a i n   N a m e :  � o   � ����� 0 
domainname 
domainName��  ��  � ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  E m a i l   f o r m a t :  � o   � ����� 0 emailformat emailFormat��  ��  � ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D i s p l a y   N a m e :  � o   � ����� 0 displayname displayName��  ��  � ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D o m a i n   P r e f i x :  � o   � ����� 0 domainprefix domainPrefix��  ��  � ���� I   �������� 0 writelog writeLog� ���� o   � ��
�� 
ret ��  ��  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l 	����� I  	�~��}�~ 0 writelog writeLog� ��|� b  
   m  
 � , V e r i f y   E m a i l   A d d r e s s :   o  �{�{ (0 verifyemailaddress verifyEMailAddress�|  �}  ��  �  �  l &�z�y I  &�x�w�x 0 writelog writeLog �v b  "	
	 m   � . V e r i f y   S e r v e r   A d d r e s s :  
 o  !�u�u *0 verifyserveraddress verifyServerAddress�v  �w  �z  �y    l '5�t�s I  '5�r�q�r 0 writelog writeLog �p b  (1 m  (+ � . D i s p l a y   D o m a i n   P r e f i x :   o  +0�o�o *0 displaydomainprefix displayDomainPrefix�p  �q  �t  �s    l 6D�n�m I  6D�l�k�l 0 writelog writeLog �j b  7@ m  7: � . D o w n l o a d   H e a d e r s   O n l y :   o  :?�i�i *0 downloadheadersonly downloadHeadersOnly�j  �k  �n  �m     l ES!�h�g! I  ES�f"�e�f 0 writelog writeLog" #�d# b  FO$%$ m  FI&& �'' : H i d e   O n   M y   C o m p u t e r   F o l d e r s :  % o  IN�c�c 20 hideonmycomputerfolders hideOnMyComputerFolders�d  �e  �h  �g    ()( l Tb*�b�a* I  Tb�`+�_�` 0 writelog writeLog+ ,�^, b  U^-.- m  UX// �00  U n i f i e d   I n b o x :  . o  X]�]�] 0 unifiedinbox unifiedInbox�^  �_  �b  �a  ) 121 l cq3�\�[3 I  cq�Z4�Y�Z 0 writelog writeLog4 5�X5 b  dm676 m  dg88 �99 , D i s a b l e   A u t o d i s c o v e r :  7 o  gl�W�W (0 enableautodiscover enableAutodiscover�X  �Y  �\  �[  2 :;: l r�<�V�U< I  r��T=�S�T 0 writelog writeLog= >�R> b  s|?@? m  svAA �BB ( E r r o r   M e s s a g e   t e x t :  @ o  v{�Q�Q 0 errormessage errorMessage�R  �S  �V  �U  ; CDC l ��E�P�OE I  ���NF�M�N 0 writelog writeLogF G�LG o  ���K
�K 
ret �L  �M  �P  �O  D HIH l     �J�I�H�J  �I  �H  I JKJ l     �GLM�G  L 0 *------------------------------------------   M �NN T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -K OPO l     �FQR�F  Q %  End logging script properties    R �SS >   E n d   l o g g i n g   s c r i p t   p r o p e r t i e s  P TUT l     �EVW�E  V 0 *------------------------------------------   W �XX T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -U YZY l     �D�C�B�D  �C  �B  Z [\[ l     �A]^�A  ] 0 *------------------------------------------   ^ �__ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\ `a` l     �@bc�@  b ( " Begin collecting user information   c �dd D   B e g i n   c o l l e c t i n g   u s e r   i n f o r m a t i o na efe l     �?gh�?  g 0 *------------------------------------------   h �ii T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -f jkj l     �>�=�<�>  �=  �<  k lml l     �;no�;  n R L attempt to read information from Active Directory for the Me Contact record   o �pp �   a t t e m p t   t o   r e a d   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y   f o r   t h e   M e   C o n t a c t   r e c o r dm qrq l     �:�9�8�:  �9  �8  r sts l ��u�7�6u r  ��vwv m  ��xx �yy  w o      �5�5 0 userfirstname userFirstName�7  �6  t z{z l ��|�4�3| r  ��}~} m  �� ���  ~ o      �2�2 0 userlastname userLastName�4  �3  { ��� l ����1�0� r  ����� m  ���� ���  � o      �/�/  0 userdepartment userDepartment�1  �0  � ��� l ����.�-� r  ����� m  ���� ���  � o      �,�, 0 
useroffice 
userOffice�.  �-  � ��� l ����+�*� r  ����� m  ���� ���  � o      �)�) 0 usercompany userCompany�+  �*  � ��� l ����(�'� r  ����� m  ���� ���  � o      �&�& 0 userworkphone userWorkPhone�(  �'  � ��� l ����%�$� r  ����� m  ���� ���  � o      �#�# 0 
usermobile 
userMobile�%  �$  � ��� l ����"�!� r  ����� m  ���� ���  � o      � �  0 userfax userFax�"  �!  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 	usertitle 	userTitle�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 
userstreet 
userStreet�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 usercity userCity�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 	userstate 	userState�  �  � ��� l ������ r  ����� m  ���� ���  � o      ��  0 userpostalcode userPostalCode�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 usercountry userCountry�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userwebpage userWebPage�  �  � ��� l     �
�	��
  �	  �  � ��� l  ����� Z   ������ =  ��� o   �� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory� m  �
� boovtrue� k  

h�� ��� l 

����  �  �  � ��� l 

� ���   � 7 1 Read full user information from Active Directory   � ��� b   R e a d   f u l l   u s e r   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y� ��� l 

��������  ��  ��  � ��� Q  
h���� k  &�� ��� r  ��� J  �� ���� m  �� ���  :  ��  � n     � � 1  ��
�� 
txdl  1  ��
�� 
ascr� �� r  & I "����
�� .sysoexecTEXT���     TEXT m   �� / u s r / b i n / d s c l   / S e a r c h   - r e a d   " / U s e r s / $ U S E R "   A u t h e n t i c a t i o n A u t h o r i t y   C i t y   c o   c o m p a n y   d e p a r t m e n t   p h y s i c a l D e l i v e r y O f f i c e N a m e   s A M A c c o u n t N a m e   w W W H o m e P a g e   m a i l   F A X N u m b e r   F i r s t N a m e   J o b T i t l e   L a s t N a m e   M o b i l e N u m b e r   P h o n e N u m b e r   P o s t a l C o d e   R e a l N a m e   S t a t e   S t r e e t��   o      ���� "0 userinformation userInformation��  � R      ������
�� .ascrerr ****      � ****��  ��  � k  .h 	 l ..��������  ��  ��  	 

 l ..����     something went wrong    � *   s o m e t h i n g   w e n t   w r o n g  l ..��������  ��  ��    I .]��
�� .sysodlogaskr        TEXT b  .; b  .7 b  .5 o  .3���� 0 errormessage errorMessage o  34��
�� 
ret  o  56��
�� 
ret  m  7: � n U n a b l e   t o   r e a d   u s e r   i n f o r m a t i o n   f r o m   n e t w o r k   d i r e c t o r y . ��
�� 
disp m  >A��
�� stic     �� 
�� 
btns J  DI!! "��" m  DG## �$$  O K��    ��%&
�� 
dflt% J  LQ'' (��( m  LO)) �**  O K��  & ��+��
�� 
appr+ m  TW,, �-- , O u t l o o k   E x c h a n g e   S e t u p��   .��. R  ^h����/
�� .ascrerr ****      � ****��  / ��0��
�� 
errn0 m  be��������  ��  � 121 l ii��������  ��  ��  2 343 Y  i	�5��67��5 k  }	�88 9:9 l }}��������  ��  ��  : ;<; r  }�=>= J  }�?? @��@ m  }�AA �BB  :  ��  > n     CDC 1  ����
�� 
txdlD 1  ����
�� 
ascr< EFE Z  ��GH����G C ��IJI n  ��KLK 4  ����M
�� 
cparM o  ������ 0 i  L o  ������ "0 userinformation userInformationJ m  ��NN �OO , d s A t t r T y p e N a t i v e : m a i l :H Q  ��PQRP r  ��STS n  ��UVU 4  ����W
�� 
citmW m  ������ V n  ��XYX 4  ����Z
�� 
cparZ o  ������ 0 i  Y o  ������ "0 userinformation userInformationT o      ���� 0 emailaddress emailAddressQ R      ������
�� .ascrerr ****      � ****��  ��  R k  ��[[ \]\ r  ��^_^ J  ��`` a��a m  ��bb �cc  ��  _ n     ded 1  ����
�� 
txdle 1  ����
�� 
ascr] f��f r  ��ghg c  ��iji n  ��klk 7����mn
�� 
cha m m  ������ n  ;  ��l n  ��opo 4  ����q
�� 
cparq l ��r����r [  ��sts o  ������ 0 i  t m  ������ ��  ��  p o  ������ "0 userinformation userInformationj m  ����
�� 
TEXTh o      ���� 0 emailaddress emailAddress��  ��  ��  F uvu l ����������  ��  ��  v wxw r  ��yzy J  ��{{ |��| m  ��}} �~~  :  ��  z n     � 1  ����
�� 
txdl� 1  ����
�� 
ascrx ��� Z  �N������� C � ��� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ��� ( d s A t t r T y p e N a t i v e : c o :� Q  J���� r  ��� n  ��� 4  ���
�� 
citm� m  ���� � n  ��� 4  	���
�� 
cpar� o  ���� 0 i  � o  	���� "0 userinformation userInformation� o      ���� 0 usercountry userCountry� R      ������
�� .ascrerr ****      � ****��  ��  � k  J�� ��� r  ,��� J  $�� ���� m  "�� ���  ��  � n     ��� 1  '+��
�� 
txdl� 1  $'��
�� 
ascr� ���� r  -J��� c  -F��� n  -B��� 77B����
�� 
cha � m  =?���� �  ;  @A� n  -7��� 4  07���
�� 
cpar� l 36������ [  36��� o  34���� 0 i  � m  45���� ��  ��  � o  -0���� "0 userinformation userInformation� m  BE��
�� 
TEXT� o      ���� 0 usercountry userCountry��  ��  ��  � ��� l OO��������  ��  ��  � ��� r  O\��� J  OT�� ���� m  OR�� ���  :  ��  � n     ��� 1  W[��
�� 
txdl� 1  TW��
�� 
ascr� ��� Z  ]�������� C ]i��� n  ]e��� 4  `e���
�� 
cpar� o  cd���� 0 i  � o  ]`���� "0 userinformation userInformation� m  eh�� ��� 2 d s A t t r T y p e N a t i v e : c o m p a n y :� Q  l����� r  o���� n  o|��� 4  w|���
�� 
citm� m  z{���� � n  ow��� 4  rw���
�� 
cpar� o  uv���� 0 i  � o  or���� "0 userinformation userInformation� o      ���� 0 usercompany userCompany� R      ��~�}
� .ascrerr ****      � ****�~  �}  � k  ���� ��� r  ����� J  ���� ��|� m  ���� ���  �|  � n     ��� 1  ���{
�{ 
txdl� 1  ���z
�z 
ascr� ��y� r  ����� c  ����� n  ����� 7���x��
�x 
cha � m  ���w�w �  ;  ��� n  ����� 4  ���v�
�v 
cpar� l ����u�t� [  ����� o  ���s�s 0 i  � m  ���r�r �u  �t  � o  ���q�q "0 userinformation userInformation� m  ���p
�p 
TEXT� o      �o�o 0 usercompany userCompany�y  ��  ��  � ��� l ���n�m�l�n  �m  �l  � ��� r  ����� J  ���� ��k� m  ���� ���  :  �k  � n     ��� 1  ���j
�j 
txdl� 1  ���i
�i 
ascr� ��� Z  � ���h�g� C ����� n  ��� � 4  ���f
�f 
cpar o  ���e�e 0 i    o  ���d�d "0 userinformation userInformation� m  �� � 8 d s A t t r T y p e N a t i v e : d e p a r t m e n t :� Q  � r  �� n  ��	
	 4  ���c
�c 
citm m  ���b�b 
 n  �� 4  ���a
�a 
cpar o  ���`�` 0 i   o  ���_�_ "0 userinformation userInformation o      �^�^  0 userdepartment userDepartment R      �]�\�[
�] .ascrerr ****      � ****�\  �[   k  �  r  �� J  �� �Z m  �� �  �Z   n      1  ���Y
�Y 
txdl 1  ���X
�X 
ascr �W r  � c  � n  �  7	�V!"
�V 
cha ! m  �U�U "  ;    n  �	#$# 4  	�T%
�T 
cpar% l &�S�R& [  '(' o  �Q�Q 0 i  ( m  �P�P �S  �R  $ o  ��O�O "0 userinformation userInformation m  �N
�N 
TEXT o      �M�M  0 userdepartment userDepartment�W  �h  �g  � )*) l !!�L�K�J�L  �K  �J  * +,+ r  !.-.- J  !&// 0�I0 m  !$11 �22  :  �I  . n     343 1  )-�H
�H 
txdl4 1  &)�G
�G 
ascr, 565 Z  /�78�F�E7 C /;9:9 n  /7;<; 4  27�D=
�D 
cpar= o  56�C�C 0 i  < o  /2�B�B "0 userinformation userInformation: m  7:>> �?? X d s A t t r T y p e N a t i v e : p h y s i c a l D e l i v e r y O f f i c e N a m e :8 Q  >�@AB@ r  ARCDC n  ANEFE 4  IN�AG
�A 
citmG m  LM�@�@ F n  AIHIH 4  DI�?J
�? 
cparJ o  GH�>�> 0 i  I o  AD�=�= "0 userinformation userInformationD o      �<�< 0 
useroffice 
userOfficeA R      �;�:�9
�; .ascrerr ****      � ****�:  �9  B k  Z�KK LML r  ZgNON J  Z_PP Q�8Q m  Z]RR �SS  �8  O n     TUT 1  bf�7
�7 
txdlU 1  _b�6
�6 
ascrM V�5V r  h�WXW c  h�YZY n  h}[\[ 7r}�4]^
�4 
cha ] m  xz�3�3 ^  ;  {|\ n  hr_`_ 4  kr�2a
�2 
cpara l nqb�1�0b [  nqcdc o  no�/�/ 0 i  d m  op�.�. �1  �0  ` o  hk�-�- "0 userinformation userInformationZ m  }��,
�, 
TEXTX o      �+�+ 0 
useroffice 
userOffice�5  �F  �E  6 efe l ���*�)�(�*  �)  �(  f ghg r  ��iji J  ��kk l�'l m  ��mm �nn  :  �'  j n     opo 1  ���&
�& 
txdlp 1  ���%
�% 
ascrh qrq Z  ��st�$�#s C ��uvu n  ��wxw 4  ���"y
�" 
cpary o  ���!�! 0 i  x o  ��� �  "0 userinformation userInformationv m  ��zz �{{ @ d s A t t r T y p e N a t i v e : s A M A c c o u n t N a m e :t Q  ��|}~| r  ��� n  ����� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      �� 0 usershortname userShortName} R      ���
� .ascrerr ****      � ****�  �  ~ k  ���� ��� r  ����� J  ���� ��� m  ���� ���  �  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� r  ����� c  ����� n  ����� 7�����
� 
cha � m  ���� �  ;  ��� n  ����� 4  ����
� 
cpar� l ������ [  ����� o  ���� 0 i  � m  ���� �  �  � o  ���� "0 userinformation userInformation� m  ���

�
 
TEXT� o      �	�	 0 usershortname userShortName�  �$  �#  r ��� l ������  �  �  � ��� r  � ��� J  ���� ��� m  ���� ���  :  �  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� Z  [����� C ��� n  	��� 4  	� �
�  
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� m  	�� ��� : d s A t t r T y p e N a t i v e : w W W H o m e P a g e :� Q  W���� r  $��� n   ��� 4   ���
�� 
citm� m  ���� � n  ��� 4  ���
�� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      ���� 0 userwebpage userWebPage� R      ������
�� .ascrerr ****      � ****��  ��  � k  ,W�� ��� r  ,9��� J  ,1�� ���� m  ,/�� ���  ��  � n     ��� 1  48��
�� 
txdl� 1  14��
�� 
ascr� ���� r  :W��� c  :S��� n  :O��� 7DO����
�� 
cha � m  JL���� �  ;  MN� n  :D��� 4  =D���
�� 
cpar� l @C������ [  @C��� o  @A���� 0 i  � m  AB���� ��  ��  � o  :=���� "0 userinformation userInformation� m  OR��
�� 
TEXT� o      ���� 0 userwebpage userWebPage��  �  �  � ��� l \\��������  ��  ��  � ��� r  \i��� J  \a�� ���� m  \_�� ���  :  ��  � n     ��� 1  dh��
�� 
txdl� 1  ad��
�� 
ascr� ��� Z  j�������� C jv��� n  jr��� 4  mr���
�� 
cpar� o  pq���� 0 i  � o  jm���� "0 userinformation userInformation� m  ru�� ��� 
 C i t y :� Q  y����� r  |���� n  |���� 4  �����
�� 
citm� m  ������ � n  |���� 4  ����
�� 
cpar� o  ������ 0 i  � o  |���� "0 userinformation userInformation� o      ���� 0 usercity userCity� R      ������
�� .ascrerr ****      � ****��  ��  � k  ����    r  �� J  �� �� m  �� �  ��   n     	 1  ����
�� 
txdl	 1  ����
�� 
ascr 
��
 r  �� c  �� n  �� 7����
�� 
cha  m  ������   ;  �� n  �� 4  ����
�� 
cpar l ������ [  �� o  ������ 0 i   m  ������ ��  ��   o  ������ "0 userinformation userInformation m  ����
�� 
TEXT o      ���� 0 usercity userCity��  ��  ��  �  l ����������  ��  ��    r  �� J  ��  ��  m  ��!! �""  :  ��   n     #$# 1  ����
�� 
txdl$ 1  ����
�� 
ascr %&% Z  �-'(����' C ��)*) n  ��+,+ 4  ����-
�� 
cpar- o  ������ 0 i  , o  ������ "0 userinformation userInformation* m  ��.. �//  F A X N u m b e r :( Q  �)0120 r  ��343 n  ��565 4  ����7
�� 
citm7 m  ������ 6 n  ��898 4  ����:
�� 
cpar: o  ������ 0 i  9 o  ������ "0 userinformation userInformation4 o      ���� 0 userfax userFax1 R      ������
�� .ascrerr ****      � ****��  ��  2 k  �);; <=< r  �>?> J  �@@ A��A m  �BB �CC  ��  ? n     DED 1  
��
�� 
txdlE 1  ��
�� 
ascr= F��F r  )GHG c  %IJI n  !KLK 7!��MN
�� 
cha M m  ���� N  ;   L n  OPO 4  ��Q
�� 
cparQ l R����R [  STS o  ���� 0 i  T m  ���� ��  ��  P o  ���� "0 userinformation userInformationJ m  !$��
�� 
TEXTH o      ���� 0 userfax userFax��  ��  ��  & UVU l ..��������  ��  ��  V WXW r  .;YZY J  .3[[ \��\ m  .1]] �^^  :  ��  Z n     _`_ 1  6:��
�� 
txdl` 1  36��
�� 
ascrX aba Z  <�cd����c C <Hefe n  <Dghg 4  ?D��i
�� 
cpari o  BC���� 0 i  h o  <?���� "0 userinformation userInformationf m  DGjj �kk  F i r s t N a m e :d Q  K�lmnl r  N_opo n  N[qrq 4  V[��s
�� 
citms m  YZ���� r n  NVtut 4  QV��v
�� 
cparv o  TU���� 0 i  u o  NQ���� "0 userinformation userInformationp o      ���� 0 userfirstname userFirstNamem R      ������
�� .ascrerr ****      � ****��  ��  n k  g�ww xyx r  gtz{z J  gl|| }��} m  gj~~ �  ��  { n     ��� 1  os��
�� 
txdl� 1  lo��
�� 
ascry ���� r  u���� c  u���� n  u���� 7�����
�� 
cha � m  ������ �  ;  ��� n  u��� 4  x���
�� 
cpar� l {~������ [  {~��� o  {|���� 0 i  � m  |}���� ��  ��  � o  ux���� "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 userfirstname userFirstName��  ��  ��  b ��� l ������~��  �  �~  � ��� r  ����� J  ���� ��}� m  ���� ���  :  �}  � n     ��� 1  ���|
�| 
txdl� 1  ���{
�{ 
ascr� ��� Z  �����z�y� C ����� n  ����� 4  ���x�
�x 
cpar� o  ���w�w 0 i  � o  ���v�v "0 userinformation userInformation� m  ���� ���  J o b T i t l e :� Q  ������ r  ����� n  ����� 4  ���u�
�u 
citm� m  ���t�t � n  ����� 4  ���s�
�s 
cpar� o  ���r�r 0 i  � o  ���q�q "0 userinformation userInformation� o      �p�p 0 	usertitle 	userTitle� R      �o�n�m
�o .ascrerr ****      � ****�n  �m  � k  ���� ��� r  ����� J  ���� ��l� m  ���� ���  �l  � n     ��� 1  ���k
�k 
txdl� 1  ���j
�j 
ascr� ��i� r  ����� c  ����� n  ����� 7���h��
�h 
cha � m  ���g�g �  ;  ��� n  ����� 4  ���f�
�f 
cpar� l ����e�d� [  ����� o  ���c�c 0 i  � m  ���b�b �e  �d  � o  ���a�a "0 userinformation userInformation� m  ���`
�` 
TEXT� o      �_�_ 0 	usertitle 	userTitle�i  �z  �y  � ��� l   �^�]�\�^  �]  �\  � ��� r   ��� J   �� ��[� m   �� ���  :  �[  � n     ��� 1  �Z
�Z 
txdl� 1  �Y
�Y 
ascr� ��� Z  h���X�W� C ��� n  ��� 4  �V�
�V 
cpar� o  �U�U 0 i  � o  �T�T "0 userinformation userInformation� m  �� ���  L a s t N a m e :� Q  d���� r   1��� n   -��� 4  (-�S�
�S 
citm� m  +,�R�R � n   (��� 4  #(�Q�
�Q 
cpar� o  &'�P�P 0 i  � o   #�O�O "0 userinformation userInformation� o      �N�N 0 userlastname userLastName� R      �M�L�K
�M .ascrerr ****      � ****�L  �K  � k  9d�� ��� r  9F��� J  9>�� ��J� m  9<�� ���  �J  � n     ��� 1  AE�I
�I 
txdl� 1  >A�H
�H 
ascr� ��G� r  Gd��� c  G`��� n  G\� � 7Q\�F
�F 
cha  m  WY�E�E   ;  Z[  n  GQ 4  JQ�D
�D 
cpar l MP�C�B [  MP o  MN�A�A 0 i   m  NO�@�@ �C  �B   o  GJ�?�? "0 userinformation userInformation� m  \_�>
�> 
TEXT� o      �=�= 0 userlastname userLastName�G  �X  �W  � 	
	 l ii�<�;�:�<  �;  �:  
  r  iv J  in �9 m  il �  :  �9   n      1  qu�8
�8 
txdl 1  nq�7
�7 
ascr  Z  w��6�5 C w� n  w 4  z�4
�4 
cpar o  }~�3�3 0 i   o  wz�2�2 "0 userinformation userInformation m  � �  M o b i l e N u m b e r : Q  �� !"  r  ��#$# n  ��%&% 4  ���1'
�1 
citm' m  ���0�0 & n  ��()( 4  ���/*
�/ 
cpar* o  ���.�. 0 i  ) o  ���-�- "0 userinformation userInformation$ o      �,�, 0 
usermobile 
userMobile! R      �+�*�)
�+ .ascrerr ****      � ****�*  �)  " k  ��++ ,-, r  ��./. J  ��00 1�(1 m  ��22 �33  �(  / n     454 1  ���'
�' 
txdl5 1  ���&
�& 
ascr- 6�%6 r  ��787 c  ��9:9 n  ��;<; 7���$=>
�$ 
cha = m  ���#�# >  ;  ��< n  ��?@? 4  ���"A
�" 
cparA l ��B�!� B [  ��CDC o  ���� 0 i  D m  ���� �!  �   @ o  ���� "0 userinformation userInformation: m  ���
� 
TEXT8 o      �� 0 
usermobile 
userMobile�%  �6  �5   EFE l ������  �  �  F GHG r  ��IJI J  ��KK L�L m  ��MM �NN  :  �  J n     OPO 1  ���
� 
txdlP 1  ���
� 
ascrH QRQ Z  �:ST��S C ��UVU n  ��WXW 4  ���Y
� 
cparY o  ���� 0 i  X o  ���� "0 userinformation userInformationV m  ��ZZ �[[  P h o n e N u m b e r :T Q  �6\]^\ r  �_`_ n  ��aba 4  ���c
� 
citmc m  ���� b n  ��ded 4  ���f
� 
cparf o  ���� 0 i  e o  ���� "0 userinformation userInformation` o      �
�
 0 userworkphone userWorkPhone] R      �	��
�	 .ascrerr ****      � ****�  �  ^ k  6gg hih r  jkj J  ll m�m m  nn �oo  �  k n     pqp 1  �
� 
txdlq 1  �
� 
ascri r�r r  6sts c  2uvu n  .wxw 7#.�yz
� 
cha y m  )+�� z  ;  ,-x n  #{|{ 4  #� }
�  
cpar} l "~����~ [  "� o   ���� 0 i  � m   !���� ��  ��  | o  ���� "0 userinformation userInformationv m  .1��
�� 
TEXTt o      ���� 0 userworkphone userWorkPhone�  �  �  R ��� l ;;��������  ��  ��  � ��� r  ;H��� J  ;@�� ���� m  ;>�� ���  :  ��  � n     ��� 1  CG��
�� 
txdl� 1  @C��
�� 
ascr� ��� Z  I�������� C IU��� n  IQ��� 4  LQ���
�� 
cpar� o  OP���� 0 i  � o  IL���� "0 userinformation userInformation� m  QT�� ���  P o s t a l C o d e :� Q  X����� r  [l��� n  [h��� 4  ch���
�� 
citm� m  fg���� � n  [c��� 4  ^c���
�� 
cpar� o  ab���� 0 i  � o  [^���� "0 userinformation userInformation� o      ����  0 userpostalcode userPostalCode� R      ������
�� .ascrerr ****      � ****��  ��  � k  t��� ��� r  t���� J  ty�� ���� m  tw�� ���  ��  � n     ��� 1  |���
�� 
txdl� 1  y|��
�� 
ascr� ���� r  ����� c  ����� n  ����� 7������
�� 
cha � m  ������ �  ;  ��� n  ����� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  ����
�� 
TEXT� o      ����  0 userpostalcode userPostalCode��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �	������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ���  R e a l N a m e :� Q  �	���� r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ���� 0 userfullname userFullName� R      ������
�� .ascrerr ****      � ****��  ��  � k  �	�� ��� r  ����� J  ���� ���� m  ���� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  �	��� c  �	��� n  �	 ��� 7�	 ����
�� 
cha � m  ������ �  ;  ��� n  ����� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  	 	��
�� 
TEXT� o      ���� 0 userfullname userFullName��  ��  ��  � ��� l 		��������  ��  ��  � ��� r  		��� J  		��  ��  m  		 �  :  ��  � n      1  		��
�� 
txdl 1  		��
�� 
ascr�  Z  		u���� C 		'	
	 n  		# 4  		#��
�� 
cpar o  	!	"���� 0 i   o  		���� "0 userinformation userInformation
 m  	#	& �  S t a t e : Q  	*	q r  	-	> n  	-	: 4  	5	:��
�� 
citm m  	8	9����  n  	-	5 4  	0	5��
�� 
cpar o  	3	4���� 0 i   o  	-	0���� "0 userinformation userInformation o      ���� 0 	userstate 	userState R      ������
�� .ascrerr ****      � ****��  ��   k  	F	q  r  	F	S J  	F	K   !��! m  	F	I"" �##  ��   n     $%$ 1  	N	R��
�� 
txdl% 1  	K	N��
�� 
ascr &��& r  	T	q'(' c  	T	m)*) n  	T	i+,+ 7	^	i��-.
�� 
cha - m  	d	f���� .  ;  	g	h, n  	T	^/0/ 4  	W	^��1
�� 
cpar1 l 	Z	]2����2 [  	Z	]343 o  	Z	[���� 0 i  4 m  	[	\���� ��  ��  0 o  	T	W���� "0 userinformation userInformation* m  	i	l��
�� 
TEXT( o      ���� 0 	userstate 	userState��  ��  ��   565 l 	v	v��������  ��  ��  6 787 r  	v	�9:9 J  	v	{;; <��< m  	v	y== �>>  :  ��  : n     ?@? 1  	~	���
�� 
txdl@ 1  	{	~��
�� 
ascr8 ABA Z  	�	�CD����C C 	�	�EFE n  	�	�GHG 4  	�	���I
�� 
cparI o  	�	����� 0 i  H o  	�	����� "0 userinformation userInformationF m  	�	�JJ �KK  S t r e e t :D Q  	�	�LMNL r  	�	�OPO n  	�	�QRQ 4  	�	���S
�� 
citmS m  	�	����� R n  	�	�TUT 4  	�	���V
�� 
cparV o  	�	����� 0 i  U o  	�	����� "0 userinformation userInformationP o      ���� 0 
userstreet 
userStreetM R      �����
�� .ascrerr ****      � ****��  �  N k  	�	�WW XYX r  	�	�Z[Z J  	�	�\\ ]�~] m  	�	�^^ �__  �~  [ n     `a` 1  	�	��}
�} 
txdla 1  	�	��|
�| 
ascrY b�{b r  	�	�cdc c  	�	�efe n  	�	�ghg 7	�	��zij
�z 
cha i m  	�	��y�y j  ;  	�	�h n  	�	�klk 4  	�	��xm
�x 
cparm l 	�	�n�w�vn [  	�	�opo o  	�	��u�u 0 i  p m  	�	��t�t �w  �v  l o  	�	��s�s "0 userinformation userInformationf m  	�	��r
�r 
TEXTd o      �q�q 0 
userstreet 
userStreet�{  ��  ��  B q�pq l 	�	��o�n�m�o  �n  �m  �p  �� 0 i  6 m  lm�l�l 7 I mx�kr�j
�k .corecnte****       ****r n mtsts 2 pt�i
�i 
cpart o  mp�h�h "0 userinformation userInformation�j  ��  4 uvu l 	�	��g�f�e�g  �f  �e  v wxw r  	�	�yzy J  	�	�{{ |}| m  	�	�~~ �  ; K e r b e r o s v 5 ; ;} ��d� m  	�	��� ���  ;�d  z n     ��� 1  	�	��c
�c 
txdl� 1  	�	��b
�b 
ascrx ��� l 	�	��a�`�_�a  �`  �_  � ��� Q  	�
���^� r  	�
��� n  	�
��� 4  	�
�]�
�] 
citm� m  
 
�\�\ � o  	�	��[�[ "0 userinformation userInformation� o      �Z�Z &0 userkerberosrealm userKerberosRealm� R      �Y�X�W
�Y .ascrerr ****      � ****�X  �W  �^  � ��� l 

�V�U�T�V  �U  �T  � ��� r  

��� J  

�� ��S� m  

�� ���  �S  � n     ��� 1  

�R
�R 
txdl� 1  

�Q
�Q 
ascr� ��� l 

�P�O�N�P  �O  �N  � ��� Z  

f���M�L� = 

%��� o  

!�K�K 0 emailaddress emailAddress� m  
!
$�� ���  � k  
(
b�� ��� l 
(
(�J�I�H�J  �I  �H  � ��� l 
(
(�G���G  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l 
(
(�F�E�D�F  �E  �D  � ��� I 
(
W�C��
�C .sysodlogaskr        TEXT� b  
(
5��� b  
(
1��� b  
(
/��� o  
(
-�B�B 0 errormessage errorMessage� o  
-
.�A
�A 
ret � o  
/
0�@
�@ 
ret � m  
1
4�� ��� h U n a b l e   t o   r e a d   e m a i l   a d d r e s s   f r o m   n e t w o r k   d i r e c t o r y .� �?��
�? 
disp� m  
8
;�>
�> stic    � �=��
�= 
btns� J  
>
C�� ��<� m  
>
A�� ���  O K�<  � �;��
�; 
dflt� J  
F
K�� ��:� m  
F
I�� ���  O K�:  � �9��8
�9 
appr� m  
N
Q�� ��� , O u t l o o k   E x c h a n g e   S e t u p�8  � ��7� R  
X
b�6�5�
�6 .ascrerr ****      � ****�5  � �4��3
�4 
errn� m  
\
_�2�2���3  �7  �M  �L  � ��1� l 
g
g�0�/�.�0  �/  �.  �1  � ��� F  
k
���� = 
k
r��� o  
k
p�-�- 0 emailformat emailFormat� m  
p
q�,�, � = 
u
|��� o  
u
z�+�+ 0 displayname displayName� m  
z
{�*�* � ��� k  
�
��� ��� l 
�
��)�(�'�)  �(  �'  � ��� l 
�
��&���&  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l 
�
��%�$�#�%  �$  �#  � ��� r  
�
���� n  
�
���� 1  
�
��"
�" 
sisn� l 
�
���!� � I 
�
����
� .sysosigtsirr   ��� null�  �  �!  �   � o      �� 0 usershortname userShortName� ��� r  
�
���� n  
�
���� 1  
�
��
� 
siln� l 
�
����� I 
�
����
� .sysosigtsirr   ��� null�  �  �  �  � o      �� 0 userfullname userFullName� ��� l 
�
�����  �  �  � ��� l 
�
�����  � D > first.last@domain.com and full name displays as "Last, First"   � ��� |   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "� ��� l 
�
�����  �  �  � ��� r  
�
���� m  
�
�	 	  �		  ,  � n     			 1  
�
��
� 
txdl	 1  
�
��
� 
ascr� 			 r  
�
�			 n  
�
�				 4 
�
��	

� 
citm	
 m  
�
��
�
��		 o  
�
��	�	 0 userfullname userFullName	 o      �� 0 userfirstname userFirstName	 			 r  
�
�			 n  
�
�			 4  
�
��	
� 
cwor	 m  
�
��� 	 n  
�
�			 4  
�
��	
� 
citm	 m  
�
��� 	 o  
�
��� 0 userfullname userFullName	 o      �� 0 userlastname userLastName	 			 r  
�
�			 m  
�
�		 �		  	 n     			 1  
�
��
� 
txdl	 1  
�
�� 
�  
ascr	 			 r  
�
�		 	 b  
�
�	!	"	! b  
�
�	#	$	# b  
�
�	%	&	% b  
�
�	'	(	' o  
�
����� 0 userfirstname userFirstName	( m  
�
�	)	) �	*	*  .	& o  
�
����� 0 userlastname userLastName	$ m  
�
�	+	+ �	,	,  @	" o  
�
����� 0 
domainname 
domainName	  o      ���� 0 emailaddress emailAddress	 	-��	- l 
�
���������  ��  ��  ��  � 	.	/	. F  
�		0	1	0 = 
�
�	2	3	2 o  
�
����� 0 emailformat emailFormat	3 m  
�
����� 	1 = 
�	4	5	4 o  
����� 0 displayname displayName	5 m  ���� 	/ 	6	7	6 k  z	8	8 	9	:	9 l ��������  ��  ��  	: 	;	<	; l ��	=	>��  	= P J Pull user information from the account settings of the local user account   	> �	?	? �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	< 	@	A	@ l ��������  ��  ��  	A 	B	C	B r  	D	E	D n  	F	G	F 1  ��
�� 
sisn	G l 	H����	H I ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	E o      ���� 0 usershortname userShortName	C 	I	J	I r  '	K	L	K n  #	M	N	M 1  #��
�� 
siln	N l 	O����	O I ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	L o      ���� 0 userfullname userFullName	J 	P	Q	P l ((��������  ��  ��  	Q 	R	S	R l ((��	T	U��  	T C = first.last@domain.com and full name displays as "First Last"   	U �	V	V z   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "	S 	W	X	W l ((��������  ��  ��  	X 	Y	Z	Y r  (3	[	\	[ m  (+	]	] �	^	^   	\ n     	_	`	_ 1  .2��
�� 
txdl	` 1  +.��
�� 
ascr	Z 	a	b	a r  4E	c	d	c n  4A	e	f	e 4  <A��	g
�� 
cwor	g m  ?@���� 	f n  4<	h	i	h 4  7<��	j
�� 
citm	j m  :;���� 	i o  47���� 0 userfullname userFullName	d o      ���� 0 userfirstname userFirstName	b 	k	l	k r  FR	m	n	m n  FN	o	p	o 4 IN��	q
�� 
citm	q m  LM������	p o  FI���� 0 userfullname userFullName	n o      ���� 0 userlastname userLastName	l 	r	s	r r  S^	t	u	t m  SV	v	v �	w	w  	u n     	x	y	x 1  Y]��
�� 
txdl	y 1  VY��
�� 
ascr	s 	z	{	z r  _x	|	}	| b  _t	~		~ b  _n	�	�	� b  _j	�	�	� b  _f	�	�	� o  _b���� 0 userfirstname userFirstName	� m  be	�	� �	�	�  .	� o  fi���� 0 userlastname userLastName	� m  jm	�	� �	�	�  @	 o  ns���� 0 
domainname 
domainName	} o      ���� 0 emailaddress emailAddress	{ 	���	� l yy��������  ��  ��  ��  	7 	�	�	� F  }�	�	�	� = }�	�	�	� o  }����� 0 emailformat emailFormat	� m  ������ 	� = ��	�	�	� o  ������ 0 displayname displayName	� m  ������ 	� 	�	�	� k  ��	�	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
sisn	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
siln	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� ? 9 first@domain.com and full name displays as "Last, First"   	� �	�	� r   f i r s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  ,  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4 ����	�
�� 
citm	� m  ��������	� o  ������ 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4  ����	�
�� 
cwor	� m  ������ 	� n  ��	�	�	� 4  ����	�
�� 
citm	� m  ������ 	� o  ������ 0 userfullname userFullName	� o      ���� 0 userlastname userLastName	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� b  ��	�	�	� b  ��	�	�	� o  ������ 0 userfirstname userFirstName	� m  ��	�	� �	�	�  @	� o  ������ 0 
domainname 
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ����������  ��  ��  ��  	� 	�	�	� F  �	�	�	� = �	�	�	� o  ����� 0 emailformat emailFormat	� m  ���� 	� = 	�	�	� o  ���� 0 displayname displayName	� m  ���� 	� 	�	�	� k  |	�	� 	�	�	� l ��������  ��  ��  	� 	�	�	� l ��	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ��������  ��  ��  	� 	�	�	� r  #	�	�	� n  	�	�	� 1  ��
�� 
sisn	� l 	����	� I �~�}�|
�~ .sysosigtsirr   ��� null�}  �|  ��  �  	� o      �{�{ 0 usershortname userShortName	� 	�	�	� r  $1	�
 	� n  $-


 1  )-�z
�z 
siln
 l $)
�y�x
 I $)�w�v�u
�w .sysosigtsirr   ��� null�v  �u  �y  �x  
  o      �t�t 0 userfullname userFullName	� 


 l 22�s�r�q�s  �r  �q  
 


 l 22�p

	�p  
 = 7 first@domain.com if full name displays as "First Last"   
	 �



 n   f i r s t @ d o m a i n . c o m   i f   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
 


 l 22�o�n�m�o  �n  �m  
 


 r  2=


 m  25

 �

   
 n     


 1  8<�l
�l 
txdl
 1  58�k
�k 
ascr
 


 r  >O


 n  >K


 4  FK�j

�j 
cwor
 m  IJ�i�i 
 n  >F


 4  AF�h

�h 
citm
 m  DE�g�g 
 o  >A�f�f 0 userfullname userFullName
 o      �e�e 0 userfirstname userFirstName
 

 
 r  P\
!
"
! n  PX
#
$
# 4 SX�d
%
�d 
citm
% m  VW�c�c��
$ o  PS�b�b 0 userfullname userFullName
" o      �a�a 0 userlastname userLastName
  
&
'
& r  ]h
(
)
( m  ]`
*
* �
+
+  
) n     
,
-
, 1  cg�`
�` 
txdl
- 1  `c�_
�_ 
ascr
' 
.
/
. r  iz
0
1
0 b  iv
2
3
2 b  ip
4
5
4 o  il�^�^ 0 userfirstname userFirstName
5 m  lo
6
6 �
7
7  @
3 o  pu�]�] 0 
domainname 
domainName
1 o      �\�\ 0 emailaddress emailAddress
/ 
8�[
8 l {{�Z�Y�X�Z  �Y  �X  �[  	� 
9
:
9 F  �
;
<
; = �
=
>
= o  ��W�W 0 emailformat emailFormat
> m  ���V�V 
< = ��
?
@
? o  ���U�U 0 displayname displayName
@ m  ���T�T 
: 
A
B
A k  �
C
C 
D
E
D l ���S�R�Q�S  �R  �Q  
E 
F
G
F l ���P
H
I�P  
H P J Pull user information from the account settings of the local user account   
I �
J
J �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
G 
K
L
K l ���O�N�M�O  �N  �M  
L 
M
N
M r  ��
O
P
O n  ��
Q
R
Q 1  ���L
�L 
sisn
R l ��
S�K�J
S I ���I�H�G
�I .sysosigtsirr   ��� null�H  �G  �K  �J  
P o      �F�F 0 usershortname userShortName
N 
T
U
T r  ��
V
W
V n  ��
X
Y
X 1  ���E
�E 
siln
Y l ��
Z�D�C
Z I ���B�A�@
�B .sysosigtsirr   ��� null�A  �@  �D  �C  
W o      �?�? 0 userfullname userFullName
U 
[
\
[ l ���>�=�<�>  �=  �<  
\ 
]
^
] l ���;
_
`�;  
_ ? 9 flast@domain.com and full name displays as "Last, First"   
` �
a
a r   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
^ 
b
c
b l ���:�9�8�:  �9  �8  
c 
d
e
d r  ��
f
g
f m  ��
h
h �
i
i  ,  
g n     
j
k
j 1  ���7
�7 
txdl
k 1  ���6
�6 
ascr
e 
l
m
l r  ��
n
o
n n  ��
p
q
p 4 ���5
r
�5 
citm
r m  ���4�4��
q o  ���3�3 0 userfullname userFullName
o o      �2�2 0 userfirstname userFirstName
m 
s
t
s r  ��
u
v
u n  ��
w
x
w 4  ���1
y
�1 
cwor
y m  ���0�0 
x n  ��
z
{
z 4  ���/
|
�/ 
citm
| m  ���.�. 
{ o  ���-�- 0 userfullname userFullName
v o      �,�, 0 userlastname userLastName
t 
}
~
} r  ��

�
 m  ��
�
� �
�
�  
� n     
�
�
� 1  ���+
�+ 
txdl
� 1  ���*
�* 
ascr
~ 
�
�
� r  �
�
�
� b  � 
�
�
� b  ��
�
�
� b  ��
�
�
� l ��
��)�(
� n  ��
�
�
� 4  ���'
�
�' 
cha 
� m  ���&�& 
� o  ���%�% 0 userfirstname userFirstName�)  �(  
� o  ���$�$ 0 userlastname userLastName
� m  ��
�
� �
�
�  @
� o  ���#�# 0 
domainname 
domainName
� o      �"�" 0 emailaddress emailAddress
� 
��!
� l � ���   �  �  �!  
B 
�
�
� F  	
�
�
� = 	
�
�
� o  	�� 0 emailformat emailFormat
� m  �� 
� = 
�
�
� o  �� 0 displayname displayName
� m  �� 
� 
�
�
� k  !�
�
� 
�
�
� l !!����  �  �  
� 
�
�
� l !!�
�
��  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l !!����  �  �  
� 
�
�
� r  !.
�
�
� n  !*
�
�
� 1  &*�
� 
sisn
� l !&
���
� I !&���
� .sysosigtsirr   ��� null�  �  �  �  
� o      �� 0 usershortname userShortName
� 
�
�
� r  /<
�
�
� n  /8
�
�
� 1  48�
� 
siln
� l /4
��
�	
� I /4���
� .sysosigtsirr   ��� null�  �  �
  �	  
� o      �� 0 userfullname userFullName
� 
�
�
� l ==����  �  �  
� 
�
�
� l ==�
�
��  
� > 8 flast@domain.com and full name displays as "First Last"   
� �
�
� p   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
� 
�
�
� l ==� �����   ��  ��  
� 
�
�
� r  =H
�
�
� m  =@
�
� �
�
�   
� n     
�
�
� 1  CG��
�� 
txdl
� 1  @C��
�� 
ascr
� 
�
�
� r  IZ
�
�
� n  IV
�
�
� 4  QV��
�
�� 
cwor
� m  TU���� 
� n  IQ
�
�
� 4  LQ��
�
�� 
citm
� m  OP���� 
� o  IL���� 0 userfullname userFullName
� o      ���� 0 userfirstname userFirstName
� 
�
�
� r  [g
�
�
� n  [c
�
�
� 4 ^c��
�
�� 
citm
� m  ab������
� o  [^���� 0 userfullname userFullName
� o      ���� 0 userlastname userLastName
� 
�
�
� r  hs
�
�
� m  hk
�
� �
�
�  
� n     
�
�
� 1  nr��
�� 
txdl
� 1  kn��
�� 
ascr
� 
�
�
� r  t�
�
�
� l t�
�����
� b  t�
�
�
� b  t�
�
�
� b  t�
�
�
� n  t|
�
�
� 4  w|��
�
�� 
cha 
� m  z{���� 
� o  tw���� 0 userfirstname userFirstName
� o  |���� 0 userlastname userLastName
� m  ��
�
� �
�
�  @
� o  ������ 0 
domainname 
domainName��  ��  
� o      ���� 0 emailaddress emailAddress
� 
���
� l ����������  ��  ��  ��  
� 
�
�
� F  ��
�
�
� = ��
�
�
� o  ������ 0 emailformat emailFormat
� m  ������ 
� = ��
�
�
� o  ������ 0 displayname displayName
� m  ������ 
� 
�
�
� k  �
�
� 
�
�
� l ����������  ��  ��  
�    l ������   P J Pull user information from the account settings of the local user account    � �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t  l ����������  ��  ��    r  ��	
	 n  �� 1  ����
�� 
sisn l ������ I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
 o      ���� 0 usershortname userShortName  r  �� n  �� 1  ����
�� 
siln l ������ I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��   o      ���� 0 userfullname userFullName  l ����������  ��  ��    l ������   C = shortName@domain.com and full name displays as "Last, First"    � z   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "  l ����������  ��  ��    r  �� !  m  ��"" �##  ,  ! n     $%$ 1  ����
�� 
txdl% 1  ����
�� 
ascr &'& r  ��()( n  ��*+* 4 ����,
�� 
citm, m  ��������+ o  ������ 0 userfullname userFullName) o      ���� 0 userfirstname userFirstName' -.- r  ��/0/ n  ��121 4  ����3
�� 
cwor3 m  ������ 2 n  ��454 4  ����6
�� 
citm6 m  ������ 5 o  ������ 0 userfullname userFullName0 o      ���� 0 userlastname userLastName. 787 r  ��9:9 m  ��;; �<<  : n     =>= 1  ����
�� 
txdl> 1  ����
�� 
ascr8 ?@? r   ABA b   CDC b   EFE o   ���� 0 usershortname userShortNameF m  GG �HH  @D o  ���� 0 
domainname 
domainNameB o      ���� 0 emailaddress emailAddress@ I��I l ��������  ��  ��  ��  
� JKJ F  -LML = NON o  ���� 0 emailformat emailFormatO m  ���� M = ")PQP o  "'���� 0 displayname displayNameQ m  '(���� K R��R k  0�SS TUT l 00��������  ��  ��  U VWV l 00��XY��  X P J Pull user information from the account settings of the local user account   Y �ZZ �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n tW [\[ l 00��������  ��  ��  \ ]^] r  0=_`_ n  09aba 1  59��
�� 
sisnb l 05c����c I 05������
�� .sysosigtsirr   ��� null��  ��  ��  ��  ` o      ���� 0 usershortname userShortName^ ded r  >Kfgf n  >Ghih 1  CG��
�� 
silni l >Cj����j I >C������
�� .sysosigtsirr   ��� null��  ��  ��  ��  g o      ���� 0 userfullname userFullNamee klk l LL��������  ��  ��  l mnm l LL��op��  o B < shortName@domain.com and full name displays as "First Last"   p �qq x   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "n rsr l LL��������  ��  ��  s tut r  LWvwv m  LOxx �yy   w n     z{z 1  RV��
�� 
txdl{ 1  OR��
�� 
ascru |}| r  Xi~~ n  Xe��� 4  `e���
�� 
cwor� m  cd���� � n  X`��� 4  [`���
�� 
citm� m  ^_���� � o  X[���� 0 userfullname userFullName o      ���� 0 userfirstname userFirstName} ��� r  jv��� n  jr��� 4 mr���
�� 
citm� m  pq������� o  jm���� 0 userfullname userFullName� o      ���� 0 userlastname userLastName� ��� r  w���� m  wz�� ���  � n     ��� 1  }���
�� 
txdl� 1  z}��
�� 
ascr� ��� r  ����� b  ����� b  ����� o  ���� 0 usershortname userShortName� m  ���� ���  @� o  ���~�~ 0 
domainname 
domainName� o      �}�} 0 emailaddress emailAddress� ��|� l ���{�z�y�{  �z  �y  �|  ��  � k  ���� ��� l ���x�w�v�x  �w  �v  � ��� l ���u���u  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l ���t�s�r�t  �s  �r  � ��� I ���q��
�q .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� o  ���p�p 0 errormessage errorMessage� o  ���o
�o 
ret � o  ���n
�n 
ret � m  ���� ��� x U n a b l e   t o   p a r s e   a c c o u n t   i n f o r m a t i o n   f r o m   l o c a l   O S   X   a c c o u n t .� �m��
�m 
disp� m  ���l
�l stic    � �k��
�k 
btns� J  ���� ��j� m  ���� ���  O K�j  � �i��
�i 
dflt� J  ���� ��h� m  ���� ���  O K�h  � �g��f
�g 
appr� m  ���� ��� , O u t l o o k   E x c h a n g e   S e t u p�f  � ��� R  ���e�d�
�e .ascrerr ****      � ****�d  � �c��b
�c 
errn� m  ���a�a���b  � ��`� l ���_�^�]�_  �^  �]  �`  �  �  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y���Y  � P J Substitute email address for username for mail systems such as Office 365   � ��� �   S u b s t i t u t e   e m a i l   a d d r e s s   f o r   u s e r n a m e   f o r   m a i l   s y s t e m s   s u c h   a s   O f f i c e   3 6 5� ��� l     �X�W�V�X  �W  �V  � ��� l ����U�T� Z  �����S�R� = ����� o  ���Q�Q *0 useemailforusername useEmailForUsername� m  ���P
�P boovtrue� r  ����� o  ���O�O 0 emailaddress emailAddress� o      �N�N 0 usershortname userShortName�S  �R  �U  �T  � ��� l     �M�L�K�M  �L  �K  � ��� l     �J���J  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �I���I  � &   End collecting user information   � ��� @   E n d   c o l l e c t i n g   u s e r   i n f o r m a t i o n� ��� l     �H���H  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �G�F�E�G  �F  �E  � ��� l     �D���D  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �C���C  � %  Begin logging user information   � ��� >   B e g i n   l o g g i n g   u s e r   i n f o r m a t i o n� ��� l     �B���B  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -�    l     �A�@�?�A  �@  �?    l ���>�= I  ���<�;�< 0 writelog writeLog �: m  �� � & U s e r   i n f o r m a t i o n . . .�:  �;  �>  �=   	
	 l ��9�8 I  ��7�6�7 0 writelog writeLog �5 b  �� m  �� �  F i r s t   N a m e :   o  ���4�4 0 userfirstname userFirstName�5  �6  �9  �8  
  l �3�2 I  �1�0�1 0 writelog writeLog �/ b  
 m   �  L a s t   N a m e :   o  	�.�. 0 userlastname userLastName�/  �0  �3  �2    l �-�, I  �+�*�+ 0 writelog writeLog �) b   !  m  "" �##  E m a i l   A d d r e s s :  ! o  �(�( 0 emailaddress emailAddress�)  �*  �-  �,   $%$ l (&�'�&& I  (�%'�$�% 0 writelog writeLog' (�#( b  $)*) m   ++ �,,  D e p a r t m e n t :  * o   #�"�"  0 userdepartment userDepartment�#  �$  �'  �&  % -.- l )5/�!� / I  )5�0�� 0 writelog writeLog0 1�1 b  *1232 m  *-44 �55  O f f i c e :  3 o  -0�� 0 
useroffice 
userOffice�  �  �!  �   . 676 l 6B8��8 I  6B�9�� 0 writelog writeLog9 :�: b  7>;<; m  7:== �>>  C o m p a n y :  < o  :=�� 0 usercompany userCompany�  �  �  �  7 ?@? l COA��A I  CO�B�� 0 writelog writeLogB C�C b  DKDED m  DGFF �GG  W o r k   P h o n e :  E o  GJ�� 0 userworkphone userWorkPhone�  �  �  �  @ HIH l P\J��J I  P\�K�� 0 writelog writeLogK L�L b  QXMNM m  QTOO �PP  M o b i l e   P h o n e :  N o  TW�
�
 0 
usermobile 
userMobile�  �  �  �  I QRQ l ]iS�	�S I  ]i�T�� 0 writelog writeLogT U�U b  ^eVWV m  ^aXX �YY 
 F A X :  W o  ad�� 0 userfax userFax�  �  �	  �  R Z[Z l jv\��\ I  jv�]� � 0 writelog writeLog] ^��^ b  kr_`_ m  knaa �bb  T i t l e :  ` o  nq���� 0 	usertitle 	userTitle��  �   �  �  [ cdc l w�e����e I  w���f���� 0 writelog writeLogf g��g b  xhih m  x{jj �kk  S t r e e t :  i o  {~���� 0 
userstreet 
userStreet��  ��  ��  ��  d lml l ��n����n I  ����o���� 0 writelog writeLogo p��p b  ��qrq m  ��ss �tt  C i t y :  r o  ������ 0 usercity userCity��  ��  ��  ��  m uvu l ��w����w I  ����x���� 0 writelog writeLogx y��y b  ��z{z m  ��|| �}}  S t a t e :  { o  ������ 0 	userstate 	userState��  ��  ��  ��  v ~~ l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  P o s t a l   C o d e :  � o  ������  0 userpostalcode userPostalCode��  ��  ��  ��   ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  C o u n t r y :  � o  ������ 0 usercountry userCountry��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  W e b   P a g e :  � o  ������ 0 userwebpage userWebPage��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� o  ����
�� 
ret ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � #  End logging user information   � ��� :   E n d   l o g g i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin account setup   � ��� (   B e g i n   a c c o u n t   s e t u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l ������� O  ���� k  ��� ��� I ��������
�� .miscactvnull��� ��� null��  ��  � ��� l ����������  ��  ��  � ��� Q  ������ k  ���� ��� r  ����� m  ����
�� boovtrue� 1  ����
�� 
wkOf� ���� n ����� I  ��������� 0 writelog writeLog� ���� m  ���� ��� d S e t   M i c r o s o f t   O u t l o o k   t o   w o r k   o f f l i n e :   S u c c e s s f u l .��  ��  �  f  ����  � R      ������
�� .ascrerr ****      � ****��  ��  � n ����� I  ��������� 0 writelog writeLog� ���� m  ���� ��� \ S e t   M i c r o s o f t   O u t l o o k   t o   w o r k   o f f l i n e :   F a i l e d .��  ��  �  f  ��� ��� l ����������  ��  ��  � ��� Q  �7���� k  ��� ��� r  �
��� o  ����� 0 unifiedinbox unifiedInbox� 1  	��
�� 
GrpF� ���� n ��� I  ������� 0 writelog writeLog� ���� b  ��� b  ��� m  �� ��� : S e t   G r o u p   S i m i l a r   F o l d e r s   t o  � o  ���� 0 unifiedinbox unifiedInbox� m  �� ���  :   S u c c e s s f u l .��  ��  �  f  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � n %7��� I  &7������� 0 writelog writeLog� ���� b  &3   b  &/ m  &) � : S e t   G r o u p   S i m i l a r   F o l d e r s   t o   o  ).���� 0 unifiedinbox unifiedInbox m  /2 �  :   F a i l e d .��  ��  �  f  %&� 	 l 88��������  ��  ��  	 

 Q  8s k  ;Y  r  ;F o  ;@���� 20 hideonmycomputerfolders hideOnMyComputerFolders 1  @E��
�� 
hOMC �� n GY I  HY������ 0 writelog writeLog �� b  HU b  HQ m  HK � F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o   o  KP���� 20 hideonmycomputerfolders hideOnMyComputerFolders m  QT �    :   S u c c e s s f u l .��  ��    f  GH��   R      ������
�� .ascrerr ****      � ****��  ��   n as!"! I  bs��#���� 0 writelog writeLog# $��$ b  bo%&% b  bk'(' m  be)) �** F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  ( o  ej���� 20 hideonmycomputerfolders hideOnMyComputerFolders& m  kn++ �,,  :   F a i l e d .��  ��  "  f  ab -.- l tt��������  ��  ��  . /0/ Z  t�12����1 = t{343 o  ty���� (0 verifyemailaddress verifyEMailAddress4 m  yz��
�� boovtrue2 k  ~�55 676 r  ~�898 I ~���:;
�� .sysodlogaskr        TEXT: m  ~�<< �== X P l e a s e   v e r i f y   y o u r   e m a i l   a d d r e s s   i s   c o r r e c t .; ��>?
�� 
dtxt> o  ������ 0 emailaddress emailAddress? ��@A
�� 
disp@ m  ������ A ��BC
�� 
apprB m  ��DD �EE , O u t l o o k   E x c h a n g e   S e t u pC ��FG
�� 
btnsF J  ��HH IJI m  ��KK �LL  C a n c e lJ M��M m  ��NN �OO  V e r i f y��  G �P�~
� 
dfltP J  ��QQ R�}R m  ��SS �TT  V e r i f y�}  �~  9 o      �|�| 0 verifyemail verifyEmail7 UVU r  ��WXW n  ��YZY 1  ���{
�{ 
ttxtZ o  ���z�z 0 verifyemail verifyEmailX o      �y�y 0 emailaddress emailAddressV [�x[ n ��\]\ I  ���w^�v�w 0 writelog writeLog^ _�u_ b  ��`a` b  ��bcb m  ��dd �ee > U s e r   v e r i f i e d   e m a i l   a d d r e s s   a s  c o  ���t�t 0 emailaddress emailAddressa m  ��ff �gg  .�u  �v  ]  f  ���x  ��  ��  0 hih l ���s�r�q�s  �r  �q  i jkj Z  �1lm�p�ol = ��non o  ���n�n *0 verifyserveraddress verifyServerAddresso m  ���m
�m boovtruem k  �-pp qrq r  �sts I ��luv
�l .sysodlogaskr        TEXTu m  ��ww �xx f P l e a s e   v e r i f y   y o u r   E x c h a n g e   S e r v e r   n a m e   i s   c o r r e c t .v �kyz
�k 
dtxty o  ���j�j  0 exchangeserver ExchangeServerz �i{|
�i 
disp{ m  ���h�h | �g}~
�g 
appr} m  �� ��� , O u t l o o k   E x c h a n g e   S e t u p~ �f��
�f 
btns� J  ���� ��� m  ���� ���  C a n c e l� ��e� m  ���� ���  V e r i f y�e  � �d��c
�d 
dflt� J  ��� ��b� m  � �� ���  V e r i f y�b  �c  t o      �a�a 0 verifyserver verifyServerr ��� r  ��� n  ��� 1  �`
�` 
ttxt� o  �_�_ 0 verifyserver verifyServer� o      �^�^  0 exchangeserver ExchangeServer� ��]� n -��� I  -�\��[�\ 0 writelog writeLog� ��Z� b  )��� b  %��� m  �� ��� @ U s e r   v e r i f i e d   s e r v e r   a d d r e s s   a s  � o  $�Y�Y  0 exchangeserver ExchangeServer� m  %(�� ���  .�Z  �[  �  f  �]  �p  �o  k ��� l 22�X�W�V�X  �W  �V  � ��� l 22�U���U  � "  create the Exchange account   � ��� 8   c r e a t e   t h e   E x c h a n g e   a c c o u n t� ��� l 22�T�S�R�T  �S  �R  � ��� Q  2���� k  5��� ��� r  5���� I 5��Q�P�
�Q .corecrel****      � null�P  � �O��
�O 
kocl� m  9<�N
�N 
Eact� �M��L
�M 
prdt� l 	?���K�J� K  ?��� �I��
�I 
pnam� b  @G��� m  @C�� ���  M a i l b o x   -  � o  CF�H�H 0 userfullname userFullName� �G��
�G 
unme� b  JS��� o  JO�F�F 0 domainprefix domainPrefix� o  OR�E�E 0 usershortname userShortName� �D��
�D 
fnam� o  VY�C�C 0 userfullname userFullName� �B��
�B 
emad� o  \_�A�A 0 emailaddress emailAddress� �@��
�@ 
host� o  bg�?�?  0 exchangeserver ExchangeServer� �>��
�> 
usss� o  jo�=�= 60 exchangeserverrequiresssl ExchangeServerRequiresSSL� �<��
�< 
port� o  rw�;�; .0 exchangeserversslport ExchangeServerSSLPort� �:��
�: 
ExLS� o  z�9�9 "0 directoryserver DirectoryServer� �8��
�8 
LDAu� o  ���7�7 N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication� �6��
�6 
LDSL� o  ���5�5 80 directoryserverrequiresssl DirectoryServerRequiresSSL� �4��
�4 
ExLP� o  ���3�3 00 directoryserversslport DirectoryServerSSLPort� �2��
�2 
LDMX� o  ���1�1 >0 directoryservermaximumresults DirectoryServerMaximumResults� �0��
�0 
LDSB� o  ���/�/ 60 directoryserversearchbase DirectoryServerSearchBase� �.��
�. 
ExPm� o  ���-�- *0 downloadheadersonly downloadHeadersOnly� �,��+
�, 
pBAD� o  ���*�* (0 enableautodiscover enableAutodiscover�+  �K  �J  �L  � o      �)�) (0 newexchangeaccount newExchangeAccount� ��(� n ����� I  ���'��&�' 0 writelog writeLog� ��%� m  ���� ��� H C r e a t e   E x c h a n g e   a c c o u n t :   S u c c e s s f u l .�%  �&  �  f  ���(  � R      �$�#�"
�$ .ascrerr ****      � ****�#  �"  � k  ��� ��� l ���!� ��!  �   �  � ��� l ������  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l ������  �  �  � ��� n ����� I  ������ 0 writelog writeLog� ��� m  ���� ��� @ C r e a t e   E x c h a n g e   a c c o u n t :   F a i l e d .�  �  �  f  ��� ��� l ������  �  �  � ��� I ����
� .sysodlogaskr        TEXT� b  ����� b  ��   b  �� o  ���� 0 errormessage errorMessage o  ���
� 
ret  o  ���
� 
ret � m  �� � D U n a b l e   t o   c r e a t e   E x c h a n g e   a c c o u n t .� �
� 
disp m  ���
� stic     �	
� 
btns J  ��

 � m  �� �  O K�  	 �
� 
dflt J  � � m  �  �  O K�   �
�	
�
 
appr m   � , O u t l o o k   E x c h a n g e   S e t u p�	  �  R  ��
� .ascrerr ****      � ****�   ��
� 
errn m  �����   � l ��� �  �  �   �  �  l ��������  ��  ��    l �� !��    e _ The following lines enable Kerberos support if the userKerberos property above is set to true.   ! �"" �   T h e   f o l l o w i n g   l i n e s   e n a b l e   K e r b e r o s   s u p p o r t   i f   t h e   u s e r K e r b e r o s   p r o p e r t y   a b o v e   i s   s e t   t o   t r u e . #$# l ��������  ��  ��  $ %&% Z  �'(����' = #)*) o  !���� 0 usekerberos useKerberos* m  !"��
�� boovtrue( Q  &�+,-+ k  )K.. /0/ r  )6121 o  ).���� 0 usekerberos useKerberos2 n      343 1  15��
�� 
Kerb4 o  .1���� (0 newexchangeaccount newExchangeAccount0 565 r  7B787 o  7:���� &0 userkerberosrealm userKerberosRealm8 n      9:9 1  =A��
�� 
ExGI: o  :=���� (0 newexchangeaccount newExchangeAccount6 ;��; n CK<=< I  DK��>���� 0 writelog writeLog> ?��? m  DG@@ �AA P S e t   K e r b e r o s   a u t h e n t i c a t i o n :   S u c c e s s f u l .��  ��  =  f  CD��  , R      ������
�� .ascrerr ****      � ****��  ��  - k  S�BB CDC l SS��������  ��  ��  D EFE l SS��GH��  G   something went wrong   H �II *   s o m e t h i n g   w e n t   w r o n gF JKJ l SS��������  ��  ��  K LML n S[NON I  T[��P���� 0 writelog writeLogP Q��Q m  TWRR �SS H S e t   K e r b e r o s   a u t h e n t i c a t i o n :   F a i l e d .��  ��  O  f  STM TUT l \\��������  ��  ��  U VWV I \���XY
�� .sysodlogaskr        TEXTX b  \iZ[Z b  \e\]\ b  \c^_^ o  \a���� 0 errormessage errorMessage_ o  ab��
�� 
ret ] o  cd��
�� 
ret [ m  eh`` �aa ^ U n a b l e   t o   s e t   E x c h a n g e   a c c o u n t   t o   u s e   K e r b e r o s .Y ��bc
�� 
dispb m  lo��
�� stic    c ��de
�� 
btnsd J  rwff g��g m  ruhh �ii  O K��  e ��jk
�� 
dfltj J  zll m��m m  z}nn �oo  O K��  k ��p��
�� 
apprp m  ��qq �rr , O u t l o o k   E x c h a n g e   S e t u p��  W sts R  ������u
�� .ascrerr ****      � ****��  u ��v��
�� 
errnv m  ����������  t w��w l ����������  ��  ��  ��  ��  ��  & xyx l ����������  ��  ��  y z{z Q  ��|}~| k  �� ��� l ��������  � M G The Me Contact record is automatically created with the first account.   � ��� �   T h e   M e   C o n t a c t   r e c o r d   i s   a u t o m a t i c a l l y   c r e a t e d   w i t h   t h e   f i r s t   a c c o u n t .� ��� l ��������  � a [ Set the first name, last name, email address and other information using Active Directory.   � ��� �   S e t   t h e   f i r s t   n a m e ,   l a s t   n a m e ,   e m a i l   a d d r e s s   a n d   o t h e r   i n f o r m a t i o n   u s i n g   A c t i v e   D i r e c t o r y .� ��� l ����������  ��  ��  � ��� r  ����� o  ������ 0 userfirstname userFirstName� n      ��� 1  ����
�� 
pFrN� 1  ����
�� 
meCn� ��� r  ����� o  ������ 0 userlastname userLastName� n      ��� 1  ����
�� 
pLsN� 1  ����
�� 
meCn� ��� r  ����� K  ���� ����
�� 
radd� o  ������ 0 emailaddress emailAddress� �����
�� 
type� m  ����
�� EATyeWrk��  � n      ��� 1  ����
�� 
EmAd� 1  ����
�� 
meCn� ��� r  ����� o  ������  0 userdepartment userDepartment� n      ��� 1  ����
�� 
Dptm� 1  ����
�� 
meCn� ��� r  ����� o  ������ 0 
useroffice 
userOffice� n      ��� 1  ����
�� 
Ofic� 1  ����
�� 
meCn� ��� r  � ��� o  ������ 0 usercompany userCompany� n      ��� 1  ����
�� 
Cmpy� 1  ����
�� 
meCn� ��� r  ��� o  ���� 0 userworkphone userWorkPhone� n      ��� 1  	��
�� 
bsNm� 1  	��
�� 
meCn� ��� r  ��� o  ���� 0 
usermobile 
userMobile� n      ��� 1  ��
�� 
mbNm� 1  ��
�� 
meCn� ��� r  *��� o   ���� 0 userfax userFax� n      ��� 1  %)��
�� 
bFax� 1   %��
�� 
meCn� ��� r  +8��� o  +.���� 0 	usertitle 	userTitle� n      ��� 1  37��
�� 
pTtl� 1  .3��
�� 
meCn� ��� r  9F��� o  9<���� 0 
userstreet 
userStreet� n      ��� 1  AE��
�� 
bStA� 1  <A��
�� 
meCn� ��� r  GT��� o  GJ���� 0 usercity userCity� n      ��� 1  OS��
�� 
bCty� 1  JO��
�� 
meCn� ��� r  Ub��� o  UX���� 0 	userstate 	userState� n      ��� 1  ]a��
�� 
bSta� 1  X]��
�� 
meCn� ��� r  cp��� o  cf����  0 userpostalcode userPostalCode� n      ��� 1  ko��
�� 
bZip� 1  fk��
�� 
meCn� ��� r  q~��� o  qt���� 0 usercountry userCountry� n      ��� 1  y}��
�� 
bCou� 1  ty��
�� 
meCn� ��� r  ���� o  ����� 0 userwebpage userWebPage� n      ��� 1  ����
�� 
bsWP� 1  ����
�� 
meCn� ���� n ����� I  ��������� 0 writelog writeLog� ���� m  ���� ��� X P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   S u c c e s s f u l .��  ��  �  f  ����  } R      ������
�� .ascrerr ****      � ****��  ��  ~ n ����� I  ��������� 0 writelog writeLog� ���� m  ���� ��� P P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   F a i l e d .��  ��  �  f  ��{ ��� l ����~�}�  �~  �}  � � � l ���|�|   0 * Set Outlook to be the default application    � T   S e t   O u t l o o k   t o   b e   t h e   d e f a u l t   a p p l i c a t i o n   l ���{�{   ( " for mail, calendars and contacts.    � D   f o r   m a i l ,   c a l e n d a r s   a n d   c o n t a c t s . 	
	 l ���z�y�x�z  �y  �x  
  Q  �� k  ��  r  �� m  ���w
�w boovtrue 1  ���v
�v 
pMSD  r  �� m  ���u
�u boovtrue 1  ���t
�t 
pCSD  r  �� m  ���s
�s boovtrue 1  ���r
�r 
pABD �q n �� I  ���p �o�p 0 writelog writeLog  !�n! m  ��"" �## � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   S u c c e s s f u l .�n  �o    f  ���q   R      �m�l�k
�m .ascrerr ****      � ****�l  �k   n ��$%$ I  ���j&�i�j 0 writelog writeLog& '�h' m  ��(( �)) � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   F a i l e d .�h  �i  %  f  �� *+* l ���g�f�e�g  �f  �e  + ,-, I ���d.�c
�d .sysodelanull��� ��� nmbr. m  ���b�b �c  - /0/ l ���a�`�_�a  �`  �_  0 121 Q  �3453 k  ��66 787 r  ��9:9 m  ���^
�^ boovfals: 1  ���]
�] 
wkOf8 ;�\; n ��<=< I  ���[>�Z�[ 0 writelog writeLog> ?�Y? m  ��@@ �AA b S e t   M i c r o s o f t   O u t l o o k   t o   w o r k   o n l i n e :   S u c c e s s f u l .�Y  �Z  =  f  ���\  4 R      �X�W�V
�X .ascrerr ****      � ****�W  �V  5 n �BCB I  ��UD�T�U 0 writelog writeLogD E�SE m  �FF �GG Z S e t   M i c r o s o f t   O u t l o o k   t o   w o r k   o n l i n e :   F a i l e d .�S  �T  C  f  ��2 HIH l �R�Q�P�R  �Q  �P  I JKJ l �OLM�O  L   We're done.   M �NN    W e ' r e   d o n e .K O�NO l �M�L�K�M  �L  �K  �N  � m  ��PP�                                                                                  OPIM  alis    N  Macintosh HD                   BD ����Microsoft Outlook.app                                          ����            ����  
 cu             Applications  %/:Applications:Microsoft Outlook.app/   ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  ��  ��  � QRQ l     �J�I�H�J  �I  �H  R STS l     �GUV�G  U 0 *------------------------------------------   V �WW T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -T XYX l     �FZ[�F  Z   End account setup   [ �\\ $   E n d   a c c o u n t   s e t u pY ]^] l     �E_`�E  _ 0 *------------------------------------------   ` �aa T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -^ bcb l     �D�C�B�D  �C  �B  c ded l     �Afg�A  f 0 *------------------------------------------   g �hh T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -e iji l     �@kl�@  k   Begin script cleanup   l �mm *   B e g i n   s c r i p t   c l e a n u pj non l     �?pq�?  p 0 *------------------------------------------   q �rr T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -o sts l     �>�=�<�>  �=  �<  t uvu l     �;�:�9�;  �:  �9  v wxw l 	,y�8�7y Q  	,z{|z k  }} ~~ I �6��5
�6 .sysoexecTEXT���     TEXT� m  �� ��� � / b i n / r m   $ H O M E / L i b r a r y / L a u n c h A g e n t s / n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5 . p l i s t�5   ��4� I  �3��2�3 0 writelog writeLog� ��1� m  �� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   S u c c e s s f u l .�1  �2  �4  { R      �0�/�.
�0 .ascrerr ****      � ****�/  �.  | I  $,�-��,�- 0 writelog writeLog� ��+� m  %(�� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   F a i l e d .�+  �,  �8  �7  x ��� l     �*�)�(�*  �)  �(  � ��� l -P��'�&� Q  -P���� k  0@�� ��� I 07�%��$
�% .sysoexecTEXT���     TEXT� m  03�� ��� x / b i n / l a u n c h c t l   r e m o v e   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5�$  � ��#� I  8@�"��!�" 0 writelog writeLog� �� � m  9<�� ��� x U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   S u c c e s s f u l .�   �!  �#  � R      ���
� .ascrerr ****      � ****�  �  � I  HP���� 0 writelog writeLog� ��� m  IL�� ��� p U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   F a i l e d .�  �  �'  �&  � ��� l     ����  �  �  � ��� l QW���� I  QW���� 0 writelog writeLog� ��� o  RS�
� 
ret �  �  �  �  � ��� l X^���� I  X^���� 0 writelog writeLog� ��� o  YZ�
� 
ret �  �  �  �  � ��� l _e��
�	� I  _e���� 0 writelog writeLog� ��� o  `a�
� 
ret �  �  �
  �	  � ��� l     ����  �  �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     � ���   �   End script cleanup   � ��� &   E n d   s c r i p t   c l e a n u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin script handlers   � ��� ,   B e g i n   s c r i p t   h a n d l e r s� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� i   ^ a��� I      ������� 0 writelog writeLog� ���� o      ���� 0 
logmessage 
logMessage��  ��  � k     Y�� ��� r     ��� b     	��� l    ������ I    ����
�� .earsffdralis        afdr� m     ��
�� afdrcusr� �����
�� 
rtyp� m    ��
�� 
TEXT��  ��  ��  � m    �� ��� L L i b r a r y : L o g s : O u t l o o k E x c h a n g e S e t u p 5 . l o g� o      ���� 0 logfile logFile� ��� r    !��� b    ��� b    ��� b    ��� n    ��� 1    ��
�� 
shdt� l   ������ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � m    �� ���   � n    ��� 1    ��
�� 
tstr� l   ������ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � 1    ��
�� 
tab � o      ���� 0 rightnow rightNow� ��� Z   " 5� ��� =  " % o   " #���� 0 
logmessage 
logMessage o   # $��
�� 
ret   r   ( + o   ( )��
�� 
ret  o      ���� 0 loginfo logInfo��   r   . 5 b   . 3	 b   . 1

 o   . /���� 0 rightnow rightNow o   / 0���� 0 
logmessage 
logMessage	 o   1 2��
�� 
ret  o      ���� 0 loginfo logInfo�  r   6 B I  6 @��
�� .rdwropenshor       file 4   6 :��
�� 
file o   8 9���� 0 logfile logFile ����
�� 
perm m   ; <��
�� boovtrue��   o      ���� 0 openlogfile openLogFile  I  C P��
�� .rdwrwritnull���     **** o   C D���� 0 loginfo logInfo ��
�� 
refn o   E F���� 0 openlogfile openLogFile ����
�� 
wrat m   G J��
�� rdwreof ��   �� I  Q Y����
�� .rdwrclosnull���     **** 4   Q U��
�� 
file o   S T���� 0 logfile logFile��  ��  �  l     ��������  ��  ��    !  l     ��"#��  " 0 *------------------------------------------   # �$$ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -! %&% l     ��'(��  '   End script handlers   ( �)) (   E n d   s c r i p t   h a n d l e r s& *��* l     ��+,��  + 0 *------------------------------------------   , �-- T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -��       ��.�� ?���� i�������� ���������c���������������/0��  . ������������������������������������������������������ 0 usekerberos useKerberos��  0 exchangeserver ExchangeServer�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL�� .0 exchangeserversslport ExchangeServerSSLPort�� "0 directoryserver DirectoryServer�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication�� 80 directoryserverrequiresssl DirectoryServerRequiresSSL�� 00 directoryserversslport DirectoryServerSSLPort�� >0 directoryservermaximumresults DirectoryServerMaximumResults�� 60 directoryserversearchbase DirectoryServerSearchBase�� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�� *0 useemailforusername useEmailForUsername�� 0 
domainname 
domainName�� 0 emailformat emailFormat�� 0 displayname displayName�� 0 domainprefix domainPrefix�� (0 verifyemailaddress verifyEMailAddress�� *0 verifyserveraddress verifyServerAddress�� *0 displaydomainprefix displayDomainPrefix�� *0 downloadheadersonly downloadHeadersOnly�� 20 hideonmycomputerfolders hideOnMyComputerFolders�� 0 unifiedinbox unifiedInbox�� (0 enableautodiscover enableAutodiscover�� 0 errormessage errorMessage�� 0 writelog writeLog
�� .aevtoappnull  �   � ****
�� boovtrue
�� boovtrue���
�� boovtrue
�� boovtrue������
�� boovtrue
�� boovfals�� �� 
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovtrue/ �������12���� 0 writelog writeLog�� ��3�� 3  ���� 0 
logmessage 
logMessage��  1 ������������ 0 
logmessage 
logMessage�� 0 logfile logFile�� 0 rightnow rightNow�� 0 loginfo logInfo�� 0 openlogfile openLogFile2 ����~�}��|�{��z�y�x�w�v�u�t�s�r�q�p�o
�� afdrcusr
� 
rtyp
�~ 
TEXT
�} .earsffdralis        afdr
�| .misccurdldt    ��� null
�{ 
shdt
�z 
tstr
�y 
tab 
�x 
ret 
�w 
file
�v 
perm
�u .rdwropenshor       file
�t 
refn
�s 
wrat
�r rdwreof �q 
�p .rdwrwritnull���     ****
�o .rdwrclosnull���     ****�� Z���l �%E�O*j �,�%*j �,%�%E�O��  �E�Y 	��%�%E�O*�/�el E�O���a a  O*�/j 0 �n4�m�l56�k
�n .aevtoappnull  �   � ****4 k    e77 "88 )99 4:: ];; d<< m== v>> ?? �@@ �AA �BB �CC �DD �EE �FF �GG �HH �II JJ KK LL MM (NN 1OO :PP CQQ sRR zSS �TT �UU �VV �WW �XX �YY �ZZ �[[ �\\ �]] �^^ �__ �`` �aa �bb cc 	dd ee ff $gg -hh 6ii ?jj Hkk Qll Zmm cnn loo upp ~qq �rr �ss �tt �uu wvv �ww �xx �yy ��j�j  �m  �l  5 �i�i 0 i  66'�h0�g�fbkt}������������&/8Ax�e�d��c��b��a��`��_��^��]��\��[��Z��Y��X��W��V�U�T�S�R�Q�P�O�N#�M)�L,�K�J�I�H�G�FAN�E�Db�C�B}������1>Rmz�A������!.B]j~������2MZn������@�"=J^~��?�������>�=�<�;	 �:		)	+	]	v	�	�	�	�	�

*
6
h
�
�
�
�
��9";Gx������"+4=FOXajs|���P�8�7���6���5)+<�4DKNS�3�2�1dfw����0���/�.�-��,�+�*�)�(�'�&�%�$�#�"�!� ��������@R`hnq����������������
�	��������"(��@F�������h 0 writelog writeLog
�g 
pnam
�f 
ret �e 0 userfirstname userFirstName�d 0 userlastname userLastName�c  0 userdepartment userDepartment�b 0 
useroffice 
userOffice�a 0 usercompany userCompany�` 0 userworkphone userWorkPhone�_ 0 
usermobile 
userMobile�^ 0 userfax userFax�] 0 	usertitle 	userTitle�\ 0 
userstreet 
userStreet�[ 0 usercity userCity�Z 0 	userstate 	userState�Y  0 userpostalcode userPostalCode�X 0 usercountry userCountry�W 0 userwebpage userWebPage
�V 
ascr
�U 
txdl
�T .sysoexecTEXT���     TEXT�S "0 userinformation userInformation�R  �Q  
�P 
disp
�O stic    
�N 
btns
�M 
dflt
�L 
appr�K 
�J .sysodlogaskr        TEXT
�I 
errn�H��
�G 
cpar
�F .corecnte****       ****
�E 
citm�D 0 emailaddress emailAddress
�C 
cha 
�B 
TEXT�A 0 usershortname userShortName�@ 0 userfullname userFullName�? &0 userkerberosrealm userKerberosRealm
�> 
bool
�= .sysosigtsirr   ��� null
�< 
sisn
�; 
siln
�: 
cwor�9 
�8 .miscactvnull��� ��� null
�7 
wkOf
�6 
GrpF
�5 
hOMC
�4 
dtxt�3 
�2 0 verifyemail verifyEmail
�1 
ttxt�0 0 verifyserver verifyServer
�/ 
kocl
�. 
Eact
�- 
prdt
�, 
unme
�+ 
fnam
�* 
emad
�) 
host
�( 
usss
�' 
port
�& 
ExLS
�% 
LDAu
�$ 
LDSL
�# 
ExLP
�" 
LDMX
�! 
LDSB
�  
ExPm
� 
pBAD� 
� .corecrel****      � null� (0 newexchangeaccount newExchangeAccount
� 
Kerb
� 
ExGI
� 
meCn
� 
pFrN
� 
pLsN
� 
radd
� 
type
� EATyeWrk
� 
EmAd
� 
Dptm
� 
Ofic
� 
Cmpy
� 
bsNm
� 
mbNm
� 
bFax
� 
pTtl
� 
bStA
�
 
bCty
�	 
bSta
� 
bZip
� 
bCou
� 
bsWP
� 
pMSD
� 
pCSD
� 
pABD� 
� .sysodelanull��� ��� nmbr�kf*�k+ O*�)�,%k+ O*�k+ O*�k+ O*�b   %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  	%k+ O*a b  
%k+ O*�k+ Ob  
f  G*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*�k+ Y hO*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*�k+ Oa E` Oa E`  Oa !E` "Oa #E` $Oa %E` &Oa 'E` (Oa )E` *Oa +E` ,Oa -E` .Oa /E` 0Oa 1E` 2Oa 3E` 4Oa 5E` 6Oa 7E` 8Oa 9E` :Ob  
e c a ;kv_ <a =,FOa >j ?E` @W AX A Bb  �%�%a C%a Da Ea Fa Gkva Ha Ikva Ja Ka L MO)a Na OlhO{k_ @a P-j Qkh  a Rkv_ <a =,FO_ @a P�/a S L _ @a P�/a Tl/E` UW 2X A Ba Vkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` UY hOa Ykv_ <a =,FO_ @a P�/a Z L _ @a P�/a Tl/E` 8W 2X A Ba [kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` 8Y hOa \kv_ <a =,FO_ @a P�/a ] L _ @a P�/a Tl/E` &W 2X A Ba ^kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` &Y hOa _kv_ <a =,FO_ @a P�/a ` L _ @a P�/a Tl/E` "W 2X A Ba akv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` "Y hOa bkv_ <a =,FO_ @a P�/a c L _ @a P�/a Tl/E` $W 2X A Ba dkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` $Y hOa ekv_ <a =,FO_ @a P�/a f L _ @a P�/a Tl/E` gW 2X A Ba hkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` gY hOa ikv_ <a =,FO_ @a P�/a j L _ @a P�/a Tl/E` :W 2X A Ba kkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` :Y hOa lkv_ <a =,FO_ @a P�/a m L _ @a P�/a Tl/E` 2W 2X A Ba nkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` 2Y hOa okv_ <a =,FO_ @a P�/a p L _ @a P�/a Tl/E` ,W 2X A Ba qkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` ,Y hOa rkv_ <a =,FO_ @a P�/a s L _ @a P�/a Tl/E` W 2X A Ba tkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` Y hOa ukv_ <a =,FO_ @a P�/a v L _ @a P�/a Tl/E` .W 2X A Ba wkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` .Y hOa xkv_ <a =,FO_ @a P�/a y L _ @a P�/a Tl/E`  W 2X A Ba zkv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E`  Y hOa {kv_ <a =,FO_ @a P�/a | L _ @a P�/a Tl/E` *W 2X A Ba }kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` *Y hOa ~kv_ <a =,FO_ @a P�/a  L _ @a P�/a Tl/E` (W 2X A Ba �kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` (Y hOa �kv_ <a =,FO_ @a P�/a � L _ @a P�/a Tl/E` 6W 2X A Ba �kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` 6Y hOa �kv_ <a =,FO_ @a P�/a � L _ @a P�/a Tl/E` �W 2X A Ba �kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` �Y hOa �kv_ <a =,FO_ @a P�/a � L _ @a P�/a Tl/E` 4W 2X A Ba �kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` 4Y hOa �kv_ <a =,FO_ @a P�/a � L _ @a P�/a Tl/E` 0W 2X A Ba �kv_ <a =,FO_ @a P�k/[a W\[Zl\62a X&E` 0Y hOP[OY��Oa �a �lv_ <a =,FO _ @a Tl/E` �W X A BhOa �kv_ <a =,FO_ Ua �  ?b  �%�%a �%a Da Ea Fa �kva Ha �kva Ja �a L MO)a Na OlhY hOPYlb  k 	 b  k a �& s*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Ti/E` O_ �a Tk/a �k/E`  Oa �_ <a =,FO_ a �%_  %a �%b  %E` UOPY�b  k 	 b  l a �& s*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Tk/a �k/E` O_ �a Ti/E`  Oa �_ <a =,FO_ a �%_  %a �%b  %E` UOPYZb  l 	 b  k a �& k*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Ti/E` O_ �a Tk/a �k/E`  Oa �_ <a =,FO_ a �%b  %E` UOPY�b  l 	 b  l a �& k*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Tk/a �k/E` O_ �a Ti/E`  Oa �_ <a =,FO_ a �%b  %E` UOPYXb  m 	 b  k a �& t*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Ti/E` O_ �a Tk/a �k/E`  Oa �_ <a =,FO_ a Wk/_  %a �%b  %E` UOPY�b  m 	 b  l a �& t*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Tk/a �k/E` O_ �a Ti/E`  Oa �_ <a =,FO_ a Wk/_  %a �%b  %E` UOPYDb  a � 	 b  k a �& k*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Ti/E` O_ �a Tk/a �k/E`  Oa �_ <a =,FO_ ga �%b  %E` UOPY �b  a � 	 b  l a �& k*j �a �,E` gO*j �a �,E` �Oa �_ <a =,FO_ �a Tk/a �k/E` O_ �a Ti/E`  Oa �_ <a =,FO_ ga �%b  %E` UOPY >b  �%�%a �%a Da Ea Fa �kva Ha �kva Ja �a L MO)a Na OlhOPOb  e  _ UE` gY hO*a �k+ O*a �_ %k+ O*a �_  %k+ O*a �_ U%k+ O*a �_ "%k+ O*a �_ $%k+ O*a �_ &%k+ O*a �_ (%k+ O*a �_ *%k+ O*a �_ ,%k+ O*a �_ .%k+ O*a �_ 0%k+ O*a �_ 2%k+ O*a �_ 4%k+ O*a �_ 6%k+ O*a �_ 8%k+ O*a �_ :%k+ O*�k+ Oa �7*j �O e*a �,FO)a �k+ W X A B)a �k+ O #b  *a �,FO)a �b  %a �%k+ W X A B)a �b  %a �%k+ O #b  *a �,FO)a �b  %a �%k+ W X A B)a �b  %a �%k+ Ob  e  Ra �a �_ Ua Dka Ja �a Fa �a �lva Ha �kva � ME` �O_ �a �,E` UO)a �_ U%a �%k+ Y hOb  e  Xa �a �b  a Dka Ja �a Fa �a �lva Ha �kva � ME` �O_ �a �,Ec  O)a �b  %a �%k+ Y hO �*a �a �a ��a �_ �%a �b  _ g%a �_ �a �_ Ua �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  	a �b  a �b  a a �E`O)ak+ W LX A B)ak+ Ob  �%�%a%a Da Ea Fakva Hakva Jaa L MO)a Na OlhOPOb   e  w 'b   _a	,FO_ �_a
,FO)ak+ W LX A B)ak+ Ob  �%�%a%a Da Ea Fakva Hakva Jaa L MO)a Na OlhOPY hO �_ *a,a,FO_  *a,a,FOa_ Uaaa �*a,a,FO_ "*a,a,FO_ $*a,a,FO_ &*a,a,FO_ (*a,a,FO_ **a,a,FO_ ,*a,a,FO_ .*a,a,FO_ 0*a,a,FO_ 2*a,a ,FO_ 4*a,a!,FO_ 6*a,a",FO_ 8*a,a#,FO_ :*a,a$,FO)a%k+ W X A B)a&k+ O %e*a',FOe*a(,FOe*a),FO)a*k+ W X A B)a+k+ Oa,j-O f*a �,FO)a.k+ W X A B)a/k+ OPUO a0j ?O*a1k+ W X A B*a2k+ O a3j ?O*a4k+ W X A B*a5k+ O*�k+ O*�k+ O*�k+ ascr  ��ޭ