import UIKit
import AVFoundation

/// An object that provides audio assets for playing Pokémon cries.
///
/// Use this class to create `AVAudioPlayer` instances for playing
/// Pokémon cries.
///
/// ```
/// import AVFoundation
/// import PokemonCryKit
///
/// // Obtain a Pokémon's name.
/// let name = "Some Pokémon name"
///
/// // MUST declare variable before method call!
/// var audioPlayer: AVAudioPlayer?
///
/// // Ask the cry provider for an audio player associated to the Pokémon's name.
/// audioPlayer = PokemonCryProvider().audioPlayer(forPokémonWithDisplayName: name)
///
/// // If an audio player is returned, use it to play a sound!
/// audioPlayer?.play()
/// ```
///
/// - Note: Calls to `audioPlayer?.play()` should be executed on the _main_ queue.
public final class PokemonCryProvider {
    
    private let fileTypeHint = "wav"
    
    public init() {}
    
    /// A method to create `AVAudioPlayer` instance for playing a Pokémon cry.
    ///
    /// - Parameter name: The name of the Pokémon.
    ///
    /// - Returns: An `AVAudioPlayer` for the Pokémon cry if the asset exists, and an audioplayer can be
    /// created, `nil` otherwise.
    public func audioPlayer(forPokémonWithDisplayName name: String) -> AVAudioPlayer? {
        
        return NSDataAsset(name: name, bundle: .module).flatMap {
            try? AVAudioPlayer(data: $0.data, fileTypeHint: fileTypeHint)
        }
    }
}
