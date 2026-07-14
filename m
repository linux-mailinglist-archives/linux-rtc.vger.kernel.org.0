Return-Path: <linux-rtc+bounces-6973-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2EnxFyODVWq7pQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6973-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 02:30:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4972B74FDDC
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 02:30:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OcVWUhSo;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6973-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6973-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 933F130080B9
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 00:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C1B19A288;
	Tue, 14 Jul 2026 00:30:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B072627
	for <linux-rtc@vger.kernel.org>; Tue, 14 Jul 2026 00:30:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783989022; cv=none; b=WLVn6xMgMvA0ZTpRFHhY+6yVvIlsurUzewT/m5yN4MsbT9AxQEE/txh976f9vuEyC3nSbUXmR9KaPCfglrhjag87vzhSAjiVNb6I802Y52lXUMM1+ZfLu0lTuXzBj3w2XYeM7n+smuBcjW6pu5J6XMmmCA1xNqC5SOD87q9TB3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783989022; c=relaxed/simple;
	bh=+PLIABUlw9uHfDDSr/41jIhsFZPkUb7RuqrPprCJPmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zf8dVGVY/zqQdDIC+sz75WOqdqdP1afGKAJQXKMXu07FtCfkBGYCIMw56KM1C4gENTjctpdcjF/tXiQSurTdCyLcAau33FLKIpVtqKQV68o5/6Kl4/zbGI4QOgjLHD6Dmw/ugeg4ZekForbVlTJAaa3JcZvHO+HpjOHPPSTP1As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcVWUhSo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142201F000E9;
	Tue, 14 Jul 2026 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783989021;
	bh=+PLIABUlw9uHfDDSr/41jIhsFZPkUb7RuqrPprCJPmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OcVWUhSoYhlC725pIUQcnAWbIBU4vBNQeMDu+dfpbiEof+9+YDqPMSROtVT1mKkBn
	 rKHYJdvV2XIknky3C2juRpwobtxxSmahfpBfKl7vLam5M/QKEcpE2qK5tdKOfkeOSb
	 ink5NbEDRHQbeBp5x2HJeVWCrBSSni7Ya8OgrxaL1asVvbauDbZSinI3b9q4AyGIvM
	 EB+htIE9b3+UT3uPxmnHlKdhDQNKc4RzLtHMaOwvqt1GqECum9pjKl0VM3/L0nTsl0
	 YA/W1qdFHcU1jTQAnVecJwY7oA0VzY4dvz+Qystv6eUMaCdH6MIXyFc9pJBTkjOrfr
	 SPZFqhkbMBhjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: st-lpc: get IRQ via platform_get_irq()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
In-Reply-To: <20260714002259.1392655-1-rosenp@gmail.com>
References: <20260714002259.1392655-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 00:30:20 +0000
Message-Id: <20260714003021.142201F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6973-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4972B74FDDC

> Replace irq_of_parse_and_map() with platform_get_irq(), which resolves
> the interrupt from pdev->dev.of_node directly and returns a positive IRQ
> or a negative errno (it never returns 0). Propagate the error on failure
> instead of the previous open-coded "IRQ missing or invalid" / -EINVAL
> message, so -EPROBE_DEFER is handled correctly. The rtc->irq field is a
> signed short, so the negative error code is preserved.
>=20
> np is still used by of_property_read_u32() for "st,lpc-mode", so it is
> not removed.
>=20
> Built for ARM (multi_v7_defconfig + CONFIG_RTC_DRV_ST_LPC) with LLVM=3D1;
> drivers/rtc/rtc-st-lpc.o compiles cleanly.
>=20
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714002259.1392=
655-1-rosenp@gmail.com?part=3D1


