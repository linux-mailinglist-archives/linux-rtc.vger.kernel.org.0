Return-Path: <linux-rtc+bounces-2650-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B79DF897
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2024 02:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB16416282F
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2024 01:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833828489;
	Mon,  2 Dec 2024 01:36:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81012257D;
	Mon,  2 Dec 2024 01:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733103401; cv=none; b=CzRkwx6ICrZmjGVd2SArjDXctQVkLJWMCE30OeUnPby1NTQQHjVyNTDoVPqcou/B7D/7OUy+YRvBYmlie8wsj7xk7lvLOQLpzuxsgHHWnCGZVasmsCzV/9AKcHVMkrliKtIP0faoirpNQc5rpd27ZrU+Spm/0+S8GpaNeNK1vUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733103401; c=relaxed/simple;
	bh=c9lFTBjWNgZ2MZLTwftw7igkltMPc+HByBbGiHhDA+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljPVEW3Bd/mvf4uSRnHpHTZpE+yE8OgTH2CVYGkLPPW4TJL9aynYuMRfyZ8h5p2LoKHuLb7Iv/sSSVKe1AK9yHrduuzop45dxedFe3hYTwkLDD4gN8J1StKurUo2AMXZSwiIhOvXutzWXEE/3p9azhW5sNWr+WSAT0YpTY6jQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8Cx764aD01n9S1OAA--.47630S3;
	Mon, 02 Dec 2024 09:36:26 +0800 (CST)
Received: from [10.180.13.127] (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowMBxKMEYD01nCGRxAA--.9518S2;
	Mon, 02 Dec 2024 09:36:25 +0800 (CST)
Message-ID: <0a7a0508-4303-4ddf-bcd6-8c00e8fcc255@loongson.cn>
Date: Mon, 2 Dec 2024 09:36:24 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, WANG Xuerui <git@xen0n.name>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, gaojuxin@loongson.cn
References: <20241128070227.1071352-1-wangming01@loongson.cn>
 <CAAhV-H4rrQ5v85TXSF-oFAxSxFgvvXR+O2YmDhOPhCcwuOzVuA@mail.gmail.com>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <CAAhV-H4rrQ5v85TXSF-oFAxSxFgvvXR+O2YmDhOPhCcwuOzVuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxKMEYD01nCGRxAA--.9518S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQETEmdM5r8B1QAAsn
X-Coremail-Antispam: 1Uk129KBj93XoWxJryrurWrKw43Zw4UGF1Dtwc_yoW8tw18pr
	Waka1DuFsYgr4UCas3X3y5Wr4avrWfJryDuF4xK34F93ZrA3W5XF1FgFyUJrZ7ur95AF4Y
	q3y8KFW3uF1qk3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8L0nUUUUU
	=

Hi, huacai

On 2024/11/29 17:57, Huacai Chen wrote:
> Hi,
> 
> On Thu, Nov 28, 2024 at 3:02 PM Ming Wang <wangming01@loongson.cn> wrote:
>>
>> The TOY_MATCH0_REG should be cleared to 0 in the RTC interrupt handler,
>> otherwise the interrupt cannot be cleared, which will cause the
>> loongson_rtc_isr to be triggered multiple times.
> Function names usually use () postfixes, e.g., loongson_rtc_isr() and
> loongson_rtc_handler().
> 
OK, I will fix it in the next version.
>>
>> The previous code cleared TOY_MATCH0_REG in the loongson_rtc_handler,
>> which is an ACPI interrupt. This did not prevent loongson_rtc_isr
>> from being triggered multiple times.
>>
>> This commit moves the clearing of TOY_MATCH0_REG to the loongson_rtc_isr
>> to ensure that the interrupt is properly cleared.
>>
>> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
>> ---
>>   drivers/rtc/rtc-loongson.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
>> index e8ffc1ab90b0..0aa30095978b 100644
>> --- a/drivers/rtc/rtc-loongson.c
>> +++ b/drivers/rtc/rtc-loongson.c
>> @@ -114,6 +114,12 @@ static irqreturn_t loongson_rtc_isr(int irq, void *id)
>>          struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
>>
>>          rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
>> +
>> +       /*
>> +        * The TOY_MATCH0_REG should be cleared 0 here,
>> +        * otherwise the interrupt cannot be cleared.
>> +        */
>> +       regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> There is usually a blank line before the return statement.
> 
> Huacai
OK, I will fix it in the next version.

Thanks,
Ming
> 
>>          return IRQ_HANDLED;
>>   }
>>
>> @@ -131,11 +137,7 @@ static u32 loongson_rtc_handler(void *id)
>>          writel(RTC_STS, priv->pm_base + PM1_STS_REG);
>>          spin_unlock(&priv->lock);
>>
>> -       /*
>> -        * The TOY_MATCH0_REG should be cleared 0 here,
>> -        * otherwise the interrupt cannot be cleared.
>> -        */
>> -       return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
>> +       return ACPI_INTERRUPT_HANDLED;
>>   }
>>
>>   static int loongson_rtc_set_enabled(struct device *dev)
>> --
>> 2.43.0
>>


