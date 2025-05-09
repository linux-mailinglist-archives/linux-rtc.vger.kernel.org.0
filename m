Return-Path: <linux-rtc+bounces-4072-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0503AB0CA5
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 10:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9998189676B
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49240272E48;
	Fri,  9 May 2025 08:07:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09881FF5E3;
	Fri,  9 May 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778024; cv=none; b=Z839zEcjh8yJk/vtSXngxCOsB7u3R6gjyPctJGvTdKFvo+oSC5Zl4ocBkpzcf7NUaUlvGB4fu1BFg92IeQph2n/HYLXzYcgs6gqlg2uB23LpZgbypaFPpGxty3zP1vuHDhr5sFTtMB2Wh9ohQeB04yHwYjNwVhM7PU6+VJp8PWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778024; c=relaxed/simple;
	bh=WNIl+4X0H+uuLCrpjLBGP1Uv7OwZjKDBg+5YejZ0woY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uwth0kJjOv7VFnw8NJq8CmHrJrRzmpVpi8lojTPA8Rj/28wkc/zsoOcWHo8T1pLs07+Fdz6mYoAq+YRZ2/XqXrh2sUWpM1jSDR3Afw0y+ufPPTKoFjMsG5UT/JU9xQmD5rhF3DJ3JVes4mZn8l830HHMYm51vLVesAUVwME8vJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=none smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpgz10t1746777980t4c8c40ac
X-QQ-Originating-IP: Nu8Lohit4j56xgXn52+ECE0kjTfqihu0oOduchgaQC8=
Received: from [10.20.7.18] ( [118.249.225.48])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 16:05:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11159292202234552627
Message-ID: <48586F8AA034EA7A+02ca49ef-db27-47a5-8de3-3407dcfb48a5@kylinsec.com.cn>
Date: Fri, 9 May 2025 16:06:07 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] rtc: loongson: Add missing alarm notifications for
 ACPI RTC events
To: Binbin Zhou <zhoubinbin@loongson.cn>, alexandre.belloni@bootlin.com,
 wangming01@loongson.cn
Cc: chenhuacai@kernel.org, gaojuxin@loongson.cn, git@xen0n.name,
 jiaxun.yang@flygoat.com, keguang.zhang@gmail.com, lixuefeng@loongson.cn,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
 <20250509014046.7399-1-liudalin@kylinsec.com.cn>
 <3c8eddda-ecce-4fdf-8773-3cfe8a09f237@loongson.cn>
From: Liu Dalin <liudalin@kylinsec.com.cn>
In-Reply-To: <3c8eddda-ecce-4fdf-8773-3cfe8a09f237@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: ONJthgsgJlmJHRWAX+4DDDTBSOQa+oho/Wbzhddrl15++GyuUrOvaVAp
	482VQjQdxFU+Gs85XStPJzF3QKc+0JPNajpUdTI91dzaVXoeHGFmBsgaaGnaDxoQ+xVhtgs
	QIQC5uVVX7VQuto1ibFDPEkpvLRh2ZQN+OAt6GSJzE6NhNWRGQEVpFdNtbwcvTHmMt/OqAq
	IjQFv008KXV/7KK/38Rtd68A5Ex+OwIkamdguUSnhe+52fxgOBgeiH+1TxIGggfkG1FYRWz
	1K6D5VJ8MIZJ9H2ppdLKwd1PnoRW8mV6uYG4o6p4RFI6myw15tEdp6cf+xmCf2kdxmwrYqj
	iG/xqwlEgmR7RXXhIQob5Wa7CXrje9Tny23Tc6xqsAtjehCsv1SO98ZY4TAZ5yJYGtyoY5C
	Ep4mTqe39IA1yD5zZql5Jhc6cGeW23DtTdJSrFbZHxehlFARKyGUzrlGxke2dAgRHRtiCFS
	HOPdAe31yeu4jDPt+D7rfKDiFQ7/OcolDPz7aVHhOHdQZECFpRGOxe5xfiyX3edoDPMKrrD
	QxUSQf9uZAXNbZ39CCiAx7Rz7q6Jm59AwKLGaje9Ltk9lSuPqPVDwu2R5bL/ldEWuzSuNxQ
	ZZ0PQi2hCoEgvAMEFpvSy+d0rGfv/kMsKk27Ra4T3z6NAcI1oXSXqDEmLPiwYpmXjvCJS1W
	aGyioh8PVWG0UsSrjbPbUombbqOFTysAAupgWsyQ1iFzBjGgqaq6pKl4aEQw4nFTdXJ6Q2J
	ay2obULav7S0gt96+9gCeBMua4C2E9zYRBVUlreL8oWKcKp0zVyzSkRs0l+AnHFAdOWRom1
	eiWb8Z4JrRHYfASfiAqDa3VASMhMK2OcNhx3j3X7Njn/KPnciYW49c5quiOUwcYW+SlM4SX
	KlRBZLq2VtDqjsdEUFr+N7EO7jE4Zz+gzCAsGCoQr6r/fK6pmcXAJ9aiVWz7aqz0ru+Jffe
	zUkNc89iHUWcG+pPEldqc2FRcfYtklf3XBA5C0/rAuhAC4ZuKctxcStN5wMng7Tv2LY8=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0



在 2025/5/9 15:12, Binbin Zhou 写道:
> Hi:
> 
> On 2025/5/9 09:40, Liu Dalin wrote:
>> When an application sets and enables an alarm on Loongson RTC devices,
>> the alarm notification fails to propagate to userspace because the
>> ACPI event handler omits calling rtc_update_irq().
>>
>> As a result, processes waiting via select() or poll() on RTC device
>> files fail to receive alarm notifications.
>>
>> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
>> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
> Technically I don't think this is a compliant patch, firstly this patch 
> should be V2 and also you should add "Changlog" for describing the 
> differences from the previous patch.
> Anyway, it's good to me.

Ok! There is another problem, if regmap_write(priv->regmap,
TOY_MATCH0_REG, 0) move to the end of loongson_rtc_handler as 
09471d8f5b39("rtc: loongson: clear TOY_MATCH0_REG in 
loongson_rtc_isr()"), the interrupt also can be triggered multiple times.

So the regmap_write(priv->regmap,TOY_MATCH0_REG, 0) is move behind of 
rtc_update_irq by me, then the interrupt was triggered OK.

Is there any problem ?

> 
> Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
> 
>> ---
>>   drivers/rtc/rtc-loongson.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
>> index 97e5625c064c..2ca7ffd5d7a9 100644
>> --- a/drivers/rtc/rtc-loongson.c
>> +++ b/drivers/rtc/rtc-loongson.c
>> @@ -129,6 +129,14 @@ static u32 loongson_rtc_handler(void *id)
>>   {
>>       struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
>> +    rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
>> +
>> +    /*
>> +     * The TOY_MATCH0_REG should be cleared 0 here,
>> +     * otherwise the interrupt cannot be cleared.
>> +     */
>> +    regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
>> +
>>       spin_lock(&priv->lock);
>>       /* Disable RTC alarm wakeup and interrupt */
>>       writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
> Thanks.
> Binbin
> 
> 
> 


