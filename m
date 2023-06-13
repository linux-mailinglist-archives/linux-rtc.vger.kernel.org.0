Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964C172DB9B
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 09:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239614AbjFMHxJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 03:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240534AbjFMHxI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 03:53:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B6610E3
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 00:53:06 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so6321709e87.3
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686642785; x=1689234785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgyeJguriMnbfi6ZGlMYcKZf5qXmQ+PSixMOFCnWr5o=;
        b=b45BvBaHfVrHpwlCQG0xJEFZLSXZmuinIWauD4liAPwvqwlxtST+/46UW3d68Bmw5H
         nxpyN+K1CqzlUo8bbuFkuwbRvKOQwnzM7SfeCC4t66etVTpCQPlFhICoKujGsnzOipJy
         JcHaePank2UOcvUNi4Mks+EOERkqv7E1NNmbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642785; x=1689234785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgyeJguriMnbfi6ZGlMYcKZf5qXmQ+PSixMOFCnWr5o=;
        b=cvxJi0EVwkbvh8fpLwKqRfNRvchooFLQIoXAOu4E7V58YfnJBNhC1JkMcYaCzAeS25
         JU0WIsI8/aSI+5KL6cDUtCJTVO/nBUmXMJq34Yk8LWGPngC7EdGaj4rWFhtyT3CvclKP
         1Wuyj5Ls+PepQ/qFdaj28wlMvJe86MFKtDy0Pgic37bxb/D2iWc8vegnQYi+UwecOCRf
         JekZDz5EnZxnr+2Qb79/7aJezEbn+NX0HJ/fteErBe0vFWguIHDFJylF+qmWHHk1fo6L
         wIxaZG3qA4TWl4+x5UBuWnjTjWZ860JjKUU15huwfrcU3WfugUzeiPqmCHiozc/oHIMe
         46Zw==
X-Gm-Message-State: AC+VfDxfV6XbYnWx8HPUWCkAYrX0dRe9On6O4zQoRJtqpHpcmgZnsDP8
        V7SdLHrm2nkKZh9fEXIBjMW8dA==
X-Google-Smtp-Source: ACHHUZ4cmU5qIKk9gkk33Hw8hZ16K2xoa8udfINvmQgU9tU31tIbOR09K8fChJ3KJ9cbDrsYguMM9w==
X-Received: by 2002:a19:6445:0:b0:4f3:9868:bee4 with SMTP id b5-20020a196445000000b004f39868bee4mr5611190lfj.32.1686642784801;
        Tue, 13 Jun 2023 00:53:04 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id e15-20020ac2546f000000b004db0d26adb4sm1712054lfn.182.2023.06.13.00.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:53:04 -0700 (PDT)
Message-ID: <c7a2d554-5cb2-5b99-bb6d-855a320deb1b@rasmusvillemoes.dk>
Date:   Tue, 13 Jun 2023 09:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/8] rtc: isl12022: implement RTC_VL_READ and RTC_VL_CLR
 ioctls
Content-Language: en-US, da
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230612113059.247275-6-linux@rasmusvillemoes.dk>
 <ZIc+YdUPIAt6L4fi@smile.fi.intel.com> <202306121610404abc8cbc@mail.local>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <202306121610404abc8cbc@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/06/2023 18.10, Alexandre Belloni wrote:
> On 12/06/2023 18:48:49+0300, Andy Shevchenko wrote:
>> On Mon, Jun 12, 2023 at 01:30:55PM +0200, Rasmus Villemoes wrote:
>>> Hook up support for reading the values of the SR_LBAT85 and SR_LBAT75
>>> bits. Translate the former to "battery low", and the latter to
>>> "battery empty or not-present".
>>
>> ...
>>
>>> +static int isl12022_read_sr(struct regmap *regmap)
>>> +{
>>> +	int ret;
>>> +	u32 val;
>>> +
>>> +	ret = regmap_read(regmap, ISL12022_REG_SR, &val);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	return val;
>>
>> Wondering if the bit 31 is in use with this register (note, I haven't checked
>> the register width nor datasheet).
>>
> 
> register width is in the driver:
> 
> static const struct regmap_config regmap_config = {
> 	.reg_bits = 8,
> 	.val_bits = 8,
> 	.use_single_write = true,
> };

Yeah.

But I only factored that out because I wanted to read the SR also in the
isl12022_set_trip_levels() to emit the warning at boot time, but when
that goes away, there's no longer any reason to not just fold this back
into the ioctl() handler.

Rasmus

