//#include "config.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include "text.h"
#include "gfx.h"
#include "msgbox.h"

#define FH_ERROR_OK 0
#define FH_ERROR_FILE 1		/* read/access error */
#define FH_ERROR_FORMAT 2	/* file format error */
#define FH_ERROR_MALLOC 3	/* error during malloc */

int fh_txt_trans(const char *name, int xs, int xw, int ys, int dy, int size, int line, int *cut, int *x, int *y, int plot)
{
char tstr[BUFSIZE]={0},rstr[BUFSIZE]={0},*tptr=NULL;
int loop=1, j, slen;
FILE *fh;
int just, comment, color=CMCT;

	if(!(fh=fopen(name,"rb")))	return(FH_ERROR_FILE);

	*x=0;
	*y=0;
	while((loop>0) && (fgets(tstr, sizeof(tstr), fh)))
	{
		j=0;
		just=LEFT;
		comment=0;
		color=CMCT;
		
		tptr=tstr+strlen(tstr);
		while((tptr>=tstr) && (*tptr<=32))
		{
			*tptr=0;
			--tptr;
		}
		tptr=tstr;
		while(*tptr)
		{
			rstr[j++]=*tptr;

			if(*tptr == '~')
			{
				switch (*(tptr+1))
				{
					case 'l': just=LEFT; break;
					case 'r': just=RIGHT; break;
					case 'c': just=CENTER; break;
					case 'C':
						if (*(tptr+2) == '!') {
							comment=1;
							tptr++;
						}
						else if (*(tptr+2) == 'L') {
							comment=2;
							tptr++;
						}
						else if (*(tptr+2) == 'R') {
							comment=3;
							tptr++;
						}
						break;
					case 's':
						ys-=(dy/2);
						RenderBox(xs, ys-2-size/3+1, xs+xw, ys-2-size/3+2, FILL, CMS);
						RenderBox(xs, ys-2-size/3, xs+xw, ys-2-size/3+1, FILL, CMCIT);
						break;
				}
			}
			tptr++;
		}
		if((loop>0) && (ys<(ey-dy)))
		{
			rstr[j]=0;
			char *t = (char *)alloca(j * 4 + 1);
			memcpy(t, rstr, j + 1);
			TranslateString(t, j * 4);

			if(plot)
			{
				if(loop>=line)
				{
					slen=GetStringLen(xs, t, size);
					if (comment == 1)
					{
						int xxs = xs;
						RenderBox(xs, ys-2-size/2+1, xs+xw, ys-2-size/2+2, FILL, CMS);
						RenderBox(xs, ys-2-size/2, xs+xw, ys-2-size/2+1, FILL, CMCIT);
						if(slen > 0 && slen < xw) {
							xxs += (xw-slen-10)/2-3;
							RenderBox(xxs, ys-2-size/2, xxs+slen+10, ys-2-size/2+2, FILL, CMC);
						}
						RenderString(t, xs, ys, xw, CENTER, size, CMCIT);
					}
					else if (comment == 2)
					{
						RenderBox(xs+slen, ys-2-size/2+1, xs+xw, ys-2-size/2+2, FILL, CMS);
						RenderBox(xs+slen, ys-2-size/2, xs+xw, ys-2-size/2+1, FILL, CMCIT);
						RenderString(t, xs, ys, xw, LEFT, size, color);
					}
					else if (comment == 3)
					{
						RenderBox(xs, ys-2-size/2+1, xs+xw-slen, ys-2-size/2+2, FILL, CMS);
						RenderBox(xs, ys-2-size/2, xs+xw-slen, ys-2-size/2+1, FILL, CMCIT);
						RenderString(t, xs, ys, xw, RIGHT, size, color);
					}
					else
					{
						RenderString(t, xs, ys, xw, just, size, color);
					}
					ys+=dy;
				}
			}
			else
			{
				if(strlen(t))
				{
					slen=GetStringLen(xs, t, size);
					if(slen>*x)
					{
						*x=slen;
					}
				}
				*y=*y+1;
			}
		}
	}
	if(plot)
	{
		*cut=(ys>=(ey-dy));
	}
	fclose(fh);
	return(FH_ERROR_OK);
}

int fh_txt_load(const char *name, int _sx, int wx, int _sy, int dy, int size, int line, int *cut)
{
int dummy;

	return fh_txt_trans(name, _sx, wx, _sy, dy, size, line, cut, &dummy, &dummy, 1);
}


int fh_txt_getsize(const char *name, int *x, int *y, int size, int *cut)
{
	return fh_txt_trans(name, 0, 0, 0, 0, size, 0, cut, x, y, 0);
}
