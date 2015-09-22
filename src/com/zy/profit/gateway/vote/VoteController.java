package com.zy.profit.gateway.vote;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.vote.entity.VoteTopic;
import com.zy.vote.service.VoteTopicPostService;
import com.zy.vote.service.VoteTopicService;

@Controller
@RequestMapping("/vote")
public class VoteController {

	@Autowired
	private VoteTopicService voteTopicService;
	@Autowired
	private VoteTopicPostService voteTopicPostService;
	
	
	@RequestMapping("/index")
	public String vote(Model model){
		
		List<VoteTopic> currentTopics = voteTopicService.getTopicBySchedule(VoteTopic.SCHEDULE_CURRENT);
		List<VoteTopic> nextTopics = voteTopicService.getTopicBySchedule(VoteTopic.SCHEDULE_NEXT);
		
		if(CollectionUtils.isNotEmpty(currentTopics))
			model.addAttribute("currentTopic", currentTopics.get(0));
		if(CollectionUtils.isNotEmpty(nextTopics))
			model.addAttribute("currentTopic", nextTopics.get(0));
		
		model.addAttribute("topics", voteTopicService.getTopicBySchedule(VoteTopic.SCHEDULE_DEFAULT));
		
		return "vote/voteIndex";
	}
}
