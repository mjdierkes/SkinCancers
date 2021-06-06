//#-hidden-code
import PlaygroundSupport
import SwiftUI
import Styles
public struct SimulationPage: View {


	@StateObject var skin = Person().getSkin()
	@State private var buttonPressed = false
	@State private var cancerType: String?
	@State private var cancerText: String = "Everything's Healthy!"
	public var body: some View {
		ZStack{
			
			VStack{
				VStack(spacing: 30){
					Text("Age \(skin.age)")
						.font(.title).bold().padding()
					Text(cancerText)
					SkinView()
						.animation(nil)
						.environmentObject(skin)
					if(buttonPressed){
						VStack{
							HStack{
								Button("Melanoma", action: {
									cancerType = "Melanoma"
									buttonAction()
								})
								.detectedButton()
								Button("Basal", action: {
									cancerType = "Basal"
									buttonAction()
								})
								.detectedButton()
							}
							HStack{
								Button("Squamous", action: {
									cancerType = "Squamous"
									buttonAction()
								})
								.detectedButton()
								
								Button("Actinic", action: {
									cancerType = "Actinic"
									buttonAction()
								})
								.detectedButton()
								
							}
							
							Button("Cancel", action: {
								cancerText = "Wow time really flies!"
								buttonPressed = false
								
							}).padding()
						}
					}
					else {
						Button(action: {
							cancerText = "What type of Cancer?"
							buttonPressed.toggle()
						}) {
							Text("Cancer Spotted")
								.bold()
						}
						.font(.headline)
						.padding(.horizontal, 30)
						.padding(.vertical, 10)
						.background(Color.black)
						.accentColor(.white)
						.cornerRadius(40)
					}
					
				}
			}.animation(.easeOut)
			
			
		}
		
	}
	
	
	func buttonAction(){
		if let cancer = skin.cancer {
			if(cancer.type == cancerType){
				cancerText = "Great job you found the right cancer!"
				buttonPressed.toggle()
			}
			else{
				cancerText = "Incorrect cancer type"
				buttonPressed.toggle()
			}
		}
		else{
			cancerText = "No cancer found"
			buttonPressed.toggle()
		}
	}

}
// Added a new struct to have a clean and intuitive interface for the user.
public struct Person {
//#-end-hidden-code
/*:

# Try it out

Run the simulation on the right to observe skin changes over a person’s lifetime. As a person ages, the number of moles increase and the likelihood that a mole will evolve into skin cancer also increases. Try to catch a cancerous mole in its early stages before it becomes life-threatening.

- Experiment:
	Try changing the profile to see how the different factors increase your risk of skin cancer. This simulation is based on actual statistics and data from the medical community.

The technique known as the ABCs can help you identify moles that should be evaluated by a dermatologist. This most commonly applies to Melanoma. Take note. It could save your life!

**Asymmetrical**
	
One half of the mole does not match the other half.

**Border**
	
The edge is uneven, crusty, or notched, this is often an early sign of Melanoma.

**Color**
	
Healthy moles are typically the same color. When a mole has many different colors, it could be dangerous.

**Diameter**
	
A mole should not be larger than the size of a pencil's tip.

**Evolution**
	
Changes in attributes are an alarming sign. Even though it may take many months, it is important to keep up with evolving moles.


- Note:
	I hope that this simulation helps to alert you to potentially dangerous moles. Please seek advice from a dermatologist if you have questions.  





[Next Page: Review](@next)

*/
let skinColor = Color(#colorLiteral(red: 0.9999651313, green: 0.7638683915, blue: 0.6287755966, alpha: 1))
	
// How often a person applies sunscreen when going in the sun.
let sunscreenFrequency = 15
	
// How many sunburns a person has over a lifetime.
let sunburns = 10
	
let isMale = true
//#-hidden-code

	func getSkin() -> Skin{
		let skin: Skin = Skin(color: skinColor, sunscreenFrequency: sunscreenFrequency, sunburns: sunburns, isMale: isMale)
		return skin
	}

}



let page = SimulationPage()
PlaygroundPage.current.setLiveView(page)
//#-end-hidden-code
