Return-Path: <linux-rtc+bounces-406-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706780E61A
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Dec 2023 09:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BF7AB20C1F
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Dec 2023 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE92D1946A;
	Tue, 12 Dec 2023 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjlGhVuP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610AA61B4
	for <linux-rtc@vger.kernel.org>; Tue, 12 Dec 2023 00:25:21 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a1f6433bc1eso814803366b.1
        for <linux-rtc@vger.kernel.org>; Tue, 12 Dec 2023 00:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702369517; x=1702974317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCP807InI7wrvOKwQXFYPNf6Ul7w+2AQncnAH+bYvyU=;
        b=wjlGhVuPpUql/AX2BdiTBH8EfxoyKHzE2DivC4fdpWi3ZGoTm46bG+MRDFOl/AQ1xJ
         vFWEO4w/aVm9O+kyRTftdHUAmIxQSN1Rl8R+G2WWMbpQ5vZjrqHnHsmfV5nzWPhlxZni
         BMvlr4t7Tsgim687dZVKAmfhZU1++fXMtMBlEbBtEBfh1IHwQLP4zAlyfaaGnZfu+cal
         y7aT+G0RaY+JrXeWJBVToP0nRnBpLGybMQ2C14EGIIbVno/FQU1tWTwg2awKchLOInAj
         3+H3VIZMec086RaiFPw0NOdMi5pxEDfOcs3tQmL8qKxfBR02Y6UN66V2TpDjHvUvm6md
         Wceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702369517; x=1702974317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCP807InI7wrvOKwQXFYPNf6Ul7w+2AQncnAH+bYvyU=;
        b=s6D8vEXP7Q2QM+CMWtzX4SL0VPpkWbq2tCmSAWW4g4aeWLsE0SJRnqQMiMTpBfx1CY
         X5af8Die1WF1iQDMByaOLC6XiaoLh4nE8lRcESWQtoX/YcJ6MXVmHJ4WtMI2sKyutTa/
         /3RGON0zUYcS/kEvwp9njsvXD9xtPdFM2TwdVBhGcyniC1tMyMwYzi6CSm8htPePmjHz
         1jqQgt0MpZkDUaCrhiQ7o7mEZRLBqbruuhUnvewp+ifNos+JubwMbTCen4qO9QZWU/tE
         nP90Ff+uppPJ64kw1Su2buuxvs/rnhhz8v0Ruwo98NvbrwgsYq8kxGEfXFa5jttFzXHK
         G/Uw==
X-Gm-Message-State: AOJu0YwWrUbc9Se+OKvYvfJYFRoH5Uyh+hdOBq876OxnKgVTsb+dG+3R
	jpP5553ikER/q40RS1LITxSuzg==
X-Google-Smtp-Source: AGHT+IEWBY503f1gM2tXLsh9TDR2pLAHeeuek8iOuUjDWd5n15LpazxTf954h68js2awQNyoYQozww==
X-Received: by 2002:a17:907:98c:b0:a1f:5526:ead1 with SMTP id bf12-20020a170907098c00b00a1f5526ead1mr6951722ejc.58.1702369517281;
        Tue, 12 Dec 2023 00:25:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vb2-20020a170907d04200b00a1f72df5617sm5477009ejc.141.2023.12.12.00.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 00:25:16 -0800 (PST)
Message-ID: <075248b8-1fbc-46ac-b0f3-b841b7f28eba@linaro.org>
Date: Tue, 12 Dec 2023 09:25:15 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: MAINTAINERS: drop Alessandro Zummo
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Alessandro Zummo <a.zummo@towertech.it>
References: <20231211132600.101090-1-krzysztof.kozlowski@linaro.org>
 <20231211165821.xp3mlxdezvezg6r4@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231211165821.xp3mlxdezvezg6r4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/2023 17:58, Uwe Kleine-König wrote:
> On Mon, Dec 11, 2023 at 02:26:00PM +0100, Krzysztof Kozlowski wrote:
>> Last email from Alessandro was in 2016, so remove him from maintainers
>> of the RTC subsystem.  Stale maintainer entries hide information whether
>> subsystem needs help, has a bus-factor or is even orphaned.
>>
>> Link: https://lore.kernel.org/all/?q=f%3A%22Alessandro+Zummo%22
> 
> unusual usage of Link: (which traditionally has an URL proving the patch
> submission).

"If related discussions or any other background information behind the
change can be found on the web, add 'Link:' tags pointing to it."

It's additional information outside serving as an proof. It's like the
"background information".

> 
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  MAINTAINERS | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ec736fccbb26..82ef00014f41 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18271,7 +18271,6 @@ X:	include/linux/srcu*.h
>>  X:	kernel/rcu/srcu*.c
>>  
>>  REAL TIME CLOCK (RTC) SUBSYSTEM
>> -M:	Alessandro Zummo <a.zummo@towertech.it>
>>  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
>>  L:	linux-rtc@vger.kernel.org
>>  S:	Maintained
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Maybe it would be a nice move to add him to CREDITS.


Yes, this is good idea. I will send v2.

Best regards,
Krzysztof


