Return-Path: <linux-rtc+bounces-6486-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLM1LQ4d/mkRnAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6486-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 19:27:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C94F9F62
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 19:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E173300D4DA
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2026 17:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E01D15539A;
	Fri,  8 May 2026 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FoabeDNM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63E33AD9A;
	Fri,  8 May 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261257; cv=none; b=XOA5K1cwqvAUrZz8aCSs3uU6OrYE0TygqfxrZgDo7uePokPzfBKRD1gI3V0fa+0FinSu2OC5sNmONwAecC+9YmU40LcPqm49Fp28QIwyQrHvyoxYJUXrLFGSaOUI0TRNU6LZaYiZoSLEgK2jXwH+gRx3knMp8MMy66KHBKvjb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261257; c=relaxed/simple;
	bh=GVadrPaIpXvloCZ2qd0TqpTcfl5gklkUuZCeS18TOZ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TuQlVjHFjLSV3OtU9nXZHwpcr1BKC7/afpf9k8hs6gbBBnXIf12+O0gL1BPXVptcKtHZJVZIERFywElaPCFaQJ/lqk53H1+QZcIk4/88nXKYcFSI224orhKbjNNkTBoclKnsJHUsO2cLTrcT58MF7si2Ls2cstynro1H18bdFU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FoabeDNM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E957027342;
	Fri,  8 May 2026 19:27:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mz1FdCaqy_UM; Fri,  8 May 2026 19:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778261251; bh=GVadrPaIpXvloCZ2qd0TqpTcfl5gklkUuZCeS18TOZ8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=FoabeDNM7Jyz+x0UDJK6XcQU51z7Kdd5xB/++yvjt5c/PUyu4oQ9/i/J5rLglEHBS
	 dUWSemd3ufA1LqftJjHvOJNQeLILdkgigpTYXJ2yrYSK8CzS8Zzi9ToGYHbDyHqm9B
	 Gk9TQM/GcPz1LwiGOY6WlKmC6O1dIYOr1g5tuKQYVKrhB1o8MFyt+g2p+0+wKo/ycy
	 biOp8HFVlb6UorCJfanOu/hhaTi4DerBImFFRf22ONmJaaaQMFuBHxnbpRYLC7RhS+
	 gCMGPYdj1nFOCgVNbRCX53LCTLIT52dQTXuQY8vrGE03YQSXwdKkpFADQXMVlAnouL
	 6p6aVHxrv7Mfg==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 22:57:12 +0530
Message-Id: <DIDGZWFXUX7H.WYJNRZR4BQ2P@disroot.org>
Cc: "Pavel Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "MyungJoo Ham" <myungjoo.ham@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Sebastian Reichel" <sre@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 08/11] leds: rgb: add support for Samsung S2M series
 PMIC RGB LED device
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Lee Jones" <lee@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-8-fcbc9da5a004@disroot.org>
 <20260507190005.GT305027@google.com>
In-Reply-To: <20260507190005.GT305027@google.com>
X-Rspamd-Queue-Id: BC0C94F9F62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6486-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Action: no action

On 2026-05-07 20:00 +01:00, Lee Jones wrote:
> On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:

[...]

>> +
>> +	switch (rgb->device_type) {
>> +	case S2MU005:
>> +		lut_ramp_up =3D s2mu005_rgb_lut_ramp;
>> +		lut_ramp_up_len =3D ARRAY_SIZE(s2mu005_rgb_lut_ramp);
>> +		lut_ramp_dn =3D s2mu005_rgb_lut_ramp;
>> +		lut_ramp_dn_len =3D ARRAY_SIZE(s2mu005_rgb_lut_ramp);
>> +		lut_stay_hi =3D s2mu005_rgb_lut_stay_hi;
>> +		lut_stay_hi_len =3D ARRAY_SIZE(s2mu005_rgb_lut_stay_hi);
>> +		lut_stay_lo =3D s2mu005_rgb_lut_stay_lo;
>> +		lut_stay_lo_len =3D ARRAY_SIZE(s2mu005_rgb_lut_stay_lo);
>> +		break;
>> +	default:
>> +		/* execution shouldn't reach here */
>
> Instead of a comment, perhaps a WARN_ON_ONCE(1); or similar would be
> more robust here to catch unexpected device types?
>

[...]

>> +static int s2m_rgb_pattern_clear(struct led_classdev *cdev)
>> +{
>> +	struct s2m_rgb *rgb =3D to_s2m_rgb(to_s2m_mc(cdev));
>> +	int ret =3D 0;
>> +
>> +	mutex_lock(&rgb->lock);
>> +
>> +	switch (rgb->device_type) {
>> +	case S2MU005:
>> +		ret =3D s2mu005_rgb_reset_params(rgb);
>> +		break;
>> +	default:
>> +		/* execution shouldn't reach here */
>> +		break;
>
> As above.
>
> And a single branch switch () makes little sense.

Even with an `if`, since only one variant is supported we're sure that
the control would never go to `else` anyway. I will flatten this block,
and expect the switch to be added when another variant is added.

>> +static struct mc_subled s2mu005_rgb_subled_info[] =3D {
>
> const?

No, this is fed to (struct led_classdev_mc)::subled_info, which is not a
const pointer. Relevant snip is marked below.

"Assigning to 'struct mc_subled *' from const struct mc_subled[3]
discards qualifiers."


>> +	{ .channel =3D 0, .color_index =3D LED_COLOR_ID_BLUE },
>> +	{ .channel =3D 1, .color_index =3D LED_COLOR_ID_GREEN },
>> +	{ .channel =3D 2, .color_index =3D LED_COLOR_ID_RED },
>> +};

[...]

>> +	switch (rgb->device_type) {
>> +	case S2MU005:
>> +		rgb->mc.subled_info =3D s2mu005_rgb_subled_info;

Here.

>> +		rgb->mc.num_colors =3D ARRAY_SIZE(s2mu005_rgb_subled_info);
>> +		break;
>> +	default:
>> +		return dev_err_probe(dev, -ENODEV, "device type %d is not supported b=
y driver\n",
>> +				     pmic_drvdata->device_type);

