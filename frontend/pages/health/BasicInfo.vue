<template>
	<view class="container">
		<p v-if="currentPage < 13" class="title">一般情况调查表</p>
		<p v-if="currentPage < 22 && 12 < currentPage" class="title">社会支持评定量表</p>
		<p v-if="currentPage > 21" class="title">生活事件量表（LES）</p>
		<div class="form-box">
			<div v-if="currentPage === 1">
				
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="1、性别" prop="sex" class="sex" required>
						<u-radio-group placement="column" v-model="BasicInfo.sex">
							<u-radio v-for="item in sexList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 2">
				
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					<u-form-item label="2、电话" prop="phone" class="phone" required>
						<u--input v-model="BasicInfo.phone" style="padding-left: 25px; background-color: white; margin-top: 10px; border-radius: 10px; height: 60px; box-shadow: 1px 2px 5px #e2e2e2;" ></u--input>
					</u-form-item>
				</u-form>
			</div>

			<div v-if="currentPage === 3">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					<u-form-item label="3、出生年月" prop="birthDate"  required>
						<xp-picker mode="ym" :yearRange=[1900,null] v-model="BasicInfo.birthDate" class="birthDate"/>
					</u-form-item>
				</u-form>
			</div>

			<div v-if="currentPage === 4">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="4、受教育程度" prop="culture" class="culture" required>
						<u-radio-group placement="column" v-model="BasicInfo.culture">
							<u-radio v-for="item in cultureList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 5">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="5、单亲家庭" prop="isSingleParent" class="isSingleParent" required>
						<u-radio-group placement="column" v-model="BasicInfo.isSingleParent">
							<u-radio v-for="item in isSingleParentList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 6">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="6、孤儿或被遗弃" prop="isAbandon" class="isAbandon" required>
						<u-radio-group placement="column" v-model="BasicInfo.isAbandon">
							<u-radio v-for="item in isAbandonList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 7">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="7、居住情况" prop="residential" class="residential" required>
						<u-radio-group placement="column" v-model="BasicInfo.residential">
							<u-radio v-for="item in residentialList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 8">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="8、婚姻状况" prop="marital" class="marital" required>
						<u-radio-group placement="column" v-model="BasicInfo.marital">
							<u-radio v-for="item in maritalList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 9">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="9、有无以下创伤经历" prop="trauma" class="trauma" required>
						<u-radio-group placement="column" v-model="BasicInfo.trauma">
							<u-radio v-for="item in traumaList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item style="margin-bottom: 100px;" label="10、如果有，是在什么时候？" v-show="BasicInfo.trauma!='无'" prop="traumaTime"
						class="traumaTime" required>
						<u-radio-group placement="column" v-model="BasicInfo.traumaTime">
							<u-radio v-for="item in traumaTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 10">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="11、亲属有无自杀" prop="relativeSuicide" class="relativeSuicide" required>
						<u-radio-group placement="column" v-model="BasicInfo.relativeSuicide">
							<u-radio v-for="item in relativeSuicideList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 11">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="12、精神疾病史" prop="mentalIllness" class="mentalIllness" required>
						<u-radio-group placement="column" v-model="BasicInfo.mentalIllness">
							<u-radio v-for="item in mentalIllnessList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 12">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<u-form-item label="13、精神障碍家族史" prop="familyMentalHistory" class="familyMentalHistory" required>
						<u-radio-group placement="column" v-model="BasicInfo.familyMentalHistory">
							<u-radio v-for="item in familyMentalHistoryList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 13">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="1、您有多少关系密切，可以得到支持和帮助的朋友？" prop="closeRel" class="closeRel" required>
						<u-radio-group placement="column" v-model="BasicInfo.closeRel">
							<u-radio v-for="item in closeRelList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 14">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="2、近一年来，您：" prop="resident" class="resident" required>
						<u-radio-group placement="column" v-model="BasicInfo.resident">
							<u-radio v-for="item in residentList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 15">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="3、您与邻居：" prop="neighborRel" class="neighborRel" required>
						<u-radio-group placement="column" v-model="BasicInfo.neighborRel">
							<u-radio v-for="item in neighborRelList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 16">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="4、您与同事：" prop="colleagueRel" class="colleagueRel" required>
						<u-radio-group placement="column" v-model="BasicInfo.colleagueRel">
							<u-radio v-for="item in colleagueRelList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 17">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo"
					:rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="5、过去，在您遇到急难情况时，曾经得到的经济支持和解决实际问题的帮助来源有：" prop="favour" class="favour" required ref="favour">
						<u-checkbox-group placement="column" v-model="BasicInfo.favour">
							<u-checkbox v-for="item in favourList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;" shape="circle"></u-checkbox>
						</u-checkbox-group>
					</u-form-item>
					<!-- <u-form-item v-show="BasicInfo.favour=='其他（请列出）'" prop="favour_other" class="favour_other">
						<u--input v-model="BasicInfo.favour_other" style="background-color: white;"></u--input>
					</u-form-item> -->
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 18">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="6、过去，在您遇到急难情况时，曾得到的安慰和关心来源有：" prop="comfort" class="comfort" required ref="comfort">
						<u-checkbox-group placement="column" v-model="BasicInfo.comfort">
							<u-checkbox v-for="item in comfortList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;" shape="circle"></u-checkbox>
						</u-checkbox-group>
					</u-form-item>
					<!-- <u-form-item v-show="BasicInfo.comfort=='其他（请列出）'" prop="comfort_other" class="comfort_other">
						<u--input v-model="BasicInfo.comfort_other" style="background-color: white;"></u--input>
					</u-form-item> -->
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 19">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="7、您遇到烦恼事的倾诉方式：" prop="share" class="share" required>
						<u-radio-group placement="column" v-model="BasicInfo.share">
							<u-radio v-for="item in shareList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 20">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="8、您遇到烦恼事的求助方式：" prop="seekHelp" class="seekHelp" required>
						<u-radio-group placement="column" v-model="BasicInfo.seekHelp">
							<u-radio v-for="item in seekHelpList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 21">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面的问题用于反映您在社会中所获得的支持，请按各个问题的具体要求，根据您的实际情况填写。
						</p>
					</div>

					<u-form-item label="9、对于团体（如党团组织、宗教组织、公会、学生会等）组织活动，您：" prop="groupActivity" class="groupActivity"
						required>
						<u-radio-group placement="column" v-model="BasicInfo.groupActivity">
							<u-radio v-for="item in groupActivityList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 22">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="1、恋爱或订婚" prop="datingEngaged_happen" class="datingEngaged_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.datingEngaged_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item v-show="BasicInfo.datingEngaged_happen!=null && BasicInfo.datingEngaged_happen!='未发生'"
						required label="性质" prop="datingEngaged_type" class="datingEngaged_type">
						<u-radio-group placement="column" v-model="BasicInfo.datingEngaged_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.datingEngaged_happen!=null && BasicInfo.datingEngaged_happen!='未发生'"
						required label="精神影响程度" prop="datingEngaged_mentalInfluence"
						class="datingEngaged_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.datingEngaged_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.datingEngaged_happen!=null && BasicInfo.datingEngaged_happen!='未发生'"
						required label="影响持续时间" prop="datingEngaged_duration" class="datingEngaged_duration">
						<u-radio-group placement="column" v-model="BasicInfo.datingEngaged_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 23">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo"
					:rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="2、恋爱失败、破裂" prop="datingLose_happen" class="datingLose_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.datingLose_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item v-show="BasicInfo.datingLose_happen!=null && BasicInfo.datingLose_happen!='未发生'"
						required label="性质" prop="datingLose_type" class="datingLose_type">
						<u-radio-group placement="column" v-model="BasicInfo.datingLose_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item v-show="BasicInfo.datingLose_happen!=null && BasicInfo.datingLose_happen!='未发生'"
						required label="精神影响程度" prop="datingLose_mentalInfluence" class="datingLose_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.datingLose_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.datingLose_happen!=null && BasicInfo.datingLose_happen!='未发生'"
						required label="影响持续时间" prop="datingLose_duration" class="datingLose_duration">
						<u-radio-group placement="column" v-model="BasicInfo.datingLose_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
					</u-form>
			</div>

			<div v-if="currentPage === 24">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="3、父母不和" prop="parentsConflict_happen" class="parentsConflict_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.parentsConflict_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item
						v-show="BasicInfo.parentsConflict_happen!=null && BasicInfo.parentsConflict_happen!='未发生'"
						required label="性质" prop="parentsConflict_type" class="parentsConflict_type">
						<u-radio-group placement="column" v-model="BasicInfo.parentsConflict_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item
						v-show="BasicInfo.parentsConflict_happen!=null && BasicInfo.parentsConflict_happen!='未发生'"
						required label="精神影响程度" prop="parentsConflict_mentalInfluence"
						class="parentsConflict_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.parentsConflict_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;"
						v-show="BasicInfo.parentsConflict_happen!=null && BasicInfo.parentsConflict_happen!='未发生'"
						required label="影响持续时间" prop="parentsConflict_duration" class="parentsConflict_duration">
						<u-radio-group placement="column" v-model="BasicInfo.parentsConflict_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 25">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="4、家庭经济困难" prop="familyFinanceDif_happen" class="familyFinanceDif_happen"
						required>
						<u-radio-group placement="column" v-model="BasicInfo.familyFinanceDif_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item
						v-show="BasicInfo.familyFinanceDif_happen!=null && BasicInfo.familyFinanceDif_happen!='未发生'"
						required label="性质" prop="familyFinanceDif_type" class="familyFinanceDif_type">
						<u-radio-group placement="column" v-model="BasicInfo.familyFinanceDif_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item
						v-show="BasicInfo.familyFinanceDif_happen!=null && BasicInfo.familyFinanceDif_happen!='未发生'"
						required label="精神影响程度" prop="familyFinanceDif_mentalInfluence"
						class="familyFinanceDif_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.familyFinanceDif_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;"
						v-show="BasicInfo.familyFinanceDif_happen!=null && BasicInfo.familyFinanceDif_happen!='未发生'"
						required label="影响持续时间" prop="familyFinanceDif_duration" class="familyFinanceDif_duration">
						<u-radio-group placement="column" v-model="BasicInfo.familyFinanceDif_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 26">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="5、欠债" prop="debt_happen" class="debt_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.debt_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item v-show="BasicInfo.debt_happen!=null && BasicInfo.debt_happen!='未发生'" required
						label="性质" prop="debt_type" class="debt_type">
						<u-radio-group placement="column" v-model="BasicInfo.debt_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.debt_happen!=null && BasicInfo.debt_happen!='未发生'" required
						label="精神影响程度" prop="debt_mentalInfluence" class="debt_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.debt_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.debt_happen!=null && BasicInfo.debt_happen!='未发生'" required
						label="影响持续时间" prop="debt_duration" class="debt_duration">
						<u-radio-group placement="column" v-model="BasicInfo.debt_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 27">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="6、家庭成员重病、重伤" prop="familySerInj_happen" class="familySerInj_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.familySerInj_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item v-show="BasicInfo.familySerInj_happen!=null && BasicInfo.familySerInj_happen!='未发生'"
						required label="性质" prop="familySerInj_type" class="familySerInj_type">
						<u-radio-group placement="column" v-model="BasicInfo.familySerInj_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.familySerInj_happen!=null && BasicInfo.familySerInj_happen!='未发生'"
						required label="精神影响程度" prop="familySerInj_mentalInfluence"
						class="familySerInj_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.familySerInj_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.familySerInj_happen!=null && BasicInfo.familySerInj_happen!='未发生'"
						required label="影响持续时间" prop="familySerInj_duration" class="familySerInj_duration">
						<u-radio-group placement="column" v-model="BasicInfo.familySerInj_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 28">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="7、家庭成员死亡" prop="familyDie_happen" class="familyDie_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.familyDie_happen">
							<u-radio v-for="item in lesTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item v-show="BasicInfo.familyDie_happen!=null && BasicInfo.familyDie_happen!='未发生'" required
						label="性质" prop="familyDie_type" class="familyDie_type">
						<u-radio-group placement="column" v-model="BasicInfo.familyDie_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.familyDie_happen!=null && BasicInfo.familyDie_happen!='未发生'" required
						label="精神影响程度" prop="familyDie_mentalInfluence" class="familyDie_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.familyDie_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.familyDie_happen!=null && BasicInfo.familyDie_happen!='未发生'" required
						label="影响持续时间" prop="familyDie_duration" class="familyDie_duration">
						<u-radio-group placement="column" v-model="BasicInfo.familyDie_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 29">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="8、本人重病或重伤" prop="serInj_happen" class="serInj_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.serInj_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.serInj_happen!=null && BasicInfo.serInj_happen!='未发生'" required
						label="性质" prop="serInj_type" class="serInj_type">
						<u-radio-group placement="column" v-model="BasicInfo.serInj_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.serInj_happen!=null && BasicInfo.serInj_happen!='未发生'" required
						label="精神影响程度" prop="serInj_mentalInfluence" class="serInj_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.serInj_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.serInj_happen!=null && BasicInfo.serInj_happen!='未发生'" required
						label="影响持续时间" prop="serInj_duration" class="serInj_duration">
						<u-radio-group placement="column" v-model="BasicInfo.serInj_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 30">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="9、待业、无业" prop="unemployed_happen" class="unemployed_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.unemployed_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.unemployed_happen!=null && BasicInfo.unemployed_happen!='未发生'"
						required label="性质" prop="unemployed_type" class="unemployed_type">
						<u-radio-group placement="column" v-model="BasicInfo.unemployed_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.unemployed_happen!=null && BasicInfo.unemployed_happen!='未发生'"
						required label="精神影响程度" prop="unemployed_mentalInfluence" class="unemployed_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.unemployed_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.unemployed_happen!=null && BasicInfo.unemployed_happen!='未发生'"
						required label="影响持续时间" prop="unemployed_duration" class="unemployed_duration">
						<u-radio-group placement="column" v-model="BasicInfo.unemployed_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 31">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="10、工作压力大" prop="workPressure_happen" class="workPressure_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.workPressure_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.workPressure_happen!=null && BasicInfo.workPressure_happen!='未发生'"
						required label="性质" prop="workPressure_type" class="workPressure_type">
						<u-radio-group placement="column" v-model="BasicInfo.workPressure_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.workPressure_happen!=null && BasicInfo.workPressure_happen!='未发生'"
						required label="精神影响程度" prop="workPressure_mentalInfluence"
						class="workPressure_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.workPressure_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.workPressure_happen!=null && BasicInfo.workPressure_happen!='未发生'"
						required label="影响持续时间" prop="workPressure_duration" class="workPressure_duration">
						<u-radio-group placement="column" v-model="BasicInfo.workPressure_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 32">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="11、学习成绩差" prop="poorMark_happen" class="poorMark_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.poorMark_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.poorMark_happen!=null && BasicInfo.poorMark_happen!='未发生'" required
						label="性质" prop="poorMark_type" class="poorMark_type">
						<u-radio-group placement="column" v-model="BasicInfo.poorMark_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.poorMark_happen!=null && BasicInfo.poorMark_happen!='未发生'" required
						label="精神影响程度" prop="poorMark_mentalInfluence" class="poorMark_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.poorMark_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.poorMark_happen!=null && BasicInfo.poorMark_happen!='未发生'" required
						label="影响持续时间" prop="poorMark_duration" class="poorMark_duration">
						<u-radio-group placement="column" v-model="BasicInfo.poorMark_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 33">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="12、与舍友不和" prop="roommatesDis_happen" class="roommatesDis_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.roommatesDis_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.roommatesDis_happen!=null && BasicInfo.roommatesDis_happen!='未发生'"
						required label="性质" prop="roommatesDis_type" class="roommatesDis_type">
						<u-radio-group placement="column" v-model="BasicInfo.roommatesDis_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.roommatesDis_happen!=null && BasicInfo.roommatesDis_happen!='未发生'"
						required label="精神影响程度" prop="roommatesDis_mentalInfluence"
						class="roommatesDis_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.roommatesDis_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.roommatesDis_happen!=null && BasicInfo.roommatesDis_happen!='未发生'"
						required label="影响持续时间" prop="roommatesDis_duration" class="roommatesDis_duration">
						<u-radio-group placement="column" v-model="BasicInfo.roommatesDis_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 34">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="13、生活规律重大变动" prop="lifeLawChange_happen" class="lifeLawChange_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.lifeLawChange_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.lifeLawChange_happen!=null && BasicInfo.lifeLawChange_happen!='未发生'"
						required label="性质" prop="lifeLawChange_type" class="lifeLawChange_type">
						<u-radio-group placement="column" v-model="BasicInfo.lifeLawChange_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.lifeLawChange_happen!=null && BasicInfo.lifeLawChange_happen!='未发生'"
						required label="精神影响程度" prop="lifeLawChange_mentalInfluence"
						class="lifeLawChange_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.lifeLawChange_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.lifeLawChange_happen!=null && BasicInfo.lifeLawChange_happen!='未发生'"
						required label="影响持续时间" prop="lifeLawChange_duration" class="lifeLawChange_duration">
						<u-radio-group placement="column" v-model="BasicInfo.lifeLawChange_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 35">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="14、好友重病或重伤" prop="friendSerInj_happen" class="friendSerInj_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.friendSerInj_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.friendSerInj_happen!=null && BasicInfo.friendSerInj_happen!='未发生'"
						required label="性质" prop="friendSerInj_type" class="friendSerInj_type">
						<u-radio-group placement="column" v-model="BasicInfo.friendSerInj_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.friendSerInj_happen!=null && BasicInfo.friendSerInj_happen!='未发生'"
						required label="精神影响程度" prop="friendSerInj_mentalInfluence"
						class="friendSerInj_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.friendSerInj_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.friendSerInj_happen!=null && BasicInfo.friendSerInj_happen!='未发生'"
						required label="影响持续时间" prop="friendSerInj_duration" class="friendSerInj_duration">
						<u-radio-group placement="column" v-model="BasicInfo.friendSerInj_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 36">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="15、好友死亡" prop="friendDie_happen" class="friendDie_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.friendDie_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.friendDie_happen!=null && BasicInfo.friendDie_happen!='未发生'" required
						label="性质" prop="friendDie_type" class="friendDie_type">
						<u-radio-group placement="column" v-model="BasicInfo.friendDie_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.friendDie_happen!=null && BasicInfo.friendDie_happen!='未发生'" required
						label="精神影响程度" prop="friendDie_mentalInfluence" class="friendDie_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.friendDie_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.friendDie_happen!=null && BasicInfo.friendDie_happen!='未发生'" required
						label="影响持续时间" prop="friendDie_duration" class="friendDie_duration">
						<u-radio-group placement="column" v-model="BasicInfo.friendDie_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 37">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="16、被人误会错怪、诬告、议论" prop="misunderstood_happen" class="misunderstood_happen"
						required>
						<u-radio-group placement="column" v-model="BasicInfo.misunderstood_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.misunderstood_happen!=null && BasicInfo.misunderstood_happen!='未发生'"
						required label="性质" prop="misunderstood_type" class="misunderstood_type">
						<u-radio-group placement="column" v-model="BasicInfo.misunderstood_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.misunderstood_happen!=null && BasicInfo.misunderstood_happen!='未发生'"
						required label="精神影响程度" prop="misunderstood_mentalInfluence"
						class="misunderstood_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.misunderstood_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;" v-show="BasicInfo.misunderstood_happen!=null && BasicInfo.misunderstood_happen!='未发生'"
						required label="影响持续时间" prop="misunderstood_duration" class="misunderstood_duration">
						<u-radio-group placement="column" v-model="BasicInfo.misunderstood_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 38">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="17、失窃、财产损失" prop="stolen_happen" class="stolen_happen" required>
						<u-radio-group placement="column" v-model="BasicInfo.stolen_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.stolen_happen!=null && BasicInfo.stolen_happen!='未发生'" required
						label="性质" prop="stolen_type" class="stolen_type">
						<u-radio-group placement="column" v-model="BasicInfo.stolen_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item v-show="BasicInfo.stolen_happen!=null && BasicInfo.stolen_happen!='未发生'" required
						label="精神影响程度" prop="stolen_mentalInfluence" class="stolen_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.stolen_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item  style="margin-bottom: 100px;" v-show="BasicInfo.stolen_happen!=null && BasicInfo.stolen_happen!='未发生'" required
						label="影响持续时间" prop="stolen_duration" class="stolen_duration">
						<u-radio-group placement="column" v-model="BasicInfo.stolen_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 39">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="BasicInfo" :rules="rules">
					
					<div class="box-card">
						<p>下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事情可能对个人有精神上的影响（体验为紧张、压力、兴奋或苦恼等），影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答问题，请在最适合的答案上打钩。
						</p>
					</div>

					<u-form-item label="18、意外惊吓、事故、自然灾害" prop="accidentalShock_happen" class="accidentalShock_happen"
						required>
						<u-radio-group placement="column" v-model="BasicInfo.accidentalShock_happen">
							<u-radio v-for="item in lesTimeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item
						v-show="BasicInfo.accidentalShock_happen!=null && BasicInfo.accidentalShock_happen!='未发生'"
						required label="性质" prop="accidentalShock_type" class="accidentalShock_type">
						<u-radio-group placement="column" v-model="BasicInfo.accidentalShock_type">
							<u-radio v-for="item in lesTypeList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item
						v-show="BasicInfo.accidentalShock_happen!=null && BasicInfo.accidentalShock_happen!='未发生'"
						required label="精神影响程度" prop="accidentalShock_mentalInfluence"
						class="accidentalShock_mentalInfluence">
						<u-radio-group placement="column" v-model="BasicInfo.accidentalShock_mentalInfluence">
							<u-radio v-for="item in lesMentalInfluenceList" :label="item" :key="item" :name="item"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>

					<u-form-item style="margin-bottom: 100px;"
						v-show="BasicInfo.accidentalShock_happen!=null && BasicInfo.accidentalShock_happen!='未发生'"
						required label="影响持续时间" prop="accidentalShock_duration" class="accidentalShock_duration">
						<u-radio-group placement="column" v-model="BasicInfo.accidentalShock_duration">
							<u-radio v-for="item in lesDurationList" :label="item" :key="item" :name="item"
								style="margin: 5rpx; ">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="submit('form')">提交</button> -->
				</u-form>
			</div>
		</div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">上一题</button></div>
			<div v-if="currentPage !== 39"><button class="button" @click="nextPage">下一题</button></div>
			<div v-if="currentPage === 39"><button class="button" @click="submit('form')">提交</button></div>
		</div>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {
				BasicInfo: {
					radio: '',
					id: 0,
					userId: 0,
					logDate: '',
					sex: null,
					phone: null,
					birthDate: null,
					culture: null,
					isSingleParent: null,
					isAbandon: null,
					residential: null,
					marital: null,
					trauma: null,
					traumaTime: null,
					relativeSuicide: null,
					mentalIllness: null,
					familyMentalHistory: null,
					closeRel: null,
					resident: null,
					neighborRel: null,
					colleagueRel: null,
					favour: [],
					favour_other: null,
					comfort: [],
					comfort_other: null,
					share: null,
					seekHelp: null,
					groupActivity: null,
					datingEngaged_happen: null,
					datingEngaged_type: null,
					datingEngaged_mentalInfluence: null,
					datingEngaged_duration: null,
					datingLose_happen: null,
					datingLose_type: null,
					datingLose_mentalInfluence: null,
					datingLose_duration: null,
					parentsConflict_happen: null,
					parentsConflict_type: null,
					parentsConflict_mentalInfluence: null,
					parentsConflict_duration: null,

					familyFinanceDif_happen: null,
					familyFinanceDif_type: null,
					familyFinanceDif_mentalInfluence: null,
					familyFinanceDif_duration: null,

					debt_happen: null,
					debt_type: null,
					debt_mentalInfluence: null,
					debt_duration: null,

					familySerInj_happen: null,
					familySerInj_type: null,
					familySerInj_mentalInfluence: null,
					familySerInj_duration: null,

					familyDie_happen: null,
					familyDie_type: null,
					familyDie_mentalInfluence: null,
					familyDie_duration: null,

					serInj_happen: null,
					serInj_type: null,
					serInj_mentalInfluence: null,
					serInj_duration: null,

					unemployed_happen: null,
					unemployed_type: null,
					unemployed_mentalInfluence: null,
					unemployed_duration: null,

					workPressure_happen: null,
					workPressure_type: null,
					workPressure_mentalInfluence: null,
					workPressure_duration: null,

					poorMark_happen: null,
					poorMark_type: null,
					poorMark_mentalInfluence: null,
					poorMark_duration: null,

					roommatesDis_happen: null,
					roommatesDis_type: null,
					roommatesDis_mentalInfluence: null,
					roommatesDis_duration: null,

					lifeLawChange_happen: null,
					lifeLawChange_type: null,
					lifeLawChange_mentalInfluence: null,
					lifeLawChange_duration: null,

					friendSerInj_happen: null,
					friendSerInj_type: null,
					friendSerInj_mentalInfluence: null,
					friendSerInj_duration: null,

					friendDie_happen: null,
					friendDie_type: null,
					friendDie_mentalInfluence: null,
					friendDie_duration: null,

					misunderstood_happen: null,
					misunderstood_type: null,
					misunderstood_mentalInfluence: null,
					misunderstood_duration: null,

					stolen_happen: null,
					stolen_type: null,
					stolen_mentalInfluence: null,
					stolen_duration: null,

					accidentalShock_happen: null,
					accidentalShock_type: null,
					accidentalShock_mentalInfluence: null,
					accidentalShock_duration: null,
				},
				rules: {
					favour_other: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sex: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					phone: [{
							required: true,
							message: "此项为必填项",
							trigger: ['change', 'blur']
						},
						{
							validator: (rule, value, callback) => {
								return uni.$u.test.mobile(value) || uni.$u.test.landline(value) || (uni.$u.test
									.number(value) && value.length > 6 && value.length < 9);
							},
							message: '电话号码不正确',
							// 触发器可以同时用blur和change
							trigger: ['change', 'blur'],
						}
					],
					birthDate: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					culture: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					isSingleParent: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					isAbandon: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					residential: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					marital: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					trauma: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					traumaTime: [{
						validator: (rule, value, callback) => {
							if (this.BasicInfo.trauma != "无") {
								return value != null && value != '';
							}
							return true;
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					relativeSuicide: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					mentalIllness: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyMentalHistory: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					closeRel: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					resident: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					neighborRel: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					colleagueRel: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					favour: [{
						type: 'array',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					favour_other: [{
						validator: (rule, value, callback) => {
							if (this.BasicInfo.favour == "其他（请列出）") {
								return value != null && value != '';
							}
							return true;
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					comfort: [{
						type: 'array',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					comfort_other: [{
						required: true,
						validator: (rule, value, callback) => {
							if (this.BasicInfo.comfort == "其他（请列出）") {
								return value != null && value != '';
							}
							return true;
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					share: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					seekHelp: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					groupActivity: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingEngaged_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingEngaged_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.datingEngaged_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingEngaged_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.datingEngaged_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingEngaged_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.datingEngaged_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingLose_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingLose_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.datingLose_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingLose_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.datingLose_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					datingLose_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.datingLose_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					parentsConflict_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					parentsConflict_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.parentsConflict_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					parentsConflict_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.parentsConflict_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					parentsConflict_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.parentsConflict_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					familyFinanceDif_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyFinanceDif_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familyFinanceDif_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyFinanceDif_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familyFinanceDif_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyFinanceDif_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familyFinanceDif_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					debt_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					debt_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.debt_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					debt_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.debt_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					debt_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.debt_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					familySerInj_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familySerInj_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familySerInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familySerInj_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familySerInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familySerInj_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familySerInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					familyDie_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyDie_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familyDie_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyDie_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familyDie_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					familyDie_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.familyDie_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					serInj_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					serInj_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.serInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					serInj_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.serInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					serInj_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.serInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					unemployed_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					unemployed_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.unemployed_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					unemployed_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.unemployed_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					unemployed_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.unemployed_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					workPressure_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					workPressure_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.workPressure_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					workPressure_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.workPressure_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					workPressure_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.workPressure_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					poorMark_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					poorMark_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.poorMark_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					poorMark_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.poorMark_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					poorMark_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.poorMark_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					roommatesDis_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					roommatesDis_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.roommatesDis_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					roommatesDis_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.roommatesDis_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					roommatesDis_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.roommatesDis_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					lifeLawChange_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					lifeLawChange_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.lifeLawChange_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					lifeLawChange_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.lifeLawChange_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					lifeLawChange_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.lifeLawChange_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					friendSerInj_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					friendSerInj_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.friendSerInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					friendSerInj_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.friendSerInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					friendSerInj_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.friendSerInj_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					friendDie_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					friendDie_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.friendDie_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					friendDie_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.friendDie_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					friendDie_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.friendDie_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					misunderstood_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					misunderstood_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.misunderstood_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					misunderstood_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.misunderstood_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					misunderstood_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.misunderstood_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					stolen_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					stolen_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.stolen_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					stolen_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.stolen_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					stolen_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.stolen_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],

					accidentalShock_happen: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					accidentalShock_type: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.accidentalShock_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					accidentalShock_mentalInfluence: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.accidentalShock_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}],
					accidentalShock_duration: [{
						validator: (rule, value, callback) => {
							return this.validate(value, this.BasicInfo.accidentalShock_happen);
						},
						message: "此项为必填项",
						trigger: 'blur'
					}]

				},
				currentPage: 1,
				labelWidth: '80%',
				sexList: ["男", "女"],
				cultureList: ["本科以下","本科", "硕士研究生", "博士研究生"],
				isSingleParentList: ["是", "否"],
				isAbandonList: ["是", "否"],
				residentialList: ["在家", "独居", "集体宿舍"],
				maritalList: ["未婚", "已婚", "离异", "再婚", "丧偶"],
				traumaList: ["无", "性虐待", "躯体虐待", "亲友亡故", "被严重忽视", "事故", "灾难"],
				traumaTimeList: ["童年期", "青少年", "成年后"],
				relativeSuicideList: ["无", "有"],
				mentalIllnessList: ["无", "有"],
				familyMentalHistoryList: ["无", "有"],
				closeRelList: ["一个也没有", "1-2个", "3-5个", "6个或6个以上"],
				residentList: ["远离家人，且独居一室", "住处经常变动，多数时间和陌生人住在一起", "和同学、同事或朋友住在一起", "和家人住在一起"],
				neighborRelList: ["相互之间从不关心，只是点头之交", "遇到困难可能稍微关心", "有些邻居很关心您", "大多数邻居都很关心您"],
				colleagueRelList: ["相互之间从不关心，只是点头之交", "遇到困难可能稍微关心", "有些同事很关心您"],
				favourList: ["无任何来源", "配偶", "其他家人", "朋友", "亲戚", "同事", "工作单位", "党团公会等官方或半官方组织", "宗教、社会团体等非官方组织"],
				comfortList: ["无任何来源", "配偶", "其他家人", "朋友", "亲戚", "同事", "工作单位", "党团公会等官方或半官方组织", "宗教、社会团体等非官方组织",],
				shareList: ["从不向任何人倾诉", "只向关系即为密切的1-2人倾诉", "如果朋友主动询问您会说出来", "主动倾诉自己的烦恼，以获得支持和理解"],
				seekHelpList: ["只靠自己，不接受别人帮助", "很少请求别人帮助", "有时请求别人帮助", "有困难时经常向家人、亲友、组织求援"],
				groupActivityList: ["从不参加", "偶尔参加", "经常参加", "主动参加并积极活动"],
				lesTimeList: ["未发生", "一年前", "一年内", "长期性"],
				lesTypeList: ["好事", "坏事", "无所谓"],
				lesMentalInfluenceList: ["无影响", "轻度", "中度", "重度"],
				lesDurationList: ["三月内", "半年内", "一年内", "一年以上"]
			}
		},
		methods: {

			nextPage() {
				if (this.currentPage < 39) {
					this.currentPage++;
				}
			},

			prevPage() {
				if (this.currentPage > 1) {
					this.currentPage--;
				}
			},

			validate(value, fValue) {
				if (fValue == null || fValue == "未发生") {
					return true;
				}
				return value != null && value != '';
			},
			fillField(obj, fName) {
				obj[fName] = obj[fName + "_happen"] + "," +
					obj[fName + "_type"] + "," +
					obj[fName + "_mentalInfluence"] + "," +
					obj[fName + "_duration"];
			},
			splitField(obj, fName) {
				if (obj[fName]) {
					let vals = obj[fName].split(",");

					obj[fName + "_happen"] = vals[0] == "null" ? null : vals[0];
					obj[fName + "_type"] = vals[1] == "null" ? null : vals[1];
					obj[fName + "_mentalInfluence"] = vals[2] == "null" ? null : vals[2];
					obj[fName + "_duration"] = vals[3] == "null" ? null : vals[3];
				}
			},
			submit(formName) {
				let _this = this;


				this.$refs.form.validate().then(res => {
					//组装成后端的数据格式
					let dataToPost = {
						..._this.BasicInfo
					};
					dataToPost.favour = dataToPost.favour.join(",");
					dataToPost.comfort = dataToPost.comfort.join(",");
					console.log(dataToPost.favour);
					if (dataToPost.favour == "其他（请列出）") {
						dataToPost.favour = "其他（请列出）," + dataToPost.favour_other;
					}
					if (dataToPost.comfort == "其他（请列出）") {
						dataToPost.comfort = "其他（请列出）," + dataToPost.comfort_other;
					}
					if (dataToPost.trauma == "无") {
						dataToPost.traumaTime = null;
					}
					this.fillField(dataToPost, "datingEngaged");
					this.fillField(dataToPost, "datingEngaged");
					this.fillField(dataToPost, "datingLose");
					this.fillField(dataToPost, "parentsConflict");
					this.fillField(dataToPost, "familyFinanceDif");
					this.fillField(dataToPost, "debt");
					this.fillField(dataToPost, "familySerInj");
					this.fillField(dataToPost, "familyDie");
					this.fillField(dataToPost, "serInj");
					this.fillField(dataToPost, "unemployed");
					this.fillField(dataToPost, "workPressure");
					this.fillField(dataToPost, "poorMark");
					this.fillField(dataToPost, "roommatesDis");
					this.fillField(dataToPost, "lifeLawChange");
					this.fillField(dataToPost, "friendSerInj");
					this.fillField(dataToPost, "friendDie");
					this.fillField(dataToPost, "misunderstood");
					this.fillField(dataToPost, "stolen");
					this.fillField(dataToPost, "accidentalShock");

					http.post(`${config.baseUrl}/basicInfo/add`, dataToPost).then((res) => {
						console.log(res.data)
						if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
							uni.showToast({
								title: "提交成功"
							});
							setTimeout(() => {
								uni.reLaunch({
									url: "/pages/index/index"
								});
							}, 700);
						} else { //返回非200，弹窗提示失败，停留在此页
							uni.showToast({
								title: "提交失败",
								icon: 'error'
							});
						}
					})
				}).catch(err => {
					uni.$u.toast('表单填写有误，请修改后重新提交')

					if (err && err.length > 0) {
						const query = uni.createSelectorQuery().in(this);
						var dataTitle;
						query.select(`.title0`).boundingClientRect((data) => {
							dataTitle = data;
						}).exec();

						query.select('.' + err[0].field).boundingClientRect((data) => {
							uni.pageScrollTo({
								scrollTop: data.top - dataTitle.top,
								duration: 100
							});
						}).exec();
					}
				})

			},
			changeRadio() {
				const _this = this;
			},
			resetform(formName) {
				this.$refs[formName].resetFields();
			},
			getDetail() {
				http.get(`${config.baseUrl}/basicInfo/getRecordDetail`).then((res) => {
					if (res.result) {
						let dataToShow = {
							...res.result
						};
						dataToShow.favour = dataToShow.favour.split(",");
						dataToShow.comfort = dataToShow.comfort.split(",");
						console.log(dataToShow.favour);

						// if (dataToShow.favour.startsWith("其他（请列出）")) {
						// 	dataToShow["favour_other"] = dataToShow.favour.replace("其他（请列出）,", "");
						// 	dataToShow.favour = "其他（请列出）";
						// }
						// if (dataToShow.comfort.startsWith("其他（请列出）")) {
						// 	dataToShow["comfort_other"] = dataToShow.comfort.replace("其他（请列出）,", "");
						// 	dataToShow.comfort = "其他（请列出）";
						// }
						this.splitField(dataToShow, "datingEngaged");
						this.splitField(dataToShow, "datingEngaged");
						this.splitField(dataToShow, "datingLose");
						this.splitField(dataToShow, "parentsConflict");
						this.splitField(dataToShow, "familyFinanceDif");
						this.splitField(dataToShow, "debt");
						this.splitField(dataToShow, "familySerInj");
						this.splitField(dataToShow, "familyDie");
						this.splitField(dataToShow, "serInj");
						this.splitField(dataToShow, "unemployed");
						this.splitField(dataToShow, "workPressure");
						this.splitField(dataToShow, "poorMark");
						this.splitField(dataToShow, "roommatesDis");
						this.splitField(dataToShow, "lifeLawChange");
						this.splitField(dataToShow, "friendSerInj");
						this.splitField(dataToShow, "friendDie");
						this.splitField(dataToShow, "misunderstood");
						this.splitField(dataToShow, "stolen");
						this.splitField(dataToShow, "accidentalShock");
						this.BasicInfo = dataToShow;
					}
				})
			}
		},
		onLoad(parms) {
			this.getDetail();
		},
	}
</script>

<style lang="scss" scoped>
	.container{	
		width: 100%;
		position: relative; /* 确保容器是已定位的，以便其子元素可以相对于它进行绝对定位 */  
		min-height: 100vh; /* 视口高度，确保容器至少和屏幕一样大 */  
		overflow-y: auto; /* 允许垂直滚动 */
	}
	.title {
		// font-size: 35rpx;
		// color: rgb(40, 40, 40);
		// padding: 2px 0 2px 5px; // 文字
		// margin: 10px auto;
		// border: 10px solid rgb(64, 158, 255);
		font-size: 38rpx;
		color: rgb(98, 98, 98);
		padding: 10px 0 10px 15px; // 文字
		font-weight: bold;
		// margin: 10px auto;
		border-left: 10px solid #4554F5;
		margin-left: 0;
	}
	
	.form {
		// padding-left: 50rpx;
		padding-right: 50rpx;
	}
	
	.form-box {  
		padding-left: 50rpx;
		margin-top: 5px;
		border-radius: 10px;
	}
	
	// 如果你还想修改<u-radio-group>的样式，可以这样做（但这通常不是必需的，除非有特别的布局需求）
	::v-deep .u-radio-group {
		display: flex; // 假设你想让它以flex布局显示  
		flex-direction: column; // 已经是column了，但这里只是示例  
		// border: 2px solid #00aa00;
		margin-top: 10px;
	}
	
	::v-deep .u-radio {
		// 修改单选按钮的样式  
		// width: 160px;
		height: 60px;
		// margin: 20px 10px 0 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		// border: 2px solid #00ff00;
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
	}
	
	::v-deep .u-checkbox-group {
		// 哪些运动按钮设置
		width: 100%;
		height: 400px;
		display: flex; // 假设你想让它以flex布局显示  
		flex-wrap: wrap;
		// flex-direction: column; // 已经是column了，但这里只是示例  
		// border: 2px solid #00aa00;
		margin-top: 10px;
	
	}
	
	::v-deep .u-checkbox {
		// 修改单选按钮的样式  
		width: 155px;
		height: 60px;
		// margin: 20px 10px 0 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		// border: 2px solid #00ff00;
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
		flex: 1 1 auto;
	}
	
	::v-deep .u-form-item{
		// font-size: 20px;
		font-weight: bold;
		// border: 2px solid #00ff00;
		// margin-bottom: 10px;
	}
	
	.birthDate{
		height: 60px;
		width: 100%;
		margin: 10px 0 20px 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
		font-size: 15px;
	}
	
	.all-button{
		width: 100%;
		display: flex;
		justify-content: center;
		position: fixed;
		bottom: 20px;
		left: 0;
		// margin-bottom: 20px;
	}
	.button {
		width: 160px;
		background-color: #4554F5;
		color: white;
		margin: 10px;
	}
</style>