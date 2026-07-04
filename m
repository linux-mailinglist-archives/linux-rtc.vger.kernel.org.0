Return-Path: <linux-rtc+bounces-6895-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zedIN+J5SWqN2AAAu9opvQ
	(envelope-from <linux-rtc+bounces-6895-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 04 Jul 2026 23:23:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B270878A
	for <lists+linux-rtc@lfdr.de>; Sat, 04 Jul 2026 23:23:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bxmIArn+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6895-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6895-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC6F73004607
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jul 2026 21:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B81D224234;
	Sat,  4 Jul 2026 21:23:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96912D1F1
	for <linux-rtc@vger.kernel.org>; Sat,  4 Jul 2026 21:23:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783200220; cv=none; b=jgxmCExfhG/9jPNnuiAYZHXYvAHUXq1QVvDOisjdetZPzurtprrg/mfRlu9raNj3QnC5zjcwcL5ZoLpUfZE0aq0VX5NZSJmcO6JyOywDGDEofWngnewA32Fom5nMU9wFK73rBxNo3g6WvfmtHxxhCkkhBTmWlTkxET++5PO1Iwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783200220; c=relaxed/simple;
	bh=5qsNgiSZcbErIq6/oAQG73icM830lM0naH2fxYOeeD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CWL7lJNTsSxPHgLGkJO1QNKQCpjcvUWy/g3IcTXYbv8pIvyYzIoV0zwDoyHS0pzUjjzolwIdJUzAH0PIrbmCjfcQE+XExQBMU9Zsck3ayuSdWIl27EzOgfJ07I6/0ujYLf0KCksfcvFcZ9mGRM3n32uDeNnLOA5hjt54dO++2yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxmIArn+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18CD1F000E9;
	Sat,  4 Jul 2026 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783200219;
	bh=E0nsPA3+ZFrepS48TJWT91xW4iGFXBurGpM8NReKxSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxmIArn+5HxX5UJhIkDFfqv2n4ymj/nx2geu/uSQirpQL6R5vOLZhf6xMfdhEzRmf
	 IqgRQWbXyo58xhX+fBWq9uUaSMiAG7twmEd/7brezBTQS2pPZrZzel59TDtEH2JbrX
	 jTggbRUXMtTP1tBMLdz0okLj31SjQ2M5l1fssN9317YMkrvBsui4wfz4R5vQu1ygjH
	 YMkK365MU2sjrAQhB5MxbbI7Oe9mk3Qx1VUfbCWADMB1MciLtGfCAg/1h7dC8SVMm+
	 I/68udnThbsOFLhoqLAao1CffX2FGofTZiRdr0EqWzHVzRtOz1+1IyrUtIr6BmUmD1
	 MOOL8xjLlzTHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: armada38x: do not advertise update interrupt (UIE)
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ioannis Fountzoulas" <ioannis.fountzoulas@nokia.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
In-Reply-To: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
References: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 21:23:38 +0000
Message-Id: <20260704212338.C18CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6895-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ioannis.fountzoulas@nokia.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,nokia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD8B270878A

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Clearing RTC_FEATURE_UPDATE_INTERRUPT degrades UIE performance t=
o software polling and introduces a silent dependency on CONFIG_RTC_INTF_DE=
V_UIE_EMUL, risking ABI breakage.

Pre-existing issues:
- [High] The patch implements a driver-specific workaround for a core RTC s=
ubsystem vulnerability, masking the issue in armada38x while leaving all ot=
her native UIE-capable RTC drivers vulnerable to a DoS (soft lockup).
- [High] Unprotected hardware register writes in armada38x_rtc_set_offset a=
nd armada38x_rtc_reset break hardware write protocol when preempted by an a=
larm interrupt, potentially causing silent RTC write failures.
--

commit e4e1f958746b053e26726c0a8b1203537d9bd06e
Author: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>

rtc: armada38x: do not advertise update interrupt (UIE) support

chrony enables RTC update interrupts via the RTC_UIE_ON ioctl to track
RTC drift. On the armada38x driver this request is served by the RTC
core's native path, which arms a 1 second periodic timer that is
re-programmed on the alarm and serviced by rtc_timer_do_work().

> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index 245290ae1a8de..da036d819649c 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -526,6 +526,14 @@ static __init int armada38x_rtc_probe(struct platfor=
m_device *pdev)
>  	else
>  		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
> =20
> +	/*
> +	 * A large forward step of the RTC time makes
> +	 * rtc_timer_do_work() replay one period per elapsed second and can
> +	 * loop long enough to trigger a soft lockup. Do not advertise
> +	 * native UIE; RTC_UIE_ON then uses the poll-based emulation.
> +	 */
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);

[Severity: High]
This is a pre-existing issue, but does this driver-specific workaround
mask a core RTC subsystem vulnerability, leaving all other native UIE-capab=
le
RTC drivers vulnerable to a soft lockup?

If a userspace process with CAP_SYS_TIME initiates a large forward time jum=
p,
a lockless TOCTOU race can occur in drivers/rtc/interface.c:rtc_set_time().

rtc_set_time() checks rtc->uie_rtctimer.enabled, which can read as 0 if
rtc_timer_do_work() is concurrently processing the timer.

rtc_set_time() then updates the hardware time without re-arming the timer
to the new time.

The subsequent run of rtc_timer_do_work() finds the timer expiry far in the
past and enters an unbounded while-loop, advancing the timer by 1 second per
iteration, pinning the CPU.

Could we fix this race in the core RTC subsystem rather than disabling nati=
ve
UIE in this driver?

[Severity: Medium]
Will clearing this feature bit introduce a regression by degrading UIE
performance to software polling and adding a silent dependency on
CONFIG_RTC_INTF_DEV_UIE_EMUL?

If the kernel lacks CONFIG_RTC_INTF_DEV_UIE_EMUL, RTC_UIE_ON will fail and
return -EINVAL, potentially breaking userspace tools like chrony.

If it is enabled, it uses CPU-intensive polling instead of hardware interru=
pts.

[Severity: High]
This isn't a bug introduced by this patch, but do unprotected hardware regi=
ster
writes in armada38x_rtc_set_offset() and armada38x_rtc_reset() break the
hardware write protocol if preempted by an alarm interrupt?

Both functions call rtc_delayed_write() without holding rtc->lock or disabl=
ing
interrupts.

If an RTC alarm interrupt fires during this time, the interrupt handler
interleaves its own rtc_delayed_write().

When the interrupt returns, the interrupted write executes without the requ=
ired
preceding dummy writes to RTC_STATUS (hardware erratum workaround RES-31240=
64),
potentially causing silent RTC write failures.

> +
>  	/* Update RTC-MBUS bridge timing parameters */
>  	rtc->data->update_mbus_timing(rtc);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704210710.6585=
74-1-ioannis.fountzoulas@nokia.com?part=3D1

