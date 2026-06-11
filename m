Return-Path: <linux-rtc+bounces-6643-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N3b+E0RtKmqypAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6643-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jun 2026 10:09:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BE66FB7F
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jun 2026 10:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6643-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6643-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D578F3038A66
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jun 2026 08:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AF376463;
	Thu, 11 Jun 2026 08:09:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23569377003
	for <linux-rtc@vger.kernel.org>; Thu, 11 Jun 2026 08:09:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165352; cv=none; b=fNES/pFpnAJIb8d5S5vFYgfMBgoBUCBYrzB/r+ZGrtNU9drvrQ7hGo4I+le+F38zzUkp1IayAtIhqv09daXlhB8CohFMaVT0rfs0Z9UmpUdCMxljUWNzPjvg3gUVIji4iKKAVh8326hhjwSoD/gB6nd/qfOtO+RWXbH3em52W5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165352; c=relaxed/simple;
	bh=OkjAi29oS1e/XV+4wQ963+R9PRYEa/yC5qynT6OoK0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQoHal9HvzZd6PPmvwiKQF7jpOvsaZenDPEaD+RXx7izQot/uHkSfZTNH/O/xmlMalDa73i9rUhkT5OqddwjIJoprxUl0DXxhtxxuKbWIY++yrNYGSIukhn3mVpQ6DpYl4wFURal9tDD0jMn86sE2xj/X22Fy/mnXjeVjzXmVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1wXaTA-0006jG-EY; Thu, 11 Jun 2026 10:08:56 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1wXaT9-002BK1-1o;
	Thu, 11 Jun 2026 10:08:55 +0200
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <pza@pengutronix.de>)
	id 1wXaT9-0000000EM0m-1rQQ;
	Thu, 11 Jun 2026 10:08:55 +0200
Date: Thu, 11 Jun 2026 10:08:55 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: alexandre.belloni@bootlin.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, ben.dooks@codethink.co.uk,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: meson: fix refcount leak in meson_rtc_get_bus
Message-ID: <aiptFzFoLzQNMlxS@pengutronix.de>
References: <20260611035605.59906-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611035605.59906-1-vulab@iscas.ac.cn>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6643-lists,linux-rtc=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:alexandre.belloni@bootlin.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:ben.dooks@codethink.co.uk,m:linux-rtc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bootlin.com,linaro.org,baylibre.com,googlemail.com,codethink.co.uk,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE5BE66FB7F

On Thu, Jun 11, 2026 at 11:56:05AM +0800, WenTao Liang wrote:
> In meson_rtc_get_bus(), reset_control_reset() is called to trigger
> a hardware reset when the serial bus is not ready. The function may
> retry up to three times, but neither the successful nor the failure
> path calls reset_control_rearm() to balance the reference count,
> leaking the triggered_count on shared reset controls.

Wrong, this driver uses exclusive reset control, which does not do any
refcounting. Arguably, it should request the reset control via
devm_regulator_get_exclusive() instead of devm_regulator_get() to
make this clear.

> Fix this by adding reset_control_rearm() after reset_control_reset()
> on both the error return path and the success path within the retry
> loop, ensuring the reset control can be re-triggered on subsequent
> bus acquisition attempts.

This doesn't fix anything, reset_control_rearm() does nothing and
should not be used with exclusive reset controls.

regards
Philipp

