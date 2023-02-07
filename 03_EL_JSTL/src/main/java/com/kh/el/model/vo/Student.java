package com.kh.el.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@NoArgsConstructor
//@AllArgsConstructor
//@Getter
//@Setter
//@ToString
//@EqualsAndHashCode

@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Student {

	private String name;
	private int age;
	private int math;
	private int english;
}
