using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Chaser : MonoBehaviour {

	public Transform target;
	public float speed = 0.1f;

	// Update is called once per frame
	void Update () {
		transform.position = Vector3.Lerp(transform.position, target.position, speed);	
	}

}
