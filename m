Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8159B27E
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 16:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392826AbfHWOxv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 10:53:51 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42653 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731256AbfHWOxv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 10:53:51 -0400
Received: by mail-ed1-f65.google.com with SMTP id m44so13846241edd.9;
        Fri, 23 Aug 2019 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zgl387QkD2iiqhSO+GDAgWSNL5E+i+hM/fHygMH0Lh0=;
        b=VYmytlO1v4Svp/a/Jz+6DoaHSFi87t5Bf72MJplc3IH6y/CMnQvWGbIQy1Ge+llXt+
         z/kRwUoWrKnqhF6GXG0NnNLx5YrZLXJxCJ2I1GUD9JJaDxlERoFKJ1oEHbFBDKQlOSDs
         amFvqJsFQeqZdG++Z6TdfGGT9G3D/gxgUZ6by+x4d8OzeKnaeK7hUzm62yj1C3X7SkzT
         MnowufOZs+d4bRtdbKk93L4dj+FerwtE6s5fD2pe8pQX010Rh+XO23ekMT10HazEI7L/
         RgMhrLzJlpEXJXo/0Bvs732rruaE6pYWDyUcTxw2G5KmJcivJfVcmdcHVGnN25uo+Uzc
         1LbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zgl387QkD2iiqhSO+GDAgWSNL5E+i+hM/fHygMH0Lh0=;
        b=caxj964EpDj2KA6g2h/Rrj4dbVTlGtBDLeZHMtx9ivsXSAvoWXssuQaa4dvjEI10gi
         mKRxCk4hVvbzE1AWfXydtO9vdswdi02/pm5tsT6+QwUux7Ccl7zFNeusT48Q0ZU8AiX3
         SkBR5ueS7Hk0XltDz0yTsv/CQUnpClrdrkts6lO4yi2FnVA4U+I4Dug6tX3rUJ5lD4e/
         Np4GQaV1HssXo5xXSm6mWOR8wV2xHLzBSxY3vW5bvgJ19c0cEgzKmTBjOjkOXyLEkul3
         Y7PGrD5HQFL/cu5/p/yu9IzT5GVTD6fHKien4Gb92LQErZqta2mHJ2VTFHTt2OIFDRRU
         mmqQ==
X-Gm-Message-State: APjAAAXIXCt1t7BMPk8J5d+kAZLwiFS8X55oWYGN3ptXvvcqdU31iRjG
        OwV5EZp3i8Do4fzd8EYV+aI=
X-Google-Smtp-Source: APXvYqxVy6AX4x2czv/ljIOE9Qcym6jmbl1ZVItw545AFJybfTz/tHgfW14Eu8jBOn3YICtxKuvzMg==
X-Received: by 2002:a50:9738:: with SMTP id c53mr4978319edb.221.1566572028048;
        Fri, 23 Aug 2019 07:53:48 -0700 (PDT)
Received: from ziggy.stardust ([37.223.137.147])
        by smtp.gmail.com with ESMTPSA id a3sm441172eje.90.2019.08.23.07.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 07:53:47 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] mfd: mt6397: extract irq related code from core
 driver
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABtClNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPokCUgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyybkCDQRT9c4FARAAqdGWpdzcSM8q
 6I2oTPS5J4KXXIJS8O2jbUcxoNuaSBnUkhwp2eML/i30oLbEC+akmagcOLD0kOY46yRFeSEC
 SPM9SWLxKvKUTQYGLX2sphPVZ3hEdFYKen3+cbvo6GyYTnm8ropHM9uqmXPZFFfLJDL76Nau
 kFsRfPMQUuwMe3hFVLmF7ntvdX3Z3jKImoMWrgA/SnsT6K40n/GCl1HNz2T8PSnqAUQjvSoI
 FAenxb23NtW6kg50xIxlb7DKbncnQGGTwoYn8u9Lgxkh8gJ03IMiSDHZ9o+wl21U8B3OXr1K
 L08vXmdR70d6MJSmt6pKs7yTjxraF0ZS6gz+F2BTy080jxceZwEWIIbK7zU3tm1hnr7QIbj/
 H6W2Pv9p5CXzQCIw17FXFXjpGPa9knzd4WMzJv2Rgx/m8/ZG91aKq+4Cbz9TLQ7OyRdXqhPJ
 CopfKgZ2l/Fc5+AGhogJLxOopBoELIdHgB50Durx4YJLmQ1z/oimD0O/mUb5fJu0FUQ5Boc1
 kHHJ8J8bZTuFrGAomfvnsek+dyenegqBpZCDniCSfdgeAx9oWNoXG4cgo8OVG7J/1YIWBHRa
 Wnk+WyXGBfbY/8247Gy8oaXtQs1OnehbMKBHRIY0tgoyUlag3wXuUzeK+0PKtWC7ZYelKNC0
 Fn+zL9XpnK3HLE5ckhBLgK8AEQEAAYkCHwQYAQIACQUCU/XOBQIbDAAKCRDZFAuyVhMC8Yyu
 D/9g6+JZZ+oEy7HoGZ0Bawnlxu/xQrzaK/ltQhA2vtiMaxCN46gOvEF/x+IvFscAucm3q4Dy
 bJJkW2qY30ISK9MDELnudPmHRqCxTj8koabvcI1cP8Z0Fw1reMNZVgWgVZJkwHuPYnkhY15u
 3vHDzcWnfnvmguKgYoJxkqqdp/acb0x/qpQgufrWGeYv2yb1YNidXBHTJSuelFcGp/oBXeJz
 rQ2IP1JBbQmQfPSePZzWdSLlrR+3jcBJEP/A/73lSObOQpiYJomXPcla6dH+iyV0IiiZdYgU
 Htwru4Stv/cFVFsUJk1fIOP1qjSa+L6Y0dWX6JMniqUXHhaXo6OPf7ArpVbBygMuzvy99LtS
 FSkMcYXn359sXOYsRy4V+Yr7Bs0lzdnHnKdpVqHiDvNgrrLoPNrKTiYwTmzTVbb9u/BjUGhC
 YUS705vcjBgXhdXS44kgO22kaB5c6Obg7WP7cucFomITovtZs5Rm1iaZZc31lzobfFPUwDSc
 YXOj6ckS9bF9lDG26z3C/muyiifZeiQvvG1ygexrHtnKYTNxqisOGjjcXzDzpS8egIOtIEI/
 arzlqK5RprMLVOl6n/npxEWmInjBetsBsaX/9kJNZFM4Yais5scOnP+tuTnFTW2K9xKySyuD
 q/iLORJYRYMloJPaDAftiYfjFa8zuw1XnQyG17kCDQRT9gX3ARAAsL2UwyvSLQuMxOW2GRLv
 CiZuxtIEoUuhaBWdC/Yq3c6rWpTu692lhLd4bRpKJkE4nE3saaTVxIHFF3tt3IHSa3Qf831S
 lW39EkcFxr7DbO17kRThOyU1k7KDhUQqhRaUoT1NznrykvpTlNszhYNjA0CMYWH249MJXgck
 iKOezSHbQ2bZWtFG3uTloWSKloFsjsmRsb7Vn2FlyeP+00PVC6j7CRqczxpkyYoHuqIS0w1z
 Aq8HP5DDSH7+arijtPuJhVv9uaiD6YFLgSIQy4ZCZuMcdzKJz2j6KCw2kUXLehk4BU326O0G
 r9+AojZT8J3qvZYBpvCmIhGliKhZ7pYDKZWVseRw7rJS5UFnst5OBukBIjOaSVdp6JMpe99o
 caLjyow2By6DCEYgLCrquzuUxMQ8plEMfPD1yXBo00bLPatkuxIibM0G4IstKL5hSAKiaFCc
 2f73ppp7eby3ZceyF4uCIxN3ABjW9ZCEAcEwC40S3rnh2wZhscBFZ+7sO7+Fgsd0w67zjpt+
 YHFNv/chRJiPnDGGRt0jPWryaasDnQtAAf59LY3qd4GVHu8RA1G0Rz4hVw27yssHGycc4+/Z
 ZX7sPpgNKlpsToMaB5NWgc389HdqOG80Ia+sGkNj9ylp74MPbd0t3fzQnKXzBSHOCNuS67sc
 lUAw7HB+wa3BqgsAEQEAAYkEPgQYAQIACQUCU/YF9wIbAgIpCRDZFAuyVhMC8cFdIAQZAQIA
 BgUCU/YF9wAKCRC0OWJbLPHTQ14xD/9crEKZOwhIWX32UXvB/nWbhEx6+PQG2uWsnah7oc5D
 7V+aY7M1jy5af8yhlhVdaxL5xUoepfOP08lkCEuSdrYbS5wBcQj4NE1QUoeAjJKbq4JwxUkX
 Baq2Lu91UZpdKxEVFfSkEzmeMaVvClGjGOtNCUKl8lwLuthU7dGTW74mJaW5jjlXldgzfzFd
 BkS3fsXfcmeDhHh5TpA4e3MYVBIJrq6Repv151g/zxdA02gjJgGvJlXTb6OgEZGNFr8LGJDh
 LP7MSksBw6IxCAJSicMESu5kXsJfcODlm4zFaV8QDBevI/s/TgOQ9KQ/EJQsG+XBAuh0dqpu
 ImmCdhlHx+YaGmwKO1/yhfWvg1h1xbVn98izeotmq1+0J1jt9tgM17MGvgHjmvqlaY+oUXfj
 OkHkcCGOvao5uAsddQhZcSLmLhrSot8WJI0z3NIM30yiNx/r6OMu47lzTobdYCU8/8m7Rhsq
 fyW68D+XR098NIlU2oYy1zUetw59WJLf2j5u6D6a9p10doY5lYUEeTjy9Ejs/cL+tQbGwgWh
 WwKVal1lAtZVaru0GMbSQQ2BycZsZ+H+sbVwpDNEOxQaQPMmEzwgv2Sk2hvR3dTnhUoUaVoR
 hQE3/+fVRbWHEEroh/+vXV6n4Ps5bDd+75NCQ/lfPZNzGxgxqbd/rd2wStVZpQXkhofMD/4k
 Z8IivHZYaTA+udUk3iRm0l0qnuX2M5eUbyHW0sZVPnL7Oa4OKXoOir1EWwzzq0GNZjHCh6Cz
 vLOb1+pllnMkBky0G/+txtgvj5T/366ErUF+lQfgNtENKY6In8tw06hPJbu1sUTQIs50Jg9h
 RNkDSIQ544ack0fzOusSPM+vo6OkvIHt8tV0fTO1muclwCX/5jb7zQIDgGiUIgS8y0M4hIkP
 KvdmgurPywi74nEoQQrKF6LpPYYHsDteWR/k2m2BOj0ciZDIIxVR09Y9moQIjBLJKN0J21XJ
 eAgam4uLV2p1kRDdw/ST5uMCqD4Qi5zrZyWilCci6jF1TR2VEt906E2+AZ3BEheRyn8yb2KO
 +cJD3kB4RzOyBC/Cq/CGAujfDkRiy1ypFF3TkZdya0NnMgka9LXwBV29sAw9vvrxHxGa+tO+
 RpgKRywr4Al7QGiw7tRPbxkcatkxg67OcRyntfT0lbKlSTEQUxM06qvwFN7nobc9YiJJTeLu
 gfa4fCqhQCyquWVVoVP+MnLqkzu1F6lSB6dGIpiW0s3LwyE/WbCAVBraPoENlt69jI0WTXvH
 4v71zEffYaGWqtrSize20x9xZf5c/Aukpx0UmsqheKeoSprKyRD/Wj/LgsuTE2Uod85U36Xk
 eFYetwQY1h3lok2Zb/3uFhWr0NqmT14EL7kCDQRT9gkSARAApxtQ4zUMC512kZ+gCiySFcIF
 /mAf7+l45689Tn7LI1xmPQrAYJDoqQVXcyh3utgtvBvDLmpQ+1BfEONDWc8KRP6Abo35YqBx
 3udAkLZgr/RmEg3+Tiof+e1PJ2zRh5zmdei5MT8biE2zVd9DYSJHZ8ltEWIALC9lAsv9oa+2
 L6naC+KFF3i0m5mxklgFoSthswUnonqvclsjYaiVPoSldDrreCPzmRCUd8znf//Z4BxtlTw3
 SulF8weKLJ+Hlpw8lwb3sUl6yPS6pL6UV45gyWMe677bVUtxLYOu+kiv2B/+nrNRDs7B35y/
 J4t8dtK0S3M/7xtinPiYRmsnJdk+sdAe8TgGkEaooF57k1aczcJlUTBQvlYAEg2NJnqaKg3S
 CJ4fEuT8rLjzuZmLkoHNumhH/mEbyKca82HvANu5C9clyQusJdU+MNRQLRmOAd/wxGLJ0xmA
 ye7Ozja86AIzbEmuNhNH9xNjwbwSJNZefV2SoZUv0+V9EfEVxTzraBNUZifqv6hernMQXGxs
 +lBjnyl624U8nnQWnA8PwJ2hI3DeQou1HypLFPeY9DfWv4xYdkyeOtGpueeBlqhtMoZ0kDw2
 C3vzj77nWwBgpgn1Vpf4hG/sW/CRR6tuIQWWTvUM3ACa1pgEsBvIEBiVvPxyAtL+L+Lh1Sni
 7w3HBk1EJvUAEQEAAYkCHwQYAQIACQUCU/YJEgIbDAAKCRDZFAuyVhMC8QndEACuN16mvivn
 WwLDdypvco5PF8w9yrfZDKW4ggf9TFVB9skzMNCuQc+tc+QM+ni2c4kKIdz2jmcg6QytgqVu
 m6V1OsNmpjADaQkVp5jL0tmg6/KA9Tvr07Kuv+Uo4tSrS/4djDjJnXHEp/tB+Fw7CArNtUtL
 lc8SuADCmMD+kBOVWktZyzkBkDfBXlTWl46T/8291lEspDWe5YW1ZAH/HdCR1rQNZWjNCpB2
 Cic58CYMD1rSonCnbfUeyZYNNhNHZosl4dl7f+am87Q2x3pK0DLSoJRxWb7vZB0uo9CzCSm3
 I++aYozF25xQoT+7zCx2cQi33jwvnJAK1o4VlNx36RfrxzBqc1uZGzJBCQu48UjmUSsTwWC3
 HpE/D9sM+xACs803lFUIZC5H62G059cCPAXKgsFpNMKmBAWweBkVJAisoQeX50OP+/11ArV0
 cv+fOTfJj0/KwFXJaaYh3LUQNILLBNxkSrhCLl8dUg53IbHx4NfIAgqxLWGfXM8DY1aFdU79
 pac005PuhxCWkKTJz3gCmznnoat4GCnL5gy/m0Qk45l4PFqwWXVLo9AQg2Kp3mlIFZ6fsEKI
 AN5hxlbNvNb9V2Zo5bFZjPWPFTxOteM0omUAS+QopwU0yPLLGJVf2iCmItHcUXI+r2JwH1CJ
 jrHWeQEI2ucSKsNa8FllDmG/fQ==
Message-ID: <d32fed91-5d7a-a6fb-535b-fca9e311df42@gmail.com>
Date:   Fri, 23 Aug 2019 16:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 23/08/2019 05:45, Hsin-Hsiung Wang wrote:
> In order to support different types of irq design, we decide to add
> separate irq drivers for different design and keep mt6397 mfd core
> simple and reusable to all generations of PMICs so far.
> 
> Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile            |   3 +-
>  drivers/mfd/mt6397-core.c       | 146 --------------------------------
>  drivers/mfd/mt6397-irq.c        | 181 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h |   9 ++
>  4 files changed, 192 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/mfd/mt6397-irq.c
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f026ada..9a96325 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -241,7 +241,8 @@ obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
> -obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o
> +mt6397-objs	:= mt6397-core.o mt6397-irq.o
> +obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
>  
>  obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
>  obj-$(CONFIG_MFD_ALTERA_SYSMGR) += altera-sysmgr.o
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index c070862..93c8881 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -18,10 +18,6 @@
>  #define MT6397_RTC_BASE		0xe000
>  #define MT6397_RTC_SIZE		0x3e
>  
> -#define MT6323_CHIP_ID		0x23
> -#define MT6391_CHIP_ID		0x91
> -#define MT6397_CHIP_ID		0x97
> -
>  static const struct resource mt6397_rtc_resources[] = {
>  	{
>  		.start = MT6397_RTC_BASE,
> @@ -86,148 +82,6 @@
>  	}
>  };
>  
> -static void mt6397_irq_lock(struct irq_data *data)
> -{
> -	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> -
> -	mutex_lock(&mt6397->irqlock);
> -}
> -
> -static void mt6397_irq_sync_unlock(struct irq_data *data)
> -{
> -	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> -
> -	regmap_write(mt6397->regmap, mt6397->int_con[0],
> -		     mt6397->irq_masks_cur[0]);
> -	regmap_write(mt6397->regmap, mt6397->int_con[1],
> -		     mt6397->irq_masks_cur[1]);
> -
> -	mutex_unlock(&mt6397->irqlock);
> -}
> -
> -static void mt6397_irq_disable(struct irq_data *data)
> -{
> -	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> -	int shift = data->hwirq & 0xf;
> -	int reg = data->hwirq >> 4;
> -
> -	mt6397->irq_masks_cur[reg] &= ~BIT(shift);
> -}
> -
> -static void mt6397_irq_enable(struct irq_data *data)
> -{
> -	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> -	int shift = data->hwirq & 0xf;
> -	int reg = data->hwirq >> 4;
> -
> -	mt6397->irq_masks_cur[reg] |= BIT(shift);
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
> -{
> -	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
> -	int shift = irq_data->hwirq & 0xf;
> -	int reg = irq_data->hwirq >> 4;
> -
> -	if (on)
> -		mt6397->wake_mask[reg] |= BIT(shift);
> -	else
> -		mt6397->wake_mask[reg] &= ~BIT(shift);
> -
> -	return 0;
> -}
> -#else
> -#define mt6397_irq_set_wake NULL
> -#endif
> -
> -static struct irq_chip mt6397_irq_chip = {
> -	.name = "mt6397-irq",
> -	.irq_bus_lock = mt6397_irq_lock,
> -	.irq_bus_sync_unlock = mt6397_irq_sync_unlock,
> -	.irq_enable = mt6397_irq_enable,
> -	.irq_disable = mt6397_irq_disable,
> -	.irq_set_wake = mt6397_irq_set_wake,
> -};
> -
> -static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
> -		int irqbase)
> -{
> -	unsigned int status;
> -	int i, irq, ret;
> -
> -	ret = regmap_read(mt6397->regmap, reg, &status);
> -	if (ret) {
> -		dev_err(mt6397->dev, "Failed to read irq status: %d\n", ret);
> -		return;
> -	}
> -
> -	for (i = 0; i < 16; i++) {
> -		if (status & BIT(i)) {
> -			irq = irq_find_mapping(mt6397->irq_domain, irqbase + i);
> -			if (irq)
> -				handle_nested_irq(irq);
> -		}
> -	}
> -
> -	regmap_write(mt6397->regmap, reg, status);
> -}
> -
> -static irqreturn_t mt6397_irq_thread(int irq, void *data)
> -{
> -	struct mt6397_chip *mt6397 = data;
> -
> -	mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
> -	mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
> -					irq_hw_number_t hw)
> -{
> -	struct mt6397_chip *mt6397 = d->host_data;
> -
> -	irq_set_chip_data(irq, mt6397);
> -	irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
> -	irq_set_nested_thread(irq, 1);
> -	irq_set_noprobe(irq);
> -
> -	return 0;
> -}
> -
> -static const struct irq_domain_ops mt6397_irq_domain_ops = {
> -	.map = mt6397_irq_domain_map,
> -};
> -
> -static int mt6397_irq_init(struct mt6397_chip *mt6397)
> -{
> -	int ret;
> -
> -	mutex_init(&mt6397->irqlock);
> -
> -	/* Mask all interrupt sources */
> -	regmap_write(mt6397->regmap, mt6397->int_con[0], 0x0);
> -	regmap_write(mt6397->regmap, mt6397->int_con[1], 0x0);
> -
> -	mt6397->irq_domain = irq_domain_add_linear(mt6397->dev->of_node,
> -		MT6397_IRQ_NR, &mt6397_irq_domain_ops, mt6397);
> -	if (!mt6397->irq_domain) {
> -		dev_err(mt6397->dev, "could not create irq domain\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = devm_request_threaded_irq(mt6397->dev, mt6397->irq, NULL,
> -		mt6397_irq_thread, IRQF_ONESHOT, "mt6397-pmic", mt6397);
> -	if (ret) {
> -		dev_err(mt6397->dev, "failed to register irq=%d; err: %d\n",
> -			mt6397->irq, ret);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int mt6397_irq_suspend(struct device *dev)
>  {
> diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> new file mode 100644
> index 0000000..b2d3ce1
> --- /dev/null
> +++ b/drivers/mfd/mt6397-irq.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/mt6323/core.h>
> +#include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/mfd/mt6397/registers.h>
> +
> +static void mt6397_irq_lock(struct irq_data *data)
> +{
> +	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> +
> +	mutex_lock(&mt6397->irqlock);
> +}
> +
> +static void mt6397_irq_sync_unlock(struct irq_data *data)
> +{
> +	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> +
> +	regmap_write(mt6397->regmap, mt6397->int_con[0],
> +		     mt6397->irq_masks_cur[0]);
> +	regmap_write(mt6397->regmap, mt6397->int_con[1],
> +		     mt6397->irq_masks_cur[1]);
> +
> +	mutex_unlock(&mt6397->irqlock);
> +}
> +
> +static void mt6397_irq_disable(struct irq_data *data)
> +{
> +	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> +	int shift = data->hwirq & 0xf;
> +	int reg = data->hwirq >> 4;
> +
> +	mt6397->irq_masks_cur[reg] &= ~BIT(shift);
> +}
> +
> +static void mt6397_irq_enable(struct irq_data *data)
> +{
> +	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
> +	int shift = data->hwirq & 0xf;
> +	int reg = data->hwirq >> 4;
> +
> +	mt6397->irq_masks_cur[reg] |= BIT(shift);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
> +{
> +	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
> +	int shift = irq_data->hwirq & 0xf;
> +	int reg = irq_data->hwirq >> 4;
> +
> +	if (on)
> +		mt6397->wake_mask[reg] |= BIT(shift);
> +	else
> +		mt6397->wake_mask[reg] &= ~BIT(shift);
> +
> +	return 0;
> +}
> +#else
> +#define mt6397_irq_set_wake NULL
> +#endif
> +
> +static struct irq_chip mt6397_irq_chip = {
> +	.name = "mt6397-irq",
> +	.irq_bus_lock = mt6397_irq_lock,
> +	.irq_bus_sync_unlock = mt6397_irq_sync_unlock,
> +	.irq_enable = mt6397_irq_enable,
> +	.irq_disable = mt6397_irq_disable,
> +	.irq_set_wake = mt6397_irq_set_wake,
> +};
> +
> +static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
> +				  int irqbase)
> +{
> +	unsigned int status;
> +	int i, irq, ret;
> +
> +	ret = regmap_read(mt6397->regmap, reg, &status);
> +	if (ret) {
> +		dev_err(mt6397->dev, "Failed to read irq status: %d\n", ret);
> +		return;
> +	}
> +
> +	for (i = 0; i < 16; i++) {
> +		if (status & BIT(i)) {
> +			irq = irq_find_mapping(mt6397->irq_domain, irqbase + i);
> +			if (irq)
> +				handle_nested_irq(irq);
> +		}
> +	}
> +
> +	regmap_write(mt6397->regmap, reg, status);
> +}
> +
> +static irqreturn_t mt6397_irq_thread(int irq, void *data)
> +{
> +	struct mt6397_chip *mt6397 = data;
> +
> +	mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
> +	mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +				 irq_hw_number_t hw)
> +{
> +	struct mt6397_chip *mt6397 = d->host_data;
> +
> +	irq_set_chip_data(irq, mt6397);
> +	irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
> +	irq_set_nested_thread(irq, 1);
> +	irq_set_noprobe(irq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops mt6397_irq_domain_ops = {
> +	.map = mt6397_irq_domain_map,
> +};
> +
> +int mt6397_irq_init(struct mt6397_chip *chip)
> +{
> +	int ret;
> +
> +	mutex_init(&chip->irqlock);
> +
> +	switch (chip->chip_id) {
> +	case MT6323_CHIP_ID:
> +		chip->int_con[0] = MT6323_INT_CON0;
> +		chip->int_con[1] = MT6323_INT_CON1;
> +		chip->int_status[0] = MT6323_INT_STATUS0;
> +		chip->int_status[1] = MT6323_INT_STATUS1;
> +		break;
> +
> +	case MT6391_CHIP_ID:
> +	case MT6397_CHIP_ID:
> +		chip->int_con[0] = MT6397_INT_CON0;
> +		chip->int_con[1] = MT6397_INT_CON1;
> +		chip->int_status[0] = MT6397_INT_STATUS0;
> +		chip->int_status[1] = MT6397_INT_STATUS1;
> +		break;
> +

Just stumbled over this in linux-next. I personally would prefer to have two
patches, one that moves the code and another one that adds the switch etc.

This way it would be much easier to realize this change.
Not sure if this is still possible, because it seems to be in one of Lee's
repositories already. (and if Lee thinks the same as I do, of course)

Regards,
Matthias


> +	default:
> +		dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
> +		return -ENODEV;
> +	}
> +
> +	/* Mask all interrupt sources */
> +	regmap_write(chip->regmap, chip->int_con[0], 0x0);
> +	regmap_write(chip->regmap, chip->int_con[1], 0x0);
> +
> +	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
> +						 MT6397_IRQ_NR,
> +						 &mt6397_irq_domain_ops,
> +						 chip);
> +	if (!chip->irq_domain) {
> +		dev_err(chip->dev, "could not create irq domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> +					mt6397_irq_thread, IRQF_ONESHOT,
> +					"mt6397-pmic", chip);
> +	if (ret) {
> +		dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
> +			chip->irq, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> index 25a95e7..9320c2a 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -7,6 +7,12 @@
>  #ifndef __MFD_MT6397_CORE_H__
>  #define __MFD_MT6397_CORE_H__
>  
> +enum chip_id {
> +	MT6323_CHIP_ID = 0x23,
> +	MT6391_CHIP_ID = 0x91,
> +	MT6397_CHIP_ID = 0x97,
> +};
> +
>  enum mt6397_irq_numbers {
>  	MT6397_IRQ_SPKL_AB = 0,
>  	MT6397_IRQ_SPKR_AB,
> @@ -54,6 +60,9 @@ struct mt6397_chip {
>  	u16 irq_masks_cache[2];
>  	u16 int_con[2];
>  	u16 int_status[2];
> +	u16 chip_id;
>  };
>  
> +int mt6397_irq_init(struct mt6397_chip *chip);
> +
>  #endif /* __MFD_MT6397_CORE_H__ */
> 
