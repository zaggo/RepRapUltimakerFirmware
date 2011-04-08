/*
 * process_g_code.h
 *
 *  Created on: 2011-04-05
 *      Author: rob
 */

#ifndef PROCESS_G_CODE_H_
#define PROCESS_G_CODE_H_

void setupGcodeProcessor();

void init_process_string();

void get_and_do_command();

void process_string(char instruction[], int size);

inline bool qEmpty();
inline void qMove(const FloatPoint& p);
inline void dQMove();

inline void setUnits(bool u);
inline void setPosition(const FloatPoint& p);


//int scan_int(char *str, int *valp);
int scan_float(char *str, float *valp, unsigned int *seen, unsigned int flag);
int scan_int(char *str, int *valp, unsigned int *seen, unsigned int flag);
int scan_long(char *str, long *valp, unsigned int *seen, unsigned int flag);
int scan_float(char *str, float *valp);
int scan_int(char *str, int *valp, unsigned int *seen, unsigned int flag);

inline void init_process_string();

#endif /* PROCESS_G_CODE_H_ */