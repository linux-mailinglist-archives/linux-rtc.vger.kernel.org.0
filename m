Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 801FC734C53
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jun 2023 09:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjFSH1Z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Jun 2023 03:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFSH1Y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Jun 2023 03:27:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0404C1A4
        for <linux-rtc@vger.kernel.org>; Mon, 19 Jun 2023 00:27:23 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f909853509so10773535e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 19 Jun 2023 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1687159641; x=1689751641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVaISX2m9XxL5h5a/4y8I7apZS6weBxYRlQstKHaB2s=;
        b=iJhu5+me0m2HX6u+lFFiJJFhkyPa4BO1Dtdj6q+mAsFrDzUYRH7Qd7TkyYs6Yo7Gxo
         zVRaQ+hs8FAhIwXoX5AUxwGNd9jYngTnYnrFyd6GoXL5BlccS2jFBZ+KCtVJCZtRq1ez
         MExxIv0syI2A9xo2DVjrvC+jNnSr9YK+cuBOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687159641; x=1689751641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVaISX2m9XxL5h5a/4y8I7apZS6weBxYRlQstKHaB2s=;
        b=klxoifs1aVnSi5lMmU5fmEVKYnY4nX5aVY7VXp6HDYrmu3nlwRGsmRyCoE7TNct/E7
         jKnHXdaWrMWBxxuy+g5vhSupyXKDuiAFM9IgYypmFNXnWpwcaSKsQjyVQVJ5uxbg1mSm
         DUNHe3mzf7E3eAtLR/SQOfkm0pDDsIItMElZhHSxXeaT756OJBLYVsQ4MG+kD22Z19UK
         cQubCVxoQDrSU5DyTNb2U7+wnWiaun+Ry4IY1bldb+3RxQYcxVBp+nw7fnensobF53x0
         oCC2UaISsYh71JJcMh3z7fW5AF/fU07Mly+UwI/KHW9b2dKATPlrtaBctzayoKGNtXJW
         hSdA==
X-Gm-Message-State: AC+VfDzbuWjZY1glDk9wop0Rf76Sb/wxsy8axPzen+7LlhqlKicjSTVW
        uoKKnEXqUm8TMKpeZV8GhVM9Tg==
X-Google-Smtp-Source: ACHHUZ7D4N4Ny9o6BKYovhoFL8IM6tDrg1j5ahbMthjQAaIA3tSDhTpQ070XzmtBpkxVnRCJqUqrzA==
X-Received: by 2002:a7b:c356:0:b0:3f8:f6fe:26bf with SMTP id l22-20020a7bc356000000b003f8f6fe26bfmr5666144wmj.12.1687159641390;
        Mon, 19 Jun 2023 00:27:21 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id l22-20020a7bc356000000b003f7e4d143cfsm9726492wmj.15.2023.06.19.00.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 00:27:20 -0700 (PDT)
Message-ID: <50f1066a-5c4c-540b-d69e-8ffe022cb860@rasmusvillemoes.dk>
Date:   Mon, 19 Jun 2023 09:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/8] rtc: isl12022: add support for trip level DT
 binding
Content-Language: en-US, da
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230615105826.411953-1-linux@rasmusvillemoes.dk>
 <20230615105826.411953-5-linux@rasmusvillemoes.dk>
 <ZIrx6lZfsYnM7TnQ@smile.fi.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <ZIrx6lZfsYnM7TnQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/06/2023 13.11, Andy Shevchenko wrote:
> On Thu, Jun 15, 2023 at 12:58:22PM +0200, Rasmus Villemoes wrote:

>> +static void isl12022_set_trip_levels(struct device *dev)
>> +{
>> +	struct regmap *regmap = dev_get_drvdata(dev);
>> +	u32 levels[2] = {0, 0};
> 
> A nit, 0, 0 is not needed, {} will do the job.

So? I'm not code-golfing, and here I really want to initialize to 0 (or
any value lower than the first entries in the trip_levels[] arrays so
that, lacking the DT property, the code ends up using what are the chip
reset defaults).

>> +	int ret, i, j, x[2];
>> +	u8 val, mask;
> 
> BUILD_BUG_ON(ARRAY_SIZE(x) != ARRAY_SIZE(levels)) ?

BUILD_BUG_ON doesn't make sense when these things are declared within a
few lines of each other _and_ since they're sized based on properties of
the hardware we're dealing with, nobody would ever have a reason to
change either. So no, that would IMO make it harder to read, because one
would stop and think "why is this obvious thing asserted?".

>> +	device_property_read_u32_array(dev, "isil,battery-trip-levels-microvolt",
>> +				       levels, 2);
> 
> A nit, ARRAY_SIZE(levels) ?
> 
>> +	for (i = 0; i < 2; i++) {
> 
> ARRAY_SIZE(x) ?

I considered that, but really didn't think it improved readability. I'll
defer to Alexandre on whether to change this.

Rasmus

