Return-Path: <linux-rtc+bounces-2564-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D79CF122
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 17:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1D2EB2AA32
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 15:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513671C75E2;
	Fri, 15 Nov 2024 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="V8+oP+VH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD8418B484;
	Fri, 15 Nov 2024 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731686273; cv=none; b=JwktMU5xw31du/v3qItvZ8gtL8R9zcrVm1n32aLRQCpXSIC5yCUs5tHkOmDPNXsvC2Pf+b/zs8Mez6FTymt81W7noySC2JuwU3NRQHjoUaMDPXvOxUyXUrfN/FM+Vappo9wtJ5eDE7pKU+Em5kJiRGoiR13dmTh1+hF8QU2YGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731686273; c=relaxed/simple;
	bh=bC9OQuPLQMk1gIbZuIE/DqOWr39Rr1QVXW9/MFiVnWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbZ7vUrNjtYbK3ZiLfOHuwvvagQDlxDTf/7FTZCsBDLtO5WBKsgFEtfDmk00ZUspLnB2z00b/qFsm7StpuSt7KjIoHbsDQFVVMd67t1RNZ/jHz70kutoEWSrFdFmqr5UnbDavrQkirzsY0zSEu7YcNBBQJb/OZuIDrDm2hsR/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=V8+oP+VH; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4XqhKl38Ghz1DHcY;
	Fri, 15 Nov 2024 16:49:47 +0100 (CET)
Received: from [10.10.15.5] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4XqhKl03B9z1DHcP;
	Fri, 15 Nov 2024 16:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1731685787;
	bh=+oe+1Y+oedK0yNmPXnrFAWVKA99UOD5aNJqyCiyD4hY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V8+oP+VHUOJju1WZZPolsoEPf4afKh6NhpG/CFU5I0Td0l3V/j9+Fwj8VKSHlH4U2
	 YVL9PsiuxzaxyQi9Bxw+EJlwpOJW3w8nkaTwZX/XfYcizsLep5inHo588jiJMBLVLi
	 k5EHIrjyolp9JM7YtlaV3Q3PIi+wdOlgpYsNiKnc=
Message-ID: <13fdfef9-4187-43d8-a8b9-ab091d6f952f@gaisler.com>
Date: Fri, 15 Nov 2024 16:49:46 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] rtc: m48t59: Use platform_data struct for year
 offset value
To: Finn Thain <fthain@linux-m68k.org>, "David S. Miller"
 <davem@davemloft.net>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>,
 linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1731450735.git.fthain@linux-m68k.org>
 <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-11-12 23:32, Finn Thain wrote:
> Instead of hard-coded values and ifdefs, store the year offset in the
> platform_data struct.
> 
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> David, Andreas - with your acknowledgement, I will ask Alexandre to merge
> this.
> ---
> I tested this for regressions using qemu-system-sparc64.
> Also, Daniel tested the RTC functionality on his MVME147 system.
> 
> Changed since v2:
>  - Use an int for the year offset in struct m48t59_plat_data.
> 
> Changed since v3:
>  - Added reviewed-by tag from Geert.
> ---
>  arch/sparc/kernel/time_32.c |  1 +
>  arch/sparc/kernel/time_64.c |  1 +
>  drivers/rtc/rtc-m48t59.c    | 26 ++++----------------------
>  include/linux/rtc/m48t59.h  |  3 +++
>  4 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/sparc/kernel/time_32.c b/arch/sparc/kernel/time_32.c
> index 08bbdc458596..578fd0d49f30 100644
> --- a/arch/sparc/kernel/time_32.c
> +++ b/arch/sparc/kernel/time_32.c
> @@ -255,6 +255,7 @@ static void mostek_write_byte(struct device *dev, u32 ofs, u8 val)
>  static struct m48t59_plat_data m48t59_data = {
>  	.read_byte = mostek_read_byte,
>  	.write_byte = mostek_write_byte,
> +	.yy_offset = 68,
>  };
>  
>  /* resource is set at runtime */
> diff --git a/arch/sparc/kernel/time_64.c b/arch/sparc/kernel/time_64.c
> index 60f1c8cc5363..b32f27f929d1 100644
> --- a/arch/sparc/kernel/time_64.c
> +++ b/arch/sparc/kernel/time_64.c
> @@ -544,6 +544,7 @@ static void mostek_write_byte(struct device *dev, u32 ofs, u8 val)
>  static struct m48t59_plat_data m48t59_data = {
>  	.read_byte	= mostek_read_byte,
>  	.write_byte	= mostek_write_byte,
> +	.yy_offset	= 68,
>  };
>  
>  static struct platform_device m48t59_rtc = {
> diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
> index 5d30ce8e13ca..4e608bc8bbd3 100644
> --- a/drivers/rtc/rtc-m48t59.c
> +++ b/drivers/rtc/rtc-m48t59.c
> @@ -71,7 +71,7 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	/* Issue the READ command */
>  	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
>  
> -	tm->tm_year	= bcd2bin(M48T59_READ(M48T59_YEAR));
> +	tm->tm_year	= bcd2bin(M48T59_READ(M48T59_YEAR)) + pdata->yy_offset;
>  	/* tm_mon is 0-11 */
>  	tm->tm_mon	= bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
>  	tm->tm_mday	= bcd2bin(M48T59_READ(M48T59_MDAY));
> @@ -82,10 +82,6 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		dev_dbg(dev, "Century bit is enabled\n");
>  		tm->tm_year += 100;	/* one century */
>  	}
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	tm->tm_year += 68;
> -#endif
>  
>  	tm->tm_wday	= bcd2bin(val & 0x07);
>  	tm->tm_hour	= bcd2bin(M48T59_READ(M48T59_HOUR) & 0x3F);
> @@ -106,12 +102,7 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	struct m48t59_private *m48t59 = dev_get_drvdata(dev);
>  	unsigned long flags;
>  	u8 val = 0;
> -	int year = tm->tm_year;
> -
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	year -= 68;
> -#endif
> +	int year = tm->tm_year - pdata->yy_offset;
>  
>  	dev_dbg(dev, "RTC set time %04d-%02d-%02d %02d/%02d/%02d\n",
>  		year + 1900, tm->tm_mon, tm->tm_mday,
> @@ -162,11 +153,7 @@ static int m48t59_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	/* Issue the READ command */
>  	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
>  
> -	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR));
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	tm->tm_year += 68;
> -#endif
> +	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR)) + pdata->yy_offset;
>  	/* tm_mon is 0-11 */
>  	tm->tm_mon = bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
>  
> @@ -197,12 +184,7 @@ static int m48t59_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	struct rtc_time *tm = &alrm->time;
>  	u8 mday, hour, min, sec;
>  	unsigned long flags;
> -	int year = tm->tm_year;
> -
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	year -= 68;
> -#endif
> +	int year = tm->tm_year - pdata->yy_offset;
>  
>  	/* If no irq, we don't support ALARM */
>  	if (m48t59->irq == NO_IRQ)
> diff --git a/include/linux/rtc/m48t59.h b/include/linux/rtc/m48t59.h
> index 9465d5405fe2..373ba77071c6 100644
> --- a/include/linux/rtc/m48t59.h
> +++ b/include/linux/rtc/m48t59.h
> @@ -56,6 +56,9 @@ struct m48t59_plat_data {
>  	void __iomem *ioaddr;
>  	/* offset to RTC registers, automatically set according to the type */
>  	unsigned int offset;
> +
> +	/* YY digits (in RTC) are offset, i.e. year is 1900 + yy_offset + YY */
> +	int yy_offset;
>  };
>  
>  #endif /* _LINUX_RTC_M48T59_H_ */

Tested-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>

Thanks,
Andreas

