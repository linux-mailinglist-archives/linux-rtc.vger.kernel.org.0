Return-Path: <linux-rtc+bounces-6751-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 10/BFZFJPGrMmAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6751-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:18:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FDD6C16A1
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:18:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ZFrS24Gq;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6751-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6751-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E141305046A
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3DD3E5A30;
	Wed, 24 Jun 2026 21:16:49 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC043E5EC5
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:16:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335809; cv=none; b=bQ+n1Rrt9dzAhraJ3u6AIFhW0mv89YcSd9eUgLYAn2uTOta2HSPK7L8P9hfTGwzL8mS5bvjTQuHAcNtFfTbzr/Abhbp3Yo3UrPXIPCb8D6cyMmzerwVNTuzAujh6ESYJLiHwrcIOIsKwI4zlTWiwh4uunRpi+s6Mi0+d7QEI5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335809; c=relaxed/simple;
	bh=3UyBs04HfmneOkBn5MHla72aREGAHdv8PrXO423iVL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrlcPMN9OCxyW2ulHnrq5usfKcr96JGcrN8ggG7RWYIwLQ1YYWIwEl5ahaJCa4eDutYHAxYvJdISyXvjyCEyuzrGT97FgH7YMXZk852RJm3kRS2yC956QNJ1U74fnA4wkN1iWxngj+VyXAfoUz0PYux903pye/GU4byeXmGqpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZFrS24Gq; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 218D1C6B3BA;
	Wed, 24 Jun 2026 21:16:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0645B601C5;
	Wed, 24 Jun 2026 21:16:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F1C1106C8468;
	Wed, 24 Jun 2026 23:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ArYnu/1YanuqdlV21/ZctLMYIsPxKet83mcYTyOtQec=;
	b=ZFrS24GqxJYKAJxoy9vCQOrpfZcgIPX4nupird0dtQGbPOfrq5K85w4+9dM3I4kgnQQU1b
	xS7j5cKtUf3hTEUhPzEr7DM/aI4xGHfGpXNeDwXbebuxiMRrf0ogFptnLEVS4xpRHKPQZG
	TL2AXUkzoktLkRQ6JDUljTvL/R0D/k9RcIDsVeMqaBiqEFepjCEgt+Z748zSGpdgwCc5fy
	Y9xkKiy6TAw7SYBClX/8310oKVePASQodwOA60f3c13Z1BQOiWfLD2osHNmH3NTgO1kCTb
	dhDeb73oZjjqnuPSKkXSOhoG7hR+W+urvycKhp30zAhb25LQyCH74LjYwcFsUA==
Date: Wed, 24 Jun 2026 23:16:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 0/3] rtc: Use named initializers for
 platform_device_id arrays
Message-ID: <178233558807.1517260.17147492956958938039.b4-ty@b4>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6751-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:bleung@chromium.org,m:groeck@chromium.org,m:linux-rtc@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:balejk@matfyz.cz,m:mazziesaccount@gmail.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:linux-samsung-soc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,matfyz.cz,gmail.com,samsung.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1FDD6C16A1

On Thu, 28 May 2026 08:48:09 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> 	 struct platform_device_id {
> 		char name[PLATFORM_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;
> 	+	union {
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 
> [...]

Applied, thanks!

[1/3] rtc: Drop unused assignment of platform_device_id driver data
      https://git.kernel.org/abelloni/c/ba5dca876b54
[2/3] rtc: ab8500: Simplify driver_data handling
      https://git.kernel.org/abelloni/c/6e2f1f0184da
[3/3] rtc: Use named initializers for platform_device_id arrays
      https://git.kernel.org/abelloni/c/041ca8884410

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

