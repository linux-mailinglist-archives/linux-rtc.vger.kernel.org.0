Return-Path: <linux-rtc+bounces-6637-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jUYvIhSbKWo/agMAu9opvQ
	(envelope-from <linux-rtc+bounces-6637-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2026 19:12:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BD66BE53
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2026 19:12:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Oq3Tttrx;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6637-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6637-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A894306EB31
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2026 17:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098E3346A10;
	Wed, 10 Jun 2026 17:07:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195E339847
	for <linux-rtc@vger.kernel.org>; Wed, 10 Jun 2026 17:07:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111244; cv=none; b=ACa9b8zjb1MHFSg5dFfGg9BA+5a9HRxM1q+uFhy2ZRx8YkFRECPTIK72G7ZaaTudVmpnkbuDXyWRyFTwpEEaqPeMivfQ1ymZyF5VtzbntWEOIM/x9PL8SW6ApenR1oMPXdCpXS6hefS620gQQ0TxigSdYCeuR+QqH6pHhBMeORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111244; c=relaxed/simple;
	bh=oNIoActVz0TXbcAcJhvF5OroIdcZfRfYtdC66CxO8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds8zmm7ITPpDr2w+3ocChfMXAxcmKqoRC1rM7Ca1BRoY9+Pp+k5blaX/LVTuCCO4u9lZgqfxhVII4w5aweH0bBwethHJm4or4fPO2YSQ/+GXY6tTwpW69dd78rVKdnwxhBS9M+5cniPx+9XZSgh3SrBGkA9hrLAsyO6DgFE3g2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Oq3Tttrx; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b64c8311so77676535e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 10 Jun 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781111241; x=1781716041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNIoActVz0TXbcAcJhvF5OroIdcZfRfYtdC66CxO8Jw=;
        b=Oq3Tttrx6PI3Bpl6rut3KT/kDTAWRNd82FpYcvAZBi9GFfUlA1bYs6PZXvfaf8IHr9
         piYQwq3vLaFTEYR1S6xfVKeE+9N+TYCKvsRTPz/HjhypKwLh3Xq786LS3p6PjW263WcL
         jm5Zb5/Ipi4Cxs73RPwhAzGH6r4uiCnenWQLcuN6Lt+0A+Hs5GlTzwJSw7BqbsIswNb8
         qRFcstHXePINMLyJbXkZwH8/5tav5LBTaVtgVGjMHBjnxpyhijMCa+hD+GVAZNykbvuA
         SpRGriiF8Ym+detDeRTfQiBWfLqGsKk02wBPus1E4tWbUHpojA+84TWbiFTTCpzwvaDi
         rhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111241; x=1781716041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNIoActVz0TXbcAcJhvF5OroIdcZfRfYtdC66CxO8Jw=;
        b=SsvgpXxEimRbhrDCMmvLSBrpZ3Sh3AMjH2i7Td4NsK42r/NOtFZCNyEtIJ2FKmeWLG
         d9g8bReVX7GawkHqKEHXSADyGKuGzssSSKex7c6FeSkEQEuiFG55ojJ28Xu96K97byz4
         l2fJIxjw0YjEzbjPRNTgrrwy+gmSDSuqcLbK+caMnlCvtj4tWj6F6H39FmcLIaQeAEVU
         8Kgy3SPTrU3AEjEb6M6ZZKKA/K78aljTMYqhLP95OXTRrqZnUeEDnTLf5tkUkMvzUybb
         vzeGiczFa6IAX8YnLaAQjaKLFvoy1yhWzJEVsed6iJqAdSUTJHY5QRXoflPW9qZvnzYW
         iJfA==
X-Forwarded-Encrypted: i=1; AFNElJ/ndj0GvuqFhy6ColycRK3Aztg9C3L6ePGEMtgwAd0K0ZyEv40e9vfFYiOEK/ruLBMoQlfDN5m7cxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxKtuOJINGEHS3WOOG7wj9PQMTCcJyw5NWczYmKJJCdUAKeRc
	HLki0j85K2A7+lcWltAaO52ic+OUFA3RkYhAgY+M/Sy6jet9UGrU/uK+HYVhlr+aH80=
X-Gm-Gg: Acq92OGnSEGWkX/Tqa+p3u3KcBA40+6p3gdAO578zH+uLykFXI9tfAa2NTfO1o48Iiq
	3TliPZr2gZZBjuhuPJpovf1sFFvqMCuuyfSqzVDvM3xJBA/7M6X+Q/5iZZf1Uh2INltMB3iLR7A
	YfgAIXKRy5bf5TISaqsaRFNHDAN39q9t/Ow0ZO+JnGUWhLSGb0G7Mo+Snwa640kNcdMPwQUTFuZ
	WF8CtzhA7RHGcY8Km5K/VNUqfmKemHGqWwPZxzW5pSorA/ac0mu+BTtVFSNPAJdEqIQA/NGv3Gq
	eKvWnG8TScw4jKcVcP/3muC331wMYzq1zlFJpHHkvNuDk5Lc4aTr8xVbyOjFflsHKEw3re1t2So
	YcaTkWqhhwuPis6FVFS9tIf1ROCrfmar72+JAncEbaRZBRrjCulLoaYFIXnOLgP7qk1ZWLwLXi4
	tDaRnEMGkC8B2UZcwcOhVTGKgPWa79EHE6fx8TeKQuCM1l9jfDwazteMG3hqLC53ghCsx05y1aY
	yAPkBGNClxr1aSo+D30U/jmDg==
X-Received: by 2002:a05:600c:1907:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490c25a0800mr404729695e9.10.1781111241169;
        Wed, 10 Jun 2026 10:07:21 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490e2b2bbdbsm1071665e9.14.2026.06.10.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:07:19 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:07:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aimZqlTywiFMrHr2@monoceros>
References: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjyhwxentwyot5rk"
Content-Disposition: inline
In-Reply-To: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:antoniu.miclaus@analog.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:gomba007@gmail.com,m:long17.cool@163.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6637-lists,linux-rtc=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,codeconstruct.com.au,gmail.com,google.com,163.com,vger.kernel.org,lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,monoceros:mid,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E25BD66BE53


--mjyhwxentwyot5rk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello Alexandre,

On Fri, May 15, 2026 at 05:47:20PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> While touching all these arrays, unify usage of whitespace and commas.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Is there a chance to still get this into 7.2-rc1?

Best regards
Uwe

--mjyhwxentwyot5rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmopmcIACgkQj4D7WH0S
/k4epwf+L6a484mFk1OKMvi0C7fAM23h7XiwvviyyN84trnw8VwKAkEiJNf5JUFg
7R1WMrq4+2e15acW97hQlPEzzBDuW2ABijg0v0ZarwUfflD+5//84KhAd2wRB6go
Ce3ayzfswCIOXZmOHtUl5OqWrp3ZhZioj2uEcV1gwtUkvbP7OdoaGJriM1ftzIN0
an6XNu4Cqpx/8pmXDoUtOIIy/te4xlV0MZBYhxUbxN0PlbW3WGdLTjj0BT9XneW0
KphmEVuwqL/2D9C8wxbpwZwCTEVNUXr8kPz5S/JedPC7/+oSdrPid2ItFPj9UHwx
fhMw7IH4sbpgOZtT26IRcW/HrV2WRA==
=FSr9
-----END PGP SIGNATURE-----

--mjyhwxentwyot5rk--

