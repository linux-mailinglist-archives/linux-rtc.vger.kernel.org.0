Return-Path: <linux-rtc+bounces-6343-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIn5J5XM32lwZAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6343-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 19:36:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFAB406D67
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 19:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0BFE30776B4
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 17:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA703ECBEA;
	Wed, 15 Apr 2026 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UvIHm5KI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132463ECBCC;
	Wed, 15 Apr 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776274238; cv=none; b=CL/3+Fi2RKdx1VtbgipbSNGmAgrRrFz/E2oJbRr7R5/uU/Zgrdz0eMyfpQVXgUi/IQZEIRuTUJ2Lur16lDzkY4c5bDek1tL6VLF/Y10lylMe3OJU05fQNFTE87B723CJrgJEmC96Almc3r6gEkLSZ/+VzLwFVDyLnyN9QPJI84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776274238; c=relaxed/simple;
	bh=qdi/nhUMdFGJLsMXflK6dnMGj0s+20mNJIk0XH5Wevg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=T96zbJ0I4lt51GRl9TQjdqOSx/r1bbwG1ywJLooUXtoG06C/kQMSylUUkTfhq2lgSXiqHPE1m6nx2aXF9SHKs3lVpBEiNvowyTpzqfhsUm0cLNUUD/POG3sR6O17ICawDr0MJMPLi/xlU2+ktJeQPfOUd3uAA0cApL/NRhaXFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UvIHm5KI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 89C0927128;
	Wed, 15 Apr 2026 19:30:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTlVcM1qlI08; Wed, 15 Apr 2026 19:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776274230; bh=qdi/nhUMdFGJLsMXflK6dnMGj0s+20mNJIk0XH5Wevg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=UvIHm5KI2b76Drc7fvFQmjy5Wk+JLF0Ti9T4CTiQhJxmegfJueVfLSgwOcbg7skRG
	 pWSLOPsx4Qs3bBOGwC6WezoDxaOQYGYng7wgLwvWQ2VQcRZMPGv7L/FWTaib+4xjXY
	 +2Tp5jKqWBEeW7bFtp95T3nHB1odT2vJT8mOEfCbe3ECcsxxrHqVhrrk9DfDzeMnjs
	 cqMFkpzWStkU1n3Eg2/mrUdnWXQrjEyUi3U6rKzUhS0pUSL/6gd3yRsgXQgHSkkiMG
	 ZnQ+Pie2AbrGE0/zL0UfbNWNK51Z0FwPEXgnbPc8l/d7VLA20atOuhHbDaAyW+Cojt
	 HEH1BoXDbiKyg==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 23:00:16 +0530
Message-Id: <DHTWNPSQ06IJ.24A9E1FL1RWER@disroot.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "MyungJoo Ham"
 <myungjoo.ham@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Sebastian Reichel" <sre@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 02/13] dt-bindings: leds: document Samsung S2M series
 PMIC RGB LED device
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-2-7fe7480577e6@disroot.org>
 <20260415-sensible-kiwi-of-argument-44d6ed@quoll>
In-Reply-To: <20260415-sensible-kiwi-of-argument-44d6ed@quoll>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6343-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.980];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DFAB406D67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-15 09:03 +02:00, Krzysztof Kozlowski wrote:
> On Tue, Apr 14, 2026 at 12:02:54PM +0530, Kaustabh Chakraborty wrote:
>> +description: |
>> +  The Samsung S2M series PMIC RGB LED is a three-channel LED device wit=
h
>> +  8-bit brightness control for each channel, typically used as status
>> +  indicators in mobile phones.
>> +
>> +  This is a part of device tree bindings for S2M and S5M family of Powe=
r
>> +  Management IC (PMIC).
>> +
>> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml f=
or
>> +  additional information and example.
>> +
>> +allOf:
>> +  - $ref: common.yaml#
>
> Rob's comment is still valid:
> 1. How do you address one of three LEDs in non-RGB case?
> 2. Where is multi-color?

Yes, multi-color should have been added here.

>
> And based on this alone without other properties, I say this should be
> part of top-level schema.  Separate node is fine, but no need for
> separate binding.

BTW, for loading the sub-device driver via platform (as it won't be a
separate binding) the driver *must* be built-in. Although not related to
bindings, this seems counter-intuitive. I see the same problem with the
PMIC charger.

>
> Best regards,
> Krzysztof


