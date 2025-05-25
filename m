Return-Path: <linux-rtc+bounces-4146-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C69AC322C
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 04:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E6717AEE52
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 02:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EBFC120;
	Sun, 25 May 2025 02:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGbhFajW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C3376;
	Sun, 25 May 2025 02:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748140623; cv=none; b=t9OAn72lLR3Txw9Z2t+nJo4Hy42cuCT+mA2gmRyOiNMowpyn/oweH2Z6HLjb881MOONc33Hv/W0RTV8oP5kx51xGo+lVcqTwlWOm52FotkQLAFY+XYZKdQlqKmglruHxberqkCujt2ocbTr3JMTeUp6smfeVjJbWcQepHvt5r/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748140623; c=relaxed/simple;
	bh=zDZLURtx1YJ1gk/IU+vYik6f09FHUYpaj1Ov27u/S70=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hw4MJFV+FFGHnrVaDwld8zmt3V1yKE8aC+IhA3yrDrEE6+d6Yu/0hey+GolUMypl4Tw1jTaiK0d6ufloTUVx89XT7V/96J5GH2FKHEsx60ahdDdW75IrKuzotXbaIM2FfxEYSW8+KQFbKrTyRU7VN/n/5rDziDzV5XLD6l+hxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGbhFajW; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-310f082a677so878705a91.2;
        Sat, 24 May 2025 19:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748140621; x=1748745421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzdeQXprNJPYlHbSnP2Nb8/UsBBJlvQjC2B2PMRmyNw=;
        b=cGbhFajWfySTyMSy7fkrTZiuQF0aEcQmDZFpibz7YkUQQ+tFLT9UWxnwsSsSbpshQO
         x500GGVaU/nZWq5BebiQXRT4tYf2wN6djkhcznDZEVc3G/j4u83Z6L3d0pPU26gOoymN
         2uSIBlmsPmjj51pg8FoBh6Ern1LItr74V0Qu+wdtF6+B5RRy4z8afGeDyQ40glPl52Dc
         OrsBWddwdWlzU7/ZSOnYLRbDAGBLH2PMOiozE1raSVynfSYzP1wXgXZBVVEoRb4Jhn21
         ze2/TeASJddWDr4QN+8crc5y6hLA7/ibQG1SpKWu5eEuHoXdF++12Jp62i31SrmCnNMh
         oYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748140621; x=1748745421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzdeQXprNJPYlHbSnP2Nb8/UsBBJlvQjC2B2PMRmyNw=;
        b=oGVbM7M4X06kdM2NNvzW3rIg5i67rqAkeATZlteH//gFXc03xM2dmQf8A50/5wTAk1
         g3HqKh5SnOUqDYszb2mUSIZ0yYvRq2B+Q74oaRmMJIDd3r+N2xjDf4fljGcqjC8qpsfn
         pby77t+E6UJ8RsT+t+vffPsy8XuZNVWbDhJ7MCIeWsgZUAaGh9ZaeRRYHlGWK/V5pNbz
         ShU6+aAqeHJTw8F+kW/AuyZ4l3nSbltRr3Cr6jN8kSXItI0fDfAaQQcH1nBdvdXJ4oLL
         XSeKrWelq4Dli5mFdrobQ2Sz4alx+fJ32vtcQY10ccxBSPv/KmeAb8/8lEqgVtDqN402
         Q+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUM2gZ5NEHKxUZEWdGRblyKpArkdpuPyh6fA6a4HHANSJs9ZDrGlfVgYa2UJjzbBXeox0zF4eOnt3kM@vger.kernel.org, AJvYcCUxkWqzW/q8yux1SeL6f5g/yZAXgDZw2Dvay8Si9y3V8NwdSYoriQCgXggraG24fOIlyq4pWEqQ8gCCbiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwYUyVVckRQmazqNiqa9dqmAhdRIcZOqKxgh9wBeY7V30pnPzE
	55R+u0+Q9N34OxeYChYWqDTm9DnGzpUPin7fQN0EyGyRKXlYp4rzjFRy
X-Gm-Gg: ASbGnctBEgn/G+aDJeFGk3xDfvEo190Iqi0pOB7Jz8Dmc4xkrXvwGOGQ/Y3rgFp7zb6
	AoE4CH0QIA+0MSHOCwMPxvD7SgbAl+QJlkIXvKssJzCJnbCPwc7Eq+3jGnCyKOvrYy+JPJWSfC7
	KnPymOEUAhR9Z4Q0chIaVa3/dttc/IkYMSZ/0FdYkj3j+BW5DSqdeUGJVegCssXrfVNnhMbJjIn
	dy8SgkUgTEAB06i4lG6vk1zeTCfxz6nyKPF9VSbpcclAYoTIdDRi6oLGbISOqOFkOjQQIQwNkpd
	Dj5vm34pB1X6RusBsm+nXGG2HZB63t4fNhY8xlcY1G6y4oA=
X-Google-Smtp-Source: AGHT+IHfj6SugT2zQml4HAbTlZC4HYYtHErBqsg+ZIx1hfzBP+Px3VtG3tGS6WD1w+x6TdFNXYqiEQ==
X-Received: by 2002:a17:90b:1b0f:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-3110efef706mr8819270a91.0.1748140620570;
        Sat, 24 May 2025 19:37:00 -0700 (PDT)
Received: from [172.29.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3112fca337fsm1177149a91.25.2025.05.24.19.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 19:37:00 -0700 (PDT)
Message-ID: <3fca9368-9f2e-4f4f-a02a-2ccb9f23deb4@gmail.com>
Date: Sun, 25 May 2025 10:36:55 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8563: fix wrong alarm register
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250419-pcf8563-fix-alarm-v1-1-b893a5de55b8@gmail.com>
 <20250524213645d5543d64@mail.local>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20250524213645d5543d64@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/5/25 05:36, Alexandre Belloni wrote:
> On 19/04/2025 22:37:10+0800, Troy Mitchell wrote:
>> Fix wrong register and align `pcf8563_get_alarm_mode`
>> with the naming convention used in ops.
>>
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>> Since this patch[1], the set_alarm function has been setting
>> an wrong register.
>>
>> Link:
>> https://lore.kernel.org/all/20241010084949.3351182-3-iwamatsu@nigauri.org/ [1]
>> ---
>>  drivers/rtc/rtc-pcf8563.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
>> index 5a084d426e58d09cfedf0809695a96a27627c420..61e2f9757de9f24407f9262657da0d1586ce124e 100644
>> --- a/drivers/rtc/rtc-pcf8563.c
>> +++ b/drivers/rtc/rtc-pcf8563.c
>> @@ -103,7 +103,7 @@ static int pcf8563_set_alarm_mode(struct pcf8563 *pcf8563, bool on)
>>  	return regmap_write(pcf8563->regmap, PCF8563_REG_ST2, buf);
>>  }
>>  
>> -static int pcf8563_get_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
>> +static int pcf8563_read_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
> 
> I was going to apply the patch but this is an unrelated change, please submit
> just the fix so it can be backported.
Hi, Could you please clarify if this renaming change would be acceptable？
If it is acceptable, I will split the original patch into two.
If not, I will remove the renaming change.

			- Troy
> 
>>  				  unsigned char *pen)
>>  {
>>  	u32 buf;
>> @@ -127,7 +127,7 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
>>  	char pending;
>>  	int err;
>>  
>> -	err = pcf8563_get_alarm_mode(pcf8563, NULL, &pending);
>> +	err = pcf8563_read_alarm_mode(pcf8563, NULL, &pending);
>>  	if (err)
>>  		return IRQ_NONE;
>>  
>> @@ -262,7 +262,7 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
>>  	tm->time.tm_mday = bcd2bin(buf[2] & 0x3F);
>>  	tm->time.tm_wday = bcd2bin(buf[3] & 0x7);
>>  
>> -	err = pcf8563_get_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
>> +	err = pcf8563_read_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
>>  	if (err < 0)
>>  		return err;
>>  
>> @@ -285,7 +285,7 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
>>  	buf[2] = bin2bcd(tm->time.tm_mday);
>>  	buf[3] = tm->time.tm_wday & 0x07;
>>  
>> -	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_SC, buf,
>> +	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_AMN, buf,
>>  				sizeof(buf));
>>  	if (err)
>>  		return err;
>>
>> ---
>> base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
>> change-id: 20250419-pcf8563-fix-alarm-5e787f095861
>>
>> Best regards,
>> -- 
>> Troy Mitchell <troymitchell988@gmail.com>
>>
> 

-- 
Troy Mitchell


