/**
 * id를 이용해 id에 해당되는 html element를 가지고옵니다.
 */
const searchForm = document.getElementById("searchForm");
const input = document.getElementById("searchText");
const temp = document.getElementById("temp");
const city = document.getElementById("city");
const image = document.getElementById("image");

// 도시 이름을 입력하고, Enter키를 누루면 아래 함수가 실행됩니다.
searchForm.addEventListener("submit", function(event) {
    event.preventDefault();

    const text = input.value;

    input.value = "";
    input.disabled = true;

    getGeoCode(text)
        .then(function(code) {
            return getWeatherData(code.lat, code.lng);
        })
        .then(function(weatherInfo) {
            setWeatherInfo(text, weatherInfo);
        })
        .catch(function(err) {
            console.log("에러가 발생했습니다.", err);
            input.disabled = false;
        });
});

// 1. 입력된 도시의 위도, 경도 값을 가지고 옵니다.
function getGeoCode(city) {
    return new Promise(function(resolve, reject) {
        fetch(
            `https://maps.googleapis.com/maps/api/geocode/json?address=${city}&key=${GOOGLE_KEY}`
        ).then(function(response) {
            response.json().then(function(data) {
                /**
                 * - input으로 받은 data에서 우리가 필요한 정보만 찾아 resolve에 인풋으로 넣어주세요!
                 *
                 * * resolve에 넘겨주어야 하는 input 형식
                 * {
                 *   lat: 위도,
                 *   lng: 경도
                 * }
                 */
                console.log("우리가 받은 위치 데이터 ", data);

                resolve(); // 여기에 저희가 원하는 형식의 값을 넣어주세요!
            });
        });
    });
}

// 2. 위도, 경도를 바탕으로 해당 지역의 날씨를 가지고 옵니다.
/**
 * getGeoCode 함수에서 return한 객체에서 lat, lng 값을 가지고 옵니다.
 * lat - 위도
 * lng - 경도
 */
function getWeatherData(lat, lng) {
    return new Promise(function(resolve, reject) {
        fetch(
            `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&APPID=${WEATHER_KEY}`
        ).then(function(response) {
            response.json().then(function(data) {
                /**
                 * - input으로 받은 data에서 우리가 필요한 정보만 찾아 resolve에 인풋으로 넣어주세요!
                 *
                 * * resolve에 넘겨주어야 하는 input 형식
                 * {
                 *    temp: 기온
                 *    weather: 날씨(데이터에서 weather -> main을 찾아 설정해주세요!)
                 * }
                 */
                console.log("우리가 받은 날씨 데이터 ", data);

                resolve(); // 여기에 저희가 원하는 형식의 값을 넣어주세요!
            });
        });
    });
}

// 3. 저희가 받은 날씨 정보로 화면을 변경합니다.
/**
 * cityName - 입력한 도시 이름
 * weatherInfo - getWeatherData에서 return해준 객체
 * {
 *    temp: 기온
 *    weather: 날씨
 * }
 */
function setWeatherInfo(cityName, weatherInfo) {
    /**
     * 우리가 받아온 온도는 Kelvin 형식으로 표시되어있습니다.
     * 어떻게 Celsius 형식으로 변경할 수 있을까요?
     */
    temp.innerText = weatherInfo.temp; // 이곳에 넣어준 값이 온도로 표시됩니다!

    /**
     * data.js 파일에 있는 imgLinks 객체를 사용해 날씨에 맞는 이미지를 표시해보세요!
     */
    const weatherLink = "sun.png";
    image.src = `./img/${weatherLink}`; // 이곳에 이미지 파일의 경로를 입력해주면 이미지 파일이 표시됩니다.

    /**
     * 아래의 코드는 어떤 역할을 할까요?
     */
    city.innerText = cityName;

    input.disabled = false;
}

/**
 * 해볼 것들
 *
 * - 날씨별로 맞추어 배경색상을 변경해보기
 * javasciprt를 사용해 element의 내용 뿐만 아니라 element의 style도 변경할 수 있습니다.
 * 어떻게 javascript를 사용해 css를 다룰 수 있을까요?
 *
 * 배경 참고 사이트 https://uigradients.com/
 *
 * - 나만의 날씨 이미지로 변경하기
 * 이미지를 수정하거나, 새로운 이미지를 추가해보세요.
 * 원하는 이미지를 찾아 img 폴더에 저장 후 data.js 파일을 수정해보세요.
 *
 */