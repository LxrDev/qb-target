const Targeting = Vue.createApp({
    data() {
        return {
            Show: false, // x store by Toxic メ#1001
            ChangeTextIconColor: false, // x store by Toxic メ#1001
            StandardEyeIcon: "", // x store by Toxic メ#1001
            CurrentIcon: this.StandardEyeIcon, // x store by Toxic メ#1001
            SuccessColor: "#683fff", // x store by Toxic メ#1001
            StandardColor: "white", // x store by Toxic メ#1001
            TargetEyeStyleObject: {
                color: 'white', 
            },
        }
    },
    destroyed() {
        window.removeEventListener("message", this.messageListener);
        window.removeEventListener("mousedown", this.mouseListener);
        window.removeEventListener("keydown", this.keyListener);
        window.removeEventListener("mouseover", this.mouseOverListener);
        window.removeEventListener("mouseout", this.mouseOutListener);
    },
    mounted() {
        this.targetLabel = document.getElementById("target-label");

        this.messageListener = window.addEventListener("message", (event) => {
            switch (event.data.response) {
                case "openTarget":
                    this.OpenTarget();
                    break;
                case "closeTarget":
                    this.CloseTarget();
                    break;
                case "foundTarget":
                    this.FoundTarget(event.data);
                    break;
                case "validTarget":
                    this.ValidTarget(event.data);
                    break;
                case "leftTarget":
                    this.LeftTarget();
                    break;
            }
        });

        this.mouseListener = window.addEventListener("mousedown", (event) => {
            let element = event.target;
            if (element.id) {
                const split = element.id.split("-");
                if (split[0] === "target" && split[1] !== "eye" && event.button == 0) {
                    fetch(`https://qb-target/selectTarget`, {
                        method: "POST",
                        headers: { "Content-Type": "application/json; charset=UTF-8" },
                        body: JSON.stringify(split[2])
                    }).then(resp => resp.json()).then(_ => {});
                    $("#target-eye").fadeOut(50);
                    $('.blackbeforeye').fadeOut(0);
                    $(".linenumber1").animate({ width: '0vh' }, 25);
                    $(".linenumber2").animate({ height: '0vh' }, 50);
                    setTimeout(() => {
                        this.targetLabel.innerHTML = "";
                    }, 15);
                    this.Show = false;
                }
            }

            if (event.button == 2) {
                this.LeftTarget();
                fetch(`https://qb-target/leftTarget`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: ""
                }).then(resp => resp.json()).then(_ => {});
            }
        });

        this.keyListener = window.addEventListener("keydown", (event) => {
            if (event.key == "Escape" || event.key == "Backspace") {
                this.CloseTarget();
                fetch(`https://qb-target/closeTarget`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: ""
                }).then(resp => resp.json()).then(_ => {});
            }
        });

        this.mouseOverListener = window.addEventListener("mouseover", (event) => {
            const element = event.target;
            if (element.id) {
                const split = element.id.split("-");
                if (split[0] === "target" && split[1] === "option") {
                    event.target.style.color = this.SuccessColor;
                    if (this.ChangeTextIconColor) document.getElementById(`target-icon-${index}`).style.color = this.SuccessColor;
                }
            }
        });

        this.mouseOutListener = window.addEventListener("mouseout", (event) => {
            const element = event.target;
            if (element.id) {
                const split = element.id.split("-");
                if (split[0] === "target" && split[1] === "option") {
                    element.style.color = this.StandardColor;
                    if (this.ChangeTextIconColor) document.getElementById(`target-icon-${index}`).style.color = this.StandardColor;
                }
            }
        });
    },
    methods: {
        OpenTarget() {
            $("#target-eye").attr('src', 'https://cdn.discordapp.com/attachments/952117961081106432/1108153548115558530/arrow-double-rotate-right.png');
            $("#target-eye").fadeIn(50);
            this.targetLabel.innerHTML = "";
            this.Show = true;
            this.TargetEyeStyleObject.color = this.StandardColor;
            $('.blackbeforeye').fadeIn(50);
            $('#target-eye').css('transform','translateY(-50%) translateX(-50%) ').css('opacity','1');
            $('.blackbeforeye').css('animation', 'pulse 0.9s ease forwards');
        },

        CloseTarget() {
            $('.blackbeforeye').fadeOut(0);
            $("#target-eye").fadeOut(50);
            setTimeout(() => {
                this.targetLabel.innerHTML = "";
            }, 15);
            $('#target-eye').css('transform','translateY(-50%) translateX(-50%) ')
            $('.blackbeforeye').css('animation', 'pulse 0.9s ease forwards');
            this.TargetEyeStyleObject.color = this.StandardColor;
            this.Show = false;
            this.CurrentIcon = this.StandardEyeIcon;
        },

        FoundTarget(item) {
            setTimeout(() => {
                $('#target-eye').css('transform','translateY(-50%) translateX(-50%)  rotate(4600000deg)');
                $('.blackbeforeye').css('animation', 'pulse2 0.9s ease forwards');
                $("#target-eye").attr('src', 'https://cdn.discordapp.com/attachments/952117961081106432/1108153700574302259/arrow-double-rotate-right_1.png');
            }, 10);
            setTimeout(() => {
                $('#target-eye').css('transform','translateY(-50%) translateX(-50%)  rotate(4500000deg)');
            }, 80);
            // if (item.data) this.CurrentIcon = item.data;
            // else this.CurrentIcon = this.StandardEyeIcon;
            this.TargetEyeStyleObject.color = this.SuccessColor;
        },

        ValidTarget(item) {
            this.targetLabel.innerHTML = "";
            sounds.audio1();
            $(".linenumber1").animate({ width: '2.90vh' }, 50);
            $(".linenumber2").animate({ height: '1.2vh' }, 100);
            setTimeout(() => {
                for (let [index, itemData] of Object.entries(item.data)) {
                    if (itemData !== null) {
                        index = Number(index) + 1;
    
                        if (this.ChangeTextIconColor) {
                            this.targetLabel.innerHTML +=
                            `<div class="targetclass" id="target-option-${index}" style="margin-bottom: 0.3vh; color: ${this.StandardColor}">
                                <span id="target-icon-${index}" style="color: ${this.StandardColor}">
                                    <i class="${itemData.icon}"></i>
                                </span>
                                ${itemData.label}
                            </div>`;
                        } else {
                            this.targetLabel.innerHTML +=
                            `<div class="targetclass" id="target-option-${index}" style="margin-bottom: 0.3vh; color: ${this.StandardColor}">
                                <span id="target-icon-${index}" style="color: #A8A8A8">
                                    <i class="${itemData.icon}"></i>
                                </span>
                                ${itemData.label}
                            </div>`;
                        }
                    }
                }
            }, 100);
        },

        LeftTarget() {
            
            $('.blackbeforeye').css('animation', 'unset');
            $('#target-eye').css('transform','translateY(-50%) translateX(-50%) ').css('opacity','1');
            // $('.blackbeforeye').fadeOut(0);
            $(".linenumber1").animate({ width: '0vh' }, 25);
            $(".linenumber2").animate({ height: '0vh' }, 50);
            setTimeout(() => {
                $("#target-eye").attr('src', 'https://cdn.discordapp.com/attachments/952117961081106432/1108153548115558530/arrow-double-rotate-right.png');
                this.targetLabel.innerHTML = "";
                this.CurrentIcon = this.StandardEyeIcon;
                this.TargetEyeStyleObject.color = this.StandardColor;
            }, 15);
        }
    }
});

Targeting.use(Quasar, { config: {} });
Targeting.mount("#target-wrapper");

sounds = {}
sounds.audio1 = function () {
  var audio1s = document.getElementById("openeye");
  audio1s.volume = 0.4;
  audio1s.play();
}