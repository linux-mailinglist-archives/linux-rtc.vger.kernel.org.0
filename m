Return-Path: <linux-rtc+bounces-4071-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD9AB0B59
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 09:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD60D4C3A33
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 07:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4E5270EA8;
	Fri,  9 May 2025 07:13:07 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A9226FDB5;
	Fri,  9 May 2025 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774787; cv=none; b=bNqLEKz1JW2hGrMn8fc2V8qZTCsHp7aqxhZI05zawx/1Nl765xMvkphIf1Dstsvgm9hKOS9B18qFGpIZuKsY+vQHK/HYbW7qdcSA2UzrL75sDB9yEdaVXV14hiYoa7mKQBY2QE7BVNiPeY+8rLCKM70dNvHccxBs/45jXKz2bqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774787; c=relaxed/simple;
	bh=qrCMcqWAKjQxhYBoAj3QbI/9b30dAvJ0gYLe6zdSglM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2I9yoS6aUQZ+znL5dJV/WBleiHJ/g4pacz/vUgMNcjwk7+/bP1Q5So1450I7MvTu4XH3Uypnm6Z2MMXQkgpW0PmwyywkBI7uLmeIuCHFEzMFjNU5GPLysSobP0djU820Dyi3aQA7lGduUwmppgyHrcW6bKTb53yQhUW9AAe6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxWXHyqh1oXivbAA--.31837S3;
	Fri, 09 May 2025 15:12:50 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMDxDcfnqh1oDLy_AA--.52511S2;
	Fri, 09 May 2025 15:12:42 +0800 (CST)
Message-ID: <3c8eddda-ecce-4fdf-8773-3cfe8a09f237@loongson.cn>
Date: Fri, 9 May 2025 15:12:39 +0800
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
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20250509014046.7399-1-liudalin@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxDcfnqh1oDLy_AA--.52511S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tw1kKr1DAw1xJF4DAF4DZFc_yoW8Xw43pF
	s8C3Z0kFs5tr4Uu3WDJ34Uur13uayfGrWDWFsrtasY9Fn0y3Z7WrWrtFy8JF4kurZ8Ja1a
	qwnFkFW3G3Wq93gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
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

Hi:

On 2025/5/9 09:40, Liu Dalin wrote:
> When an application sets and enables an alarm on Loongson RTC devices,
> the alarm notification fails to propagate to userspace because the
> ACPI event handler omits calling rtc_update_irq().
>
> As a result, processes waiting via select() or poll() on RTC device
> files fail to receive alarm notifications.
>
> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
Technically I don't think this is a compliant patch, firstly this patch 
should be V2 and also you should add "Changlog" for describing the 
differences from the previous patch.
Anyway, it's good to me.

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>

> ---
>   drivers/rtc/rtc-loongson.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> index 97e5625c064c..2ca7ffd5d7a9 100644
> --- a/drivers/rtc/rtc-loongson.c
> +++ b/drivers/rtc/rtc-loongson.c
> @@ -129,6 +129,14 @@ static u32 loongson_rtc_handler(void *id)
>   {
>   	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
>   
> +	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +
> +	/*
> +	 * The TOY_MATCH0_REG should be cleared 0 here,
> +	 * otherwise the interrupt cannot be cleared.
> +	 */
> +	regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> +
>   	spin_lock(&priv->lock);
>   	/* Disable RTC alarm wakeup and interrupt */
>   	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
Thanks.
Binbin


