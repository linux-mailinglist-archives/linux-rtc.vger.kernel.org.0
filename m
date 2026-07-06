Return-Path: <linux-rtc+bounces-6939-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LgZoEYn/S2qAeQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6939-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:18:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1C714DF2
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:18:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W2UA6o+i;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6939-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6939-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E48A2368EE2C
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CDD3BF673;
	Mon,  6 Jul 2026 17:54:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093FD3B7B6E;
	Mon,  6 Jul 2026 17:54:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360478; cv=none; b=SdwOmUz4olWDlfoVzgJfRRI5DWh16Md6bvS7a/nz2CiBtppIo5wBJcsK5HT9lu34CoLTBz+976Qaq0J2ggc83zKVmKgwVm0OLIZgoFqCDNIRDdXN/71WuF/ojwAl0waxvsM4TSXGibSxREPjXwfytNeQB+lddXeurjOaesNq6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360478; c=relaxed/simple;
	bh=P13DcB7tw1CJzOHf31D+ZtgW/0sH/W1zsHNhIcaO2F8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VFNusKW5HiG6LSiKEd01zaQ7+xId+irNnjdkHWwCb2pT4M2hPTm8HfeV6KAVYygaDk/c5L52wBhQkZ+cWGC6wNUt+xdU6CQq/eX6h0aMwCp+8yjJCjOUi/iXzXwBU+/Ei3U9RwXaaSl/mjSGdzYmaSWr3xuJNHMb3w/F5m7Yja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2UA6o+i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1141F000E9;
	Mon,  6 Jul 2026 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360475;
	bh=P13DcB7tw1CJzOHf31D+ZtgW/0sH/W1zsHNhIcaO2F8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2UA6o+i4WC7EYoy2HijxW6r7MwA/I7ZEVUrJFdTa8ZO680WY9z8Toomrx9u3o9RB
	 NhuQX2l91jcfdjXUQAmwfFYKNlQ5dL6Ajns59h97NwY4yY/2vyKACtUROxYgDG6kEp
	 LW06kcwUaIOTxTVR7SqGgVQRtKAVtff922oDlksT/m0EmfRJpDxni90uH59j6tnIMY
	 4n35HoynxgWLKd/vNSGa1z1EIsdq0L6geeu0XjqTJ5ioAw5vLv3r0/nbdnNX54id15
	 47jNsb7HaTvXWKei5rfdY7iRSHgieM0CIDK+hhkHQhpK5eU5zLYQayVeLEbuZWTuyV
	 1EToJSOljm6WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency
 to ARCH_RENESAS
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260706175138.12587-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:54:34 +0000
Message-Id: <20260706175435.0C1141F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6939-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:alexandre.belloni@bootlin.com,m:wsa+renesas@sang-engineering.com,m:devicetree@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93D1C714DF2

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
> config option to make the driver available across both ARM32 and ARM64
> Renesas architectures.
>=20
> The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
> of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
> and expand the Kconfig help text to allow this driver to be selected for
> these additional platforms.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5


