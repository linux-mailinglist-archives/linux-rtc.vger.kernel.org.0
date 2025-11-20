Return-Path: <linux-rtc+bounces-5440-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5300BC7377C
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 11:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8C7BA3538F3
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 10:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C9832BF4B;
	Thu, 20 Nov 2025 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UEseo7bM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1402FF179
	for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634748; cv=none; b=UznIIMo03POU9A4kkl6XPN+a3VGbr0OTqoJSqU73tA0q+91iK2kJQYeCzX7wLjawQ+jjsmoI0guvMzwW9g+RAFxqNyu3c1T21ZF3ysUx5fv8rHOoQCcu2xkdUvnqQhnU9SAlP7ojle6hDG27Rr/uBueHB+qNF1lSnynWI5JDQWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634748; c=relaxed/simple;
	bh=OSupr0kJjnxwNvOhXhv6PH9+Mq/EXttUjlC7N2YQVtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NHeNkWtaKriVvaXct1nBEaohQDLrOPzIMysQ2uhusGp//7Dx6kS7wllOoyEMnObekwffasa6QlO/NFT66SJKMfkkU68HMdW7Pe3WHUgXUL/jTvt5BczBny5fJNdEaPiHEMYKHTR1Wj+q9wsrM6WhnHpAR/PeMOIn6sbwOeQO5AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UEseo7bM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so5756265e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763634744; x=1764239544; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OSupr0kJjnxwNvOhXhv6PH9+Mq/EXttUjlC7N2YQVtc=;
        b=UEseo7bMUCkbROB9ao2jiRTLBLtvfd2OvdCYzl4Zy3QS5JXaMdi9KNMjtZQKxTCXNu
         moVHOKFDA+BKfJBjLDc3pwTOdC0Asl1RSRh+FTaK7N/9jlpbzl7Hqg8wrP0HF6xy8H3m
         FVIw2tIYL0Jo6olgQpCW3SjDy3px2bQAmmmQZMcl23PJhdjq8G8/gVPs9dzQFCQGPU/r
         ZrHfaaIdZ1LOOPYphRxDy5vVtHSmwR4U/NpfbG89ibaYqB8rvUYM82XdyNnHH+UAaKLt
         AZIGMgTLFbdHhB8Q1iYq4xd5TJ0uZg/wKk1BDVb8zuOwuIIDT5sHxmnZMxi73gosAXEg
         6dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763634744; x=1764239544;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSupr0kJjnxwNvOhXhv6PH9+Mq/EXttUjlC7N2YQVtc=;
        b=OGMksgiR190AdI9NJZKHWzn9n1oBSsoNxwtZhXvjEn1l6+gWn5wJUf7Q4vi/D7NGRl
         yovO6OUW/Z3Wb0Rzz5tDWq1gga6mJjjRcqjQADnMs6TF18+KN9+l/FucoIr6AOHdQiTO
         LprRUXuB2Ib2q/UjwOSHirZqzLFZgOCRQ8gX7bzujJKB8GOFzrdLRwJzhcyLFA4bCfON
         ADmGBOJD+0mSx8fpa/Xts36y/bvhYUSrmeaBuo8kixoAdzz4h1Nhno23CyT8W11Pqjfq
         KlgNzDdItnX/Wlt7bm3RjFAsb+zxMVVwnAWc4YHeIJzxQIzwBXoVAcCNntkCNmOKOQzA
         Oydw==
X-Forwarded-Encrypted: i=1; AJvYcCWaOAbjOEEIAIcMNYOyUbVWDwlMw1vbmrsGNDpISqISlpv6Ul6NG0J9zpVlnEFb3z4++29DuD65dzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5jKZE9ZkSZ/aLH/rnYOY2uRh8ODFPOCvxzB+Dz2Ziifhc1No
	T9LPyJHSxiazAnV+CdcXSq6kkuU0cVs9eX3ja4pZMB7wzFq5UoMO0PHrVZXLCYbtJUo=
X-Gm-Gg: ASbGncuJNvvzLyILbHJyDn/E8iYsTbNuSz+5VBvfmWTYpbSsy/Ttc3cYV+fwdfQX9++
	bCUB4J6x9DF7VsGXAeFbOMkiF9ZjQrrws2/p06W1J4b5v+Uaswni1fletXYBDphyqIgf9a+l38D
	2Q47W6dm/8bOfcC78vbUqkDuJFD/b12ZfT8wClW2dTyv6eLwkSgdYTVCOvQTIT0bLqNBuB4nBIc
	A285Eau+BzMrNE0eutVfC3TDqfuORQt13uiuU00xVCYZYwi/R9pJ7fSMxeZR3o3I9Ce0jaAqtHK
	/mN907qKM1HthKnTi2CQ2WDFLygAk/BAc4ixygWKIB9zQuNTFKLwb6+6AtU45FsOKX+tfmF+f1m
	r5CR/WtrPIJEYuTY7dukxxEjFzbEVAwnv3XPqlIFWJLoS0NAZwaw3qmTo11LGpwRdKldSKLgl9b
	jn5/NWd4DNGSeKQzf2XGRiviK4hDk=
X-Google-Smtp-Source: AGHT+IECH0Ar6MJ7BtthyBsytzJSAtWIhKLrFKyKhjk8O39/oM0DhnAqKZk88fXqWIq9/kPk2wPzpg==
X-Received: by 2002:a05:600c:474a:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-477b8a98a93mr27846505e9.23.1763634744455;
        Thu, 20 Nov 2025 02:32:24 -0800 (PST)
Received: from salami.lan ([212.129.72.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106b03bsm102270655e9.9.2025.11.20.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:32:23 -0800 (PST)
Message-ID: <8ebfbfa9d592b7a5d965dadf5f3615a77c89cb03.camel@linaro.org>
Subject: Re: [PATCH 0/3] Samsung mfd/rtc driver alarm IRQ simplification
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Juan Yescas	 <jyescas@google.com>, Douglas
 Anderson <dianders@chromium.org>, 	kernel-team@android.com, Kaustabh
 Chakraborty <kauschluss@disroot.org>, 	linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org
Date: Thu, 20 Nov 2025 10:32:22 +0000
In-Reply-To: <20251120103104.GY1949330@google.com>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
	 <20251120103104.GY1949330@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2025-11-20 at 10:31 +0000, Lee Jones wrote:
> On Fri, 14 Nov 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Hi,
> >=20
> > With the attached patches the Samsung s5m RTC driver is simplified a
> > little bit with regards to alarm IRQ acquisition.
> >=20
> > The end result is that instead of having a list of IRQ numbers for each
> > variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> > queries the 'alarm' platform resource from the parent (mfd cell).
> >=20
> > Additionally, we can drop a now-useless field from runtime data,
> > reducing memory consumption slightly.
> >=20
> > The attached patches must be applied in-order. I would expect them all
> > to go via the MFD tree. Alternatively, they could be applied one after
> > another during multiple kernel release cycles, but that seems a
> > needless complication.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Andr=C3=A9 Draszik (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd: sec: add rtc alarm IRQ as platform =
device resource
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s5m: query platform device IRQ reso=
urce for alarm IRQ
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd: sec: drop now unused struct sec_pmi=
c_dev::irq_data
> >=20
> > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 41 ++++++++++++++++++++++++++++++----------
> > =C2=A0drivers/mfd/sec-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++--------
> > =C2=A0drivers/rtc/rtc-s5m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++------------
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 1 -
> > =C2=A05 files changed, 42 insertions(+), 33 deletions(-)
>=20
> This needs to be rebased now, right?

Yes, I'll do that now. Thanks for merging the other patch.


Cheers,
Andre'

