Return-Path: <linux-rtc+bounces-5932-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NMxB0n8fmlThwIAu9opvQ
	(envelope-from <linux-rtc+bounces-5932-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:10:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D2C5161
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EB493016CB8
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Feb 2026 07:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CABD2E5B19;
	Sun,  1 Feb 2026 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/E02SDd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE82E1F06
	for <linux-rtc@vger.kernel.org>; Sun,  1 Feb 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769929789; cv=pass; b=foCwYgFF8+Vd8XFh62El5tkLEMVHw9uXb2d75Kti9WJy0k1/8/qhDXR5oO8dJJBI2y/QrVLxep7FRQAyqQ1eNzxsfufz1o3V/a/fyDWo0bFcEJgfPuEr61KXi/Zt1PUQNJ3yIEdLkbPoWTj0t9I1ltChcZNfcnPzcJoLYIn70zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769929789; c=relaxed/simple;
	bh=mVleZTFVGkwhs8mQsAxLo89FsklFvp22Sy0QI4BhQvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ycgne8SbvEIswXJt6Pth9BGCVnWU4Tuxq+4jRXwQ5RW3ic+K0rS1i2PprYdDgxV6wWOs3D38dwfqZcgF0sRn1EVTcEmVH4p0tK2lNRM9wr2LCpzYDZHe2ZENFbJz/B2iDJAmVIwq38a/jVhIdI59zldz6zO4HEfL2oZBcTBfwDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/E02SDd; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432755545fcso2170133f8f.1
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 23:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769929786; cv=none;
        d=google.com; s=arc-20240605;
        b=KcXoMArhuop32W1JjM/s7BLSGYxJ94riZL3McgX+ghl0TZv4LJEr4FLsrx5az5DOUx
         MyRShSoElrKJcFlMb8HlOLHgFOoGBIrMenzZ8Ta7lXRMgtogAajW+Yt5uLu1nCEinetF
         ieLCMNnY1TXo2NHErSxIEqCksAv37EJVYI+k/QSlhFdCCLR06F9ArXFXnlnTqqwUIGbD
         bUDgUptfMz8IsiAM6MBDO7fQCVhrYWw92ul4fVzVsazEUn9LR/sneYU+gayTJJSA3vYC
         0YM5fhQiHqFTt46jtdO8kbpPiD4KdVAWB+FP7W/wn6WLoM8+FVTmnm4qYAKTPGgxULAS
         +Zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mVleZTFVGkwhs8mQsAxLo89FsklFvp22Sy0QI4BhQvE=;
        fh=oC27YKVgo9xQ/IT99l01SgYuY6kg81AGmKoJ91CSnwc=;
        b=YGMftWbHs5tPh5QGUVOc4q0TE15OdwdH5OqSsZkkKNAeCKrlIoOnNZN8drixeHC+ST
         xQN4ERq5CaxkJ5cx9LoazAfY5ncBVfisgQMc3SPDo9+dE85MxRRhJgk49A2mGxLra77v
         g2aDVBI4wRJcHCQsgHT+59IU4OiDn/mBZ/B+5h1rGqKQTtU2fnxNHfgtrDesmrsuqNxq
         iYU30NOj9rk72VNwepih1li/Irq5fR9JykiV3E9FevEWscjk1GUZuuXQUCEyGQf9pwfd
         yL2deWddoPTe3/q1/njpIEUM2YE+OJhyUkkzCqQrj0fGET5EwlNBMaT9IvaE+LUhFVWB
         2zuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769929786; x=1770534586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVleZTFVGkwhs8mQsAxLo89FsklFvp22Sy0QI4BhQvE=;
        b=c/E02SDdbVDPPQi7HL8AFN3msp3RoF3Mpiv4ztFLpwmQ02C8hdg1DqCFwXPHIN1mju
         FbIv43PIv7hBATmlP/PEOYiM++UxUYMBGg+epg6xMTgnnDEn4OlkzxPBSBbCAPr3n2AQ
         WqW31xJD/0UiMYR8As70DsGvCdsLdrE9f/EX3f5HGqg2rRnJYN+1f7gGc/lIrn1/ShZv
         SsIAKiaA4fojunyTpmjg+yqt3zFLbYN4XtQ+VAWVtSx+Tg2AMKc5kPuOHQEK9oUehzsn
         JEPwI8BDMY2FrvIspNC4uXgJh5Q9/pgmQpe7GRfrrhW9nAedb7FJR92YxVk5YdU7Lux4
         RIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769929786; x=1770534586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVleZTFVGkwhs8mQsAxLo89FsklFvp22Sy0QI4BhQvE=;
        b=nmzZpib9pqTI/chq/9aYLp4t4RVnZaAYBSkct5e1D52Hix/yCS6rDBy6nGpfRszpYm
         nFVtjqmWxhLLmjZaMDXe1B/MuT966GjNUI57l7fB6TE+k01tQlZ7KslohgFVwt3d4Ayh
         d7UKg3AK+FWuuZJzhJEtA16HoqhUrIdaV0pngZQL2ZkVtSpnB8GbGNI51oMgupglhnrv
         hWKVGplnjKrtS9Hhl5B/hxstgg8m71iWeOJfgiHfruTmNdTLsY/wf5enEQiZXt5XNq06
         STISTgRmLXuHybefF6JOo3ZgvdPPMQYpNSZse8aBwWoXgRBbHLOw03jZbenipuEUE5/5
         mMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvSrsQzZprkavamsX9vJSp+FSGF5KhwjxHWQztHcRL3L8yxlAVXHTCPNxMOPzdcH8mZUZ71Q5bKL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXuqNeYI18DgJ1UKDEjf9aE9GH7NyV70u4vAR87ewwkOycaL2
	4QqvL0IDHyvb9YhMFm7xkt4BuPFXuXk3K9VdjLvFZu7CxSQjJ7Ch/KoyG3AfdC/XZHMelVsWHLV
	Fx51FpshkFdf89fWYv0+GMgttmvLCqFA=
X-Gm-Gg: AZuq6aK0xOx+ueeBysvBPC5D0a9UnGVQn+8p4mpFQoCg0dqF2P+9aBlC/9boCwXSHrl
	vmfX6KNHjZpULyiqzF1P4jylqz7XdK/uZqj2npDl5rHrVnD2f5oHoXg93wYZqnh1DPXdmi34BNl
	DgD+NJJCPKfBNjsQl1yAlb6Tavpmc48tayN39N3VKb5hi7ZGjZym17W/dXReNC3o856Po2LOcO+
	S7IhDpoRBr8ftAEPjQTpe7Y22US5ugWPyiJL/ZAM7qICHUNv16PRaUHJPZ4qHNgdk4jlPWG
X-Received: by 2002:a05:6000:2310:b0:435:a594:33dd with SMTP id
 ffacd0b85a97d-435f3aafeb2mr12707085f8f.46.1769929786087; Sat, 31 Jan 2026
 23:09:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-9-clamor95@gmail.com>
 <fca2c04b-fe1c-4685-9c80-b0d7d37ced60@baylibre.com>
In-Reply-To: <fca2c04b-fe1c-4685-9c80-b0d7d37ced60@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Feb 2026 09:09:34 +0200
X-Gm-Features: AZwV_QgqhXC-zAPZm3FWrQrZKb00Emtx10eOBVUYX82Uyvi3NU9ESnDiArQ89Vo
Message-ID: <CAPVz0n3XPmYPWD=Yr8WXGn84M-9Onf+AHZK0ZpyQcBJJNHUCeA@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] dt-bindings: mfg: motorola-cpcap: convert to schema
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5932-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,baylibre.com:email]
X-Rspamd-Queue-Id: B93D2C5161
X-Rspamd-Action: no action

=D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:07 Davi=
d Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 1/25/26 7:43 AM, Svyatoslav Ryhel wrote:
> > Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML=
.
> > Audio codec bindings adjusted with common ports node for port@0 and
> > port@1. Added compatible for Mot board CPCAP. Other bindings remain the
> > same.
> >
>
> ...
>
> > +examples:
>
> Ah, I guess this covers all of the missing examples. The other commit
> messages should say that was the plan so we know why the examples were
> omitted in the other patches.
>

Subdevices schema state that they are part of MFD and link to the main
MFD schema. MFD device description mandates to have a complete device
example so having examples for each subdevice is redundant.

