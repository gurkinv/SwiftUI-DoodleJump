import AVFoundation

class SoundManager {
    static let shared = SoundManager()

    var backgroundPlayer: AVAudioPlayer?
    var effectPlayer: AVAudioPlayer?

    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") else { return }
        do {
            backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundPlayer?.numberOfLoops = -1 // бесконечно
            backgroundPlayer?.volume = 0.5
            backgroundPlayer?.play()
        } catch {
            print("Ошибка проигрывания фоновой музыки: \(error.localizedDescription)")
        }
    }

    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }

    func playSoundEffect(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else { return }
        do {
            effectPlayer = try AVAudioPlayer(contentsOf: url)
            effectPlayer?.play()
        } catch {
            print("Ошибка проигрывания эффекта: \(error.localizedDescription)")
        }
    }
}