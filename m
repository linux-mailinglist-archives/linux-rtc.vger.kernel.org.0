Return-Path: <linux-rtc+bounces-4201-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D502AC833F
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 22:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6196BA2821B
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 20:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E332920BE;
	Thu, 29 May 2025 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="W30M4U6O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35CC292935
	for <linux-rtc@vger.kernel.org>; Thu, 29 May 2025 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550524; cv=none; b=M0G5+bZHmULrrAkyrwkgCpv8EVnceZPCZ+b+rj1tjZLt1K+uE70oMO8wvFsdJ1gNnaBeGkyjmF28aZ6g2Ksnu1vXCzxo27E0cWP58epn+HeE9VqaRBGv1YOZT16gGEK+xml/WuZ59cgAOUmHGbSqJgELnxel/itU2+O+SCy+wFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550524; c=relaxed/simple;
	bh=vjx7XExIbnpXbgWXA1Un2B7ZGdzA6zV/5E6aMdL9rb8=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=UfJ/OSVXHbvoBrA2T1l7hw2f+/zwmSMXHP9w0uaAHOslAustQwC6shb2idrglElBvbgtPFBbAhNv/ORXL6WEP3S3vjYkAR4EnM3S46k+KQJCPH0dDUOEajNTcc/GlDFDf8b3gjz+U756zabtjAGNgKGzbmg6TdLcNb3NrzhwbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=W30M4U6O; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=gGgb67rZJSOShGXmcTAeGYaZAohB7p6T1lwDrRezPQs=; b=W30M4U6OAe7iHpON1lKqz6x03p
	boMbL6/AYfrFMkhae1lcKEkf7UJtKFPerF9sVzlrijdppNEosoyIfw1zyto3zYSnbOQfkTS6lcWLz
	nx3Rw+HISXTJt1Qx9tkMk/YPmRoFE3ZmY6lQkHF/UCAxnF5y7YpKiwYuQcPL4LBR1pfY=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:35334 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uKjrh-0004eA-PH; Thu, 29 May 2025 16:28:38 -0400
Date: Thu, 29 May 2025 16:28:37 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Elena Popa <elena.popa@nxp.com>
Cc: <alexandre.belloni@bootlin.com>, <hvilleneuve@dimonoff.com>,
 <r.cerrato@til-technologies.fr>, <linux-rtc@vger.kernel.org>
Message-Id: <20250529162837.391497b3f5241759ed5a5279@hugovil.com>
In-Reply-To: <20250529075326.612550-1-elena.popa@nxp.com>
References: <20250529075326.612550-1-elena.popa@nxp.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] rtc: pcf2127: fix command byte for PCF2131
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Elena,

On Thu, 29 May 2025 10:53:26 +0300
Elena Popa <elena.popa@nxp.com> wrote:

> PCF2131 was not responding to read/write operations. PCF2131 has a
> different command byte definition, compared to PCF2127/29. Added the new
> command byte definition when PCF2131 is detected.
> 
> Signed-off-by: Elena Popa <elena.popa@nxp.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 31c7dca8f469..2c7917bc2a31 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1538,6 +1538,11 @@ static int pcf2127_spi_probe(struct spi_device *spi)
>  		variant = &pcf21xx_cfg[type];
>  	}
>  
> +	if (variant->type == PCF2131) {
> +		config.read_flag_mask = 0x0;
> +		config.write_flag_mask = 0x0;
> +	}
> +
>  	config.max_register = variant->max_register,

Your patch made me realize that I introduced an error, when adding
support for the PCF2131, where I used a comma instead of a semi-column
when setting config.max_register. I will submit a patch for this after
this message, feel free to include it with your serie when
resubmitting your V2.

Also, you should probably add "Fixes:" and "Cc:" tags:

    Fixes: afc505bf9039 ("rtc: pcf2127: add support for PCF2131 RTC")
    configuration structure") Cc: stable@vger.kernel.org

>  
>  	regmap = devm_regmap_init_spi(spi, &config);

Hugo.

