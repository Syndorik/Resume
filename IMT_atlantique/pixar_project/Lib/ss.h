#ifndef SS_H
#define SS_H

class Ss
{
	public:
		Ss(char*);
		~Ss();
		Ss& operator=( const Ss& other );

		int lengthh();
		char charAt(int );
		char* substringleft(int );
		char* substring(int);
		void remove(int, int);
		void concatt(char*);


		char* getString();
		void setString(char*);
		int getlength();

		char content[500] = {0};



	private:
		unsigned int length;
		char* string;


};

#endif