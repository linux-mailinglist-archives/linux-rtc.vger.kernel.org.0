Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47C86225E3
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Nov 2022 09:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiKIIxL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Nov 2022 03:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiKIIxA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Nov 2022 03:53:00 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206821DDE3
        for <linux-rtc@vger.kernel.org>; Wed,  9 Nov 2022 00:52:53 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b9so24718425ljr.5
        for <linux-rtc@vger.kernel.org>; Wed, 09 Nov 2022 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbGNFPpu5MVDBZ3XQuPIC1Y2Ym2XdJZtS6bvD1mV44s=;
        b=O67WfZyW3vSanjXsrFxnokhcN9YGCncthkF8OjHlYeDM6++FJZXzza6QFyXaLCXoA+
         lSg+mkd0x/t93RaMKv3HkPiwBGL4fuJF3dWPX0rExwXPPbhK6O/Bpw8aJKU7pzqFjgfj
         f26w2FAHcWPDRtGa9uWqpMTa+RMS+GGLs17qGOYZpS8MOaq703BC0Se1Sh6jjc1xxJ1i
         Y+2MJ7ikfiSHvhgrW9bHBgErIm8Y43+YjnwOvTsPC0P++4GVcYmj45wiS9zF4s1Or4H8
         Bizb2IUGdlrR/qqKTgMaLmhX/AV0uKJ+YncIqrIlpZT2Pyp+zBPFTJfXSUVgBWPxiqeR
         v44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbGNFPpu5MVDBZ3XQuPIC1Y2Ym2XdJZtS6bvD1mV44s=;
        b=jTifbbrSQ7A4Q25YD0I5VpzirdRFZAyjA2OZRDvRUp4yV9EN0vJGEyqVuM1N6emz5I
         /gnrgCEKHlE5BhtLKQthT2lANhY88xUIYYGIlwefeZ/06HSbYDtZphkpPpGUCf5x4eiW
         Z1deGr2m9vtB3frGU2/NNp1cXwRETwLpCToAFxRSXgv9lNhS7wqkNAhiuLELv/nPax+l
         2hit+RDvITyngbqvMnByGCP8QYp1dHIb/4lKl28+GxsV2C85yWfO0h71EKfDYhnOeF7/
         QzNsBPAvLCZUqIahmikbszQBypOQtPXYjl2TC4NjSb1kQyo/+zoAn3etESm0p65Sd8El
         uXNQ==
X-Gm-Message-State: ACrzQf15Ku18pCG3fh4lLpsk69/qQtuC7Kxpv1GRjjD+IHhUBloRchpP
        zj7++JzBQ9UhTJ+xwxju9rkHJw==
X-Google-Smtp-Source: AMsMyM5D0WrT2cMz/vfENcgBByz3G07Jcm3sCIyh9HDVzAkhiz3YJqyWaOUMi+Gu13j4LKp/6yHIpQ==
X-Received: by 2002:a2e:2c12:0:b0:277:8b2c:c62d with SMTP id s18-20020a2e2c12000000b002778b2cc62dmr9135595ljs.117.1667983971484;
        Wed, 09 Nov 2022 00:52:51 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0049f530939aasm2124615lfu.126.2022.11.09.00.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:52:50 -0800 (PST)
Message-ID: <99f517bf-dcdc-8edc-a113-18082183b910@linaro.org>
Date:   Wed, 9 Nov 2022 09:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add
 TPS6594x PMIC node
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-8-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-8-mranostay@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/11/2022 07:55, Matt Ranostay wrote:
> Add TPS6594x PMIC, GPIO, and RTC definitions for j721s2 common processor
> board device tree.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../boot/dts/ti/k3-j721s2-common-proc-board.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index a7aa6cf08acd..918c0c8d02cf 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -309,3 +309,20 @@ &mcu_mcan1 {
>  	pinctrl-0 = <&mcu_mcan1_pins_default>;
>  	phys = <&transceiver2>;
>  };
> +
> +&wkup_i2c0 {
> +	status = "okay";
> +	tps6594x: tps6594x@48 {
> +		compatible = "ti,tps6594x";

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

