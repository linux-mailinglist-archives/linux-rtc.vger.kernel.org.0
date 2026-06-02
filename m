Return-Path: <linux-rtc+bounces-6615-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFHfH3GdHmq5CgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6615-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 11:08:01 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2562B109
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 11:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD194301C9DB
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 09:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE493A9601;
	Tue,  2 Jun 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="ADqK8bKI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807413C9894;
	Tue,  2 Jun 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391048; cv=none; b=Es4mD08js+imEw1+GPxAkckbykNlW8gA9Tuvmtxdi2Sw7GEm2pKyULDt9finAxJ25ain8+KUR/0o2xGy/dMdLzv45hT6YqXYjtjIz1QR4MNPT8ID/TJy1+vLiAndB0Vh4Ao3F1PPH97VFLkk92j+8JjQo92Ha/cUWsFn7AVJyY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391048; c=relaxed/simple;
	bh=BGfRpCziLoFkxXw1IWBGIjETJmsIEuWBg7unSPf5Keg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gEQ08dfVyHmEnI5Ws9QdEjb5TzIIrNZtvckv21xrNtFrNCw0JViUWFwJc4Qz/7E9agNfzhc9AYUNLVNApQuVRsez/g3jBDNK4rFF0R6u9LUryRDY6Xnp2DYHJ42+9RrbeXyG7L9VWWvIkvxIvoBXDJV948cZKSPiPzo2XiU28+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=ADqK8bKI; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 87CFB583063;
	Tue,  2 Jun 2026 08:36:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0E1A3EB1D;
	Tue,  2 Jun 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780389395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d/l5rvA/a40QIu3rhbiP/pZ1jgz6zGNVh6aFboZ+MYw=;
	b=ADqK8bKIMGw1pZtEWhnOgHmFdfE4n+DtB6Kj4LHTb9A78iwLsPTwNXG28JcwWmH71TjV0/
	XfCsR1GYKre0J1xcPQWVgao2Znz8y4OXVK/iRot+APfoM6zbinPZgLmvaKpC7wiA3xzQ1A
	Y7M51zgtwtba+30A3c97TeYQTaUND1QT2vxRoKo8wct+JZNE8A4hDpo3clcc62ADVOOjlR
	kkf2Ou8A7j4h2ILHL+2ildZ331LhfcfqXEflQVfj2aQGG//+DzHInXzBSCF5j5AIITlWlM
	ej5+BHfMKmv6EH3MhfK5DMRtFxOGpnA+KaYulA/LegsEDcPw7ebSykwUPsW1vA==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH 0/2] rtc: add a driver for the Freescale MCF5441x on-chip
 RTC
Date: Tue, 02 Jun 2026 10:36:16 +0200
Message-Id: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAACWHmoC/yXMTQqDQAxA4atI1g1MA5axVyldODFTI/WHzFgK4
 t072uW3eG+DJKaS4F5tYPLRpPNUcL1UwH07vQS1KwZydHM1NTiMPa5LyibtiDy/u6gmaJnR++C
 aOhBH8lD6xSTq93w/nn+nNQzC+RjCvv8AKxSxM30AAAA=
X-Change-ID: 20260529-jmh-upstream-coldfire-rtc-88b095b2cf28
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780389394; l=1832;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=BGfRpCziLoFkxXw1IWBGIjETJmsIEuWBg7unSPf5Keg=;
 b=1tTsRXbKifjj5ZG5IuOSmeVX5O+RxaNkhnId8yDKf3k3EM0pmoGkXUmuRoMYsuqfOaSWv08mM
 7XyjFCZ4eNWAJmgqwq2xNnVgldkhjEtqAczTKbt6Ir/06Y23jREzI5H
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTE29EoZmkXhu/xQtkxQaa0kHijKM01RTghUKVBKBIcVlzcrYFVuyXUNxNf9FZmwubASaLi7n+lgMYv0R7A8AAkNTqQDRMNAzlT42sG40ar65UhwE1PMc6GbyDclX4g0QQsp9UOpLIHqyaUXWl+Ds0VavrEAU3rRZ/CpKAR+upsKqaNRihcn9EiAMU/7mtmAf3zEXLoWPGjaw1Nd5NePFYgEO1OxtC0twdNpfB6VoEHWlwHDNukueX+wkoWk+o1YsiT5zloIKqufFaDRfVlAxuIb72Xc+MaGa2xW168G2Ky1HzFXPPeYPevmMkIoTtTiMkPWIlSOBAZ0dZVY/rzfqmDnqGETg+yL1xs5YVIWF9Xk5a3cPnG3FjSzIsKv2UeKIW2HZdy5BEtfaBjk09cuGMVyoTxLoj4wX2MtuirSboO4unJJ5vr6dtOITnSIcjrEekWqH6FJyIeK3b9Svl2oG99jXRh5r805fIvDMXUAIvPSQ8IMY5E7oiRN7hM3MU/iMGxRzru6ie7vOo+SdVrSN+a7mjqIQbFAwYLIK9lMAuSp4DxAEkMiBDds1O7WababosQ0WU0Zh8qf53oDThqxEKAjKgVtjb4B/C/kO0OpzN5Alj6HqJ4f3yA0nY7jDDuXAZIcMXArxj01hAYRl5ljv/LFoa0BKR45nwGZJECFyi0IIA
X-Rspamd-Queue-Id: 87D2562B109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[yoseli.org:+];
	TAGGED_FROM(0.00)[bounces-6615-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yoseli.org:mid,yoseli.org:dkim,yoseli.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series adds support for the "robust" real time clock found on the
Freescale MCF5441x family of ColdFire SoCs.

Patch 1 adds the rtc-class driver. Besides the usual time/calendar and a
one-shot alarm, the block contains 2KB of battery-backed standby RAM that
survives a main-power loss while VSTBY_RTC is supplied; the driver exposes
it through the nvmem framework so userspace can persist data (for example a
reset/reboot counter) across power cycles. Register and standby-RAM writes
go through the RTC_CR[WE] knock sequence, the time counters are read under
the RTC_SR[INVAL] guard described in the reference manual, and the time/date
encoding is forced to binary at probe.

Patch 2 registers the platform device from the m5441x ColdFire SoC support
code so that every MCF5441x board gets the RTC. The MCFRTC_BASE, MCFRTC_SIZE
and MCF_IRQ_RTC definitions it relies on already exist in
arch/m68k/include/asm/m5441xsim.h.

The driver has been exercised on an MCF54418-based board: it registers
as an rtc device, exposes the standby RAM as an nvmem device, and a value
written to the standby RAM survives a mains power-cycle.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Jean-Michel Hautbois (2):
      rtc: m5441x: add MCF5441x on-chip RTC driver
      m68k: coldfire/m5441x: register the on-chip RTC

 MAINTAINERS                 |   6 +
 arch/m68k/coldfire/m5441x.c |  29 +++
 drivers/rtc/Kconfig         |  12 +
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-m5441x.c    | 582 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 630 insertions(+)
---
base-commit: 6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
change-id: 20260529-jmh-upstream-coldfire-rtc-88b095b2cf28

Best regards,
--  
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


