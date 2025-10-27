Return-Path: <linux-rtc+bounces-5190-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D193C0DF79
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 14:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27A724FCBF5
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 13:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAF027A130;
	Mon, 27 Oct 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwFg2t9S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CF24BD03
	for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570133; cv=none; b=hrAGlIIyNYcPLxEHVSqzTFmv0eIqhhV25Qg/czkcXyHdFWSPtd+srK31lJ/a0YhyQUfv6z0zjHcqIuLmY5OOh52L0K0wEv4Q9X7oPL4skSzaY+rn8hKUhCaxR7gozlGbU8yQv8RsfvCqLvyj2Imgzd3ayjakdIyxzJEWn+q0HxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570133; c=relaxed/simple;
	bh=1bB7L68kzJayTBvOhwCV/SjorHR+hB0GqpWfqKFMQiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv7X46hKV0KFBvzMhqk5mZ3Hs7hQHk94xU/TBu8Um/1OW/eiNAG6VfV4Z6XKvnw8eKtHUrHrhg+JDbdxgQSg6jo22ctm4NJ9lmtDcAF55MRBpYrgNPIVNemJaze3O81igsl0+EGiMMoDtVUCnPvL2WFjY/N0R5wRwVeBEuaWC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwFg2t9S; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3737d09d123so65483001fa.2
        for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761570130; x=1762174930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxCTtcPsN8230LeCJx3j5DlRF4pEORPX1pABk9GNfEI=;
        b=fwFg2t9SG/sQuwHr+iOuOpC3wwIySvcp88EAW5Qw6/Py2Yfu/2U3pqbMMiloyGL1yn
         G9+B5zMpSpXM4hzVroUx7nDp4F1WdWzgZg3/FxjVAiX/Cn2Qg5zLHAX0lZEjldlbL2p3
         sByH1SDT+v5XdZLtuZLBrns3GsT6co610lr6RHkGvnsXR3xhPpteK5/q/8y+qpLRVKv9
         tqxel4Y+g408wgC2IBHHrud94bIMJraSCJnK06sYsrH0aUCYiyPkLl3PKUu3WFvxd7fU
         BmmnRXhLT5m0u7X26zANng3rEGNz/8K0OXYPDigWUZrtMZdikTBFGHkLk6rpt4Ib2ehe
         kBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761570130; x=1762174930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxCTtcPsN8230LeCJx3j5DlRF4pEORPX1pABk9GNfEI=;
        b=QZwCHOf6baDd4K1pmNmAUpGNx9nmJ6aQV9ueCc/5bHuzVw62tKaXTpTwgDEJvYZXKS
         AeLH2IH7r/Ry/r39Hn6afTs9c4jSAF4VXs+OJDqFGXeBEGEtuVDksLzWuhbVb+aGHm4K
         cE9BPt1VMnyOJRlc8T75SX6jvV5bdidGuPWWxm8Ge9YCNoGVEaXbsbmK1MCqpXZQZ8In
         tVCw/g77p5e5CBquShRp94E6xesAdl92NmZwcwVF3vbcclYOn31RfEh8iwIcBrKrjImF
         9l3gWNaNnhlITo8x5s5vG6EuDTSdeH0TuYI7t0dbSkjGkkZY2CQvZQSFIhg1J/YTIWBk
         QYCw==
X-Forwarded-Encrypted: i=1; AJvYcCXy6P2dhw7ip1jrTQr9Ws6AhV3QcRuKsDDC5b61t1ZvPgbV6rN8SXMvv8o1+HRDW2gwY/NOLtndvq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/P3oKHspFAJHD+f4BAjTDcFV0/6xUtG9LmOUzFO3TrPFOSo8y
	ii2Qb9WWZnHli3Uz5j+mqqY/3ykqak0ckebJxUwbKZJOsp+kf7JyXiEW
X-Gm-Gg: ASbGncv4JS10h0Kop+MN581sTfZUxUGh395qyIjgjn42ufbTJCNTyGJtZEQNOjVmSvg
	3KKYMlQCFNq6nfJxoGWjeo6nDrx60KtL9QtciFsCmAYYSgXk7LPo0RxANi5E6v2rt5N0krjV2HR
	vQ65JKLLjBp86pGhS7enYvvuIO2Zk3vbbxZTXdQvQO3ekc3n3GfHevjpkN4sH+Mw8ZZYhfphgaf
	i+WqJ66E1j+sq2NKXHy2GhX7Zzrrl3DJRPW3SMFq4Wa5UzEtsecN+cuNcsjT9R/FYzHQB40NtVN
	rhuGTFEA2lJfpqist6TMMacBsuBrCQ1p6m1J1wcnOvsBkuH4r2JMonfhgO2M2hsa61rph3XR8Ax
	mme60P9qTTEf6Jh3BkJbqXpoP0+m6W6gy81K8f42/QnzsIY+TjmozvGWpoppAaOsJPwBC/5k51j
	W5dBC3dvaHtssHtqacekZt7kgaGnIKSoeLF9ypCycRIh0VxwhWquElW3dKt/fCwm+sZEm/
X-Google-Smtp-Source: AGHT+IEl/ogSJ08y9LQ2dV4OaLLEyD6Fjj0ThgIRaIYYP5R3v0fiFqlQt8CBQpsPUF3Equew6ssOkw==
X-Received: by 2002:a2e:b893:0:b0:36c:f6:a4e1 with SMTP id 38308e7fff4ca-377978c6d84mr104935861fa.14.1761570129393;
        Mon, 27 Oct 2025 06:02:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d0028sm19860371fa.35.2025.10.27.06.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:02:08 -0700 (PDT)
Message-ID: <a74c9c52-7c39-4c66-bdcf-0fb9e1b8f77c@gmail.com>
Date: Mon, 27 Oct 2025 15:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] rtc: bd70528: Support BD72720 rtc
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <380ea1fdbb94a796418e8f463c6a9436001d572d.1761564043.git.mazziesaccount@gmail.com>
 <202510271238195ef3bdfb@mail.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <202510271238195ef3bdfb@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 14:38, Alexandre Belloni wrote:
> On 27/10/2025 13:47:51+0200, Matti Vaittinen wrote:
>> The BD72720 has similar RTC block as a few other ROHM PMICs.
>>
>> Add support for BD72720 RTC.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Note that we didn't get 07/15 that adds linux/mfd/rohm-bd72720.h which
> this patch depends on.

Thanks for the heads-up Alexandre!

For some reason the SMTP server seems to be blocking the 7/15 :/ I will 
try to figure out a way to send it :(

Yours,
	-- Matti

