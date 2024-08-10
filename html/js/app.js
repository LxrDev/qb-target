const Targeting = Vue.createApp({
    data() {
        return {
            Show: false, // leave this
            ChangeTextIconColor: false, // This is if you want to change the color of the icon next to the option text with the text color
            StandardEyeIcon: "", // This is the default eye icon
            CurrentIcon: this.StandardEyeIcon, // leave this
            SuccessColor: "#ffffff", // This is the color when the target has found the option
            StandardColor: "white", // This is the standard color, change this to the same as the StandardColor if you have changed it
            TargetEyeStyleObject: {
                color: 'white', // leave this
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
                    fetch(`https://${GetParentResourceName()}/selectTarget`, {
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
                fetch(`https://${GetParentResourceName()}/leftTarget`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: ""
                }).then(resp => resp.json()).then(_ => {});
            }
        });

        this.keyListener = window.addEventListener("keydown", (event) => {
            if (event.key == "Escape" || event.key == "Backspace") {
                this.CloseTarget();
                fetch(`https://${GetParentResourceName()}/closeTarget`, {
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
            $("#target-eye").attr('src', 'https://cdn.discordapp.com/attachments/1163105405120020570/1241302011622981642/arrow-double-rotate-right_1_2.png?ex=66b91ad5&is=66b7c955&hm=4bc92d9bab7d132f3c24a9d45798674ec5e0a73c60a740e2ddd413e622d71f5c&');
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
            $(".test").fadeOut(50);
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
                $('#target-eye').css('transform','translateY(-50%) translateX(-50%)  rotate(4000000deg)');
                $('.blackbeforeye').css('animation', 'pulse2 0.9s ease forwards');
                $("#target-eye").attr('src', 'https://cdn.discordapp.com/attachments/1163105405120020570/1241302026000928770/arrow-double-rotate-right_1_1.png?ex=66b91ad9&is=66b7c959&hm=93867f604200664cef3d7abc94604ccea0c2a85e38881c50c0211dc19b23cb4b&');
            }, 10);
            setTimeout(() => {
                $('#target-eye').css('transform','translateY(-50%) translateX(-50%)  rotate(4000000deg)');
            }, 80);
            // if (item.data) this.CurrentIcon = item.data;
            // else this.CurrentIcon = this.StandardEyeIcon;
            this.TargetEyeStyleObject.color = this.SuccessColor;
        },

        ValidTarget(item) {
            $(".test").fadeIn(50);
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
                                <span id="target-icon-${index}" style="color: #ca70fa">
                                    <i class="${itemData.icon}"></i>
                                </span>
                                ${itemData.label}
                            </div>`;
                            `<div class="targetclass"</div>`;   
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
                $("#target-eye").attr('src', 'https://cdn.discordapp.com/attachments/1163105405120020570/1241302011622981642/arrow-double-rotate-right_1_2.png?ex=66b91ad5&is=66b7c955&hm=4bc92d9bab7d132f3c24a9d45798674ec5e0a73c60a740e2ddd413e622d71f5c&');
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
