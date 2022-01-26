 #  
 . S y n o p s i s  
       	 F o r c e   I n s t a l l   U p d a t e s   o n   R e m o t e   C o m p u t e r  
 . D E S C R I P T I O N  
       	 F o r c e   I n s t a l l   U p d a t e s   o n   R e m o t e   C o m p u t e r   u s i n g   a   s c h e d u l e d   t a s k  
 . E X A M P L E  
 	 I n s t a l l U p d a t e s   - C o m p u t e r   " s e r v e r 1 . c o n t o s o . c o m "   - U s e r   " C o n t o s o \ A d m i n i s t r a t o r "   - P a s s w o r d   " P a s s w o r d "  
 . N O T E S  
       	 V e r s i o n   1 . 0   -   I n i t i a l   S c r i p t  
       	 W r i t t e n   b y   D a r r y l   v a n   d e r   P e i j l  
       	 D a t e :   3 0 . 0 5 . 2 0 1 4  
  
       	 U s e   a t   o w n   r i s k  
 # >  
  
 F u n c t i o n   I n s t a l l U p d a t e s   {  
 p a r a m ( $ C o m p u t e r , $ U s e r , $ P a s s w o r d )  
  
 $ S e c u r e P a s s w o r d   =   C o n v e r t T o - S e c u r e S t r i n g    S t r i n g   $ P a s s w o r d    A s P l a i n T e x t   - F o r c e  
 $ C r e d e n t i a l   =   N e w - O b j e c t    T y p e N a m e   S y s t e m . M a n a g e m e n t . A u t o m a t i o n . P S C r e d e n t i a l    A r g u m e n t L i s t   $ U s e r ,   $ S e c u r e P a s s w o r d  
  
 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r   - c r e d e n t i a l   $ C r e d e n t i a l   - S c r i p t B l o c k   {  
 # G e t   D a t e  
 $ D a t e A n d T i m e   =   ( G e t - D a t e   - f o r m a t   d d M M M y y y y - H H . m m )  
 # R e g i s t e r   S c h e d u l e d   T a s k   w i t h   D a t e  
 R e g i s t e r - S c h e d u l e d J o b   - N a m e   " I n s t a l l U p d a t e s   $ D a t e A n d T i m e "   - R u n N o w   - S c r i p t B l o c k   {  
 # D e f i n e   u p d a t e   c r i t e r i a .  
 $ C r i t e r i a   =   " I s I n s t a l l e d = 0   a n d   T y p e = ' S o f t w a r e ' " ; `  
 # S e a r c h   f o r   r e l e v a n t   u p d a t e s .  
 $ S e a r c h e r   =   N e w - O b j e c t   - C o m O b j e c t   M i c r o s o f t . U p d a t e . S e a r c h e r ; `  
 $ S e a r c h R e s u l t   =   $ S e a r c h e r . S e a r c h ( $ C r i t e r i a ) . U p d a t e s ; `  
 # D o w n l o a d   u p d a t e s .  
 $ S e s s i o n   =   N e w - O b j e c t   - C o m O b j e c t   M i c r o s o f t . U p d a t e . S e s s i o n ; `  
 $ D o w n l o a d e r   =   $ S e s s i o n . C r e a t e U p d a t e D o w n l o a d e r ( ) ; `  
 $ D o w n l o a d e r . U p d a t e s   =   $ S e a r c h R e s u l t ; `  
 $ D o w n l o a d e r . D o w n l o a d ( ) ; `  
 # I n s t a l l   u p d a t e s .  
 $ I n s t a l l e r   =   N e w - O b j e c t   - C o m O b j e c t   M i c r o s o f t . U p d a t e . I n s t a l l e r ; `  
 $ I n s t a l l e r . U p d a t e s   =   $ S e a r c h R e s u l t ; `  
 # R e s u l t   - >   2   =   S u c c e e d e d ,   3   =   S u c c e e d e d   w i t h   E r r o r s ,   4   =   F a i l e d ,   5   =   A b o r t e d  
 $ R e s u l t   =   $ I n s t a l l e r . I n s t a l l ( ) ; `  
  
 }   # E n d   s c h e d u l e d j o b   s c r i p t b l o c k  
 }   # E n d   I n v o k e   S c r i p t l o c k  
 }   # E n d   F u n c t i o n  
  
 
