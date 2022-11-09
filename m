Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E376225D8
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Nov 2022 09:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiKIIwr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Nov 2022 03:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiKIIwq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Nov 2022 03:52:46 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86461D306
        for <linux-rtc@vger.kernel.org>; Wed,  9 Nov 2022 00:52:44 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id be13so24669594lfb.4
        for <linux-rtc@vger.kernel.org>; Wed, 09 Nov 2022 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P90r3AzM1Asz4bqZj9mzkrib+orYLcJuTTyYZ9PzgDY=;
        b=dglRE3lXBeu+nWrxl+Rt9ZUzRI1wHOHyOLqTHwaNMu02RNmlvCnDUcBJX7jMg2WKIE
         sYtDoHDlGCTDPw58u1lwSDSv9B+lLEaWYQc6y20Pf6dXI/RW3U4+jjfNRzR46Qgz50fb
         Q2JvMdUI/Eo0HU1oFJ8MJCh5XSEcDFzT8awMa6FVY7ED4piZBbOzdYFu2M9R40hPzDoo
         FMLBabJUakYpTIiCMQ1zYwDe9geZ4hH4iNZ1/bIKA/sbWS/1/4WXc1g4IuM8oCrERoDz
         c54C2ggEG+gRYcBHzgdB8gnbByZfOXg10La5XO/pTAq4XoSRQ2ILWUVn4JCD6v91EXgr
         GeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P90r3AzM1Asz4bqZj9mzkrib+orYLcJuTTyYZ9PzgDY=;
        b=wgu99+upz6cnJQ5N/F5cGMzzrDYih7uDea2Ok5coUAf59nlQ0lsEtQ4YEFWtkcQyYm
         2kuphTIFskA5kQZGWuYjxfT2LdqNCNG9M8FR7XWBIDW/5FOC2g8rKyfqdRVjyRDaxP+0
         9Ws+V9LZ+iZXFmKhYrjyF7TMsQzdQVXrzip9iQ53vioLCIGOLoGUnxvyzciTe4ZVvEa/
         Ooi61xidHdaWm3Gkf/ENPZzWD5dPczceKj94o/cvxLWtHBey+0rznpvmbonmEuKvS1hR
         7jYK+4/eTgXy2bV/5y9EvwkRXjAG8Jp63r1PWnLwYGvx4DQs+DVvPBVZRR1b+TrZlVBa
         Tw3w==
X-Gm-Message-State: ACrzQf3aXeYwh+MatNMcQVq9+LPscyayK1XyJDeqcGkMm7cg9NAPEyF5
        tfhZT126VdKkRmguSKIZneCz0Q==
X-Google-Smtp-Source: AMsMyM56FGgfTQwgu4ShGFY632vAeEz3gCQBQ9TJiyJtFbXrFIZFdOKABTMQ2hmFDg7IKwOAlKexLg==
X-Received: by 2002:a19:2d0d:0:b0:4b0:975c:f1cd with SMTP id k13-20020a192d0d000000b004b0975cf1cdmr17336601lfj.361.1667983963100;
        Wed, 09 Nov 2022 00:52:43 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id x6-20020a056512078600b004ab2cb8deb5sm228048lfr.18.2022.11.09.00.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:52:42 -0800 (PST)
Message-ID: <1c3db53c-8fc7-a96c-a716-0afeca2c9789@linaro.org>
Date:   Wed, 9 Nov 2022 09:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/7] arm64: dts: ti: k3-j721e-common-proc-board: Add
 TPS6594x PMIC node
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-7-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-7-mranostay@ti.com>
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
> Add TPS6594x PMIC, GPIO, and RTC definitions for J721E common processor
> board device tree.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../boot/dts/ti/k3-j721e-common-proc-board.dts  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 1861598f3bb4..93bc7433ab06 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -904,3 +904,20 @@ &main_mcan2 {
>  	pinctrl-0 = <&main_mcan2_pins_default>;
>  	phys = <&transceiver4>;
>  };
> +
> +&wkup_i2c0 {
> +	status = "okay";
> +	tps6594x: tps6594x@48 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

