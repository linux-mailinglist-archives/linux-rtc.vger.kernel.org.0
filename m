Return-Path: <linux-rtc+bounces-4073-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B7AB0D20
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 10:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C93E99C29C0
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 08:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A427E272E68;
	Fri,  9 May 2025 08:28:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F3178F44;
	Fri,  9 May 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779282; cv=none; b=NgRMUMG2ohIvlaCxwZS20BWG24zV6oCIjvNb+ihHJSJ/7JtRNxlkBLCowZ1Z43c8hA3bAGGOLz6lKsJ7OuHW1S9JHbzyBNHaDKq+n7RVUQQLOsdgfm7wdksEAJwraHcUTe9ZMPQJikoX008Dsi4zz8VRIbOv23StyGCzJtl3Jws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779282; c=relaxed/simple;
	bh=zt4Yp2rwhdxWjESu9/z/iyNWq4hu5etLj8FEIXCqoD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eB37QMmoRS8gcGG9/XHV3tVgBOu0SMKS4Lg7YzDKhAfmV2uiDwWuQQ1B8MhaNaf+0xnuvnI5EpYu7YL6F9qxXBZywd4q8Ma5F/6PER5DZZ9Y5k/yxK5LIYItZTUcxmagw15eU/cCwbwuF9eAmZ/Xtf6n8vJfw/+dSpnFJUMkrzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxquCGvB1oCkPbAA--.55768S3;
	Fri, 09 May 2025 16:27:50 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMBx2xp+vB1oJem_AA--.14742S2;
	Fri, 09 May 2025 16:27:44 +0800 (CST)
Message-ID: <9b32fba8-a096-416a-abba-338ef414def7@loongson.cn>
Date: Fri, 9 May 2025 16:27:41 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] rtc: loongson: Add missing alarm notifications for
 ACPI RTC events
To: Liu Dalin <liudalin@kylinsec.com.cn>, alexandre.belloni@bootlin.com,
 wangming01@loongson.cn
Cc: chenhuacai@kernel.org, gaojuxin@loongson.cn, git@xen0n.name,
 jiaxun.yang@flygoat.com, keguang.zhang@gmail.com, lixuefeng@loongson.cn,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
 <20250509014046.7399-1-liudalin@kylinsec.com.cn>
 <3c8eddda-ecce-4fdf-8773-3cfe8a09f237@loongson.cn>
 <48586F8AA034EA7A+02ca49ef-db27-47a5-8de3-3407dcfb48a5@kylinsec.com.cn>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <48586F8AA034EA7A+02ca49ef-db27-47a5-8de3-3407dcfb48a5@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx2xp+vB1oJem_AA--.14742S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWktFWDWFWxuw13Aw47Awc_yoW8KFyfpF
	Z5Aa4qkrZ5tr18uF9Fqa4UWryjk34rJ398XFs7ta409anFyw12gr4YqFyq9F4DAr48GF4a
	qw1j9ay3uFn093gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU8uuWJUUUUU==


On 2025/5/9 16:06, Liu Dalin wrote:
>
>
> 在 2025/5/9 15:12, Binbin Zhou 写道:
>> Hi:
>>
>> On 2025/5/9 09:40, Liu Dalin wrote:
>>> When an application sets and enables an alarm on Loongson RTC devices,
>>> the alarm notification fails to propagate to userspace because the
>>> ACPI event handler omits calling rtc_update_irq().
>>>
>>> As a result, processes waiting via select() or poll() on RTC device
>>> files fail to receive alarm notifications.
>>>
>>> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family 
>>> chips")
>>> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
>> Technically I don't think this is a compliant patch, firstly this 
>> patch should be V2 and also you should add "Changlog" for describing 
>> the differences from the previous patch.
>> Anyway, it's good to me.
>
> Ok! There is another problem, if regmap_write(priv->regmap,
> TOY_MATCH0_REG, 0) move to the end of loongson_rtc_handler as 
> 09471d8f5b39("rtc: loongson: clear TOY_MATCH0_REG in 
> loongson_rtc_isr()"), the interrupt also can be triggered multiple times.
>
> So the regmap_write(priv->regmap,TOY_MATCH0_REG, 0) is move behind of 
> rtc_update_irq by me, then the interrupt was triggered OK.
>
> Is there any problem ?

It is ok. That's where I added it when I suggested it before.

Thanks.
Binbin

>
>>
>> Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>
>>> ---
>>>   drivers/rtc/rtc-loongson.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
>>> index 97e5625c064c..2ca7ffd5d7a9 100644
>>> --- a/drivers/rtc/rtc-loongson.c
>>> +++ b/drivers/rtc/rtc-loongson.c
>>> @@ -129,6 +129,14 @@ static u32 loongson_rtc_handler(void *id)
>>>   {
>>>       struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
>>> +    rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
>>> +
>>> +    /*
>>> +     * The TOY_MATCH0_REG should be cleared 0 here,
>>> +     * otherwise the interrupt cannot be cleared.
>>> +     */
>>> +    regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
>>> +
>>>       spin_lock(&priv->lock);
>>>       /* Disable RTC alarm wakeup and interrupt */
>>>       writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
>> Thanks.
>> Binbin
>>
>>
>>


