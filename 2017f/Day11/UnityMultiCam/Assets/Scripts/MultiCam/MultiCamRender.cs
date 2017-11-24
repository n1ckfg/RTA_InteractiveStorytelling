using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// https://forum.unity3d.com/threads/rendering-screenshot-using-multiple-cameras-and-one-rendertexture.135916/

public class MultiCamRender : MonoBehaviour {

	public MultiCamSettings multiCamSettings;
	public RenderTexture rTex;

	void Awake() {
		rTex.width = multiCamSettings.cam.Length * multiCamSettings.screenWidth;
		rTex.height = multiCamSettings.screenHeight;
	}

	void OnRenderImage(RenderTexture src, RenderTexture dest) {
		if (multiCamSettings.renderCam != null) {
			Graphics.Blit(createCubemap(multiCamSettings.screenWidth, multiCamSettings.screenHeight), multiCamSettings.renderCam.targetTexture);
		}
	}

	public Texture2D createCubemap(int a_Width, int a_Height) {
		Texture2D result = new Texture2D(a_Width * multiCamSettings.cam.Length, a_Height, TextureFormat.ARGB32, false);

		for (int i=0; i<multiCamSettings.cam.Length; i++) {
			RenderTexture renderTexture = RenderTexture.GetTemporary(a_Width, a_Height, 24);
			RenderTexture.active = renderTexture;  

			if (multiCamSettings.cam[i].enabled) {
				float fov = multiCamSettings.cam[i].fov;
				multiCamSettings.cam[i].targetTexture = renderTexture;
				multiCamSettings.cam[i].Render();
				multiCamSettings.cam[i].targetTexture = null;
				multiCamSettings.cam[i].fov = fov;
			}

			result.ReadPixels(new Rect(0f, 0f, a_Width, a_Height), i * a_Width, 0, false);
			result.Apply();

			RenderTexture.active = null;

			RenderTexture.ReleaseTemporary(renderTexture);
		}

     	return result;
	}


	public Texture2D getScreenshot(int a_Width, int a_Height) {
		//List<Camera> cameras = new List<Camera>(Camera.allCameras);
		RenderTexture renderTexture = RenderTexture.GetTemporary(a_Width, a_Height, 24);
		RenderTexture.active = renderTexture;  

		//foreach (Camera camera in cameras) {
		foreach (Camera camera in multiCamSettings.cam) {
			if (camera.enabled) {
				float fov = camera.fov;
				camera.targetTexture = renderTexture;
				camera.Render();
				camera.targetTexture = null;
				camera.fov = fov;
			}
		}

		Texture2D result = new Texture2D(a_Width, a_Height, TextureFormat.ARGB32, false);
		result.ReadPixels(new Rect(0.0f, 0.0f, a_Width, a_Height), 0, 0, false);
		result.Apply();

		RenderTexture.active = null;

		RenderTexture.ReleaseTemporary(renderTexture);

		return result;
	}

}
