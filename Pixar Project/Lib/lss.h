#ifndef lSS_H
#define lSS_H

class lSs
{
	public:
		lSs(char*);
		lSs();
		~lSs();
		lSs& operator=( const lSs& other );

		int lengthh();
		char charAt(int );
		char* substringleft(int );
		char* substring(int);
		void remove(int, int);
		void concatt(char*);


		char* getString();
		void setString(char*);
		int getlength();

		char content[100] = {0};



	private:
		unsigned int length;
		char* string;


};

#endif