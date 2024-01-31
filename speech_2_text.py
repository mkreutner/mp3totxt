import glob
import os
import whisper

from pathlib import Path

model = whisper.load_model("base")

in_folder = 'mp3'
out_folder = 'text'

in_files = glob.glob(f'''./{in_folder}/**/*.mp3''', recursive=True)
in_files_cnt = len(in_files) 
i = 1

for in_file in in_files:
    in_file_path = Path(f'''{in_file}''')
    in_file_path = str(in_file_path.with_suffix('.txt'))
    out_file = in_file_path.replace(f'''{in_folder}''', f'''{out_folder}''', 1)
    print(f'''{i} / {in_files_cnt}: {out_file}''')    
    result = model.transcribe(in_file)
    with open(out_file, 'w') as f:
        f.write(result['text'])
    i += 1


# audio = "./mp3/5 mn de préparation aux Arts Martiaux avec l'hypnose SAJECE [FjlYVupiEGg].mp3"
# text = "./text/5 mn de préparation aux Arts Martiaux avec l'hypnose SAJECE [FjlYVupiEGg].txt"
# result = model.transcribe(audio)

# with open(text, 'w') as f:
    # f.write(result['text'])

