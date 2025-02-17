Return-Path: <linux-rtc+bounces-3213-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B7A37EA0
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 10:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E2BA169AF0
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 09:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BDC216395;
	Mon, 17 Feb 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qgo4L2Ww"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639E216393;
	Mon, 17 Feb 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784711; cv=none; b=MwK6VIy5yNuJNGacxck3q4wrVGblDUQSCHBnpd8Zyo3Hf3uVj+MRor/JFiCeLV9DgL+arVOTJBDBVe2qCeUqWDsb4KCwDEt3J6ctZQI8ioyfrqtPsaNNymTCZ4oA4PHCi9Dvsmzdc95gaeExTSFjCaUdkz4fw6WeNqW8NQgyAgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784711; c=relaxed/simple;
	bh=qwwfQspqK1CIaepn5O3N48Xj/62KJzh4txop3uOMjDc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=chTNivSwqLwR5/3x6ZH7tX7xwhMAQ40YfO0l4amueTiViafZ5OtscfJML6KzWX/ev561uTV//4/filAo6gLLB1lssDAYFBr/QlaOD3Fm/kRqtd4BXtJr2OOkxt7gnDN8AA0nt2lAlI6n7wy9Trxyb77009LSjYfNX4sJfMSHags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qgo4L2Ww; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso615422566b.3;
        Mon, 17 Feb 2025 01:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739784708; x=1740389508; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qwwfQspqK1CIaepn5O3N48Xj/62KJzh4txop3uOMjDc=;
        b=Qgo4L2WwhX7vWcVUGZ1DzQicBwRJuBsoC+tuYs9WiR8y/KBF6byNaAUgx38YNqo3FX
         dNNVrd+ivRzKttSSN1hsikdg2tGuZH+ZWMhmXZcT/4K4gRUk2RJYZUHxcyMfPxJrMiPy
         EamgI6VG9CkcK4S4uShN2u1Dn160vBo+kE4mu7oSnPrvGvEm+X3s7A+TtzjbPWT41cm+
         vYXwkXY71eiX6pxKJkJO2N4EsPjig3pAKVPe9ORWoVftJGB1x5955pSO/Cr2ZYar+Vyp
         tSJDFvffLQBp0k4+AgIjf3/p6KAMqaT8EkpYFYVsTs4DU/Ygw+0und4dbMzrXb6wtFlv
         SArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784708; x=1740389508;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwwfQspqK1CIaepn5O3N48Xj/62KJzh4txop3uOMjDc=;
        b=U4Q6Nlfy2lEKwHf6N1mWoPZzd4Qpz9suWifVoTIiMRvdWh5nuC9s299LyhqWOJJ83d
         PEh+qf0y0cnUVCdV0cJ4/EjoJ/t1Jpn8q1MA6AdmwrjqepRlNNNl6omwNfrTA+aUXBFt
         vqV6AgXR6CXprVK2jeAGDt78lYrMn2Mvc+8TBVv3EyrXVi1c5omqInPJ8YNzzdEJNtG9
         rRaoldBJ8bT332SniBd61lwv5ELhunORcBc55FQj0nwJNj0N0NMne11ZuZw8wjTe+UAF
         ltI+Z8Hah/2ObD1NuTycFJDB6MQ4lGD1flGIlO586FImEAxvJImrA0RflPvbWPM7Rx4g
         IBnw==
X-Forwarded-Encrypted: i=1; AJvYcCUz3+BJOhKwf9gYyE2u9OOHNKx+DiPZyAuje2Ihk+Ms3M1e/T36UttMNFa4HdU3msVQagMceLWpuxqB@vger.kernel.org, AJvYcCVKkQpBeOgIGD8mJApjiEpg1A6jrlRIwYeoq6uoL+PrRnvGOHb4nJAINYD03rzSocjahd0F3l2m2c68@vger.kernel.org, AJvYcCVwzKVHenWfxSeV1xqOAE/F7dQudMUvlj4A79MiUthe47qRlmjkctaNu59Fv8ixUL5z8Fv5koLRBmbO+jYr@vger.kernel.org
X-Gm-Message-State: AOJu0YxO96En12Dtl7AiffaYNE0V0tFN8nY3rDKCBA0szY+lKafXUNPM
	Alz8H7g9fC6WrvjnwdR3pt4R+D6opiPCnYe4ZSPDrNBcJ4Q+I19N
X-Gm-Gg: ASbGnctlQk9jGzvtD+dAKCjv4f6VyxFBVW/65zjFJdT7Ts7n4xTpR2YObmoJwbuAhET
	YNOr3nKjXc5DpzbbQ9mPbj+axXxUP+uHQBHdntplKswo/AAmOHZ4X2gys2XxYjLX/CYDQjpZvsi
	TFCnfeojGiTcD2vH6UjQL4I9USSEYZXtUYh6GV3HYBeFO1G6ku4ai7e5MGpXUGgZL1LZABT50U+
	8PzFnCsvFVZHgAlE1qwOEDCrIjuDUhgLissIuat7b4GQMlOhkaifimMvWfJZxX/iU7QorKLQS2i
	oHPSW/KY4oZbH1C14zM9zYUhUO88X3RE
X-Google-Smtp-Source: AGHT+IF19rIOBPRe3FreKmfKhGzofepgR2PC8/BYqtWn5SXsysFWGgg87ztwsvGb53f3Baqru+RpWg==
X-Received: by 2002:a17:907:3d8e:b0:ab7:4641:a72d with SMTP id a640c23a62f3a-abb70de28admr913177666b.51.1739784707261;
        Mon, 17 Feb 2025 01:31:47 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba64fbabfsm75995966b.172.2025.02.17.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:31:46 -0800 (PST)
Message-ID: <3ba76f2162841ab91ef823315e7ce4b5b7526984.camel@gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Jingbao Qiu
	 <qiujingbao.dlmu@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
Date: Mon, 17 Feb 2025 10:31:43 +0100
In-Reply-To: <MA0PR01MB567164E6BE03750F2200CBDBFEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
	 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
	 <MA0PR01MB567164E6BE03750F2200CBDBFEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Chen!

On Mon, 2025-02-17 at 17:26 +0800, Chen Wang wrote:
> > Add RTC devicetree binding for Sophgo CV1800 SoC.
> >=20
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0=C2=A0 .../bindings/rtc/sophgo,cv1800-rtc.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 53 +++++++++++++++++++
> > =C2=A0=C2=A0 1 file changed, 53 insertions(+)
> > =C2=A0=C2=A0 create mode 100644 Documentation/devicetree/bindings/rtc/s=
ophgo,cv1800-rtc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> > new file mode 100644
> > index 000000000000..b36b51a69166
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Real Time Clock of the Sophgo CV1800 SoC
> > +
> > +description:
> > +=C2=A0 Real Time Clock (RTC) is an independently powered module
> > +=C2=A0 within the chip, which includes a 32KHz oscillator and a
> > +=C2=A0 Power On Reset/POR submodule. It can be used for time display
> > +=C2=A0 and timed alarm generation. In addition, the hardware state
> > +=C2=A0 machine provides triggering and timing control for chip
> > +=C2=A0 power on, off, and reset.
> > +
> > +maintainers:
> > +=C2=A0 - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
>=20
> I guess Jingbao will not take this role. If he doesn't raise any=20
> objections, please just change this.
>=20
> Jingbao, do you have any comment on this?

New version will look rather like this:
https://lore.kernel.org/linux-devicetree/20250216180924.2506416-1-alexander=
.sverdlin@gmail.com/

But I'll be happy to take you suggestion and replace my name in the
new version with someone more afiliated with Sophgo ;-)

--=20
Alexander Sverdlin.


