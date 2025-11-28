Return-Path: <linux-rtc+bounces-5493-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09672C91AD3
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Nov 2025 11:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C34A34E5008
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Nov 2025 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C332730BF78;
	Fri, 28 Nov 2025 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyFJfB5E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C24309DAF
	for <linux-rtc@vger.kernel.org>; Fri, 28 Nov 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326229; cv=none; b=lxuzcKIUp35ZIW7m2mibgcdjGXbyT9pHl+tPmFXL2V0yq8qhn1OZFjV6PpTOZLQvl1FZCvWXDpegNF49naxAATkseQYl/V7IFvL/zoqqHGSCwKazN6skv97z5CT11vTUXlVkZiKhhhRfkFYILVtuq3GSyZTBKOJE5pXywmFWOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326229; c=relaxed/simple;
	bh=LsjBUCj2srMne7edzgGW8cbMkZIkCTv5yV9uYfkGBBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dk8PpFCJskTGiupldbjsFwjtr6pFHclkz6yc2MYYJrYdHLF6F3/bxZpYSDuhzGqUNNvti6o/BrXlEDxnIj7vwVUvHuKz0NUT3X4LvDXyA6+67Jx11Jg5849ZH3iyB5oIK4cH2uZc76VVZWexPwM5Bg75XXBXbq6MUK+03YL7Ko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyFJfB5E; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29586626fbeso22023565ad.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Nov 2025 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326226; x=1764931026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=TyFJfB5Ep4A7ODMRUKn8tZ7ZKi6TTBW1kh28faa/niAkS6GcO8WPf7G2Y/g2oubik4
         fzhckhp4qq0IWU5BuOJALxL+nzRPxaWHgo1g9roiJv36iT+0X0zcgfy4kLjj4LdS1Lfd
         /Zg4DJZisPmw9SZFyC5gUpkdHDVHYlVp+2+5V6+6U1k8P7EfvhrYND5Xr09YDd1O7r8l
         Mp/4S/Lb8cDe/tJyl7mgZfCnk3kI+lxQFxcsLRG/9PngjLN7x6NQZrojCz4YtrlFc1wy
         s9yUOjCqBxKzevDIKlwZp6JZL/rHCSdgSNlqpZnvl6jjaotXbp3Wnla1FLhVmXgX7wDu
         d9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326226; x=1764931026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=itnvjzPqDRxdKSPjkGFHv989FUx8MH5fQuI6SP5S9Vl+c7ctLXvOBA6kXsHPDyruKu
         wVIYTHeAO72RGTYxuIjhqlZ0Xd+Er2c/Z+T8ZH2Fe+xVQjYFRjNRRqozDNJUXH3zI/E8
         erklTiOKajOrP1g6lPqPeM7y3zxJ2ZXRpq7zG8uNCTTWmWuxksxx4FXD0QuiJ42tx3HH
         tU3Vqj4EX6zARlA1g5yCsWaP1fmUJ0L1JVqMiZZ6+c6sD7m9j117UdUfDR9/b7irfOFR
         hsR/IZ7/P3GxvjjuzR6zrubRXMPGp861lKXmq+H3oxt5Mmu/1xD6Tx2ImGST/8GqVB+7
         N2ug==
X-Forwarded-Encrypted: i=1; AJvYcCXgncziMgS0AOJxsJKTH8pEXA31JIoSW2UAxgSw8ZCMzijTu7WkfWK//wLwAEg6su0q/WF8/hl2GDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxklKn/ZtD7ne5kspYxwPVpMQN4FN1/MrNd9fpRCFInh3LWS/SA
	EZDc0QdGbna8fw9aPUJH0ckZNeZPrrZfdWH5e60cBqHt6hkz/RsSx7Hl
X-Gm-Gg: ASbGncvRfHlG1SHPbNRXGoeVmM81EQhcdajROAOUvsFq6zjd2llJ16CboSWnEeEhhbJ
	SlaeXEhV9bamteDItIOaI9kkfhXXFbOdmZvFMZDJ1wGyNYQkN4JeCkzhyIxmQbD8d/SUL0KK/BQ
	ZDBYEhJZRT3bRKFwmdZXg9Oam0tJWKMnz8RlyIYlERSbhCpx1CODAnKKOmamiSXAAu3jKhnTbEf
	o2Isj2zZjas5BiDyaN5RFvYiaSQ721wt18+pkUPOf2lcSyQ5JXH5sq1c2gg5ZGcPunXRPrFCANk
	DDGhHOBGp+XVAIB5+TjNs0FZ68/hgyPtDv+i+mS1fqoOg6WDe0z2fjmn4yQl/3Yyasf4jtbDzui
	teFeCE5Xyxme56kEHNk46xZDX7wY46L0YyxlpoLyQrvTYAAWsMUzbjdwUbFBFlOdapz6hD+eASd
	Seyo6H/qmQGNgyk+5TEirh6L/3FNJ/oXB/MMyzgLKUJRYUp7TXbrkJVJSQ2zcAHxXeOCSU2U/BK
	yBSD0a3kE6N/2+AeRqOPYWjE9GTGNUYeoRDgIcSIVKPVzangST1ScmgQiqMVgi686IJIyhTCbN5
	X83MMxmn+X1wx5qopZ/a4rP8Qen96+VZpE/MPUgVxhJvsqzPX9/EeKM=
X-Google-Smtp-Source: AGHT+IGMXq1Dh7hKw7TbowlI22iUZ08cEdFKrn/i/FIQAiWpJQ+dGpYRwCov3xkXMTBkJf1Am/GMAQ==
X-Received: by 2002:a17:903:b84:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-29b6bec45damr309873285ad.18.1764326225590;
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm41643525ad.41.2025.11.28.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Date: Fri, 28 Nov 2025 20:36:56 +1000
Message-ID: <1938104.tdWV9SEqCh@setsuna>
In-Reply-To: <20251120134445.GC661940@google.com>
References:
 <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
 <20251120134445.GC661940@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 20 November 2025 11:44:45=E2=80=AFpm Australian Eastern Standa=
rd Time Lee=20
Jones wrote:
> On Wed, 12 Nov 2025, James Calligeros wrote:
> > When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 err=
ors
> > out with 'case label does not reduce to an integer constant'. Introduce
> > a new __SMC_KEY macro that can be used instead.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/linux/mfd/macsmc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> > index 6b13f01a8592..f6f80c33b5cf 100644
> > --- a/include/linux/mfd/macsmc.h
> > +++ b/include/linux/mfd/macsmc.h
> > @@ -41,6 +41,7 @@ typedef u32 smc_key;
> >=20
> >   */
> > =20
> >  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
> >  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) |
> >  (s)[3])>=20
> > +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) |
> > ((u32)(c) << 8) | ((u32)(d)))
> Are we expecting users/consumers to be able to tell the difference
> between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
> internal)?

_SMC_KEY is used in the gpio driver, and I would have used it here too if n=
ot=20
for GCC complaining about it. I wouldn't expect anyone to want to use=20
__SMC_KEY outside of the specific use case this commit addresses given the=
=20
suboptimal ergonomics.

> I have not tested this and it is just off the top of my head, but does
> this work:
>=20
> #define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

This works fine on a smattering of M1 and M2 series machines. I can submit =
a=20
v6 with this and the hwmon driver dropped if need be.

Regards,
James



