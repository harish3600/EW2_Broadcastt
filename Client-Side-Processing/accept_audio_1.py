import threading
import subprocess
from pydub import AudioSegment
import ffmpeg

# define a function to execute the subprocess
def run_subprocess():
    cmd = f'python3 ica.py -i {i}'
    subprocess.call(cmd, shell=True)



rtsp_url = 'rtsp://192.168.43.196:8000/' # replace with your RTSP URL
i = 1

while(True):
    #connect to serveer for t = 300
    output_name = 'input_file_1_' # replace with your desired output file name
    number = i
    format = '.wav'

    output_file = output_name + str(number) + format

    time_dur = 5
    # Set up the FFmpeg command to retrieve the audio stream and save it as a WAV file
    cmd = f'ffmpeg -i "{rtsp_url}" -f wav -vn -t {time_dur} "{output_file}"'

    # Run the FFmpeg command using subprocess
    import subprocess
    subprocess.call(cmd, shell=True)

    # Load the WAV file into an AudioSegment object using pydub
    audio = AudioSegment.from_wav(output_file)


    # Save the processed audio as a WAV file using pydub
    audio.export(output_file, format='wav')
    

    # cmd = f'python3 ica.py -i {i}'
    # subprocess.call(cmd, shell=True)

    # create a new thread to run the subprocess
    subprocess_thread = threading.Thread(target=run_subprocess)
    subprocess_thread.start()

    i = i + 1
