import SwiftUI
import SkinModel


// Displays the skin simulation.
// Manages rendering of moles and cancers on the skin.
public struct SkinView: View {
	
	// Update the view every second
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	// Get the global skin object to use later.
	@EnvironmentObject var skin: Skin
	@State private var moles: [Mole] = [
		Mole(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), size: 0, position: [0,0], age: 200),
	]
	
	// Swift Playgrounds requires everything to be public and accessible. 
	public init(){}
	
	
	public var body: some View {
		VStack{
			
			if(skin.hasCancer){
				Text("You got cancer :(")
			}
			
			// Displays the moles in Geometry Reader to insure absolute yet resizable position.
			// There is a bug in Swift Playgrounds where if "Enable Results" is turned on, it will cause the playground to crash.
			GeometryReader { geo in
				// Renders every mole on the skin
			  ForEach(moles, id: \.self) { mole in
				Image(mole.image())
					  .frame(maxWidth: mole.size, maxHeight: mole.size)
					  .position(x: geo.size.width * mole.position[0], y: geo.size.height * mole.position[1])
			  }
			}
			.background(skin.color)
			.cornerRadius(35)
			.frame(maxWidth: 300, maxHeight: 300)
			.morphDropShadow()

			
			//Updates the age and tries to generate a new mole.
			.onReceive(timer, perform: { _ in
				if(skin.age < 100){
					skin.age += 1
					
					moles.append(skin.generateMole(age: skin.age) ?? Mole(color: Color.white, size: 0, position: [0,100], age: 200))
					
					// Updates the images of cancerous moles.
					for mole in moles{
						if let cancer = mole as? Cancer{
							cancer.transform(lifespan: 4)
						}
					}
				}
				
			})
			
		}
	}
	
}
