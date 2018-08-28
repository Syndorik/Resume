package allani.alexandre.playmusic.BeatDetection.io;

import android.util.Log;

import java.io.InputStream;

import allani.alexandre.playmusic.BeatDetection.Wave.Wave;
import allani.alexandre.playmusic.BeatDetection.Wave.WaveHeader;

public class WavfileDecod {
	private InputStream mInputStream;
	private int nchannel;
	private int  bitPerSample;
	private long sampleRate;
	private Wave wavFile;
	private byte[] data;
	private int len;
	private short[] amplitude;
	
	public WavfileDecod(InputStream inputStream) {
		this.mInputStream = inputStream;
		this.wavFile =  new Wave(inputStream);
		WaveHeader waveHeader = wavFile.getWaveHeader();
		this.nchannel = waveHeader.getChannels();
		this.bitPerSample = waveHeader.getBitsPerSample();
		this.sampleRate = waveHeader.getSampleRate();
		this.data = wavFile.getBytes();
		this.len = (int) wavFile.length();
		this.amplitude = wavFile.getSampleAmplitudes();
	}
	
	public Wave getWav() {
		return this.wavFile;
	}
	
	public short[] getAmp() {
		return this.amplitude;
	}
	
	public byte[] getData() {
		return this.data;
	}
	
	public long getSampleRate() {
		return this.sampleRate;
	}
	
	public long getbitPerSample() {
		return this.bitPerSample;
	}
	
	public InputStream getInputstream() {
		return this.mInputStream;
	}
	
	public int getNChannels() {
		return this.nchannel;
	}
	
	

}
