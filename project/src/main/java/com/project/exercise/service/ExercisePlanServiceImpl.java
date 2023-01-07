package com.project.exercise.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;
import com.project.exercise.mapper.ExercisePlanMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Transactional
@Log4j2
public class ExercisePlanServiceImpl implements ExercisePlanService{
	
	private final ExercisePlanMapper exercisePlanMapper;
	
	@Override
	public void insertExercisePlan(List<ExercisePlanDTO> list, String user_id) {
		try {
			for(ExercisePlanDTO dto : list) {
				String r_no = exercisePlanMapper.selectSeq();
				dto.setR_no(r_no);
				dto.setUser_id(user_id);
				exercisePlanMapper.insertSelectExercise(dto);
				
				ExerciseVolumeDTO volume = new ExerciseVolumeDTO();
				volume.setR_no(r_no);
				
				exercisePlanMapper.insertExerciseVolume(volume);
			}
		}catch (Exception e) {
			log.error(e.getMessage());
		}
		
	}

	@Override
	public void insertExercisePlan(List<ExercisePlanDTO> list, String[] pSetList, String[] pRepsList,
			String[] pKgList) {
		
		try {
			int idx = 0;
			for(ExercisePlanDTO dto : list) {
				String r_no = exercisePlanMapper.selectSeq();
				dto.setR_no(r_no);
				exercisePlanMapper.insertSelectExercise(dto);
				ExerciseVolumeDTO volume = new ExerciseVolumeDTO();
				int sets = Integer.parseInt(pSetList[idx]);
				int reps = Integer.parseInt(pRepsList[idx]);
				int kg = Integer.parseInt(pKgList[idx]);
				
				for(int i = 0; i < sets; i++) {
					volume.setR_no(r_no);
					volume.setV_reps(reps);
					volume.setV_kg(kg);
					exercisePlanMapper.insertExerciseVolume(volume);
				}
				idx++;
			}
		}catch (Exception e) {
			log.error(e.getMessage());
		}
		
	}
	
	@Override
	public List<ExercisePlanDTO> selectExercisePlan(String r_date, String user_id) {
		List<ExercisePlanDTO> list = null;
		
		try {
			list = exercisePlanMapper.selectExercisePlan(r_date, user_id);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return list;
	}

	@Override
	public void deleteVolume(String v_no) {
		try {
			exercisePlanMapper.deleteVolume(v_no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public List<ExerciseVolumeDTO> selectExerciseVolume(String r_date, String user_id) {
		List<ExerciseVolumeDTO> list = null;
		
		try {
			list = exercisePlanMapper.selectExerciseVolume(r_date, user_id);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return list;
	}

	@Override
	public void deleteRecode(String r_no) {
		try {
			exercisePlanMapper.deleteRecode(r_no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}


	@Override
	public void insertExerciseVolume(String r_no) {
		try {
			exercisePlanMapper.insertExerciseVolume(r_no, 0, 0);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public void updateDoCheck(String vNo, String checkValue) {
		try {
			exercisePlanMapper.updateDoCheck(vNo, checkValue);		
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public void updateReps(String vNo, String repsValue) {
		
		try {
			exercisePlanMapper.updateReps(vNo, repsValue);		
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public void updateKg(String vNo, String kgValue) {
		try {
			exercisePlanMapper.updateKg(vNo, kgValue);		
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public void updateChecked(String vNo, String checkValue) {
		try {
			exercisePlanMapper.updateChecked(vNo, checkValue);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public ArrayList<String> workoutDay(String user_id) {
		ArrayList<String> r_date = null;
		
		try {
			r_date = exercisePlanMapper.workoutDay(user_id);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return r_date;
	}

}
