package Bean;

import java.io.File;

public class PresentationBean {

	private int presentationId, userId;
	private String presentationTopic, presentationType, presentationPurpose, presentationDesc;
	private File presentation, presentationimg;

	public int getuserid() {
		return userId;
	}

	public void setFirstName(int userId) {
		this.userId = userId;
	}

	public int getpresentationId() {
		return presentationId;
	}

	public void setpresentationId(int presentationId) {
		this.presentationId = presentationId;
	}

	public String getpresentationTopic() {
		return presentationTopic;
	}

	public void setpresentationTopic(String presentationTopic) {
		this.presentationTopic = presentationTopic;
	}

	public String getpresentationType() {
		return presentationType;
	}

	public void setpresentationType(String presentationType) {
		this.presentationType = presentationType;
	}

	public String getpresentationPurpose() {
		return presentationPurpose;
	}

	public void setpresentationPurpose(String presentationPurpose) {
		this.presentationPurpose = presentationPurpose;
	}

	public String getpresentationDesc() {
		return presentationDesc;
	}

	public void setpresentationDesc(String presentationDesc) {
		this.presentationDesc = presentationDesc;
	}

	public File getpresentation() {
		return presentation;
	}

	public void setpresentaation(File presentation) {
		this.presentation = presentation;
	}

	public File getpresentationimg() {
		return presentationimg;
	}

	public void setpresentationimg(File presentationimg) {
		this.presentationimg = presentationimg;
	}

}
