Return-Path: <linux-rtc+bounces-4088-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 619EBAB4CCC
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 09:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036CF1B419C5
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 07:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484911C84B9;
	Tue, 13 May 2025 07:32:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8027A1F03EB;
	Tue, 13 May 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121571; cv=none; b=eVucg1aZwvNy1zLd8jLLH+nGz+TZwsd9NK2zZW4OJkjhW0c9Q2tlRLR5XBD7QctuCCkJWWUsqz2jAVJA99hnoQwjDnPaArY4zNe069R6VzHuIohmcUIwCediZ3GZqlB5WVeDUWb2G9J0POiJIHrphgX+6ZNt17LNX9HVUWIG4+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121571; c=relaxed/simple;
	bh=WAJxgDOvWdcx9erm9qegXnyQi7Djc/seW2uy6WNttuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLmBhVLi8VT0w6koO19bEr2rBUvWAuDS9JenPkgxNXscVcVUUcOb+q541siOXhUQLV08yJaDGkCoH25u2KbIIi1XbFE4JI83HYlM7MPnpaxqMS/s53qLKnIOb39Jc2bfcWy48BgVdB8SXNPF4hbiiBVmPcESLG4Q9akWSU+/BH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxmnGc9SJonYzjAA--.42933S3;
	Tue, 13 May 2025 15:32:44 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMBxHBua9SJoBV3NAA--.17956S2;
	Tue, 13 May 2025 15:32:42 +0800 (CST)
Message-ID: <6f47e397-8877-4412-bebd-0314a6b46908@loongson.cn>
Date: Tue, 13 May 2025 15:32:41 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] rtc: loongson: Add missing alarm notifications for
 ACPI RTC events
To: Liu Dalin <liudalin@kylinsec.com.cn>, alexandre.belloni@bootlin.com,
 wangming01@loongson.cn
Cc: chenhuacai@kernel.org, gaojuxin@loongson.cn, git@xen0n.name,
 jiaxun.yang@flygoat.com, keguang.zhang@gmail.com, lixuefeng@loongson.cn,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
 <20250509084416.7979-1-liudalin@kylinsec.com.cn>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20250509084416.7979-1-liudalin@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxHBua9SJoBV3NAA--.17956S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4kZr4Dur1fKrW3Xw45twc_yoW8Wr4DpF
	ZxC3Wq9rsYqr4Uua4DA34UurW3u3yfGrWDWFsrtasY9F9Fy3WDXr4rtFy8Jrs7ury5Xa1a
	q3Wv9FW5GF1qkagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
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


On 2025/5/9 16:44, Liu Dalin wrote:
> When an application sets and enables an alarm on Loongson RTC devices,
> the alarm notification fails to propagate to userspace because the
> ACPI event handler omits calling rtc_update_irq().
>
> As a result, processes waiting via select() or poll() on RTC device
> files fail to receive alarm notifications.
>
> The ACPI interrupt is also triggered multiple times. In loongson_rtc_handler,
> we need to clear TOY_MATCH0_REG to resolve this issue.
>
> Fixes: 09471d8f5b39 ("rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()")
> Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
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


