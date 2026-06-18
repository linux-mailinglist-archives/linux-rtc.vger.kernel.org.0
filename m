Return-Path: <linux-rtc+bounces-6706-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sWoVBTvIM2rcGAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6706-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:28:11 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64369F4F6
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 12:28:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JrO5TUnt;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6706-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6706-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39888308A2E7
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 10:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF3F3ED5BB;
	Thu, 18 Jun 2026 10:25:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3C33CA4B8
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 10:25:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778315; cv=pass; b=TS93q1XrfXa5SlzM22r8E9rwjJKkC00M7njUfPAFj3jWIckitq41vGMJ/LYj1yQYC5P6PmU9ykpBM1Ml/vqmwceS5onvRVNtEpLUHVODoXzE6Btt1tYXlHbvmpeZ3BFqx0BRc0n5SPPNoZxksqvchATkDY0hP+gIJCEytqpArFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778315; c=relaxed/simple;
	bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rh2Gu424mTULmHK/MywlYYXoj24JiZNgw6/eAbeNradbkHjNcXk/3vlSG8W9bXc4yAXGqP5iaAD2StrIbKzHbvFnA3FWHU/xJsZ+LdFXKPG90Y9X5wF7Ag0KvlxCew3K20Oxu0QoQKseJkRarVmVCbcTwzug+a1zBMcaikZv+Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrO5TUnt; arc=pass smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49222b6e871so6512965e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 03:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781778306; cv=none;
        d=google.com; s=arc-20240605;
        b=BdfQsGuRZ2by8dDV8xOvfAXAt0rhPRuq9lHWEI8MmUAz+uA/uaGU6+VxjJsuxI4vuI
         kvpLJZxROzHTAm2FzqPfwZ9fI/dhxCzH7zSsOUspdaeLrzlh2dWi0XhIjbbGJz3b/CZF
         cDOwsEmvM8bRXtgl97BU0gR1ht9Rpa7uWSCKpVIIn3gQ1HmwTo9XIkZDN1W4bUaihLPE
         SwEdNMOqI89StLpgmsVxxmt/PKmxu1fxxlsMEopZV5GXOvCGgbu/Hn+bFDLVaOa0Vv9I
         Czr8J1S1O6ld5tfeiMKfE3FUPS5Vt4PAUA814b542AJPwN2rH2dUVLbI+ICjmSCHuZvK
         05Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        fh=1CCQAuBdNFyqvILA2ycUyKy7VWvcbgNu8RzMB3AtF8E=;
        b=XlGlKyi6kpgQlKyP+arPVCocveFC3579ClMoKxvqCevPUfOqVRmRkEHOMYNhYKhsJI
         qLDcI0wYDTmBV9Ju8u6Tk3jhkvzyB7wz9OEbHuHqp2PjWud2Js2dzukQvElSWQlsYh2o
         KySlz30ltRop6E86p+rapTpZbtKtggkv78bsO+gYOEs+3xewBpOQr1zWJ11z3Ce34v78
         TUZQaDL1GH1Q1qSWoZluosCApr+bESUvybFoz5V6Vu4+kroRgRHLcRja7hlzTZACu/A4
         xwNqqN/FywVilU9nB+Ub2uGhACTGoPyEK0weFAFY92tsfg8zOnV4OAUv3Ft7OTKWuVjF
         bf6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781778306; x=1782383106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=JrO5TUntxG44+akEv+ys39/1vOLyjc/hJRYPeYu35hkT/Q1x4ewokDZyrQ7WFYFYHX
         pvR++tOqATJM8FKDZTRB5JXXbIcQxprX4ZSJ4SPoaS7uCuL1Ludh6MkIgWXsQdn3cx1s
         17wkY3V+pjqTK42of1TriBl81hMF3gwiA926SekONyVeuiwbW0X+zjeElG3ikVYbDsL9
         t3JY6CE6FOxGama3M0Af7E8Xfg7AjU+JxVP6QfCSV6+4u6AJUerHGLIRHt3VC/Vl9QmI
         yt57Jd8oiPK4ztigwFE+/ZXLCfISesdPS8tKaeT7g98kG1HNrqN67MvkBT1cqO8I5+rL
         UWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778306; x=1782383106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=Nb7DtZ0JruC2EDsn2qaBOHzO7g2MaHlFQxnqs8ze7vSxxjOUoatvMVaxGZI1A5q1ts
         aXZarDEWWvhZu5PRWTlpA4D2JE9yHkrdFLHvw8XunE+edqZRSZ9eYgjBxHDlZtPv/oVZ
         kMxZmTgQKOk8Hs2ql4reIktHz4qvjhvCYPTiUHV3i6VMoL/aBI2/5xiOxpRM2EjGfW2N
         8hUfpJFY6aNc+28buRu/KQhRVQa+LTMePnc5qo79CQS6B6laUg8HcyzYvsLYyLh2axb1
         1xltF+qFDuL3RZ2NMwB9QFSQU+A7OQ8koCl3JETfft+J/rMNlwEdpoh5ZQJFp8HI+3j8
         j19w==
X-Forwarded-Encrypted: i=1; AFNElJ8be4N6mV9el5YnhoD9jcBWJd3z1cbVMebsJ/KTUXWaNb8SEqYzVllVuFOOwyaFmFMTKMqCCMGyi00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcRmHFNLOucglm/bhXrdQIfn/0n8ZUbIhgEnKASRjj/h1fSOf
	mrJLrgYqU86ZFPXj8+OQDBLgVj3ej0lPi2t6I+0n2tUlkLI1wvM4JUwmnuYHx9IXdgk/J5GGhPQ
	BsLiIiQShMCDEDimVguuL6tYPQKNEb4s=
X-Gm-Gg: AfdE7cmvKCJSjoDebcysibdVoQOWXW7FhJERsuDcbzcNIrBkyB6iBqT1qEQi58c5enh
	DUN0JgRxH2izDNv5/bCTRaIeomaephF0oIUbMiohYliCJhvLYId7waMC894V3/F3JjgasLLw9SP
	rKcZcZNlhP9Ky2QrEgn1mwN/CJhU/UwoYLIJfCDVwjYMiyCaTio5TFyziORqtwHGic+4qYHtIyk
	ryWD9eObUEqPG5JsUDNbhGnhL+38kEgzfXDFVjtLJZ+swW8ImbUpT0hmy95se6MT25BLnz/tJXS
	KnjeUTzdTubQqAyOjf5cHYskshy6cFvFl2JgFWbj1VU1FhmE1aVcY9Mo7/rJSr+IJeiD47LuatS
	IxKZ7igqUMzGyDOw=
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id
 5b1f17b1804b1-49234141d98mr81843365e9.33.1781778306310; Thu, 18 Jun 2026
 03:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJwqDt2jUfhSD1x@shikoro>
In-Reply-To: <ajJwqDt2jUfhSD1x@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:24:39 +0100
X-Gm-Features: AVVi8CeKp76ZYhBRPcDvdhbfVkObzMomSw3gP3ldqFUf5h9HH7P4rMMrIdx25Ww
Message-ID: <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6706-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A64369F4F6

Hi Wolfram,

On Wed, Jun 17, 2026 at 11:02=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Add system-wide power management support along with wakeup capability t=
o
> > the rtc-rzn1 driver.
>
> Do you have an actual use case for the wakeup functionality? If it is so
> limited, then we should maybe not support the weak abilities until
> someone has a real use case? For which then, a proper solution has been
> developed and tested?
>
For running s2idle cases with rtcwake > 60sec this feature would be
helpful. What do you think?

Cheers,
Prabhakar

