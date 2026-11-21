package org.sopt.web3.preschool.dto;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import jakarta.validation.Payload;

@Target({ElementType.FIELD, ElementType.PARAMETER, ElementType.RECORD_COMPONENT})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidWaitingMinutes.Validator.class)
public @interface ValidWaitingMinutes {
	String message() default "대기시간은 5~30분 중 5분 단위여야 합니다.";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};

	class Validator implements ConstraintValidator<ValidWaitingMinutes, Integer> {
		@Override
		public boolean isValid(Integer value, ConstraintValidatorContext context) {
			return value == null || (value >= 5 && value <= 30 && value % 5 == 0);
		}
	}
}
