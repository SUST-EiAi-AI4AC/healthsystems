/**

 PAM (Photographic Affect Meter) (good for valence, arousal)
 Totally 48 pictures, arranged as randomized 4*4 grid capturing participant’s instantaneous mood, always precedes any EMA with PAM.
 High correlation with PANAS

 文件夹名称的序号就是4*4栅格从左至右、从上到下的排列序号，
 即对于4*4栅格，左上角是1，右下角是16，排列如下：

 1_afraid     2_tense  3_excited 4_delighted
 5_frustrated 6_angry  7_happy   8_glad
 9_miserable  10_sad   11_calm   12_satisfied
 13_gloomy    14_tired 15_sleepy 16_serene

 */

// 图片在assets/pam_images路径下，IMAGE_FOLDERS保存了文件夹名称，每个文件夹下有3张图片
// const IMAGE_FOLDERS = [
//     "1_afraid", // 文件夹名称
//     "2_tense",
//     "3_excited",
//     "4_delighted",
//     "5_frustrated",
//     "6_angry",
//     "7_happy",
//     "8_glad",
//     "9_miserable",
//     "10_sad",
//     "11_calm",
//     "12_satisfied",
//     "13_gloomy",
//     "14_tired",
//     "15_sleepy",
//     "16_serene"
// ];

// 文件夹名称
// name 和pamScore的对应关系，详见《PAM.pptx》
// 对应的分数一定不要写错
const IMAGE_FOLDERS = [
    {
        name: "1_afraid",
        valence: -2,
        arousal: 2,
        pamScore: 6,
    },
    {
        name: "2_tense",
        valence: -1,
        arousal: 2,
        pamScore: 8,
    },
    {
        name: "3_excited",
        valence: 1,
        arousal: 2,
        pamScore: 14,
    },
    {
        name: "4_delighted",
        valence: 2,
        arousal: 2,
        pamScore: 16,
    },
    {
        name: "5_frustrated",
        valence: -2,
        arousal: 1,
        pamScore: 5,
    },
    {
        name: "6_angry",
        valence: -1,
        arousal: 1,
        pamScore: 7,
    },
    {
        name: "7_happy",
        valence: 1,
        arousal: 1,
        pamScore: 13,
    },
    {
        name: "8_glad",
        valence: 2,
        arousal: 1,
        pamScore: 15,
    },
    {
        name: "9_miserable",
        valence: -2,
        arousal: -1,
        pamScore: 2,
    },
    {
        name: "10_sad",
        valence: -1,
        arousal: -1,
        pamScore: 4,
    },
    {
        name: "11_calm",
        valence: 1,
        arousal: -1,
        pamScore: 10,
    },
    {
        name: "12_satisfied",
        valence: 2,
        arousal: -1,
        pamScore: 12,
    },
    {
        name: "13_gloomy",
        valence: -2,
        arousal: -2,
        pamScore: 1,
    },
    {
        name: "14_tired",
        valence: -1,
        arousal: -2,
        pamScore: 3,
    },
    {
        name: "15_sleepy",
        valence: 1,
        arousal: -2,
        pamScore: 9,
    },
    {
        name: "16_serene",
        valence: 2,
        arousal: -2,
        pamScore: 11,
    },
];

// 所有图片，一定要确保src和alt中的图片IMAGE_FOLDERS的索引是相同的！！！
let dataImages = [{
    id: '1',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[0].name + '/' + '1_' + getRandomInt(1, 3) + ".jpg", // 图片的地址
    alt: IMAGE_FOLDERS[0].name.split('_')[1] // 图片对应的情感标签，从文件夹字符串中获取，以下划线分割字符串
}, {
    id: '2',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[1].name + '/' + '2_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[1].name.split('_')[1]
}, {
    id: '3',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[2].name + '/' + '3_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[2].name.split('_')[1]
}, {
    id: '4',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[3].name + '/' + '4_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[3].name.split('_')[1]
}, {
    id: '5',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[4].name + '/' + '5_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[4].name.split('_')[1]
}, {
    id: '6',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[5].name + '/' + '6_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[5].name.split('_')[1]
}, {
    id: '7',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[6].name + '/' + '7_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[6].name.split('_')[1]
}, {
    id: '8',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[7].name + '/' + '8_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[7].name.split('_')[1]
}, {
    id: '9',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[8].name + '/' + '9_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[8].name.split('_')[1]
}, {
    id: '10',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[9].name + '/' + '10_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[9].name.split('_')[1]
}, {
    id: '11',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[10].name + '/' + '11_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[10].name.split('_')[1]
}, {
    id: '12',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[11].name + '/' + '12_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[11].name.split('_')[1]
}, {
    id: '13',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[12].name + '/' + '13_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[12].name.split('_')[1]
}, {
    id: '14',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[13].name + '/' + '14_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[13].name.split('_')[1]
}, {
    id: '15',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[14].name + '/' + '15_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[14].name.split('_')[1]
}, {
    id: '16',
    src: "static/images/pam_images/" + IMAGE_FOLDERS[15].name + '/' + '16_' + getRandomInt(1, 3) + ".jpg",
    alt: IMAGE_FOLDERS[15].name.split('_')[1]
},
];

/**
 * 生成min-max的整数
 * Math.floor(); // 向下取整
 * Math.random();  // random() 方法可返回介于 0（包含） ~ 1（不包含） 之间的一个随机数。
 * Math.floor((Math.random()*10)+1); // 取得介于 1 到 10 之间的一个随机数：
 * Math.floor((Math.random()*100)+1); // 取得介于 1 到 100 之间的一个随机数：
 *
 * @param min
 * @param max
 * @returns int
 */
function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

export function getPAMScoreById(imageSelectedId) {
    // 打印出来，检查 imageSelectedId 和 IMAGE_FOLDERS[index]索引的对应关系

    let index = imageSelectedId - 1;
    console.log("imageSelectedId: ", imageSelectedId)
    console.log("imageSelected name: ", IMAGE_FOLDERS[index].name)
    console.log("imageSelected pamScore: ", IMAGE_FOLDERS[index].pamScore)

    return IMAGE_FOLDERS[index].pamScore;
}

export function getValenceById(imageSelectedId) {
    // 打印出来，检查 imageSelectedId 和 IMAGE_FOLDERS[index]索引的对应关系

    let index = imageSelectedId - 1;
    console.log("imageSelectedId: ", imageSelectedId)
    console.log("imageSelected name: ", IMAGE_FOLDERS[index].name)
    console.log("imageSelected pamScore: ", IMAGE_FOLDERS[index].valence)

    return IMAGE_FOLDERS[index].valence;
}

export function getArousalById(imageSelectedId) {
    // 打印出来，检查 imageSelectedId 和 IMAGE_FOLDERS[index]索引的对应关系

    let index = imageSelectedId - 1;
    console.log("imageSelectedId: ", imageSelectedId)
    console.log("imageSelected name: ", IMAGE_FOLDERS[index].name)
    console.log("imageSelected pamScore: ", IMAGE_FOLDERS[index].arousal)

    return IMAGE_FOLDERS[index].arousal;
}

export default {
    dataImages,
    IMAGE_FOLDERS,
}
