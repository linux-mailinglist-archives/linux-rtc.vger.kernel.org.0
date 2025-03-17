Return-Path: <linux-rtc+bounces-3537-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD55A66103
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 22:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A90FA189D7EA
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 21:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47630202F89;
	Mon, 17 Mar 2025 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LlMJViCp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EBC17BBF;
	Mon, 17 Mar 2025 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742248275; cv=none; b=NvLjyPrbU6TpctDJk5sLFuV/n5OyOxeJMYhjyrRsmAr7T4R0wcSmDCBGB0W+qrLyOv7Jj5NXyiFQZ2uPYSUqr7iRk3GTTcBkx/iSn1CZ6n9UVIlNHodY8kVLzKU/MlVG52Wr+4ifv4i2ldY5BgMS/JuLk0JDpACmWlyBGN263WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742248275; c=relaxed/simple;
	bh=KKGVKFt6r7juB9UTQruDn+ukuqMxz2mWYBbQuMHA8Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc1yy72n4rUR12jr/90X7d1YsrQrIbgsDPdBgFgOu9f0Z69KwPACrlt3ypdoIG92HNWvv9EHsUzfGszBQqB/+z8GmzPDTz+7/H/9r6uBqUbm49dbisuBIQrx8YS5HKiL1SHkOxrw7+1JTEEdIFE2XZVIQ2lRXugGOuDEROe0DQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LlMJViCp; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96973442CF;
	Mon, 17 Mar 2025 21:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742248271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7bD6OTU3nvuqmcSiOM4u/sELVWPucEw+NEaP96pCMk=;
	b=LlMJViCpZ2nrGzDTaeKmJSkMde8IXAh2MfH4ckzHrE0drdkW0gGTKxunSNsNS0fPB/Km6t
	7VrR/VEQz+FkDNRMhzSGoHISHf+Jwc0c0/L3+SQ79/Jq0ZHQ4QDr1GUJVaIPT19VNS4W2S
	sjl/E35C6szf+b9VbuWvL5s2qmY/tstQNY0wbrErC2Z5oCWSVJ2byUUapL/ZFkOSxk1bSX
	fjJpcrtwk0o2T10Lx2mvApEcQcQr2LpdZZdMiK6hYoEdNdTdA1y7OutsvfPhGxpUoY91q7
	tguhGTSAIUv6EFmJP8zcg7ZSlMmjQZ0R5UEDDQp9NDkAmwjGFbh1idpDh/PQtQ==
Date: Mon, 17 Mar 2025 22:51:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Cc: linux-rtc@vger.kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] rtc: fix use of uninit struct in rtc_read_alarm_internal
Message-ID: <2025031721511050987ca2@mail.local>
References: <20250317183349.346399-1-bharadwaj.raju777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317183349.346399-1-bharadwaj.raju777@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevudevhfdvheelgfeileefteduuefghefguefgkeeljeeufeeutedtffeuteeivdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghhrghrrggufigrjhdrrhgrjhhujeejjeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alexandre.belloni@bootlin.com

On 18/03/2025 00:03:43+0530, Bharadwaj Raju wrote:
> The trace call invokes rtc_tm_to_time64 on a
> potentially uninitialized alarm->time. Move the
> trace call to the path where we do successfully
> initialize and read that struct.
> 
> This fixes a KMSAN warning.
> 
> Fixes: 29a1f599c0cc ("rtc: Add tracepoints for RTC system")
> 
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
> ---
>  drivers/rtc/interface.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index aaf76406cd7d..82ba33bf478b 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -201,11 +201,12 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>  		alarm->time.tm_yday = -1;
>  		alarm->time.tm_isdst = -1;
>  		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
> +		if (!err)
> +			trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
>  	}
>  
>  	mutex_unlock(&rtc->ops_lock);
>  
> -	trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);

This removes the tracepoint when there is an error, rendering it les
useful.

Also, as discussed about a year ago, alarm-time being uninitialized is
not actually an issue as mktime64 can handle whatever is the input so
this will never cause any problem so this isn't really a fix.

I suggest the following:

---

From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: interface: silence KMSAN warning

KMSAN complains that alarm->time can be used uninitialized. Pass 0 to
trace_rtc_read_alarm in case it has not been set.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d..dc741ba29fa3 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -205,7 +205,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 
 	mutex_unlock(&rtc->ops_lock);
 
-	trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
+	trace_rtc_read_alarm(err?0:rtc_tm_to_time64(&alarm->time), err);
 	return err;
 }
 
-- 
2.48.1
²


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

