Return-Path: <linux-rtc+bounces-4060-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579AAAF177
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 05:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF529C62B0
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 03:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1CD1DFE12;
	Thu,  8 May 2025 03:12:49 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624F64B1E5E;
	Thu,  8 May 2025 03:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746673969; cv=none; b=uZJ+OPY15Vn+2UdTFbTNQZlEV7qBH1JO8Qep6lodr4hrkSY6kTw/TY6icdTcJjgWch4RP8x4C4L93kpkBQQgLtMG2qkrYDysSGWrqc+I14MkYzFri8N2CkrdShcSiBQLt+CGl7Vw8YTrWnfkPkuo3j9gWKi/qRgEn+9M8BQfbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746673969; c=relaxed/simple;
	bh=I66MJZSfaafNNwys96eTN0APBvZaiWs4/xP8tDVTnaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGVWo/Ey9IVCJtxbb6GLMHDb14UfW5DQOWS3nm0teSAlZ5Lxzp5PQf3kHlOazEYKIm1QPjG7QJsDGWOjA/Fl2y6FAMAe0TVkCZ4mAj2qQQxeezTziv4+DyRbpgpSnvOQoI5+JrUaGPxFFVb1/Mf+wMS7/9mT4554PWz364OpDfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxaeAlIRxoOyjZAA--.29634S3;
	Thu, 08 May 2025 11:12:37 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMDxesQgIRxoNPi7AA--.48698S2;
	Thu, 08 May 2025 11:12:35 +0800 (CST)
Message-ID: <2fa3740a-9181-40bf-9b1a-eeb6ffc6f23f@loongson.cn>
Date: Thu, 8 May 2025 11:12:32 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: loongson: Add missing alarm notifications for ACPI
 RTC events
To: Liu Dalin <liudalin@kylinsec.com.cn>, alexandre.belloni@bootlin.com,
 wangming01@loongson.cn
Cc: chenhuacai@kernel.org, gaojuxin@loongson.cn, git@xen0n.name,
 jiaxun.yang@flygoat.com, keguang.zhang@gmail.com, lixuefeng@loongson.cn,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhoubb.aaron@gmail.com
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxesQgIRxoNPi7AA--.48698S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uryrtrWDXF1Duw4kGFW8Zrc_yoW8Gw45pF
	ZxC3Wq9F4rtw4Uua4DJ34UuryUua4fGrWqgFsrJayF9rnIy3Z2qrWrtFy8Jr48ury5Ga1a
	qa4qka43G3Wqk3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZF
	pf9x07jepB-UUUUU=

Hi Dalin:

Thanks for your patch.

On 2025/4/29 14:27, Liu Dalin wrote:
> When an application sets and enables an alarm on Loongson RTC devices,
> the alarm notification fails to propagate to userspace because the
> ACPI event handler omits calling rtc_update_irq().
>
> As a result, processes waiting via select() or poll() on RTC device
> files fail to receive alarm notifications.
>
> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
> ---
>   drivers/rtc/rtc-loongson.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> index 97e5625c064c..0c573f198f63 100644
> --- a/drivers/rtc/rtc-loongson.c
> +++ b/drivers/rtc/rtc-loongson.c
> @@ -129,6 +129,8 @@ static u32 loongson_rtc_handler(void *id)
>   {
>   	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
>   
> +	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +
While testing the patch, I noticed that interrupts are triggered 
multiple times (/proc/interrupt), not sure if you have the same issue.

I think we need a similar operation to loongson_rtc_isr() to clear the 
interrupt:
regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
>   	spin_lock(&priv->lock);
>   	/* Disable RTC alarm wakeup and interrupt */
>   	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
Thanks.
Binbin


