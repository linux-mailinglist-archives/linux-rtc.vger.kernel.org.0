Return-Path: <linux-rtc+bounces-5930-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKE9AGr6fmnlhgIAu9opvQ
	(envelope-from <linux-rtc+bounces-5930-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:02:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FDC50DA
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E69383013ED4
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Feb 2026 07:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B5F2E11C5;
	Sun,  1 Feb 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBKejBmS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A81284895
	for <linux-rtc@vger.kernel.org>; Sun,  1 Feb 2026 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769929314; cv=pass; b=cdflX0l/nzdvo3ffTCHHIMLV/V261Py7GdrGq1xegIF6S7IusEVEL7hjJOEkgB8dX45Po+D3Cfyw5UnG9Y2JBPj710tUsCS2iCWcRNaipMLEBBogLCk5ApfLpMlJKGBdCMgkpL/3h1ga2pGfIxT1wrQQVwvnftn8YcFKmBUwSZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769929314; c=relaxed/simple;
	bh=bHSVbRQDobR7C2o5P+eolgEypYFQdOgjv1IYhW+8fGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5ZJQVon+Hr5KHmgqmlEqyN5SxAcDyKhIjc/SF21RQ3BEhjAJPQWvZqvD2H5S7sYTLUMR+QUHl6KdG+v2o125VYGRrRCYNiOyDkmau7h1AHxgxmSv2xHpaAjZrd76l+eRXJKokA/YsR0P/LG2kcKwqxKncDyZJVCK2PdWr7s0M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBKejBmS; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b872f1c31f1so441848166b.0
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 23:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769929311; cv=none;
        d=google.com; s=arc-20240605;
        b=W1HdijF0fK02aMx0g+OQTOSbV8rjZE8BOMpdiGB73cTqkniwyPsZLhzoVOomwP2UKA
         xHgRte2zoC0ENglvDp4z2/A8foyjEKToNgMsuaNNpsCaG2BitnagsUYRl61adEhUTaxb
         0xFTEm1Mq1TcYmorIxikvZQJlw77JaMKaMOFv7u/EKTzLIDfEobmshH9YOS0I/mwF+Vp
         BqTFJTxZtUlsgv/zd+xCN9Zci5mXtRnnUMvqpVjlYlRq/gem/02O1H3+bNB8UcQu6Oqh
         gKv/NdzFR6S1PgC45fWj06Hj/d5NnVLZs1/8yUHhIuBrSzki+fAGW88gZit7H7TRX0Lf
         RtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iAWzb9BbFNy/4m/w6Zwd+njIpZ8M14O9H5IZPS16EzA=;
        fh=S32YrWT3EOSOuA51xDbQRJNS7MI05qA3abP+jXBhphM=;
        b=KSCl4Pr5BsHF2NSfw9cxI5q6npsHdRkYRPZ95e6NhEQ6CtnldudqglzMSerDygyLZy
         Sy0mX/CcSW9jMOonjxPtPm595wxGXKXSmuZyN2Djj3DrALNRWQ0Av4RSHzzsg5CdAZ7o
         s430HVXK0S0WbqBBcWsTMtR17x7XK5y6UoqIjNjx6rQJSdDU97vuhnNQULsTRFGnIeFo
         k2Xdp6tOuy1NNYZMuYgJi6yoag7pG6GDhhsPXQ5S/H+mCAySQkDWq+D58QyExaBe6M9Q
         z8yl2Olt6aFW/AJGDrtCme/dbTUtpOBrZrdBcePV3XSKa2Ii036BqMplMGUgc4NYASa4
         ZSYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769929311; x=1770534111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAWzb9BbFNy/4m/w6Zwd+njIpZ8M14O9H5IZPS16EzA=;
        b=JBKejBmS4EnrDrrSgo2TZcaWiwNko6dejhSRpqB3coSugLXxkgr19crETgfRrA4ZSE
         oBeD6xlYTYLcRVe2j8yQARiozYUaqztOdjRsLRnjw6x9GbRq/pcR8txFh+Rq9MsR7Bvq
         euACVxPmpd4Isp2GhT0aYyLA09r5034g7/jP4q7uEbA7mFfHOA8o7JzdvcKNESIbixqx
         Fhbqy4+MS2BPYXyhurlRpX1od+D8JrHooCPqHJphyqFoq4ML6c8cbhCeMY5Bqk99Mayv
         PgrnLN9InlhN6UYWN7gwPNxX1hX7WZ99HRl74jlgql3p0F0F9SZfHUTQo8XsqafLeuRN
         F0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769929311; x=1770534111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAWzb9BbFNy/4m/w6Zwd+njIpZ8M14O9H5IZPS16EzA=;
        b=O/nE200uSFMqhvq4hasB0AS6EOoUwIlGr7GUrBJjYpnSBlf74RosdFjL7xG8+77W7F
         VDpOKv0nJ9ckVs+UL6E6D1RwUHFUVXypaGuyDIgbHbEJEEjNIY5bsQitbeCnjCPC+Tjb
         kwtb9Zwd0vJUeGolyFhqM4Fcw/lJXJLW7yyReF0qPkW+4HwVPGfUz5q9vDrXEGpyLTED
         /RCC4xqqlF46n99m1W7dJaeALiWIMQPbzWNE525Ds0fxaBpA3N6eCcJexMDGAFsqHLOL
         /sCfc+D+VAwsfMmoDwa+FRoWZjGF011KF2L1w56Yv47Zkr5dIKdJoeZhB5lgDcrYJItE
         6cCA==
X-Forwarded-Encrypted: i=1; AJvYcCUIWsXTYQXZjQ23H7l+3XWRRZffWqjK6lJepOla1OqAOFADFSWyFIO0JDmyaW9tE5vJBprWq3IjxsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YznYj5WtbliJ7YCWTujRdQXKEHQtVppNpwj58npJijclYNjjVYd
	ZfFFSxrVLXER7MXO0y1MgaygFe/ME7fg8avp7nV4EaFVOtTUsQxnJqW2S8TSOGWgritiw01gNk5
	Msbmb8SlnIhZDPzv5cWDe08x+TOAbCBY=
X-Gm-Gg: AZuq6aJOHUGgnY5bXpD1H/AO5uEetzjAZebPX4qhG6ee0HWpxDrEh/wK8Dm7SqqyXri
	NeXA0ru1MMDOl1FILLcEEppgp1a550FM6Y1nFkmJX9ophiUmC1yfBse03n2pBRbFfXiUrBQYH3L
	nffMUzqVtFAaDDyuuW1qVopInMPz8GT8PnaZ96mg+y2ilZZzT7/NVwTyZRHCs6NeGiA+F88VSEB
	7I3P6ItwTnvAki9CyDrWuCiKGlVzgxoGHhAA07yI6FgmdqTEE9nqr0JeGDmS6YfH2EYXm8g
X-Received: by 2002:a17:907:94d0:b0:b87:1839:2601 with SMTP id
 a640c23a62f3a-b8dff6969b7mr517593266b.40.1769929310797; Sat, 31 Jan 2026
 23:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-2-clamor95@gmail.com>
 <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com> <8cedbb9c-9f72-43ae-a23e-705b3feb85fb@baylibre.com>
In-Reply-To: <8cedbb9c-9f72-43ae-a23e-705b3feb85fb@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Feb 2026 09:01:38 +0200
X-Gm-Features: AZwV_QizrzJwmFJ9K3HDRK05t0a_0kaNB1Vjer8WbyjV6HsHfDqBvgFrLolg9pY
Message-ID: <CAPVz0n1uv=2Hhue2zjnXdG=_PyofBBqEhdU+S84+ysYq2PV+qg@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert
 to schema
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5930-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 757FDC50DA
X-Rspamd-Action: no action

=D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 21:55 Davi=
d Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 1/31/26 1:46 PM, David Lechner wrote:
> > On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> >> Convert devicetree bindings for the Motorola CPCAP MFD regulator subno=
de
> >> from TXT to YAML format. Main functionality preserved and added compat=
ible
> >> for CPCAP regulator set found in the Mot board.
> >>
>
> ...
>
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - motorola,cpcap-regulator
> >> +      - motorola,mapphone-cpcap-regulator
> >> +      - motorola,mot-cpcap-regulator
>
> This is what caused me to get confused on the order of the later patches.
>
> motorola,mot-cpcap-regulator is a new compatible, so would be better as
> a separate patch.
>

Rob already cleared this up

