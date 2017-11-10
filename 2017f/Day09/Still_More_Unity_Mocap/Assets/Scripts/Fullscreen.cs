using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fullscreen : MonoBehaviour {

	void Start () {
		Screen.fullScreen = !Screen.fullScreen;
	}

}