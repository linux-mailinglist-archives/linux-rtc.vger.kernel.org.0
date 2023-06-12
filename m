Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679CB72C431
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jun 2023 14:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbjFLMbF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Jun 2023 08:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbjFLMae (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Jun 2023 08:30:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58D51713
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jun 2023 05:30:21 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f63a2e1c5fso5020126e87.2
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jun 2023 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686573020; x=1689165020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U9z6LiWhhNIjZTQZVib3hcbFKnnBjPQBx95lAycLnw=;
        b=F1/6AZava+zQRwLlQeOO1h/1nEAd1sO8wigO0yr61pbTNrL0BaQc9+yIquUpTsISGk
         WYCTxJXiU1wUtpADftFQCCSxSQGk2LwLUNVNA1gobhcoxkXsoE+nOrs052zVfNkX/fYW
         i0satxDiN65XV4b0kRadeIDLuIj7mQBVGmiq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686573020; x=1689165020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U9z6LiWhhNIjZTQZVib3hcbFKnnBjPQBx95lAycLnw=;
        b=P4+7E2/kArwIo0Q8kBoccz3lW6KRSDRbJoOV2CHlQYQ0eAbMpNJN+4tRsf64nDIyLL
         uQFTNFVOmr7dq09rfBvDtD4U7+djhrcNA57spaqdy6npFIHpOIF3Sua8SIcxzAyC1IOK
         sks+ykD6fVbXBNmBzcgFlKu76FIDREUmCVshrV+ej2M/JqgVn0pYiYjle5qTd+nmr3NO
         Y4pFMsw+u3CPWWgnTDSJjIUUTX+GwR2dkTB3Rg9OTK5zW6AIVfk/ZhW/K4yhjBJXaS1B
         mkcuFjzXhpF3CXPCpWH77CyROyCsZqBD8faj5Unjox3W4YpoTOZk+S1HGuDNrvasdzzF
         HfBw==
X-Gm-Message-State: AC+VfDx688UXsiBkeopy2mg3Qm2YBZl5YRBSXqpKHVtid/l3z0VnufqQ
        ekM5c6Y+BISxiD4O6+qTyXhRuQ==
X-Google-Smtp-Source: ACHHUZ6xroZGYOAtqAK+l3adlJ0TXz4+23QzUhBiw1ZWwYdsPksiPsUu4dtFS/kv82kzmk1opcJ5rQ==
X-Received: by 2002:ac2:465b:0:b0:4f6:1805:6080 with SMTP id s27-20020ac2465b000000b004f618056080mr4892783lfo.4.1686573019770;
        Mon, 12 Jun 2023 05:30:19 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 11-20020ac2482b000000b004f251e73fc5sm1426472lft.30.2023.06.12.05.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:30:19 -0700 (PDT)
Message-ID: <665d9926-2e0f-4b16-1414-f6d8fc487124@rasmusvillemoes.dk>
Date:   Mon, 12 Jun 2023 14:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/8] rtc: isl12022: trigger battery level detection during
 probe
Content-Language: en-US, da
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230612113059.247275-7-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20230612113059.247275-7-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/06/2023 13.30, Rasmus Villemoes wrote:

> diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
> index 1b6659a9b33a..690dbb446d1a 100644
> --- a/drivers/rtc/rtc-isl12022.c
> +++ b/drivers/rtc/rtc-isl12022.c
> @@ -280,8 +280,25 @@ static void isl12022_set_trip_levels(struct device *dev)
>  	mask = ISL12022_REG_VB85_MASK | ISL12022_REG_VB75_MASK;
>  
>  	ret = regmap_update_bits(regmap, ISL12022_REG_PWR_VBAT, mask, val);
> -	if (ret)
> +	if (ret) {
>  		dev_warn(dev, "unable to set battery alarm levels: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = regmap_write_bits(regmap, ISL12022_REG_BETA,
> +				ISL12022_BETA_TSE, ISL12022_BETA_TSE);
> +	if (ret) {
> +		dev_warn(dev, "unable to trigger battery level detection: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = isl12022_read_sr(regmap);

So testing this a bit more thoroughly reveals that the LBAT85/LBAT75
bits do not get updated immediately after the TSE bit is set; one needs
to wait a little before the battery voltage detection is done and the SR
bits updated. Unfortunately, the data sheet doesn't say anything about
how long that might be or if there's some busy bit one could look at;
all it says is actually exactly what I've done above:

  The battery level monitor is not functional in battery backup
  mode. In order to read the monitor bits after powering up VDD,
  instigate a battery level measurement by setting the TSE bit to
  "1" (BETA register), and then read the bits.

IOW, please don't apply this patch until I figure out how to do this
properly.

Rasmus

