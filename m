Return-Path: <linux-rtc+bounces-5747-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B7D19C28
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 16:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 902A23007ED6
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 15:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871792D7DF8;
	Tue, 13 Jan 2026 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="cajF4ZQL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784F502BE;
	Tue, 13 Jan 2026 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316674; cv=none; b=VU+AkqfRZyi7pBmGTXPnfJPLoy5veN7Zr6LHrYH+xHsjv0h74rc3wEodmEi/8uouEtz/RfP96MIr0ARNjq1iUUhtNVmXwqv0fWEvvF1BCqos4eAEreWGUdFs5vqxmyjLnZvBdlgEtDWTu7yqaQ95WXC7+uBkv+9+YwBl0rsldWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316674; c=relaxed/simple;
	bh=kAYhc9cP2PawXmSfQ57XvF0oHtV1Ey2ZrxOyFrB2aKs=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=Nlyjgc5oFjYMgcgxpInPg8UfFBRSQpdR7PwFh09B/fj2aZINsuw5m3H104fpmzpZkiaq4loeoXCOuP2HnpKZWPslCdB1RF2cjlDKrzXpscs6acQ0r4L+oT6BYyAkVmp+CRo6zvYIn0eeEk+WWyAurZNOLZ6jATeQ2TPZV9yThEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=cajF4ZQL; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=g3TT0sqWT8MDYIs4mEqQa1JRDCpCOqU8NLya9A1kj28=; b=cajF4ZQLvKbGNtCMA2iVca7v1t
	aL3xY/2vmtN4R55r5EbLsQ33MJwhRbz9cfhQcOpp04Fap1xELyMtjznLBK8fKgUSGWXo2Y9bYRjTl
	oHmtSIdZaWVKDxpgWnov87flItw/shUp266qwUP3jBn20h9Iy9ofo2mQFF0+SNAz4ibw=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:55208 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vffwa-00053m-9K; Tue, 13 Jan 2026 10:04:28 -0500
Date: Tue, 13 Jan 2026 10:04:27 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <20260113100427.f2162f0d5ba80a259511f9d2@hugovil.com>
In-Reply-To: <20250721153332.2177134-1-hugo@hugovil.com>
References: <20250721153332.2177134-1-hugo@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.4 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] rtc: add BSM flags descriptions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Mon, 21 Jul 2025 11:33:31 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> It is hard to decipher what the RTC BSM flags mean, so add
> meaningful descriptions.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  include/uapi/linux/rtc.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
> index 97aca4503a6a..da65130e316d 100644
> --- a/include/uapi/linux/rtc.h
> +++ b/include/uapi/linux/rtc.h
> @@ -141,10 +141,15 @@ struct rtc_param {
>  #define RTC_PARAM_CORRECTION		1
>  #define RTC_PARAM_BACKUP_SWITCH_MODE	2
>  
> +/* Backup switch mode */
>  #define RTC_BSM_DISABLED	0
> -#define RTC_BSM_DIRECT		1
> -#define RTC_BSM_LEVEL		2
> -#define RTC_BSM_STANDBY		3
> +#define RTC_BSM_DIRECT		1 /* Switch if Vbackup > Vdd */
> +#define RTC_BSM_LEVEL		2 /* Switch based on a threshold, usually with an hysteresis */
> +#define RTC_BSM_STANDBY		3 /*
> +				   * Switch if Vdd > Vbackup.
> +				   * Useful to ensure the RTC doesn't draw any
> +				   * power until the device is first powered on.
> +				   */
>  
>  #define RTC_MAX_FREQ	8192

Ping?


>  
> 
> base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
> -- 
> 2.39.5
> 
> 


-- 
Hugo Villeneuve

